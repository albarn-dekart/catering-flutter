import 'package:flutter/material.dart';

import 'package:catering_app/Pages/home_page.dart';
import 'package:catering_app/Pages/login_page.dart';
import 'package:catering_app/Pages/new_order.dart';
import 'package:catering_app/Pages/orders_page.dart';
import 'package:catering_app/Pages/register_page.dart';
import 'package:catering_app/Pages/user_page.dart';

import 'package:catering_app/main.dart';
import 'package:catering_app/Classes/user_manager.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Pages/admin_page.dart';

class CateringAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CateringAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });

  @override
  _CateringAppBarState createState() => _CateringAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CateringAppBarState extends State<CateringAppBar> {
  @override
  Widget build(BuildContext context) {
    final isAdmin = UserManager().hasRole('ROLE_ADMIN');
    final isUser = UserManager().hasRole('ROLE_USER');
    final detailsFilled = UserManager().detailsFilled;
    final username = UserManager().username;

    return AppBar(
      //Page title
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(widget.title),
      ),
      leading: widget.showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      automaticallyImplyLeading: false,
      actions: [
        if (isAdmin) _buildAppBarButton('Admin Page', AdminPage()),
        if (isUser) ...[
          //New order or redirect if user details are not filled
          _buildAppBarButton(
              'New Order', detailsFilled ? NewOrder() : UserPage()),
          //Show current username
          if (username != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  '($username)',
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ),
            ),
          _buildUserMenu(), // UserMenu comes after the username
        ] else ...[
          _buildAppBarButton('Login', LoginPage()),
          _buildAppBarButton('Register', RegisterPage()),
        ],
      ],
    );
  }

  Widget _buildAppBarButton(String text, Widget page) {
    return TextButton(
      onPressed: () => navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (context) => page)),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
      ),
      child: Text(text),
    );
  }

  Widget _buildUserMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.person, color: Colors.white70),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'details',
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('User Details'),
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
        Widget page = HomePage();
        switch (value) {
          case 'details':
            page = UserPage();
            break;
          case 'orders':
            page = OrdersPage();
            break;
          case 'logout':
            await Authorization.logout();
            break;
        }

        navigatorKey.currentState?.push(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
    );
  }
}
