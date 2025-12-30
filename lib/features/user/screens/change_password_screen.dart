import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.changePassword,
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
        AppLocalizations.of(context)!.fillAllFields,
        isError: true,
      );
      return;
    }

    if (newPassword != confirmedPassword) {
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.passwordsDoNotMatch,
        isError: true,
      );
      return;
    }

    if (newPassword.length < 8) {
      UIErrorHandler.showSnackBar(
        context,
        AppLocalizations.of(context)!.newPasswordMinLength,
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
        AppLocalizations.of(context)!.passwordChangedSuccess,
        isError: false,
      );
      context.pop();
    } catch (e) {
      if (!mounted) return;
      UIErrorHandler.handleError(
        context,
        e,
        customMessage: AppLocalizations.of(context)!.failedToChangePassword,
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
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: AppCard(
          padding: const EdgeInsets.all(16),
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
                AppLocalizations.of(context)!.updateSecurity,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.updateSecurityDescription,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _oldPasswordController,
                labelText: AppLocalizations.of(context)!.oldPassword,
                hintText: AppLocalizations.of(context)!.oldPassword,
                prefixIcon: const Icon(Icons.lock_outline),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _newPasswordController,
                labelText: AppLocalizations.of(context)!.newPassword,
                hintText: AppLocalizations.of(context)!.newPassword,
                prefixIcon: const Icon(Icons.password_outlined),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _confirmedPasswordController,
                labelText: AppLocalizations.of(context)!.confirmNewPassword,
                hintText: AppLocalizations.of(context)!.confirmNewPassword,
                prefixIcon: const Icon(Icons.check_circle_outline),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              AppPremiumButton(
                onPressed: _changePassword,
                label: AppLocalizations.of(context)!.changePassword,
                isLoading: _isLoading,
                icon: Icons.lock_open,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
