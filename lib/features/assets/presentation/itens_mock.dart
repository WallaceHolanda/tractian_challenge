import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';

List<ItemEntity> mockItems = const [
  LocationEntity(
    id: '1',
    name: 'Location 1',
    itens: [
      LocationEntity(
        id: '2',
        parentId: '1',
        name: 'Sub-Location 1.1',
        itens: [
          AssetEntity(
            id: '3',
            locationId: '2',
            name: 'Asset 1.1.1',
            itens: [
              AssetEntity(
                id: '4',
                parentId: '3',
                name: 'Sub-Asset 1.1.1.1',
                itens: [
                  AssetEntity(
                    id: '5',
                    parentId: '3',
                    sensorType: 'energy',
                    name: 'Component 1.1.1.1.1',
                    itens: [],
                  ),
                ],
              ),
            ],
          ),
          AssetEntity(
            id: '6',
            name: 'Asset 1.1.2',
            itens: [],
          ),
        ],
      ),
    ],
  ),
  AssetEntity(
    id: '7',
    name: 'Component 1.1.1.1.1',
    sensorType: 'vibration',
    status: 'alert',
    itens: [],
  ),
];
