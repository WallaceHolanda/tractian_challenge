import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';

class CompanyCard extends StatelessWidget {
  final String nome;
  final VoidCallback onTap;

  const CompanyCard({
    super.key,
    required this.nome,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 76,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColorsEnum.lightBlue.cor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 32),
            Image.asset(
              IconsEnum.company.caminho,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 16),
            Text(
              nome,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColorsEnum.white.cor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
