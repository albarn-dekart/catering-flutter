import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class RestaurantDriversScreen extends StatefulWidget {
  final String restaurantIri;

  const RestaurantDriversScreen({super.key, required this.restaurantIri});

  @override
  State<RestaurantDriversScreen> createState() =>
      _RestaurantDriversScreenState();
}

class _RestaurantDriversScreenState extends State<RestaurantDriversScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDrivers();
    });
  }

  Future<void> _loadDrivers() async {
    await context.read<UserService>().fetchDriversByRestaurant(
      widget.restaurantIri,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<RestaurantDriverNode>(
          title: AppLocalizations.of(context)!.manageDrivers,
          items: userService.restaurantDrivers,
          isLoading: userService.isLoading,
          searchHint: AppLocalizations.of(context)!.searchDriversByEmail,
          onSearch: (query) {
            userService.fetchDriversByRestaurant(
              widget.restaurantIri,
              searchQuery: query,
            );
          },
          hasError: userService.hasError,
          errorMessage: userService.errorMessage,
          onRetry: _loadDrivers,
          onRefresh: _loadDrivers,
          itemBuilder: (context, driver) {
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 24,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  driver.email,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.driverRoleLabel,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: () =>
                      _confirmDeleteDriver(context, userService, driver),
                ),
              ),
            );
          },
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: _showInviteDriverDialog,
                  tooltip: AppLocalizations.of(context)!.inviteDriver,
                  child: const Icon(Icons.person_add),
                )
              : FloatingActionButton.extended(
                  onPressed: _showInviteDriverDialog,
                  icon: const Icon(Icons.person_add),
                  label: Text(AppLocalizations.of(context)!.inviteDriver),
                ),
        );
      },
    );
  }

  Future<void> _confirmDeleteDriver(
    BuildContext context,
    UserService userService,
    RestaurantDriverNode driver,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmDelete),
        content: Text(
          AppLocalizations.of(context)!.confirmDeleteDriver(driver.email),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await userService.deleteUser(driver.id);
        if (context.mounted) {
          UIErrorHandler.showSnackBar(
            context,
            AppLocalizations.of(context)!.driverDeleted,
          );
        }
      } catch (e) {
        if (context.mounted) {
          UIErrorHandler.handleError(context, e);
        }
      }
    }
  }

  void _showInviteDriverDialog() {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.inviteNewDriver),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.email,
                  prefixIcon: const Icon(Icons.email),
                ),
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
                AppLocalizations.of(context)!.driverPasswordWillBeEmailed,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  Navigator.pop(context); // Close dialog first
                  await context.read<UserService>().createDriver(
                    emailController.text,
                    restaurantIri: widget.restaurantIri,
                  );
                  if (!context.mounted) return;
                  UIErrorHandler.showSnackBar(
                    context,
                    AppLocalizations.of(context)!.driverInvitedSuccess,
                  );
                  _loadDrivers(); // Refresh list
                } catch (e) {
                  if (!context.mounted) return;
                  UIErrorHandler.showSnackBar(
                    context,
                    AppLocalizations.of(
                      context,
                    )!.driverInviteFailed(e.toString()),
                    isError: true,
                  );
                }
              }
            },
            child: Text(AppLocalizations.of(context)!.invite),
          ),
        ],
      ),
    );
  }
}
