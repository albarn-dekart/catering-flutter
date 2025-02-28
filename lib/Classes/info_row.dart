import 'package:flutter/material.dart';
import 'package:catering_app/Classes/app_theme.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String value;
  final String? label;

  const InfoRow({
    super.key,
    required this.icon,
    required this.value,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppTheme.defaultPadding / 2),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryColor),
          const SizedBox(width: AppTheme.defaultPadding),
          if (label != null)
            Text(
              "$label: ",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          Text(
            value,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
