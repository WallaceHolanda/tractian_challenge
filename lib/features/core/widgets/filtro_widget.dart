import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';

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

  Color get _background =>
      isSelecionado ? AppColorsEnum.lightBlue.cor : AppColorsEnum.white.cor;

  Color get _cor =>
      isSelecionado ? AppColorsEnum.white.cor : AppColorsEnum.bodyText.cor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: _background,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        side: BorderSide(
          width: 1,
          color: AppColorsEnum.whiteBorder.cor,
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
              color: _cor,
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
                  color: _cor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
