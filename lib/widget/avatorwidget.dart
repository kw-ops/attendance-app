import 'package:attendance/model/staff_model.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../const/constants.dart';

class AvatorWidget extends StatelessWidget {
  const AvatorWidget({
    required this.image,
    required this.height,
    required this.width,
    super.key,
  });

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    //Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: appColors.black0001),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            color: appColors.black282828,
          ),
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
