import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';

class LocationEntity extends ItemEntity {
  const LocationEntity({
    required super.id,
    required super.name,
    super.parentId,
  });
}
