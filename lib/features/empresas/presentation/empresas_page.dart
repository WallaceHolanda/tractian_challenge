import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/images_enum.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';

class EmpresasPage extends StatefulWidget {
  const EmpresasPage({super.key});

  @override
  State<EmpresasPage> createState() => _EmpresasPageState();
}

class _EmpresasPageState extends State<EmpresasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 48,
              width: double.maxFinite,
              color: Theme.of(context).colorScheme.azulEscuro,
              child: Image.asset(
                ImagesEnum.logo.caminho,
                height: 18,
                width: MediaQuery.sizeOf(context).width * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
