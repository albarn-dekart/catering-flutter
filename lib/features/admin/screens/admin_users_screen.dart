import 'package:catering_flutter/core/utils/iri_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/user/services/user_service.dart';
import 'package:catering_flutter/core/widgets/searchable_list_screen.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  State<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
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
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<UserNode>(
          title: 'Manage Users',
          items: userService.users,
          isLoading: userService.isLoading,
          searchHint: 'Search users by email...',
          filter: (user, query) {
            final matchesQuery = user.email.toLowerCase().contains(query);
            final matchesRole =
                _selectedRoleFilter == null ||
                user.roles.contains(_selectedRoleFilter);
            return matchesQuery && matchesRole;
          },
          onRefresh: () async {
            await userService.fetchAllUsers();
          },
          customFilters: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Filter by Role',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              initialValue: _selectedRoleFilter,
              items: const [
                DropdownMenuItem(value: null, child: Text('All Roles')),
                DropdownMenuItem(value: 'ROLE_ADMIN', child: Text('Admin')),
                DropdownMenuItem(
                  value: 'ROLE_RESTAURANT',
                  child: Text('Restaurant'),
                ),
                DropdownMenuItem(value: 'ROLE_DRIVER', child: Text('Driver')),
                DropdownMenuItem(
                  value: 'ROLE_CUSTOMER',
                  child: Text('Customer'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedRoleFilter = value;
                });
              },
            ),
          ),
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('ID: ${IriHelper.getId(user.id)}'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Assign Role:',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          items: const [
                            DropdownMenuItem(
                              value: 'ROLE_ADMIN',
                              child: Text('Admin'),
                            ),
                            DropdownMenuItem(
                              value: 'ROLE_RESTAURANT',
                              child: Text('Restaurant'),
                            ),
                            DropdownMenuItem(
                              value: 'ROLE_DRIVER',
                              child: Text('Driver'),
                            ),
                            DropdownMenuItem(
                              value: 'ROLE_CUSTOMER',
                              child: Text('Customer'),
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
                                    'Role updated successfully',
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
}
