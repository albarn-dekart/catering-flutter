import 'dart:convert';
import 'package:catering_app/Pages/orders_page.dart';
import 'package:catering_app/Pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/info_row.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/button.dart';

class User {
  final int id;
  final String email;
  List<String> roles;

  User({
    required this.id,
    required this.email,
    required this.roles,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is User && other.id == id);

  @override
  int get hashCode => id.hashCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
    );
  }

  static Future<List<User>> getAllUsers() async {
    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return [];
      }

      final response = await http.get(
        ApiConfig.users(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> usersJson =
            jsonDecode(response.body) as List<dynamic>;
        return usersJson
            .map((userJson) => User.fromJson(userJson as Map<String, dynamic>))
            .toList();
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to get users', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to get users', Colors.red, error.toString());
    }
    return [];
  }

  static Future<Map<String, dynamic>?> getCurrentUserDetails() async {
    //Request
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return null;

      final response = await http.get(
        ApiConfig.userDetails(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.isNotEmpty) {
          return data;
        }
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load user data', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to load user data', Colors.red, error.toString());
    }

    return null;
  }

  Future<Map<String, dynamic>?> getDetails() async {
    //Request
    try {
      final token = await Authorization.getValidToken();
      if (token == null) return null;

      final response = await http.get(
        ApiConfig.userDetailsById(id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.isNotEmpty) {
          return data;
        }
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load user data', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to load user data', Colors.red, error.toString());
    }

    return null;
  }

  Future<bool> delete() async {
    if (roles.contains('admin')) {
      NotificationBar().show(
        'Cannot delete admin users!',
        Colors.red,
      );
      return false;
    }

    try {
      final token = await Authorization.getValidToken();
      if (token == null) return false;

      final response = await http.delete(
        ApiConfig.deleteUserById(id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 204) {
        NotificationBar().show('User deleted!', Colors.green);
        return true;
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to delete user', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to delete user', Colors.red, error.toString());
    }
    return false;
  }

  Future<void> updateRoles() async {
    final requestBody = {
      'roles': roles,
    };

    try {
      final token = await Authorization.getValidToken();
      if (token == null) return;

      final response = await http.patch(
        ApiConfig.updateRolesById(id.toString()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 204) {
        NotificationBar().show('User roles updated!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to update roles', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to update roles', Colors.red, error.toString());
    }
  }
}

class UserCard extends StatefulWidget {
  final User user;
  final Function(User) onDelete;

  const UserCard({
    super.key,
    required this.user,
    required this.onDelete,
  });

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late TextEditingController _rolesController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _rolesController =
        TextEditingController(text: widget.user.roles.join(', '));
  }

  @override
  void dispose() {
    _rolesController.dispose();
    super.dispose();
  }

  Future<void> _saveRoles() async {
    final newRoles = _rolesController.text
        .split(',')
        .map((role) => role.trim())
        .where((role) => role.isNotEmpty)
        .toList();

    if (newRoles.isEmpty) {
      NotificationBar().show('Roles cannot be empty!', AppTheme.errorColor);
      return;
    }

    setState(() {
      widget.user.roles = newRoles;
      _isEditing = false;
    });

    await widget.user.updateRoles();
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete User?',
            style: Theme.of(context).textTheme.titleMedium),
        content: const Text('This action cannot be undone'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: const Text('Delete',
                style: TextStyle(color: AppTheme.errorColor)),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (await widget.user.delete()) {
        widget.onDelete(widget.user);
      }
    }
  }

  void _cancelEdit() {
    setState(() {
      _rolesController.text = widget.user.roles.join(', ');
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: AppTheme.defaultPadding),
            InfoRow(
              icon: Icons.email_outlined,
              value: widget.user.email,
            ),
            const SizedBox(height: AppTheme.defaultPadding / 2),
            _buildRolesEditor(),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildActionButtons(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "User #${widget.user.id}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  Widget _buildRolesEditor() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.groups_outlined, size: 20, color: Colors.grey),
        const SizedBox(width: AppTheme.defaultPadding),
        _isEditing
            ? Expanded(
                child: TextFormField(
                  controller: _rolesController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Comma-separated roles..',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.cardRadius),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.defaultPadding,
                      vertical: 12,
                    ),
                  ),
                ),
              )
            : Expanded(
                child: Text(
                  widget.user.roles.join(', '),
                ),
              ),
        const SizedBox(width: AppTheme.defaultPadding / 2),
        _buildEditControls(),
      ],
    );
  }

  Widget _buildEditControls() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: _isEditing
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.check_circle_outline),
                  color: AppTheme.successColor,
                  onPressed: _saveRoles,
                ),
                IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  color: AppTheme.errorColor,
                  onPressed: _cancelEdit,
                ),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.edit_outlined),
              color: AppTheme.primaryColor,
              onPressed: () => setState(() => _isEditing = true),
            ),
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Wrap(
      spacing: AppTheme.defaultPadding / 2,
      runSpacing: AppTheme.defaultPadding / 2,
      alignment: WrapAlignment.end,
      children: [
        cardButton(
            'Orders',
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrdersPage(user: widget.user),
                  ),
                ),
            Icons.shopping_cart_outlined,
            AppTheme.secondaryColor,
            isMobile),
        cardButton(
            'Details',
            () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(user: widget.user),
                  ),
                ),
            Icons.edit_note_outlined,
            AppTheme.primaryColor,
            isMobile),
        if (!widget.user.roles.contains('ROLE_ADMIN'))
          cardButton('Delete', _confirmDelete, Icons.delete_outlined,
              Colors.red, isMobile),
      ],
    );
  }
}
