import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';

mixin ItemMixin {
  String? obterIconeItem(ItemEntity item) {
    if (item is LocationEntity) {
      return IconsEnum.location.caminho;
    }

    if (item is AssetEntity) {
      if (item.isComponent) {
        return IconsEnum.component.caminho;
      }
      return IconsEnum.asset.caminho;
    }

    return null;
  }
}
