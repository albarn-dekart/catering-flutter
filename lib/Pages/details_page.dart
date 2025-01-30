import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/app_theme.dart';

class DetailsPage extends StatefulWidget {
  final int? userId;

  const DetailsPage({super.key, this.userId});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String firstName = '';
  String secondName = '';
  String phoneNumber = '';
  String city = '';
  String postCode = '';
  String address = '';
  bool isLoading = true;

  // Controllers for editing fields
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _addressController = TextEditingController();

  // Password controllers
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  Future<void> fetchDetails() async {
    //Request
    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      setState(() {
        isLoading = true;
      });

      final response = await http.get(
        widget.userId != null
            ? ApiConfig.getUserByIdAdminUrl(widget.userId.toString())
            : ApiConfig.getUserUrl(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          if (data.isNotEmpty) {
            firstName = data['firstName'] ?? '';
            secondName = data['secondName'] ?? '';
            phoneNumber = data['phoneNumber'] ?? '';
            city = data['city'] ?? '';
            postCode = data['postCode'] ?? '';
            address = data['address'] ?? '';

            // Update controllers with fetched data
            _firstNameController.text = firstName;
            _secondNameController.text = secondName;
            _phoneController.text = phoneNumber;
            _cityController.text = city;
            _postCodeController.text = postCode;
            _addressController.text = address;
          }
        });
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to load user data', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to load user data', Colors.red, error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _updateDetails() async {
    final firstName = _firstNameController.text.trim();
    final secondName = _secondNameController.text.trim();
    final city = _cityController.text.trim();
    final postCode = _postCodeController.text.trim();
    final address = _addressController.text.trim();
    final phoneNumber = _phoneController.text.trim();

    // Validation
    if (firstName.isEmpty || firstName.length > 50) {
      NotificationBar().show(
        'First name must not be empty and cannot exceed 50 characters',
        Colors.yellow,
      );
      return;
    }

    if (secondName.isEmpty || secondName.length > 50) {
      NotificationBar().show(
        'Second name must not be empty and cannot exceed 50 characters',
        Colors.yellow,
      );
      return;
    }

    if (city.isEmpty || city.length > 100) {
      NotificationBar().show(
        'City must not be empty and cannot exceed 100 characters',
        Colors.yellow,
      );
      return;
    }

    final postCodeRegex = RegExp(r'^\d{2}-\d{3}$');
    if (!postCodeRegex.hasMatch(postCode)) {
      NotificationBar().show(
        'Postcode must be in the format XX-XXX',
        Colors.yellow,
      );
      return;
    }

    if (address.isEmpty || address.length > 255) {
      NotificationBar().show(
        'Address must not be empty and cannot exceed 255 characters',
        Colors.yellow,
      );
      return;
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(phoneNumber)) {
      NotificationBar().show(
        'Phone number must be between 7 and 15 digits, with an optional "+" prefix',
        Colors.yellow,
      );
      return;
    }

    //Request
    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      final response = await http.put(
        widget.userId != null
            ? ApiConfig.getUserByIdAdminUrl(widget.userId.toString())
            : ApiConfig.getUserUrl(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'firstName': firstName,
          'secondName': secondName,
          'city': city,
          'postCode': postCode,
          'address': address,
          'phoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 204) {
        NotificationBar().show('Successfully changed user data!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to change user data', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to change user data', Colors.red, error.toString());
    }
  }

  Future<void> _changePassword() async {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;

    if (currentPassword.isEmpty || newPassword.isEmpty) {
      NotificationBar().show('Please fill out all fields', Colors.yellow);
      return;
    }

    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      final response = await http.patch(ApiConfig.getUserChangePasswordUrl(),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'currentPassword': currentPassword,
            'newPassword': newPassword
          }));

      if (response.statusCode == 200) {
        NotificationBar().show('Password changed!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['message'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to change password', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to change password', Colors.red, error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CateringAppBar(
        title: widget.userId != null ? 'User Details' : 'My Profile',
        showBackButton: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              _buildPersonalDetailsCard(),
              const SizedBox(height: AppTheme.defaultPadding),
              _buildPasswordCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonalDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(Icons.person, 'Personal Information'),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildDetailField(
              controller: _firstNameController,
              label: 'First Name',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildDetailField(
              controller: _secondNameController,
              label: 'Last Name',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildDetailField(
              controller: _phoneController,
              label: 'Phone Number',
              icon: Icons.phone,
              inputType: TextInputType.phone,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildDetailField(
              controller: _cityController,
              label: 'City',
              icon: Icons.location_city,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildDetailField(
              controller: _postCodeController,
              label: 'Postal Code',
              icon: Icons.markunread_mailbox,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildDetailField(
              controller: _addressController,
              label: 'Address',
              icon: Icons.home_work,
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(Icons.lock, 'Password Settings'),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildPasswordField(
              controller: _currentPasswordController,
              label: 'Current Password',
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildPasswordField(
              controller: _newPasswordController,
              label: 'New Password',
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildChangePasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryColor),
        const SizedBox(width: AppTheme.defaultPadding / 2),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }

  Widget _buildDetailField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save, size: 20),
        label:
            const Text('SAVE CHANGES', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppTheme.primaryColor,
        ),
        onPressed: _updateDetails,
      ),
    );
  }

  Widget _buildChangePasswordButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.lock_reset, size: 20),
        label: const Text('CHANGE PASSWORD',
            style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppTheme.secondaryColor,
        ),
        onPressed: _changePassword,
      ),
    );
  }
}
