import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../const/constants.dart';


class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: appColors.white.withOpacity(.4),
      highlightColor: appColors.lightGrey.withOpacity(.8),
      child: child,
    );
  }
}
