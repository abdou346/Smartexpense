import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartexp/Component/circle.dart';
import 'package:smartexp/Firebase/firebase.dart';
import 'lobby.dart';
import '../Component/logout.dart';

import 'loginscreen.dart';

import 'sign up.dart';

class infogoogle extends StatefulWidget {
  const infogoogle({Key? key}) : super(key: key);

  @override
  State<infogoogle> createState() => _infoState();
}

final Salarycontroller = TextEditingController();
final expcontroller = TextEditingController();
final soldecontroller = TextEditingController();
final agecontroller = TextEditingController();
final datenaissancecontroller = TextEditingController();
Position? position;
double? longitude;
double? latitude;
String? Devise;
String? Address;

class _infoState extends State<infogoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        circle(),
        Container(
          margin: EdgeInsets.only(top: 100, left: 20),
          child: Text(
            "More about you ",
            style: GoogleFonts.outfit(
              textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 550, left: 0),
          child: TextFormField(
            controller: Salarycontroller,
            decoration: InputDecoration(
              labelText: "salary",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 640, left: 0),
          child: TextFormField(
            controller: expcontroller,
            decoration: InputDecoration(
              labelText: "regular monthly expenses",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 450, left: 0),
          child: TextFormField(
            controller: soldecontroller,
            decoration: InputDecoration(
              labelText: "Solde actuel",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 250, left: 0),
          child: TextFormField(
            controller: agecontroller,
            decoration: InputDecoration(
              labelText: "phone number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 350, left: 0),
          child: TextFormField(
            controller: datenaissancecontroller,
            decoration: InputDecoration(
              labelText: "Date de naissance (dd/mm/yy)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 500,
          margin: EdgeInsets.only(top: 730, left: 0),
          child: ElevatedButton(
              child: Text("Submit"),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xff8234F8),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: const Color(0xff8234F8),
                          )))),
              onPressed: () {
                if (Address == "Maroc") {
                  Devise = "dh";
                }
                if (Address == "France" ||
                    Address == "Germany" ||
                    Address == "Belgique" ||
                    Address == "Suisse") {
                  Devise = "€";
                }
                if (Address == "Usa") {
                  Devise = "\$";
                }
                userSetupgoogle(
                    agecontroller.text,
                    double.parse(Salarycontroller.text),
                    double.parse(expcontroller.text),
                    double.parse(soldecontroller.text),
                    datenaissancecontroller.text,
                    Devise);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => lobby(),
                    ));
              }),
        ),
      ],
    ));
  }

  void initState() {
    super.initState();

    permission();
    getCurrentLocation();
    getAdressfromlatlong();
  }

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    // passing this to latitude and longitude strings
    latitude = lat;
    longitude = long;
  }

  permission() async {
    LocationPermission permission = await Geolocator.requestPermission();
  }

  void getAdressfromlatlong() async {
    await Future.delayed(const Duration(seconds: 10), () {});
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
    print(placemarks);
    Placemark placemark = placemarks[0];
    setState(() {
      Address = '${(placemark.country).toString()}';
    });
  }
}
