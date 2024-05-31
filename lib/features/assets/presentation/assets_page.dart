import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/core/utils/app_strings_enum.dart';

class AssetsPage extends StatefulWidget {
  final String companyId;

  const AssetsPage({
    super.key,
    required this.companyId,
  });

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.azulEscuro,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.branco,
            size: 32,
          ),
        ),
        title: Text(
          AppStringsEnum.assets.texto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.branco,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              width: double.maxFinite,
              child: Text(
                AppStringsEnum.assets.texto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
