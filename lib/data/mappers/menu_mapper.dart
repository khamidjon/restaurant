import 'package:restaurant/data/local/records/menu_item_record.dart';
import 'package:restaurant/domain/entities/menu_item_entity.dart';

extension MenuItemRecordToEntityMapper on MenuItemRecord {
  MenuItemEntity toEntity() => MenuItemEntity(
        id: id,
        name: name,
        price: price,
      );
}

extension MenuItemEntityToRecordMapper on MenuItemEntity {
  MenuItemRecord toRecord() => MenuItemRecord(
        id: id,
        name: name,
        price: price,
      );
}
