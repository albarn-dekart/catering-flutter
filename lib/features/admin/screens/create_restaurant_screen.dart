import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/authentication/services/user_service.dart';
import 'package:catering_flutter/features/authentication/models/user.dart';
import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class CreateRestaurantScreen extends StatefulWidget {
  const CreateRestaurantScreen({super.key});

  @override
  State<CreateRestaurantScreen> createState() => _CreateRestaurantScreenState();
}

class _CreateRestaurantScreenState extends State<CreateRestaurantScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  User? _selectedUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserService>().fetchAllUsers();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createRestaurant() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select an owner for the restaurant.'),
          ),
        );
        return;
      }
      final newRestaurant = Restaurant(
        id: 0, // ID will be assigned by the backend
        name: _nameController.text,
        description: _descriptionController.text,
        imageUrl: '',
        owner: _selectedUser, // Assign selected user as owner
      );
      final restaurantService = context.read<RestaurantService>();
      await restaurantService.createRestaurant(newRestaurant);

      if (restaurantService.hasError) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to create restaurant: ${restaurantService.errorMessage}',
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Restaurant created successfully!')),
          );
          context.pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Create Restaurant',
      child: Consumer2<RestaurantService, UserService>(
        builder: (context, restaurantService, userService, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Restaurant Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    if (userService.isLoading)
                      const CircularProgressIndicator()
                    else if (userService.hasError)
                      Text('Error loading users: ${userService.errorMessage}')
                    else if (userService.users.isNotEmpty)
                      DropdownButtonFormField<User>(
                        decoration: const InputDecoration(
                          labelText: 'Select Owner',
                        ),
                        initialValue: _selectedUser,
                        onChanged: (User? newValue) {
                          setState(() {
                            _selectedUser = newValue;
                          });
                        },
                        items: userService.users
                            .where(
                              (user) => user.roles.contains('ROLE_RESTAURANT'),
                            )
                            .map<DropdownMenuItem<User>>((User user) {
                              return DropdownMenuItem<User>(
                                value: user,
                                child: Text(user.email),
                              );
                            })
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an owner';
                          }
                          return null;
                        },
                      )
                    else
                      const Text('No restaurant owners found.'),
                    const SizedBox(height: 24),
                    restaurantService.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _createRestaurant,
                            child: const Text('Create Restaurant'),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
