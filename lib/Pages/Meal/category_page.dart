import 'package:flutter/material.dart';
import 'package:catering_app/Classes/category.dart';
import 'package:catering_app/Classes/catering_app_bar.dart';
import 'package:catering_app/Classes/app_theme.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Category> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() => isLoading = true);
    categories = await Category.get();
    setState(() => isLoading = false);
  }

  Future<void> _confirmDelete(Category category) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Category?',
            style: Theme.of(context).textTheme.titleMedium),
        content: const Text('This action cannot be undone'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (await category.delete()) {
        setState(() => categories.remove(category));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CateringAppBar(title: 'Manage Categories'),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) => CategoryAddDialog(
              onSaved: _loadCategories,
            ),
          );
        },
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        child: const Icon(Icons.add),
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (categories.isEmpty) return _buildEmptyState();

    return ListView.separated(
      itemCount: categories.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppTheme.defaultPadding),
      itemBuilder: (context, index) => CategoryCard(
        category: categories[index],
        onDelete: _confirmDelete,
        onSaved: _loadCategories,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month_rounded, size: 64, color: Colors.grey[400]),
          const SizedBox(height: AppTheme.defaultPadding),
          const Text(
            'No meal plans found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class CategoryAddDialog extends StatefulWidget {
  final VoidCallback onSaved;

  const CategoryAddDialog({super.key, required this.onSaved});

  @override
  State<CategoryAddDialog> createState() => _CategoryAddDialogState();
}

class _CategoryAddDialogState extends State<CategoryAddDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (await Category(id: null, name: _nameController.text).save()) {
        widget.onSaved();
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Category'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameController,
          autofocus: true,
          decoration: InputDecoration(
            labelText: 'Category Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.cardRadius),
            ),
          ),
          validator: (value) =>
              value?.isEmpty ?? true ? 'Required field' : null,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => _submitForm(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor,
            foregroundColor: Colors.white,
          ),
          child: const Text('Create'),
        ),
      ],
    );
  }
}
