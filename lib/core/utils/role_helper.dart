import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RoleHelper {
  static String getLocalizedRole(BuildContext context, String role) {
    final l10n = AppLocalizations.of(context)!;
    switch (role) {
      case 'ROLE_ADMIN':
        return l10n.roleAdmin;
      case 'ROLE_RESTAURANT':
        return l10n.roleRestaurant;
      case 'ROLE_COURIER':
        return l10n.roleCourier;
      case 'ROLE_CUSTOMER':
        return l10n.roleCustomer;
      default:
        return role.replaceFirst('ROLE_', '').toLowerCase();
    }
  }

  static String getLocalizedRoles(BuildContext context, List<String> roles) {
    return roles
        .where((r) => r.startsWith('ROLE_'))
        .map((r) => getLocalizedRole(context, r))
        .join(', ');
  }
}
