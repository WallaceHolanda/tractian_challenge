import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/utils/item_mixin.dart';

class TreeWidget extends StatelessWidget with ItemMixin {
  final List<ItemEntity> itens;
  final int nivel;

  const TreeWidget({
    super.key,
    required this.itens,
    this.nivel = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itens.length,
      itemBuilder: (context, index) {
        final item = itens[index];
        return Padding(
          padding: EdgeInsets.only(left: nivel * 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    if (item.itens.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.chevron_right,
                            size: 10,
                            color: Theme.of(context).colorScheme.azulEscuro,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 8,
                        left: item.itens.isNotEmpty ? 0 : 8,
                      ),
                      child: Image.asset(
                        obterIconeItem(item)!,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Text(
                      item.name.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.azulEscuro,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.itens.isNotEmpty)
                TreeWidget(itens: item.itens, nivel: nivel + 1),
            ],
          ),
        );
      },
    );
  }
}
