import 'package:flutter/material.dart';

import '../const/constants.dart';
import '../const/funcs.dart';
import '../widget/widgets.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: AppTextWidget(
            text: 'COURSE LIST',
            fontsize: getFontSize(24, size),
            fontWeight: FontWeight.bold,
            color: appColors.black,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: Dimensions().pSH(70),
              width: Dimensions().pSW(350),
              decoration: BoxDecoration(
                // color: appColors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: appColors.black0002,
                    offset: const Offset(1, 3),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
