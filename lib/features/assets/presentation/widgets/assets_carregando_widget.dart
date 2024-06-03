import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/core/widgets/shimmer_widget.dart';

class AssetsCarregandoWidget extends StatelessWidget {
  const AssetsCarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      padding: const EdgeInsets.only(
        top: 30,
        left: 22,
        right: 22,
      ),
      itemBuilder: (context, index) => const Column(
        children: [
          ShimmerWidget(
            height: 24,
            width: double.maxFinite,
            borderRadius: 2,
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: ShimmerWidget(
              height: 24,
              width: double.maxFinite,
              borderRadius: 2,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 48),
            child: ShimmerWidget(
              height: 24,
              width: double.maxFinite,
              borderRadius: 2,
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
