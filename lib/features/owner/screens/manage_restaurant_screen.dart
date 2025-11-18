import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:catering_flutter/core/app_routes.dart';
import 'package:catering_flutter/features/owner/services/restaurant_service.dart';
import 'package:catering_flutter/features/owner/models/restaurant_model.dart';
import 'package:catering_flutter/core/widgets/custom_scaffold.dart'; // Import CustomScaffold

class ManageRestaurantScreen extends StatefulWidget {
  final Restaurant? restaurant;
  final int? restaurantId;

  const ManageRestaurantScreen({super.key, this.restaurant, this.restaurantId});

  @override
  State<ManageRestaurantScreen> createState() => _ManageRestaurantScreenState();
}

class _ManageRestaurantScreenState extends State<ManageRestaurantScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final restaurantService = context.read<RestaurantService>();
      if (widget.restaurant != null) {
        // If a restaurant object is passed, set it directly
        restaurantService.currentRestaurant = widget.restaurant;
      } else if (widget.restaurantId != null) {
        // If an ID is passed, fetch by ID
        restaurantService.getRestaurantById(widget.restaurantId!);
      } else {
        // Otherwise, fetch the current user's restaurant
        restaurantService.getCurrentUserRestaurant();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Restaurant',
      child: Consumer<RestaurantService>(
        builder: (context, restaurantService, child) {
          if (restaurantService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (restaurantService.hasError) {
            return Center(child: Text(restaurantService.errorMessage!));
          } else if (restaurantService.currentRestaurant != null) {
            return RestaurantForm(
              restaurant: restaurantService.currentRestaurant!,
            );
          } else {
            return const Center(child: Text('No restaurant data.'));
          }
        },
      ),
    );
  }
}

class RestaurantForm extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantForm({super.key, required this.restaurant});

  @override
  State<RestaurantForm> createState() => _RestaurantFormState();
}

class _RestaurantFormState extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.restaurant.name);
    _descriptionController = TextEditingController(
      text: widget.restaurant.description,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateRestaurant() async {
    if (_formKey.currentState!.validate()) {
      final restaurantService = context.read<RestaurantService>();
      final updatedRestaurant = widget.restaurant.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
      );
      await restaurantService.updateRestaurant(updatedRestaurant);
      if (restaurantService.hasError) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to update restaurant: ${restaurantService.errorMessage}',
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Restaurant updated successfully!')),
          );
        }
      }
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageBytes = await image.readAsBytes();
    final imageName = image.name;

    if (!mounted) return;

    final restaurantService = context.read<RestaurantService>();
    await restaurantService.updateRestaurantImage(
      widget.restaurant.id,
      imageBytes,
      imageName,
    );

    if (restaurantService.hasError) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to update image: ${restaurantService.errorMessage}',
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image updated successfully!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final restaurantService = context.watch<RestaurantService>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (restaurantService.currentRestaurant?.imageUrl != null)
              Image.network(
                restaurantService.currentRestaurant!.imageUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: restaurantService.isLoading ? null : _pickImage,
              child: restaurantService.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Change Image'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Restaurant Name'),
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
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: restaurantService.isLoading ? null : _updateRestaurant,
              child: restaurantService.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Update Restaurant'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push(AppRoutes.manageMealPlans);
              },
              child: const Text('Manage Meal Plans'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.push(AppRoutes.manageDeliveries);
              },
              child: const Text('Manage Deliveries'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await context.push(AppRoutes.manageMeals);
              },
              child: const Text('Manage Meals'),
            ),
          ],
        ),
      ),
    );
  }
}
