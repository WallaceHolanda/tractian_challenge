import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';

class TreeWidget extends StatelessWidget {
  final List<ItemEntity> items;
  final int profundidade;

  const TreeWidget({
    super.key,
    required this.items,
    this.profundidade = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.only(left: profundidade * 16.0),
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
                    Text(
                      item.name.toUpperCase(),
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
                TreeWidget(items: item.itens, profundidade: profundidade + 1),
            ],
          ),
        );
      },
    );
  }
}
