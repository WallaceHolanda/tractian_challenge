import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';

List<ItemEntity> mockItems = const [
  ItemEntity(
    id: '2',
    name: 'Sub Folder 1',
    itens: [
      ItemEntity(
        id: '3',
        name: 'Sub Sub Folder 1',
        itens: [
          ItemEntity(
            id: '4',
            name: 'File 1.1.1',
            itens: [],
          ),
          ItemEntity(
            id: '5',
            name: 'File 1.1.2',
            itens: [],
          ),
        ],
      ),
      ItemEntity(
        id: '6',
        name: 'File 1.2',
        itens: [],
      ),
    ],
  ),
  ItemEntity(
    id: '7',
    name: 'Sub Folder 2',
    itens: [
      ItemEntity(
        id: '8',
        name: 'Sub Sub Folder 2',
        itens: [
          ItemEntity(
            id: '9',
            name: 'Sub Sub Sub Folder 1',
            itens: [
              ItemEntity(
                id: '10',
                name: 'File 2.1.1.1',
                itens: [],
              ),
              ItemEntity(
                id: '11',
                name: 'File 2.1.1.2',
                itens: [],
              ),
            ],
          ),
          ItemEntity(
            id: '12',
            name: 'File 2.1.2',
            itens: [],
          ),
        ],
      ),
    ],
  ),
  ItemEntity(
    id: '13',
    name: 'File 3',
    itens: [],
  ),
];
