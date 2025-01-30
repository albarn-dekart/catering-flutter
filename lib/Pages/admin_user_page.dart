import 'package:flutter/material.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/user.dart';

class AdminUserPage extends StatefulWidget {
  const AdminUserPage({super.key});

  @override
  _AdminUserPageState createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      isLoading = true;
    });

    final fetchedUsers = await User.fetch();

    setState(() {
      users = fetchedUsers;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Manage Users'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : users.isEmpty
              ? const Center(child: Text('No users found'))
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return UserCard(
                      user: user,
                      onDelete: (int userId) {
                        setState(() {
                          users.removeWhere((user) => user.id == userId);
                        });
                      },
                    );
                  },
                ),
    );
  }
}
