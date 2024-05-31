import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';

class FiltroWidget extends StatelessWidget {
  final double width;
  final String titulo;
  final IconsEnum icone;
  final bool isSelecionado;
  final VoidCallback onPressed;

  const FiltroWidget({
    super.key,
    required this.width,
    required this.titulo,
    required this.icone,
    required this.isSelecionado,
    required this.onPressed,
  });

  Color _obterBackground(context) => isSelecionado
      ? Theme.of(context).colorScheme.azulClaro
      : Theme.of(context).colorScheme.white;

  Color _obterCor(context) => isSelecionado
      ? Theme.of(context).colorScheme.white
      : Theme.of(context).colorScheme.bodyText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: _obterBackground(context),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.brancoBorda,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Image.asset(
              icone.caminho,
              height: 16,
              width: 16,
              color: _obterCor(context),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                titulo,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: _obterCor(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
