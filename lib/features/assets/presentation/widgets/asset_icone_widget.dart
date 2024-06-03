import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';

class AssetIconeWidget extends StatelessWidget {
  final AssetEntity item;

  const AssetIconeWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (item.isCritico)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              IconsEnum.alert.caminho,
              width: 16,
              height: 16,
            ),
          ),
        if (item.isSensorEnergia)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              IconsEnum.energy.caminho,
              width: 16,
              height: 16,
            ),
          ),
        const SizedBox(),
      ],
    );
  }
}
