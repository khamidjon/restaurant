import 'package:flutter/material.dart';
import 'package:restaurant/domain/entities/table_entity.dart';

class TableItemWidget extends StatelessWidget {
  const TableItemWidget({
    required this.item,
    required this.onTap,
    super.key,
  });

  final TableEntity item;
  final void Function(TableEntity) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(item),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            Text(
              'T ${item.number}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 6),
            Text(
              item.customerName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
