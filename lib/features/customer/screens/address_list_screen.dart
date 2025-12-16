import 'package:catering_flutter/core/app_router.dart';
import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/core/utils/ui_error_handler.dart';
import 'package:catering_flutter/features/customer/services/address_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
        if (!mounted) return;
        final service = context.read<AddressService>();
        if (service.errorMessage != null) {
          UIErrorHandler.showSnackBar(
            context,
            service.errorMessage!,
            isError: true,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 700;
    return CustomScaffold(
      title: widget.isSelectionMode
          ? AppLocalizations.of(context)!.selectAddress
          : AppLocalizations.of(context)!.myAddresses,
      floatingActionButton: isNarrow
          ? FloatingActionButton(
              onPressed: () {
                context.push(AppRoutes.addressForm);
              },
              tooltip: AppLocalizations.of(context)!.addAddress,
              child: const Icon(Icons.add),
            )
          : FloatingActionButton.extended(
              onPressed: () {
                context.push(AppRoutes.addressForm);
              },
              icon: const Icon(Icons.add),
              label: Text(AppLocalizations.of(context)!.addAddress),
            ),
      child: Consumer<AddressService>(
        builder: (context, addressService, child) {
          if (addressService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (addressService.addresses.isEmpty) {
            return Center(
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
                  Text(AppLocalizations.of(context)!.addAddressToGetStarted),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              final userIri = context.read<AuthService>().userIri;
              if (userIri != null) {
                await context.read<AddressService>().fetchAddresses(userIri);
              }
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: addressService.addresses.length,
              itemBuilder: (context, index) {
                final address = addressService.addresses[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: Icon(
                      address.isDefault ? Icons.star : Icons.location_on,
                      color: address.isDefault
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                    title: Text('${address.firstName} ${address.lastName}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(address.street),
                        if (address.apartment != null)
                          Text(
                            '${AppLocalizations.of(context)!.apt}: ${address.apartment}',
                          ),
                        Text('${address.city}, ${address.zipCode}'),
                        Text(address.phoneNumber),
                      ],
                    ),
                    trailing: widget.isSelectionMode
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              context.push(
                                AppRoutes.addressForm,
                                extra: address,
                              );
                            },
                          ),
                    onTap: widget.isSelectionMode
                        ? () {
                            context.pop(address);
                          }
                        : null,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
