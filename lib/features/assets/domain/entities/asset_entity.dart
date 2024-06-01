import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/utils/asset_status_enum.dart';
import 'package:tractian_challenge/features/assets/utils/sensor_type_enum.dart';

class AssetEntity extends ItemEntity {
  final String? locationId;
  final String? sensorType;
  final String? status;

  const AssetEntity({
    required super.id,
    required super.name,
    required super.itens,
    super.parentId,
    this.locationId,
    this.sensorType,
    this.status,
  });

  bool get isComponent => sensorType != null;

  bool get isSensorEnergia => sensorType == SensorTypeEnum.energy.tipo;

  bool get isCritico => status == AssetStatusEnum.alert.tipo;
}
