import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';

class ErroWidget extends StatelessWidget {
  final String texto;

  const ErroWidget({
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
            Icons.error,
            size: 48,
            color: Theme.of(context).colorScheme.azulEscuro,
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
                color: Theme.of(context).colorScheme.azulEscuro,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
