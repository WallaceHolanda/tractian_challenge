import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/core/utils/app_strings_enum.dart';

class SemDadosWidget extends StatelessWidget {
  const SemDadosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apartment,
              size: 48,
              color: Theme.of(context).colorScheme.azulEscuro,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppStringsEnum.naoExistemEmpresasDisponiveis.texto,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.azulEscuro,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
