import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/utils/app_strings_enum.dart';

class EmpresasErroWidget extends StatelessWidget {
  const EmpresasErroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 48,
              color: Theme.of(context).colorScheme.azulEscuro,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppStringsEnum.ocorreuUmErroAoListarAsEmpresas.texto,
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