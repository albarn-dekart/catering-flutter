import 'package:flutter_test/flutter_test.dart';
import 'package:catering_flutter/features/order/services/cart_service.dart';
import 'package:catering_flutter/graphql/meals.graphql.dart';

void main() {
  group('CartItem Model Tests', () {
    test('toJson serializes correctly', () {
      final mealPlan = Fragment$MealPlanFragment(
        id: '1',
        name: 'Test Plan',
        price: 2000,
        imageUrl: 'test.jpg',
        description: 'Test Desc',
        dietCategories: null,
        $__typename: 'MealPlan',
      );

      final item = CartItem(
        mealPlan: mealPlan,
        restaurantIri: '/api/restaurants/1',
        quantity: 2,
      );

      final json = item.toJson();

      expect(json['mealPlanId'], '1');
      expect(json['mealPlanName'], 'Test Plan');
      expect(json['quantity'], 2);
      expect(json['restaurantIri'], '/api/restaurants/1');
    });

    test('fromJson deserializes correctly', () {
      final json = {
        'mealPlanId': '1',
        'mealPlanName': 'Restored Plan',
        'mealPlanPrice': 3000,
        'mealPlanImageUrl': 'restored.jpg',
        'mealPlanDescription': 'Desc',
        'quantity': 3,
        'restaurantIri': '/api/restaurants/5',
      };

      final item = CartItem.fromJson(json);

      expect(item, isNotNull);
      expect(item!.mealPlan.id, '1');
      expect(item.mealPlan.name, 'Restored Plan');
      expect(item.quantity, 3);
      expect(item.restaurantIri, '/api/restaurants/5');
    });

    test('fromJson returns null on invalid data', () {
      final json = {
        'mealPlanId': 123, // Should be String
        // Missing required fields
      };

      final item = CartItem.fromJson(json);
      expect(item, isNull);
    });
  });
}
