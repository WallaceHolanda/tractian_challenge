import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';

class EmpresaCard extends StatelessWidget {
  final String nome;

  const EmpresaCard({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/assets'),
      child: Container(
        height: 76,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.azulClaro,
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
                color: Theme.of(context).colorScheme.branco,
              ),
            ),
          ],
        ),
      ),
    );
  }
}