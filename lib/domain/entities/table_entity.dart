import 'package:equatable/equatable.dart';

class TableEntity with EquatableMixin {
  const TableEntity({
    required this.number,
    required this.customerName,
    required this.orders,
  });

  final int number;
  final String customerName;
  final int orders;

  @override
  List<Object> get props => [
        number,
        customerName,
        orders,
      ];
}
