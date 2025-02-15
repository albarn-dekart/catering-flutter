import 'package:flutter/material.dart';

OutlinedButton cardButton(
    String label, VoidCallback? onPressed, IconData icon, Color color,
    [bool isMobile = false]) {
  return isMobile
      ? OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: color,
            side: BorderSide(color: color),
          ),
          child: Text(label),
        )
      : OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 18, color: color),
          label: Text(label),
          style: OutlinedButton.styleFrom(
            foregroundColor: color,
            side: BorderSide(color: color),
          ),
        );
}
