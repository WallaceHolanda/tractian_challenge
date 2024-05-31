import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/core/utils/app_routes_enum.dart';
import 'package:tractian_challenge/features/empresas/domain/entities/empresa_entity.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/empresa_card.dart';

class EmpresasWidget extends StatelessWidget {
  final List<EmpresaEntity> empresas;

  const EmpresasWidget({
    super.key,
    required this.empresas,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: empresas.length,
      padding: const EdgeInsets.only(
        top: 30,
        left: 22,
        right: 22,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          EmpresaCard(
            nome: empresas[index].name,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutesEnum.assets.rota,
              arguments: empresas[index].id,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
