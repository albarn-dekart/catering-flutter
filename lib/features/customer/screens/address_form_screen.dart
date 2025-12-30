import 'package:catering_flutter/core/services/auth_service.dart';
import 'package:catering_flutter/core/widgets/app_card.dart';
import 'package:catering_flutter/core/widgets/app_premium_button.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart';
import 'package:catering_flutter/l10n/app_localizations.dart';

import 'package:catering_flutter/features/customer/services/address_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/widgets/card_action_buttons.dart';
import 'package:catering_flutter/core/widgets/custom_text_field.dart';

class AddressFormScreen extends StatefulWidget {
  final Address? address;

  const AddressFormScreen({super.key, this.address});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _streetController;
  late TextEditingController _apartmentController;
  late TextEditingController _cityController;
  late TextEditingController _zipCodeController;
  bool _isDefault = false;

  @override
  void initState() {
    super.initState();
    final address = widget.address;
    _firstNameController = TextEditingController(text: address?.firstName);
    _lastNameController = TextEditingController(text: address?.lastName);
    _phoneNumberController = TextEditingController(text: address?.phoneNumber);
    _streetController = TextEditingController(text: address?.street);
    _apartmentController = TextEditingController(text: address?.apartment);
    _cityController = TextEditingController(text: address?.city);
    _zipCodeController = TextEditingController(text: address?.zipCode);
    _isDefault = address?.isDefault ?? false;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _streetController.dispose();
    _apartmentController.dispose();
    _cityController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  Future<void> _saveAddress() async {
    if (!_formKey.currentState!.validate()) return;

    final addressService = context.read<AddressService>();
    final userIri = context.read<AuthService>().userIri;

    if (userIri != null && widget.address == null) {
      await addressService.createAddress(
        userIri: userIri,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneNumberController.text,
        street: _streetController.text,
        apartment: _apartmentController.text.isEmpty
            ? null
            : _apartmentController.text,
        city: _cityController.text,
        zipCode: _zipCodeController.text,
        isDefault: _isDefault,
      );
    } else {
      await addressService.updateAddress(
        id: widget.address!.id,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneNumberController.text,
        street: _streetController.text,
        apartment: _apartmentController.text.isEmpty
            ? null
            : _apartmentController.text,
        city: _cityController.text,
        zipCode: _zipCodeController.text,
        isDefault: _isDefault,
      );
    }

    if (mounted && !addressService.hasError) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.address == null
          ? AppLocalizations.of(context)!.addAddress
          : AppLocalizations.of(context)!.editAddress,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            AppCard(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 500;
                        final firstNameField = CustomTextField(
                          controller: _firstNameController,
                          labelText: AppLocalizations.of(context)!.firstName,
                          hintText: AppLocalizations.of(context)!.firstName,
                          prefixIcon: const Icon(Icons.person),
                          validator: (value) => value?.isEmpty ?? true
                              ? AppLocalizations.of(context)!.fieldRequired
                              : null,
                        );
                        final lastNameField = CustomTextField(
                          controller: _lastNameController,
                          labelText: AppLocalizations.of(context)!.lastName,
                          hintText: AppLocalizations.of(context)!.lastName,
                          prefixIcon: const Icon(Icons.person_outline),
                          validator: (value) => value?.isEmpty ?? true
                              ? AppLocalizations.of(context)!.fieldRequired
                              : null,
                        );
                        return isWide
                            ? Row(
                                children: [
                                  Expanded(child: firstNameField),
                                  const SizedBox(width: 16),
                                  Expanded(child: lastNameField),
                                ],
                              )
                            : Column(
                                children: [
                                  firstNameField,
                                  const SizedBox(height: 16),
                                  lastNameField,
                                ],
                              );
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _phoneNumberController,
                      labelText: AppLocalizations.of(context)!.phoneNumber,
                      hintText: AppLocalizations.of(context)!.phoneNumber,
                      prefixIcon: const Icon(Icons.phone),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return AppLocalizations.of(context)!.fieldRequired;
                        }
                        final phoneRegex = RegExp(
                          r'^(\+?48)?[ -]?\d{3}[ -]?\d{3}[ -]?\d{3}$',
                        );
                        if (!phoneRegex.hasMatch(value!)) {
                          return AppLocalizations.of(
                            context,
                          )!.invalidPhoneNumber;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _streetController,
                      labelText: AppLocalizations.of(context)!.streetAddress,
                      hintText: AppLocalizations.of(context)!.streetAddress,
                      prefixIcon: const Icon(Icons.home),
                      validator: (value) => value?.isEmpty ?? true
                          ? AppLocalizations.of(context)!.fieldRequired
                          : null,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _apartmentController,
                      labelText: AppLocalizations.of(
                        context,
                      )!.apartmentOptional,
                      hintText: AppLocalizations.of(context)!.apartmentOptional,
                      prefixIcon: const Icon(Icons.meeting_room),
                    ),
                    const SizedBox(height: 16),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 500;
                        final cityField = CustomTextField(
                          controller: _cityController,
                          labelText: AppLocalizations.of(context)!.city,
                          hintText: AppLocalizations.of(context)!.city,
                          prefixIcon: const Icon(Icons.location_city),
                          validator: (value) => value?.isEmpty ?? true
                              ? AppLocalizations.of(context)!.fieldRequired
                              : null,
                        );
                        final zipCodeField = CustomTextField(
                          controller: _zipCodeController,
                          labelText: AppLocalizations.of(context)!.zipCode,
                          hintText: AppLocalizations.of(context)!.zipCode,
                          prefixIcon: const Icon(Icons.numbers),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return AppLocalizations.of(
                                context,
                              )!.fieldRequired;
                            }
                            if (!RegExp(r'^\d{2}-\d{3}$').hasMatch(value!)) {
                              return AppLocalizations.of(
                                context,
                              )!.invalidZipCode;
                            }
                            return null;
                          },
                        );
                        return isWide
                            ? Row(
                                children: [
                                  Expanded(child: cityField),
                                  const SizedBox(width: 16),
                                  Expanded(child: zipCodeField),
                                ],
                              )
                            : Column(
                                children: [
                                  cityField,
                                  const SizedBox(height: 16),
                                  zipCodeField,
                                ],
                              );
                      },
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: Text(
                        AppLocalizations.of(context)!.setAsDefaultAddress,
                      ),
                      value: _isDefault,
                      onChanged: (value) {
                        setState(() {
                          _isDefault = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    Consumer<AddressService>(
                      builder: (context, service, child) {
                        return AppPremiumButton(
                          onPressed: _saveAddress,
                          label: widget.address == null
                              ? AppLocalizations.of(context)!.addAddress
                              : AppLocalizations.of(context)!.saveChanges,
                          isLoading: service.isLoading,
                          icon: Icons.save,
                        );
                      },
                    ),
                    if (widget.address != null) ...[
                      const SizedBox(height: 16),
                      Consumer<AddressService>(
                        builder: (consumerContext, service, child) {
                          return OutlinedButton.icon(
                            onPressed: service.isLoading
                                ? null
                                : () async {
                                    final confirmed =
                                        await DeleteConfirmationDialog.show(
                                          context: context,
                                          title: AppLocalizations.of(
                                            context,
                                          )!.deleteAddress,
                                          message: AppLocalizations.of(
                                            context,
                                          )!.deleteAddressConfirmation,
                                        );

                                    if (confirmed && mounted) {
                                      await service.deleteAddress(
                                        widget.address!.id,
                                      );
                                      if (context.mounted &&
                                          !service.hasError) {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  },
                            icon: const Icon(Icons.delete),
                            label: Text(
                              AppLocalizations.of(context)!.deleteAddress,
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.error,
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
