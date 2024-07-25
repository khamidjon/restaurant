import 'package:equatable/equatable.dart';

class TableEntity with EquatableMixin {
  const TableEntity({
    required this.id,
    required this.number,
    required this.waiterName,
  });

  final int id;
  final int number;
  final String waiterName;

  @override
  List<Object> get props => [
        id,
        number,
        waiterName,
      ];
}
