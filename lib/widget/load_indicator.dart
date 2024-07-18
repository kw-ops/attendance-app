import 'package:flutter/material.dart';

import '../const/constants.dart';
class LoadIndicator extends StatelessWidget {
  const LoadIndicator({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.black.withOpacity(0.4),
      child: Center(
          child:child?? SizedBox(
              height: Dimensions().pSH(120),
              width: Dimensions().pSH(120),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                        color: appColors.primary),
                    SizedBox(
                      height: Dimensions().pSH(12),
                    ),
                    const Text(
                      'Loading...',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ))),
    );
  }
}
