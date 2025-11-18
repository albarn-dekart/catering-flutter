import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/authentication/services/change_password_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Change Password',
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChangePasswordService>().clearStatus();
    });
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmedPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() async {
    final changePasswordService = context.read<ChangePasswordService>();
    await changePasswordService.changePassword(
      _oldPasswordController.text,
      _newPasswordController.text,
      _confirmedPasswordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordService>(
      builder: (context, changePasswordService, child) {
        if (changePasswordService.isSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password changed successfully')),
            );
            context.pop();
            changePasswordService.clearStatus();
          });
        } else if (changePasswordService.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Failed to change password: ${changePasswordService.errorMessage}',
                ),
              ),
            );
            changePasswordService.clearStatus();
          });
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextField(
                  controller: _oldPasswordController,
                  hintText: 'Old Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _newPasswordController,
                  hintText: 'New Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: _confirmedPasswordController,
                  hintText: 'Confirm New Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                changePasswordService.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _changePassword,
                        child: const Text('Change Password'),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
