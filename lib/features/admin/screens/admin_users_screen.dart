import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';
import 'package:catering_flutter/core/services/export_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

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
      if (!mounted) return;
      final service = context.read<UserService>();
      if (service.hasError) {
        UIErrorHandler.showSnackBar(
          context,
          service.errorMessage!,
          isError: true,
        );
      }
    });
  }

  String? _selectedRoleFilter;

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<UserNode>(
          title: AppLocalizations.of(context)!.manageUsers,
          floatingActionButton: isNarrow
              ? FloatingActionButton(
                  onPressed: _isExporting ? null : _exportUsers,
                  tooltip: AppLocalizations.of(context)!.exportToCsv,
                  child: _isExporting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.download),
                )
              : FloatingActionButton.extended(
                  onPressed: _isExporting ? null : _exportUsers,
                  icon: _isExporting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.download),
                  label: Text(AppLocalizations.of(context)!.exportToCsv),
                ),
          items: userService.users,
          isLoading: userService.isLoading,
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

            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ExpansionTile(
                leading: CircleAvatar(
                  child: Text(
                    user.email.isNotEmpty ? user.email[0].toUpperCase() : '?',
                  ),
                ),
                title: Text(
                  user.email,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('ID: ${IriHelper.getId(user.id)}'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.assignRole,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          initialValue: currentRole,
                          items: [
                            DropdownMenuItem(
                              value: 'ROLE_ADMIN',
                              child: Text(
                                AppLocalizations.of(context)!.roleAdmin,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'ROLE_RESTAURANT',
                              child: Text(
                                AppLocalizations.of(context)!.roleRestaurant,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'ROLE_DRIVER',
                              child: Text(
                                AppLocalizations.of(context)!.roleDriver,
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'ROLE_CUSTOMER',
                              child: Text(
                                AppLocalizations.of(context)!.roleCustomer,
                              ),
                            ),
                          ],
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
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _confirmDeleteUser(context, userService, user),
                            icon: const Icon(Icons.delete),
                            label: Text(AppLocalizations.of(context)!.delete),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                            ),
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.confirmDelete),
        content: Text(
          AppLocalizations.of(context)!.confirmDeleteUser(user.email),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
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
    final roles = [
      {'value': null, 'label': AppLocalizations.of(context)!.all},
      {'value': 'ROLE_ADMIN', 'label': AppLocalizations.of(context)!.roleAdmin},
      {
        'value': 'ROLE_RESTAURANT',
        'label': AppLocalizations.of(context)!.roleRestaurant,
      },
      {
        'value': 'ROLE_DRIVER',
        'label': AppLocalizations.of(context)!.roleDriver,
      },
      {
        'value': 'ROLE_CUSTOMER',
        'label': AppLocalizations.of(context)!.roleCustomer,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: roles.map((role) {
            return _buildFilterChip(role['value'], role['label'] as String);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String? role, String label) {
    final isSelected = _selectedRoleFilter == role;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedRoleFilter = role;
          });
          context.read<UserService>().fetchAllUsers(roleFilter: role);
        },
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        checkmarkColor: Theme.of(context).colorScheme.onPrimaryContainer,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
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
        AppLocalizations.of(context)!.usersExported,
        isError: false,
      );
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.usersExportFailed(e.toString()),
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
