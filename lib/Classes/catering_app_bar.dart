import 'package:flutter/material.dart';
import 'package:catering_app/main.dart';
import 'package:catering_app/Classes/role_manager.dart';
import 'package:catering_app/Classes/authorization.dart';

class CateringAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CateringAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  _CateringAppBarState createState() => _CateringAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CateringAppBarState extends State<CateringAppBar> {
  @override
  Widget build(BuildContext context) {
    final isAdmin = RoleManager().isAdmin;
    final isUser = RoleManager().isUser;

    return AppBar(
      title: Text(widget.title),
      leading: widget.showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      automaticallyImplyLeading: false,
      actions: [
        if (isAdmin) ...[
          _buildAppBarButton('Manage Users', '/admin/users'),
          _buildAppBarButton('Manage Meal Plans', '/admin/meal_plans'),
        ],
        if (isUser) ...[
          _buildAppBarButton('New Order', '/order'),
          _buildProfileMenu(),
        ] else ...[
          _buildAppBarButton('Login', '/login'),
          _buildAppBarButton('Register', '/register'),
        ],
      ],
    );
  }

  Widget _buildAppBarButton(String text, String route) {
    return TextButton(
      onPressed: () => navigatorKey.currentState?.pushReplacementNamed(route),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }

  Widget _buildProfileMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.person, color: Colors.white),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'details',
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile Details'),
          ),
        ),
        const PopupMenuItem(
          value: 'orders',
          child: ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('My Orders'),
          ),
        ),
        const PopupMenuItem(
          value: 'logout',
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ),
      ],
      onSelected: (value) async {
        if (value == 'logout') await Authorization.logout();
        navigatorKey.currentState?.pushReplacementNamed('/$value');
      },
    );
  }
}
