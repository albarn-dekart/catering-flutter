import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:catering_flutter/graphql/meals.graphql.dart';
import 'package:catering_flutter/core/services/auth_service.dart';

// Use GraphQL generated type for meal plan
typedef MealPlan = Fragment$MealPlanFragment;

class CartItem {
  int quantity;
  final MealPlan mealPlan;
  final String restaurantIri;

  CartItem({
    required this.mealPlan,
    required this.restaurantIri,
    this.quantity = 1,
  });

  // Convert CartItem to JSON for storage
  Map<String, dynamic> toJson() => {
    'quantity': quantity,
    'restaurantIri': restaurantIri,
    'mealPlanId': mealPlan.id,
    'mealPlanName': mealPlan.name,
    'mealPlanPrice': mealPlan.price,
    'mealPlanImageUrl': mealPlan.imageUrl,
    'mealPlanDescription': mealPlan.description,
  };

  // Create CartItem from JSON (simplified - we store minimal data)
  static CartItem? fromJson(Map<String, dynamic> json) {
    try {
      // Create a minimal MealPlan object from stored data
      // Note: This is a simplified version. The full meal plan will be missing some fields.
      final mealPlan = Fragment$MealPlanFragment(
        id: json['mealPlanId'] as String,
        name: json['mealPlanName'] as String,
        price: json['mealPlanPrice'] as int?,
        imageUrl: json['mealPlanImageUrl'] as String?,
        description: json['mealPlanDescription'] as String?,
        dietCategories: null,
        $__typename: 'MealPlan',
      );

      return CartItem(
        mealPlan: mealPlan,
        restaurantIri: json['restaurantIri'] as String,
        quantity: json['quantity'] as int,
      );
    } catch (e) {
      debugPrint('Error parsing CartItem from JSON: $e');
      return null;
    }
  }
}

class CartService extends ChangeNotifier {
  static const String _cartItemsKey = 'cart_items';
  static const String _deliveryDatesKey = 'delivery_dates';
  static const String _deliveryDaysKey = 'delivery_days';
  static const String _deliveryPriceKey = 'delivery_price';
  static const String _startDateKey = 'start_date';
  static const String _endDateKey = 'end_date';

  final SharedPreferences _prefs;
  final List<CartItem> _cartItems = [];
  List<DateTime> _deliveryDates = [];
  List<String> _deliveryDays = [];
  DateTime? _startDate;
  DateTime? _endDate;
  bool _wasAuthenticated = false;

  CartService(this._prefs) {
    _loadCart();
  }

  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
  List<DateTime> get deliveryDates => List.unmodifiable(_deliveryDates);
  List<String> get deliveryDays => List.unmodifiable(_deliveryDays);
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

  int get itemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  // Load cart from SharedPreferences
  void _loadCart() {
    try {
      // Load cart items
      final cartJson = _prefs.getString(_cartItemsKey);
      if (cartJson != null) {
        final List<dynamic> cartList = jsonDecode(cartJson);
        _cartItems.clear();
        for (var itemJson in cartList) {
          final item = CartItem.fromJson(itemJson);
          if (item != null) {
            _cartItems.add(item);
          }
        }
      }

      // Load delivery dates
      final datesJson = _prefs.getString(_deliveryDatesKey);
      if (datesJson != null) {
        final List<dynamic> datesList = jsonDecode(datesJson);
        _deliveryDates = datesList
            .map((d) => DateTime.parse(d as String))
            .toList();
      }

      // Load delivery days
      final daysJson = _prefs.getString(_deliveryDaysKey);
      if (daysJson != null) {
        final List<dynamic> daysList = jsonDecode(daysJson);
        _deliveryDays = daysList.cast<String>();
      }

      // Load delivery price
      _deliveryPrice = _prefs.getInt(_deliveryPriceKey) ?? 0;

      // Load start date
      final startDateStr = _prefs.getString(_startDateKey);
      if (startDateStr != null) {
        _startDate = DateTime.parse(startDateStr);
      }

      // Load end date
      final endDateStr = _prefs.getString(_endDateKey);
      if (endDateStr != null) {
        _endDate = DateTime.parse(endDateStr);
      }
    } catch (e) {
      debugPrint('Error loading cart from storage: $e');
    }
  }

