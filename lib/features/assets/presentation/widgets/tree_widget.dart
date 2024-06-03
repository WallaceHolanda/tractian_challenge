import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/asset_icone_widget.dart';
import 'package:tractian_challenge/features/assets/utils/item_mixin.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';

class TreeWidget extends StatefulWidget {
  final List<ItemEntity> itens;
  final int nivel;

  const TreeWidget({
    super.key,
    required this.itens,
    this.nivel = 0,
  });

  @override
  State<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> with ItemMixin {
  final Map<int, bool> expandedMap = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.itens.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = widget.itens[index];
        final icone = obterIconeItem(item);
        final isExpanded = expandedMap[index] ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  item.itens.isNotEmpty
                      ? GestureDetector(
                          onTap: () => setState(
                            () => expandedMap[index] = !isExpanded,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 6.0,
                              left: widget.nivel * 18.0,
                            ),
                            child: RotatedBox(
                              quarterTurns: isExpanded ? 4 : 1,
                              child: SizedBox(
                                width: 16,
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 16,
                                  color: AppColorsEnum.darkBlue.cor,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(width: (widget.nivel * 18.0) + 20.0),
                  if (icone != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
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
                  if (item is AssetEntity) AssetIconeWidget(item: item)
                ],
              ),
            ),
            if (isExpanded && item.itens.isNotEmpty)
              TreeWidget(
                itens: item.itens,
                nivel: widget.nivel + 1,
              ),
          ],
        );
      },
    );
  }
}
