import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';
import 'package:catering_flutter/core/utils/date_formatter.dart';
import 'package:catering_flutter/features/customer/services/address_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class AddressCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String street;
  final String? apartment;
  final String city;
  final String zipCode;
  final String phoneNumber;
  final String? email;
  final bool isDefault;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onAddressTap;
  final bool showActions;
  final bool showDefaultBadge;
  final bool withCardDecoration;
  final String? title;
  final Widget? titleAction;
  final DateTime? deliveryDate;
  final bool enablePhoneAction;

  const AddressCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.street,
    this.apartment,
    required this.city,
    required this.zipCode,
    required this.phoneNumber,
    this.email,
    this.isDefault = false,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.onAddressTap,
    this.showActions = true,
    this.showDefaultBadge = true,
    this.withCardDecoration = true,
    this.title,
    this.titleAction,
    this.deliveryDate,
    this.enablePhoneAction = false,
  });

  factory AddressCard.fromAddress({
    Key? key,
    required Address address,
    VoidCallback? onTap,
    VoidCallback? onEdit,
    VoidCallback? onDelete,
    VoidCallback? onAddressTap,
    bool showActions = true,
    bool showDefaultBadge = true,
    bool withCardDecoration = true,
    String? title,
    Widget? titleAction,
    DateTime? deliveryDate,
    bool enablePhoneAction = false,
  }) {
    return AddressCard(
      key: key,
      firstName: address.firstName,
      lastName: address.lastName,
      street: address.street,
      apartment: address.apartment,
      city: address.city,
      zipCode: address.zipCode,
      phoneNumber: address.phoneNumber,
      isDefault: address.isDefault,
      onTap: onTap,
      onEdit: onEdit,
      onDelete: onDelete,
      onAddressTap: onAddressTap,
      showActions: showActions,
      showDefaultBadge: showDefaultBadge,
      withCardDecoration: withCardDecoration,
      title: title,
      titleAction: titleAction,
      deliveryDate: deliveryDate,
      enablePhoneAction: enablePhoneAction,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    title!,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (titleAction != null) titleAction!,
            ],
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 8),
        ],
        if (deliveryDate != null) ...[
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: withCardDecoration ? 24 : 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              if (!withCardDecoration) ...[
                Text(
                  '${l10n.deliveryDate}:',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: Text(
                  withCardDecoration
                      ? '${l10n.deliveryDate}: ${AppDateFormatter.shortDate(context, deliveryDate!)}'
                      : AppDateFormatter.shortDate(context, deliveryDate!),
                  style: withCardDecoration
                      ? theme.textTheme.bodyMedium
                      : theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
        Row(
          children: [
            Icon(
              Icons.person,
              size: withCardDecoration ? 24 : 16,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 12),
            if (!withCardDecoration) ...[
              Text(
                '${l10n.customerLabel}:',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 4),
            ],
            Expanded(
              child: Text(
                '$firstName $lastName',
                style: withCardDecoration
                    ? theme.textTheme.bodyMedium
                    : theme.textTheme.titleMedium,
              ),
            ),
            if (showDefaultBadge && isDefault)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  l10n.defaultAddress,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: onAddressTap,
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              Icon(
                Icons.place,
                size: withCardDecoration ? 24 : 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              if (!withCardDecoration) ...[
                Text(
                  '${l10n.address}:',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: Text(
                  '$street${apartment != null ? '/$apartment' : ''}, $city, $zipCode',
                  style:
                      (withCardDecoration
                              ? theme.textTheme.bodyMedium
                              : theme.textTheme.titleMedium)
                          ?.copyWith(
                            color: onAddressTap != null
                                ? theme.colorScheme.primary
                                : null,
                            fontWeight: onAddressTap != null
                                ? FontWeight.w500
                                : null,
                          ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildPhoneRow(theme, l10n),
        if (email != null && email!.isNotEmpty) ...[
          const SizedBox(height: 12),
          InkWell(
            onTap: () async {
              final Uri launchUri = Uri(scheme: 'mailto', path: email);
              if (await canLaunchUrl(launchUri)) {
                await launchUrl(launchUri);
              }
            },
            borderRadius: BorderRadius.circular(8),
            child: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: withCardDecoration ? 24 : 16,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  email!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
        if (showActions && (onEdit != null || onDelete != null))
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [CardActionButtons(onEdit: onEdit, onDelete: onDelete)],
          ),
      ],
    );

    if (withCardDecoration) {
      return AppCard(
        onTap: onTap,
        padding: const EdgeInsets.all(16),
        child: content,
      );
    }

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(padding: const EdgeInsets.all(8.0), child: content),
      );
    }

    return content;
  }

  Widget _buildPhoneRow(ThemeData theme, AppLocalizations l10n) {
    final phoneRow = Row(
      children: [
        Icon(
          Icons.phone_outlined,
          size: withCardDecoration ? 24 : 16,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 12),
        if (!withCardDecoration) ...[
          Text(
            '${l10n.phone}:',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 4),
        ],
        Text(
          phoneNumber,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: enablePhoneAction ? theme.colorScheme.primary : null,
            fontWeight: enablePhoneAction ? FontWeight.w500 : null,
          ),
        ),
      ],
    );

    if (enablePhoneAction) {
      return InkWell(
        onTap: () async {
          final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
          if (await canLaunchUrl(launchUri)) {
            await launchUrl(launchUri);
          }
        },
        borderRadius: BorderRadius.circular(8),
        child: phoneRow,
      );
    }

    return phoneRow;
  }
}
