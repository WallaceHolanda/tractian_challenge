import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';

class AssetEntity extends ItemEntity {
  final String? locationId;
  final String? sensorType;
  final String? status;

  const AssetEntity({
    required super.id,
    required super.name,
    super.parentId,
    this.locationId,
    this.sensorType,
    this.status,
  });
}
