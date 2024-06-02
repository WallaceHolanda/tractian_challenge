import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/assets_carregando_widget.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/tree_widget.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_strings_enum.dart';
import 'package:tractian_challenge/features/core/widgets/sem_dados_widget.dart';

class AssetsWidget extends StatelessWidget {
  final List<ItemEntity> itens;
  final bool isCarregando;

  const AssetsWidget({
    super.key,
    required this.itens,
    required this.isCarregando,
  });

  @override
  Widget build(BuildContext context) {
    if (isCarregando) {
      return const AssetsCarregandoWidget();
    }

    if (itens.isEmpty) {
      return SemDadosWidget(texto: AppStringsEnum.semResultados.texto);
    }

    return TreeWidget(itens: itens);
  }
}
