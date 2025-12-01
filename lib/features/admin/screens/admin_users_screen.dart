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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserService>().fetchAllUsers();
    });
  }

  Widget _buildRoleChip(
    BuildContext context,
    UserService userService,
    UserNode user,
    String role,
    String label,
  ) {
    final rolesList = user.roles;
    final isSelected = rolesList.contains(role);
    return FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
      onSelected: (selected) async {
        final currentRoles = List<String>.from(rolesList);
        if (selected) {
          currentRoles.add(role);
        } else {
          currentRoles.remove(role);
        }

        try {
          await userService.updateUserRoles(user.id, currentRoles);
          if (context.mounted) {
            UIErrorHandler.showSnackBar(
              context,
              'Roles updated successfully',
              isError: false,
            );
          }
        } catch (e) {
          if (context.mounted) {
            UIErrorHandler.handleError(context, e);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        return SearchableListScreen<UserNode>(
          title: 'Manage Users',
          items: userService.users,
          isLoading: userService.isLoading,
          searchHint: 'Search users by email...',
          filter: (user, query) => user.email.toLowerCase().contains(query),
          onRefresh: () async {
            await userService.fetchAllUsers();
          },
          itemBuilder: (context, user) {
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
                subtitle: Text('ID: ${IriHelper.getId(user.id)} • Roles: ${user.roles.length}'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildRoleChip(
                          context,
                          userService,
                          user,
                          'ROLE_ADMIN',
                          'Admin',
                        ),
                        _buildRoleChip(
                          context,
                          userService,
                          user,
                          'ROLE_RESTAURANT',
                          'Restaurant',
                        ),
                        _buildRoleChip(
                          context,
                          userService,
                          user,
                          'ROLE_DRIVER',
                          'Driver',
                        ),
                        _buildRoleChip(
                          context,
                          userService,
                          user,
                          'ROLE_CUSTOMER',
                          'Customer',
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
