import 'package:catering_flutter/core/api_service.dart';
import 'package:catering_flutter/features/owner/models/category_model.dart';

class CategoryService {
  final ApiService _apiService;

  CategoryService(this._apiService);

  Future<List<Category>> getCategories() async {
    return await _apiService.getCollection<Category>(
      'categories',
      fromJson: Category.fromJson,
    );
  }
}