  // Save cart to SharedPreferences
  Future<void> _saveCart() async {
    try {
      // Save cart items
      final cartList = _cartItems.map((item) => item.toJson()).toList();
      await _prefs.setString(_cartItemsKey, jsonEncode(cartList));

      // Save delivery dates
      final datesList = _deliveryDates.map((d) => d.toIso8601String()).toList();
      await _prefs.setString(_deliveryDatesKey, jsonEncode(datesList));

      // Save delivery days
      await _prefs.setString(_deliveryDaysKey, jsonEncode(_deliveryDays));

      // Save delivery price
      await _prefs.setInt(_deliveryPriceKey, _deliveryPrice);

      // Save start date
      if (_startDate != null) {
        await _prefs.setString(_startDateKey, _startDate!.toIso8601String());
      } else {
        await _prefs.remove(_startDateKey);
      }

      // Save end date
      if (_endDate != null) {
        await _prefs.setString(_endDateKey, _endDate!.toIso8601String());
      } else {
        await _prefs.remove(_endDateKey);
      }
    } catch (e) {
      debugPrint('Error saving cart to storage: $e');
    }
  }

  bool isDifferentRestaurant(String restaurantIri) {
    return _cartItems.isNotEmpty &&
        _cartItems.first.restaurantIri != restaurantIri;
  }

  void addToCart(
    MealPlan mealPlan,
    String restaurantIri,
    int deliveryPrice, {
    int quantity = 1,
  }) {
    // If adding from a different restaurant, clear cart first (simple rule)
    if (_cartItems.isNotEmpty &&
        _cartItems.first.restaurantIri != restaurantIri) {
      _cartItems.clear();
      _deliveryDates.clear();
      _startDate = null;
      _endDate = null;
    }

    _deliveryPrice = deliveryPrice;
    final index = _cartItems.indexWhere(
      (item) => item.mealPlan.id == mealPlan.id,
    );
    if (index >= 0) {
      _cartItems[index].quantity += quantity;
    } else {
      _cartItems.add(
        CartItem(
          mealPlan: mealPlan,
          restaurantIri: restaurantIri,
          quantity: quantity,
        ),
      );
    }
    _saveCart();
    notifyListeners();
  }

  void removeFromCart(String mealPlanId) {
    _cartItems.removeWhere((item) => item.mealPlan.id == mealPlanId);
    _saveCart();
    notifyListeners();
  }

  void updateQuantity(String mealPlanId, int quantity) {
    final index = _cartItems.indexWhere(
      (item) => item.mealPlan.id == mealPlanId,
    );
    if (index >= 0) {
      if (quantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity = quantity;
      }
      _saveCart();
      notifyListeners();
    }
  }

  void updateDeliveryDetails(
    List<DateTime> dates,
    List<String> days, {
    DateTime? startDate,
    DateTime? endDate,
  }) {
    _deliveryDates = dates;
    _deliveryDays = days;
    _startDate = startDate;
    _endDate = endDate;
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _deliveryDates = [];
    _deliveryDays = [];
    _startDate = null;
    _endDate = null;
    _saveCart();
    notifyListeners();
  }

  double get totalPricePLN => _cartItems.fold(
    0,
    (total, item) => total + item.mealPlan.price! * item.quantity,
  );

  int _deliveryPrice = 0;
  int get deliveryPrice => _deliveryPrice;

  void setDeliveryPrice(int price) {
    if (_deliveryPrice != price) {
      _deliveryPrice = price;
      notifyListeners();
    }
  }

  double get grandTotalPLN => _deliveryDates.isEmpty
      ? 0.0
      : (totalPricePLN * _deliveryDates.length) +
            (deliveryPrice * _deliveryDates.length);

  void updateAuth(AuthService auth) {
    if (_wasAuthenticated && !auth.isAuthenticated) {
      clearCart();
    }
    _wasAuthenticated = auth.isAuthenticated;
  }
}
