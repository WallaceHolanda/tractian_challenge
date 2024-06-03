import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';
import 'package:tractian_challenge/features/core/widgets/shimmer_widget.dart';

class CompaniesCarregandoWidget extends StatelessWidget {
  const CompaniesCarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: const EdgeInsets.only(
        top: 30,
        left: 22,
        right: 22,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: 76,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColorsEnum.lightBlue.cor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 24),
                    ShimmerWidget(
                      height: 24,
                      width: 24,
                      borderRadius: 2,
                      color: AppColorsEnum.white.cor.withOpacity(0.8),
                    ),
                    const SizedBox(width: 16),
                    ShimmerWidget(
                      height: 24,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      borderRadius: 2,
                      color: AppColorsEnum.white.cor.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
