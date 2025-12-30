import 'package:catering_flutter/core/utils/role_helper.dart';
import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/core/widgets/filter_chips_bar.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';
import 'package:catering_flutter/core/widgets/icon_badge.dart';
import 'package:catering_flutter/core/widgets/app_export_button.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  bool _isExporting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<UserService>().fetchAllUsers();
    });
  }

  String? _selectedRoleFilter;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<UserNode>(
          title: AppLocalizations.of(context)!.manageUsers,
          headerAction: AppExportButton(
            onPressed: _exportUsers,
            isLoading: _isExporting,
          ),
          items: userService.users,
          isLoading: userService.isLoading,
          isLoadingMore: userService.isFetchingMore,
          hasError: userService.hasError,
          errorMessage: userService.errorMessage,
          onRetry: () =>
              userService.fetchAllUsers(roleFilter: _selectedRoleFilter),
          onLoadMore: () async {
            if (!userService.isFetchingMore && userService.hasNextPage) {
              await userService.loadMoreUsers();
            }
          },
          searchHint: AppLocalizations.of(context)!.searchUsers,
          onSearch: (query) {
            userService.fetchAllUsers(
              searchQuery: query,
              roleFilter: _selectedRoleFilter,
            );
          },

          onRefresh: () async {
            await userService.fetchAllUsers(roleFilter: _selectedRoleFilter);
          },
          customFilters: _buildRoleFilterChips(),
          itemBuilder: (context, user) {
            // Determine primary role (first match or default to Customer)
            String currentRole = 'ROLE_CUSTOMER';
            if (user.roles.contains('ROLE_ADMIN')) {
              currentRole = 'ROLE_ADMIN';
            } else if (user.roles.contains('ROLE_RESTAURANT')) {
              currentRole = 'ROLE_RESTAURANT';
            } else if (user.roles.contains('ROLE_DRIVER')) {
              currentRole = 'ROLE_DRIVER';
            }

            final theme = Theme.of(context);

            return AppCard(
              child: ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer
                      .withValues(alpha: 0.5),
                  foregroundColor: theme.colorScheme.primary,
                  child: Text(
                    user.email.isNotEmpty ? user.email[0].toUpperCase() : '?',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  user.email,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      IconBadge(
                        text: IriHelper.getId(user.id),
                        icon: Icons.tag,
                      ),
                      const SizedBox(width: 8),
                      IconBadge(
                        text: RoleHelper.getLocalizedRole(context, currentRole),
                        icon: Icons.shield_outlined,
                      ),
                    ],
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.assignRole,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          initialValue: currentRole,
                          items:
                              [
                                'ROLE_ADMIN',
                                'ROLE_RESTAURANT',
                                'ROLE_DRIVER',
                                'ROLE_CUSTOMER',
                              ].map((role) {
                                return DropdownMenuItem(
                                  value: role,
                                  child: Text(
                                    RoleHelper.getLocalizedRole(context, role),
                                  ),
                                );
                              }).toList(),
                          onChanged: (newRole) async {
                            if (newRole != null && newRole != currentRole) {
                              try {
                                await userService.updateUserRoles(user.id, [
                                  newRole,
                                ]);
                                if (context.mounted) {
                                  UIErrorHandler.showSnackBar(
                                    context,
                                    AppLocalizations.of(context)!.roleUpdated,
                                    isError: false,
                                  );
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  UIErrorHandler.handleError(context, e);
                                }
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CardActionButtons(
                            onDelete: () =>
                                _confirmDeleteUser(context, userService, user),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _confirmDeleteUser(
    BuildContext context,
    UserService userService,
    UserNode user,
  ) async {
    final confirmed = await DeleteConfirmationDialog.show(
      context: context,
      title: AppLocalizations.of(context)!.confirmDelete,
      message: AppLocalizations.of(context)!.confirmDeleteUser(user.email),
    );

    if (confirmed && context.mounted) {
      try {
        await userService.deleteUser(user.id);
        if (context.mounted) {
          UIErrorHandler.showSnackBar(
            context,
            AppLocalizations.of(context)!.userDeleted,
            isError: false,
          );
        }
      } catch (e) {
        if (context.mounted) {
          UIErrorHandler.handleError(context, e);
        }
      }
    }
  }

  Widget _buildRoleFilterChips() {
    return FilterChipsBar<String>(
      values: const [
        'ROLE_ADMIN',
        'ROLE_RESTAURANT',
        'ROLE_DRIVER',
        'ROLE_CUSTOMER',
      ],
      selectedValue: _selectedRoleFilter,
      allLabel: AppLocalizations.of(context)!.all,
      labelBuilder: (role) => RoleHelper.getLocalizedRole(context, role),
      onSelected: (role) {
        setState(() {
          _selectedRoleFilter = role;
        });
        context.read<UserService>().fetchAllUsers(roleFilter: role);
      },
    );
  }

  Future<void> _exportUsers() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final exportService = context.read<ExportService>();

      await exportService.exportUsersToCsv(roleFilter: _selectedRoleFilter);

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.exportSuccess,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.exportFailed(e.toString()),
        isError: true,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }
}
