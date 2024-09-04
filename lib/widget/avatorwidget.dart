import 'package:attendance/model/staff_model.dart';
import 'package:flutter/material.dart';
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
    return CircleAvatar(
      radius: width,
      backgroundImage: image != null && image!.isNotEmpty
          ? NetworkImage(image!)
          : AssetImage('assets/default_avatar.png') as ImageProvider, // Replace with your default asset path
      onBackgroundImageError: (exception, stackTrace) {
        // Handle error by showing default image if the network image fails to load
      },
      child: image == null || image!.isEmpty
          ? Icon(Icons.person, size: 50)
          : null,
    );
  }
}
