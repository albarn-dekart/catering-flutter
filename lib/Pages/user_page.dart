import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:catering_app/Classes/api_config.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/notification_bar.dart';
import 'package:catering_app/Classes/authorization.dart';
import 'package:catering_app/Classes/app_theme.dart';
import 'package:catering_app/Classes/user.dart';
import 'package:catering_app/Classes/user_manager.dart';

class UserPage extends StatefulWidget {
  final User? user;

  const UserPage({super.key, this.user});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
  bool isPasswordVisible = false;

  Future<void> _loadUserDetails() async {
    setState(() => isLoading = true);

    if (!UserManager().detailsFilled) {
      if (widget.user == null) {
        NotificationBar().show(
            'Please enter your details, so your orders can be delivered.',
            Colors.yellow);
      }
    } else {
      final userData = widget.user != null
          ? await widget.user?.getDetails()
          : await User.getCurrentUserDetails();

      if (userData != null) {
        _firstNameController.text = userData['firstName'];
        _secondNameController.text = userData['secondName'];
        _phoneController.text = userData['phoneNumber'];
        _cityController.text = userData['city'];
        _postCodeController.text = userData['postCode'];
        _addressController.text = userData['address'];
      }
    }

    setState(() => isLoading = false);
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

    final requestBody = {
      'firstName': firstName,
      'secondName': secondName,
      'city': city,
      'postCode': postCode,
      'address': address,
      'phoneNumber': phoneNumber,
    };

    //Request
    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      final response = await http.put(
        widget.user != null
            ? ApiConfig.userDetailsById(widget.user!.id.toString())
            : ApiConfig.userDetails(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 204) {
        UserManager().detailsFilled = true;
        NotificationBar().show('Successfully changed user data!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
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

    // Password validation
    if (newPassword.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(newPassword) || // Uppercase
        !RegExp(r'[0-9]').hasMatch(newPassword) || // Digit
        !RegExp(r'[\W_]').hasMatch(newPassword)) {
      // Special character
      NotificationBar().show(
        'New password must be at least 8 characters long and include at least one uppercase letter, one number, and one special character',
        Colors.yellow,
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final token = await Authorization.getValidToken();
      if (token == null) {
        return;
      }

      final response = await http.patch(ApiConfig.changePassword(),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'currentPassword': currentPassword,
            'newPassword': newPassword
          }));

      if (response.statusCode == 204) {
        NotificationBar().show('Password changed!', Colors.green);
      } else {
        final error =
            '${response.statusCode.toString()} - ${jsonDecode(response.body)['error'] ?? 'Unknown error'}';
        NotificationBar().show('Failed to change password', Colors.red, error);
      }
    } catch (error) {
      NotificationBar()
          .show('Failed to change password', Colors.red, error.toString());
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _loadUserDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CateringAppBar(
          title:
              'User ${widget.user == null ? '' : '#${widget.user?.id}'} Details'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
      margin: const EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(Icons.person, 'User Details'),
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
            _buildButton('Save Changes', _updateDetails),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCard() {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppTheme.defaultPadding / 2,
        horizontal: AppTheme.defaultPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(Icons.lock, 'Password Settings'),
            const SizedBox(height: AppTheme.defaultPadding),
            TextField(
              controller: _currentPasswordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Current Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            TextField(
              controller: _newPasswordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'New Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () =>
                      setState(() => isPasswordVisible = !isPasswordVisible),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.defaultPadding),
            _buildButton('Change Password', _changePassword),
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

  Widget _buildButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.save, size: 20),
        label: Text(label, style: TextStyle(color: Colors.white70)),
        style: ElevatedButton.styleFrom(
          padding:
              const EdgeInsets.symmetric(vertical: AppTheme.defaultPadding),
          backgroundColor: AppTheme.primaryColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
