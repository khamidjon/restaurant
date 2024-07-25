import 'package:restaurant/data/local/records/table_record.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

extension TableRecordToEntityMapper on TableRecord {
  TableEntity toEntity() => TableEntity(
        id: id,
        number: number,
        waiterName: waiterName,
      );
}

extension TableEntityToRecordMapper on TableEntity {
  TableRecord toRecord() => TableRecord(
        id,
        number,
        waiterName,
      );
}
