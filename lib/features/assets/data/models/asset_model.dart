import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.id,
    required super.name,
    required super.itens,
    super.parentId,
    super.locationId,
    super.sensorType,
    super.status,
  });

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      id: map['id'],
      name: map['name'],
      locationId: map['locationId'],
      parentId: map['parentId'],
      sensorType: map['sensorType'],
      status: map['status'],
      itens: [],
    );
  }
}
