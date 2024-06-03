import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/utils/item_mixin.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';

class TreeWidget extends StatefulWidget {
  final List<ItemEntity> itens;
  final int nivel;

  const TreeWidget({super.key, required this.itens, this.nivel = 0});

  @override
  State<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> with ItemMixin {
  final Map<int, bool> _expandedMap = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.itens.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = widget.itens[index];
        final icone = obterIconeItem(item);
        final iconeAsset = obterIconeAsset(item);
        final isExpanded = _expandedMap[index] ?? false;

        return Padding(
          padding: EdgeInsets.only(left: (widget.nivel * 12.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    if (item.itens.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          setState(() => _expandedMap[index] = !isExpanded);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: RotatedBox(
                            quarterTurns: isExpanded ? 4 : 1,
                            child: Icon(
                              Icons.chevron_right,
                              size: 16,
                              color: AppColorsEnum.darkBlue.cor,
                            ),
                          ),
                        ),
                      ),
                    if (icone != null)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 6.0,
                          left: item.itens.isNotEmpty ? 0 : 6.0,
                        ),
                        child: Image.asset(
                          icone,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    Flexible(
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColorsEnum.darkBlue.cor,
                        ),
                      ),
                    ),
                    if (iconeAsset != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                          iconeAsset,
                          width: 16,
                          height: 16,
                        ),
                      ),
                  ],
                ),
              ),
              if (isExpanded)
                TreeWidget(
                  itens: item.itens,
                  nivel: widget.nivel + 1,
                ),
            ],
          ),
        );
      },
    );
  }
}
