import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';

class RestaurantCouriersScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantCouriersScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantCouriersScreen> createState() =>
      _RestaurantCouriersScreenState();
}

class _RestaurantCouriersScreenState extends State<RestaurantCouriersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCouriers();
    });
  }

  Future<void> _loadCouriers() async {
    await context.read<UserService>().fetchCouriersByRestaurant(
      widget.restaurantIri,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<RestaurantCourierNode>(
          title: AppLocalizations.of(context)!.manageCouriers,
          items: userService.restaurantCouriers,
          isLoading: userService.isLoading,
          totalItems: userService.totalCouriers,
          searchHint: AppLocalizations.of(context)!.searchCouriersByEmail,
          onSearch: (query) {
            userService.fetchCouriersByRestaurant(
              widget.restaurantIri,
              searchQuery: query,
            );
          },
          hasError: userService.hasError,
          errorMessage: userService.errorMessage,
          onRetry: _loadCouriers,
          onRefresh: _loadCouriers,
          onCreate: _showInviteCourierDialog,
          itemBuilder: (context, courier) {
            final theme = Theme.of(context);
            return AppCard(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Text(
                    courier.email[0].toUpperCase(),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  courier.email,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      IconBadge(
                        text: IriHelper.getId(courier.id),
                        icon: Icons.tag,
                      ),
                    ],
                  ),
                ),
                trailing: CardActionButtons(
                  onDelete: () =>
                      _confirmDeleteCourier(context, userService, courier),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _confirmDeleteCourier(
    BuildContext context,
    UserService userService,
    RestaurantCourierNode courier,
  ) async {
    final confirmed = await DeleteConfirmationDialog.show(
      context: context,
      title: AppLocalizations.of(context)!.confirmDelete,
      message: AppLocalizations.of(
        context,
      )!.confirmDeleteCourier(courier.email),
    );

    if (confirmed && context.mounted) {
      try {
        await userService.deleteUser(courier.id);
        if (context.mounted) {
          UIErrorHandler.showSnackBar(
            context,
            AppLocalizations.of(context)!.courierDeleted,
          );
        }
      } catch (e) {
        if (context.mounted) {
          UIErrorHandler.handleError(context, e);
        }
      }
    }
  }

  void _showInviteCourierDialog() {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.inviteNewCourier),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: emailController,
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnterEmail;
                  }
                  if (!value.contains('@')) {
                    return AppLocalizations.of(context)!.pleaseEnterValidEmail;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.courierPasswordWillBeEmailed,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            label: Text(AppLocalizations.of(context)!.cancel),
          ),
          AppPremiumButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  Navigator.pop(context); // Close dialog first
                  await context.read<UserService>().createCourier(
                    emailController.text,
                    restaurantIri: widget.restaurantIri,
                  );
                  if (!context.mounted) return;
                  UIErrorHandler.showSnackBar(
                    context,
                    AppLocalizations.of(context)!.courierInvitedSuccess,
                  );
                  _loadCouriers(); // Refresh list
                } catch (e) {
                  if (!context.mounted) return;
                  UIErrorHandler.showSnackBar(
                    context,
                    AppLocalizations.of(
                      context,
                    )!.courierInviteFailed(e.toString()),
                    isError: true,
                  );
                }
              }
            },
            icon: Icons.send,
            label: AppLocalizations.of(context)!.inviteCourier,
          ),
        ],
      ),
    );
  }
}
