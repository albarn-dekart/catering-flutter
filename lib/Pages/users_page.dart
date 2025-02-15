import 'package:flutter/material.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/user.dart';
import 'package:catering_app/Classes/app_theme.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  Future<void> _getUsers() async {
    setState(() => isLoading = true);

    final getedUsers = await User.getAllUsers();

    setState(() {
      users = getedUsers;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Manage Users'),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (users.isEmpty) return _buildEmptyState();

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        return UserCard(
          user: user,
          onDelete: (User user) {
            setState(() => users.remove(user));
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_alt_rounded, size: 64, color: Colors.grey[400]),
          const SizedBox(height: AppTheme.defaultPadding),
          const Text(
            'No users found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
