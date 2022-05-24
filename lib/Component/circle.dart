import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class circle extends StatelessWidget {
  const circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Stack(children: [
        Container(
          width: 500,
          height: 200,
          margin: EdgeInsets.only(right: 70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(400),
              bottomRight: Radius.circular(400),
            ),
            color: Color.fromARGB(234, 236, 121, 85),
          ),
        ),
        Container(
          width: 350,
          height: 200,
          margin: EdgeInsets.only(left: 210),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(400),
            ),
            color: Color.fromARGB(226, 132, 95, 236),
          ),
        ),
      ]),
    );
  }
}
