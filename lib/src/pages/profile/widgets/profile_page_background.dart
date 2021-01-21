import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/size_config.dart';

class ProfilePageBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: SizeConfig.screenHeight * .3,
        color: kRedColor,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * 0.85);
    Offset curveEndPoint = Offset(size.width, size.height * 0.85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
