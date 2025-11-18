import 'package:flutter/foundation.dart';
import 'package:catering_flutter/features/customer/models/cart_item_model.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  List<DateTime> _deliveryDates = [];
  List<String> _deliveryDays = [];

  List<CartItem> get cartItems => _cartItems;
  List<DateTime> get deliveryDates => _deliveryDates;
  List<String> get deliveryDays => _deliveryDays;

  int get totalQuantity => _cartItems.fold(
    0,
    (previousValue, element) => previousValue + element.quantity,
  );

  double get totalPrice => _cartItems.fold(
    0.0,
    (previousValue, element) =>
        previousValue + ((element.mealPlan.price) * element.quantity),
  );

  void addItemToCart(CartItem item) {
    // Check if the item already exists in the cart
    final existingItemIndex = _cartItems.indexWhere(
      (element) => element.mealPlan.id == item.mealPlan.id,
    );

    if (existingItemIndex != -1) {
      // If it exists, update the quantity
      _cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      // Otherwise, add it as a new item
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void updateCartItemQuantity(CartItem item, int quantity) {
    final existingItemIndex = _cartItems.indexWhere(
      (element) => element.mealPlan.id == item.mealPlan.id,
    );

    if (existingItemIndex != -1) {
      if (quantity > 0) {
        _cartItems[existingItemIndex].quantity = quantity;
      } else {
        _cartItems.removeAt(existingItemIndex);
      }
      notifyListeners();
    }
  }

  void removeAllItemsFromCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeItemFromCart(CartItem item) {
    _cartItems.removeWhere(
      (element) => element.mealPlan.id == item.mealPlan.id,
    );
    notifyListeners();
  }

  void updateDeliveryDetails(List<DateTime> dates, List<String> days) {
    _deliveryDates = dates;
    _deliveryDays = days;
    notifyListeners();
  }
}
