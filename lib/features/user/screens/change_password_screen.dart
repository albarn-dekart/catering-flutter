import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/core/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<ChangePasswordService>().clearStatus(); // Removed ChangePasswordService
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
    final newPassword = _newPasswordController.text;
    final confirmedPassword = _confirmedPasswordController.text;
    final oldPassword = _oldPasswordController.text;

    // Validate inputs
    if (oldPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmedPassword.isEmpty) {
      UIErrorHandler.showSnackBar(
        context,
        'Please fill in all fields',
        isError: true,
      );
      return;
    }

    if (newPassword != confirmedPassword) {
      UIErrorHandler.showSnackBar(
        context,
        'New passwords do not match',
        isError: true,
      );
      return;
    }

    if (newPassword.length < 8) {
      UIErrorHandler.showSnackBar(
        context,
        'New password must be at least 8 characters',
        isError: true,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });
    try {
      final authService = context.read<AuthService>();
      await authService.changePassword(oldPassword, newPassword);

      if (!mounted) return;

      UIErrorHandler.showSnackBar(
        context,
        'Password changed successfully!',
        isError: false,
      );
      context.pop();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(
        context,
        e,
        customMessage: 'Failed to change password',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lock_reset,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Update Security',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your current password and a new one.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
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
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: _isLoading ? null : _changePassword,
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Change Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
