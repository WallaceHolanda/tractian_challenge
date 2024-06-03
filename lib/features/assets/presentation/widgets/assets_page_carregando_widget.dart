import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/assets_carregando_widget.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';
import 'package:tractian_challenge/features/core/widgets/shimmer_widget.dart';

class AssetsPageCarregandoWidget extends StatelessWidget {
  const AssetsPageCarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              const ShimmerWidget(
                height: 48,
                width: double.maxFinite,
                borderRadius: 2,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ShimmerWidget(
                    height: 48,
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    borderRadius: 2,
                  ),
                  const SizedBox(width: 8),
                  ShimmerWidget(
                    height: 48,
                    width: MediaQuery.sizeOf(context).width * 0.28,
                    borderRadius: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          thickness: 0.5,
          color: AppColorsEnum.gray.cor,
        ),
        const Expanded(
          child: AssetsCarregandoWidget(),
        ),
      ],
    );
  }
}
