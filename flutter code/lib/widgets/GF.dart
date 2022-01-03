import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GFWidget extends StatelessWidget {
  const GFWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.blueGrey.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {},
            child: AnimatedContainer (
              duration: Duration(seconds: 1),
              width: 130,
              height: 70,
              alignment: Alignment.center,
              child: "G".text.xl.blueGray600.bold.make(),
            ),
          ),
        ),
        Spacer(),
        Material(
          color: Colors.blueGrey.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {},
            child: AnimatedContainer (
              duration: Duration(seconds: 1),
              width: 130,
              height: 70,
              alignment: Alignment.center,
              child: "f".text.xl.blueGray600.bold.make(),
            ),
          ),
        ),
      ],
    );
  }
}
