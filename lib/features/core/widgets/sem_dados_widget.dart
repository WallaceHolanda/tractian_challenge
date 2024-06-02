import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';

class SemDadosWidget extends StatelessWidget {
  final String texto;

  const SemDadosWidget({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.apartment,
            size: 48,
            color: AppColorsEnum.darkBlue.cor,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              texto,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColorsEnum.darkBlue.cor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
