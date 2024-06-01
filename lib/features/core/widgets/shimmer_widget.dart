import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;

  const ShimmerWidget({
    super.key,
    this.height,
    this.width,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.gray.withOpacity(0.8),
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
      ),
    );
  }
}
