import 'package:flutter/material.dart';

class PermissionTile extends StatelessWidget {
  final String title;
  final bool checked;
  final Function(bool?)? onChanged;

  const PermissionTile({
    required this.title,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        value: checked,
        onChanged: onChanged,
      ),
      title: Text(title),
    );
  }
}
