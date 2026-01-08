import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/widgets/global_error_widget.dart';
import 'package:catering_flutter/features/customer/services/address_service.dart';
import 'package:flutter/material.dart';
import 'package:catering_flutter/features/customer/widgets/address_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

class AddressListScreen extends StatefulWidget {
  final bool isSelectionMode;

  const AddressListScreen({super.key, this.isSelectionMode = false});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userIri = context.read<AuthService>().userIri;
      if (userIri != null) {
        await context.read<AddressService>().fetchAddresses(userIri);
      }
    });
  }

  @override
  void dispose() {
    context.read<AddressService>().clearError();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.isSelectionMode
          ? AppLocalizations.of(context)!.selectAddress
          : AppLocalizations.of(context)!.myAddresses,
      child: Consumer<AddressService>(
        builder: (context, addressService, child) {
          final addresses = addressService.addresses;

          if (addressService.hasError && addresses.isEmpty) {
            return GlobalErrorWidget(
              message: addressService.errorMessage,
              onRetry: () {
                final userIri = context.read<AuthService>().userIri;
                if (userIri != null) {
                  addressService.fetchAddresses(userIri);
                }
              },
              onCancel: () {
                addressService.clearError();
                context.pop();
              },
              withScaffold: false,
            );
          }

          if (addressService.isLoading && addresses.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    // const Spacer(),
                    AppPremiumButton(
                      onPressed: () {
                        context.push(AppRoutes.addressForm);
                      },
                      icon: Icons.add,
                      label: AppLocalizations.of(context)!.addAddress,
                      isFullWidth: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: addresses.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_off,
                              size: 64,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              AppLocalizations.of(context)!.noAddressesFound,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.addAddressToGetStarted,
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          final userIri = context.read<AuthService>().userIri;
                          if (userIri != null) {
                            await context.read<AddressService>().fetchAddresses(
                              userIri,
                            );
                          }
                        },
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: addresses.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            return AddressCard.fromAddress(
                              address: address,
                              onTap: widget.isSelectionMode
                                  ? () => context.pop(address)
                                  : null,
                              showActions: !widget.isSelectionMode,
                              onEdit: () {
                                context.push(
                                  AppRoutes.addressForm,
                                  extra: address,
                                );
                              },
                              onDelete: () async {
                                final confirmed =
                                    await DeleteConfirmationDialog.show(
                                      context: context,
                                      title: AppLocalizations.of(
                                        context,
                                      )!.deleteAddress,
                                      message: AppLocalizations.of(
                                        context,
                                      )!.confirmDeleteAddress,
                                    );

                                if (confirmed && context.mounted) {
                                  try {
                                    await context
                                        .read<AddressService>()
                                        .deleteAddress(address.id);
                                  } catch (e) {
                                    if (context.mounted) {
                                      UIErrorHandler.handleError(context, e);
                                    }
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
