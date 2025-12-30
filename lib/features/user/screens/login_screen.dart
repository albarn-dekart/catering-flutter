import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';

import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  final String? redirectUrl;

  const LoginScreen({super.key, this.redirectUrl});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.login,
      child: LoginView(redirectUrl: redirectUrl),
    );
  }
}

class LoginView extends StatefulWidget {
  final String? redirectUrl;

  const LoginView({super.key, this.redirectUrl});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });
    try {
      await context.read<AuthService>().login(
        _emailController.text,
        _passwordController.text,
      );

      if (mounted) {
        UIErrorHandler.showSnackBar(
          context,
          AppLocalizations.of(context)!.loginSuccess,
          isError: false,
        );
        if (widget.redirectUrl != null) {
          context.go(widget.redirectUrl!);
        } else {
          context.go(AppRoutes.home);
        }
      }
    } catch (e) {
      if (mounted) {
        UIErrorHandler.handleError(
          context,
          e,
          customMessage: AppLocalizations.of(context)!.loginFailed,
        );
      }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_person,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            AppCard(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.signInToContinue,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _emailController,
                      labelText: AppLocalizations.of(context)!.email,
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.fieldRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: AppLocalizations.of(context)!.password,
                      hintText: AppLocalizations.of(context)!.password,
                      prefixIcon: const Icon(Icons.lock_outline),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.fieldRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    AppPremiumButton(
                      onPressed: _login,
                      label: AppLocalizations.of(context)!.login,
                      isLoading: _isLoading,
                      icon: Icons.login,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: () {
                context.push(AppRoutes.register);
              },
              icon: const Icon(Icons.person_add),
              label: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.dontHaveAccount,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.register,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
