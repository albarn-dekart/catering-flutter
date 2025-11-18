import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/customer/services/profile_service.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch profile data when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileService>().fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(title: 'Profile', child: const ProfileView());
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileService>(
      builder: (context, profileService, child) {
        if (profileService.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (profileService.hasError) {
          return Center(
            child: Text(profileService.errorMessage ?? 'An error occurred'),
          );
        } else if (profileService.profile != null) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Profile',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text('Email: ${profileService.profile!.email}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.push(AppRoutes.changePassword);
                    },
                    child: const Text('Change Password'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
