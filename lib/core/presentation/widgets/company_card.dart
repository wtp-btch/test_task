import 'package:flutter/material.dart';
import 'package:test_task_company/core/domain/entity/company_entity.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    required this.company,
    required this.onDelete,
    required this.onEdit,
    required this.onView,
    required this.onLongPress,
    this.isSelected = false,
    super.key,
  });

  final CompanyEntity company;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onLongPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            tileColor: isSelected ? Colors.blue : null,
            title: Text(
              company.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              company.website,
            ),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Colors.blue[300],
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete,
                    ),
                    color: Colors.red,
                    onPressed: onDelete,
                  ),
                ]),
            onTap: onView,
            onLongPress: onLongPress,
          ),
        ),
      ],
    );
  }
}
