// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get actionReportIssue => 'Report Issue';

  @override
  String get actionReturnToRestaurant => 'Return to Restaurant';

  @override
  String get active => 'Active';

  @override
  String get activeOrders => 'Active Orders';

  @override
  String get add => 'Add';

  @override
  String get addAddress => 'Add Address';

  @override
  String get address => 'Address';

  @override
  String get addAddressToGetStarted => 'Add a new address to get started';

  @override
  String get addMeal => 'Add Meal';

  @override
  String get addMealPlan => 'Add Meal Plan';

  @override
  String get addNewDietCategory => 'Add New Diet Category';

  @override
  String get addRemoveMeals => 'Add/Remove Meals';

  @override
  String get addRestaurant => 'Add Restaurant';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String addedToCart(String item) {
    return '$item added to cart';
  }

  @override
  String get adminDashboard => 'Admin Dashboard';

  @override
  String get advancedFilters => 'Advanced Filters';

  @override
  String get all => 'All';

  @override
  String get allTime => 'All Time';

  @override
  String allDeliveries(int count) {
    return 'All Deliveries ($count)';
  }

  @override
  String get apartmentOptional => 'Apartment / Unit (Optional)';

  @override
  String get appTitle => 'Catering Service';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'Are you sure you want to cancel this order?';

  @override
  String get assignDriver => 'Assign Driver';

  @override
  String get assignRole => 'Assign Role';

  @override
  String get averageOrderValue => 'Average Order Value';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get browseAllRestaurants => 'Browse All Restaurants';

  @override
  String get calories => 'Calories';

  @override
  String get caloriesRange => 'Calories Range';

  @override
  String get cancel => 'Cancel';

  @override
  String get cancelOrder => 'Cancel Order';

  @override
  String get carbs => 'Carbs';

  @override
  String get carbsRange => 'Carbs Range';

  @override
  String get cart => 'Cart';

  @override
  String get cartEmpty => 'Your cart is empty.';

  @override
  String get categories => 'Categories';

  @override
  String categoryCreated(Object type) {
    return '$type category created';
  }

  @override
  String get categoryDeleted => 'Category deleted successfully';

  @override
  String get categoryName => 'Category Name';

  @override
  String get categoryUpdated => 'Category updated successfully';

  @override
  String get change => 'Change';

  @override
  String get changeImage => 'Change Image';

  @override
  String get changePassword => 'Change Password';

  @override
  String get changeStatus => 'Change Status';

  @override
  String get city => 'City';

  @override
  String get clearAndAdd => 'Clear and Add';

  @override
  String get clearCartMessage =>
      'Your cart contains items from another restaurant. Do you want to clear your cart and add this item?';

  @override
  String get clearCartQuestion => 'Clear cart?';

  @override
  String get clearFilter => 'Clear filter';

  @override
  String get confirm => 'Confirm';

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String confirmDeleteDriver(String email) {
    return 'Are you sure you want to delete driver $email? They will be unassigned from any deliveries.';
  }

  @override
  String confirmDeleteUser(String email) {
    return 'Are you sure you want to delete user $email? They will be unassigned from any restaurants or orders.';
  }

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get confirmOrder => 'Confirm Order';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmStatusChange => 'Confirm Status Change';

  @override
  String get contactDetails => 'Contact Details';

  @override
  String get couldNotLaunchMap => 'Could not launch map';

  @override
  String get couldNotLaunchPhone => 'Could not launch phone dialer';

  @override
  String get count => 'Count';

  @override
  String get createAccount => 'Create Account';

  @override
  String get createCustomPlan => 'Create Custom Plan';

  @override
  String get createMeal => 'Create Meal';

  @override
  String get createMealPlan => 'Create Meal Plan';

  @override
  String get createNew => 'Create New';

  @override
  String get createRestaurant => 'Create Restaurant';

  @override
  String get customMealPlanPromoSubtitle =>
      'Select a restaurant and create a meal plan that fits your diet logic.';

  @override
  String get customMealPlanPromoTitle => 'Build Your Perfect Meal Plan';

  @override
  String get customerLabel => 'Customer';

  @override
  String get customers => 'Customers';

  @override
  String get dailyOrders => 'Daily Orders';

  @override
  String daysCount(int count) {
    return '$count days';
  }

  @override
  String get delete => 'Delete';

  @override
  String get deleteAddress => 'Delete Address';

  @override
  String get deleteAddressConfirmation =>
      'Are you sure you want to delete this address?';

  @override
  String deleteCategory(Object type) {
    return 'Delete $type Category';
  }

  @override
  String deleteCategoryConfirmation(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get deleteDietCategory => 'Delete Diet Category';

  @override
  String get deleteMeal => 'Delete Meal';

  @override
  String deleteMealConfirmation(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get deleteMealPlan => 'Delete Meal Plan';

  @override
  String deleteMealPlanConfirmation(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get deleteRestaurant => 'Delete Restaurant';

  @override
  String deleteRestaurantConfirmation(Object name) {
    return 'Are you sure you want to delete \"$name\"?';
  }

  @override
  String get delivery => 'Delivery';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get deliveryDate => 'Delivery Date';

  @override
  String deliveryDateWithDate(Object date) {
    return 'Delivery Date: $date';
  }

  @override
  String get deliveryDays => 'Delivery Days';

  @override
  String get deliveryDetails => 'Delivery Details';

  @override
  String get deliveryFee => 'Delivery Fee';

  @override
  String get deliveryPricePLN => 'Delivery Price (PLN)';

  @override
  String get deliverySchedule => 'Delivery Schedule';

  @override
  String get deliveryStatusUpdated => 'Delivery status updated successfully';

  @override
  String get deliverySuccess => 'Delivery Success';

  @override
  String get description => 'Description';

  @override
  String get diet => 'Diet';

  @override
  String get dietCategories => 'Diet Categories';

  @override
  String get dietCategoryHint => 'e.g., Vegan, Keto, Gluten-Free';

  @override
  String get discoverMessage =>
      'Discover delicious meal plans from top restaurants';

  @override
  String get done => 'Done';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get driver => 'Driver';

  @override
  String get driverAssignFailed => 'Failed to assign driver. Please retry.';

  @override
  String get driverAssignedSuccess => 'Driver assigned successfully.';

  @override
  String get driverDashboard => 'Driver Dashboard';

  @override
  String get driverDeleted => 'Driver deleted successfully';

  @override
  String driverInviteFailed(Object error) {
    return 'Failed to invite driver: $error';
  }

  @override
  String get driverInvitedSuccess => 'Driver invited successfully';

  @override
  String get driverPasswordWillBeEmailed =>
      'A temporary password will be sent to this email address.';

  @override
  String get driverRoleLabel => 'DRIVER';

  @override
  String driverWithName(Object name) {
    return 'Driver: $name';
  }

  @override
  String get drivers => 'Drivers';

  @override
  String get edit => 'Edit';

  @override
  String get editAddress => 'Edit Address';

  @override
  String get editRestaurantCategory => 'Edit Restaurant Category';

  @override
  String get editDetails => 'Edit Details';

  @override
  String get editDietCategory => 'Edit Diet Category';

  @override
  String get editMeal => 'Edit Meal';

  @override
  String get editMealPlan => 'Edit Meal Plan';

  @override
  String get email => 'Email';

  @override
  String get enterName => 'Enter name...';

  @override
  String get error => 'Error';

  @override
  String get errorNetwork =>
      'Network error. Please check your internet connection.';

  @override
  String get errorServer => 'Server error. Please try again later.';

  @override
  String get errorTimeout =>
      'Request timed out. The server is taking too long to respond.';

  @override
  String get errorUnauthorized => 'Session expired. Please log in again.';

  @override
  String exportFailed(Object error) {
    return 'Failed to export data: $error';
  }

  @override
  String get exportData => 'Export Data';

  @override
  String get exportSuccess => 'Data exported successfully';

  @override
  String get failedToChangePassword => 'Failed to change password';

  @override
  String get failedToCreateCategory => 'Failed to create category';

  @override
  String get failedToDeleteCategory => 'Failed to delete category';

  @override
  String get failedToLoadCategories => 'Failed to load categories';

  @override
  String get failedToSaveRestaurant => 'Failed to save restaurant';

  @override
  String get failedToUpdateCategory => 'Failed to update category';

  @override
  String get failedToUpdateStatus => 'Failed to update status';

  @override
  String get fat => 'Fat';

  @override
  String get fatRange => 'Fat Range';

  @override
  String get featuredRestaurants => 'Featured Restaurants';

  @override
  String get fieldRequired => 'Required';

  @override
  String get fillAllFields => 'Please fill in all fields';

  @override
  String get finalTotal => 'Final Total';

  @override
  String get firstName => 'First Name';

  @override
  String get hideIncludedMeals => 'Hide Included Meals';

  @override
  String get history => 'History';

  @override
  String get home => 'Home';

  @override
  String get imageUpdatedSuccess => 'Image updated successfully!';

  @override
  String get imageUploadFailed => 'Image upload failed. Please retry.';

  @override
  String get imageUploadedSuccess => 'Image uploaded successfully!';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get invalidFormat => 'Invalid format';

  @override
  String get invalidNip => 'Invalid NIP (10 digits)';

  @override
  String get invalidNumber => 'Invalid number';

  @override
  String get invalidPhoneNumber => 'Invalid Phone Number';

  @override
  String get invalidZipCode => 'Invalid Zip Code';

  @override
  String get invite => 'Invite';

  @override
  String get inviteDriver => 'Invite Driver';

  @override
  String get inviteNewDriver => 'Invite New Driver';

  @override
  String get kitchenSchedule => 'Kitchen Schedule';

  @override
  String get last30Days => 'Last 30 Days';

  @override
  String get lastName => 'Last Name';

  @override
  String get login => 'Login';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get loginSuccess => 'Login successful!';

  @override
  String get logout => 'Logout';

  @override
  String get manageDeliveries => 'Manage Deliveries';

  @override
  String get manageDietCategories => 'Manage Diet Categories';

  @override
  String get manageDrivers => 'Manage Drivers';

  @override
  String get manageMealPlans => 'Manage Meal Plans';

  @override
  String get manageMeals => 'Manage Meals';

  @override
  String get manageOrders => 'Manage Orders';

  @override
  String get manageRestaurants => 'Manage Restaurants';

  @override
  String get manageUsers => 'Manage Users';

  @override
  String get management => 'Management';

  @override
  String get markAsDelivered => 'MARK AS DELIVERED';

  @override
  String get markAsDeliveredAction => 'Mark as Delivered';

  @override
  String get markAsPickedUp => 'Mark as Picked Up';

  @override
  String get mealDeleteFailed => 'Failed to delete meal';

  @override
  String get mealDeleted => 'Meal deleted successfully!';

  @override
  String get mealName => 'Meal Name';

  @override
  String get mealPlanDeleteFailed => 'Failed to delete meal plan';

  @override
  String get mealPlanDeletedSuccess => 'Meal Plan deleted successfully!';

  @override
  String get mealPlanDetails => 'Meal Plan Details';

  @override
  String get mealPlanName => 'Meal Plan Name';

  @override
  String get mealPlanSaveFailed => 'Failed to save Meal Plan';

  @override
  String get mealPlanSavedImageFailed =>
      'Meal Plan saved, but image upload failed. Please retry.';

  @override
  String get mealPlanSavedSuccess => 'Meal Plan saved successfully!';

  @override
  String get mealPlans => 'Meal Plans';

  @override
  String get mealSaveFailed => 'Failed to save Meal';

  @override
  String get mealSavedImageFailed =>
      'Meal saved, but image upload failed. Please retry.';

  @override
  String get mealSavedSuccess => 'Meal saved successfully!';

  @override
  String get mealsIncluded => 'Meals Included';

  @override
  String get menu => 'Menu';

  @override
  String get myAddresses => 'My Addresses';

  @override
  String get myCustomPlans => 'My Custom Plans';

  @override
  String get myMealPlans => 'My Meal Plans';

  @override
  String get myOrders => 'My Orders';

  @override
  String newCategory(Object type) {
    return 'New $type Category';
  }

  @override
  String get newPassword => 'New Password';

  @override
  String get newPasswordMinLength =>
      'New password must be at least 8 characters';

  @override
  String get newRestaurantDetails => 'New Restaurant Details';

  @override
  String get no => 'No';

  @override
  String get noAddressesFound => 'No addresses found';

  @override
  String get noCategoriesAvailable => 'No categories available';

  @override
  String get noCategoriesFound => 'No categories found';

  @override
  String get noDataAvailable => 'No data available';

  @override
  String get noDeliveriesScheduled => 'No deliveries scheduled';

  @override
  String get noDescription => 'No description';

  @override
  String get noDietCategoriesFound => 'No diet categories found';

  @override
  String get noItemsFound => 'No items found';

  @override
  String get noMealPlanData => 'No meal plan data found';

  @override
  String get noMealsSelected => 'No meals selected.';

  @override
  String get noOrderData => 'No order data available';

  @override
  String get noOrders => 'You have no orders.';

  @override
  String noOrdersWithStatus(Object status) {
    return 'No orders with status \"$status\"';
  }

  @override
  String get noOwner => 'No Owner';

  @override
  String get noProductionData => 'No production data for this date';

  @override
  String get noRestaurantData => 'No restaurant data.';

  @override
  String get noRestaurantFound => 'No restaurant found for this account.';

  @override
  String get noRevenueDataAvailable => 'No revenue data available';

  @override
  String get noStatisticsAvailable => 'No statistics available';

  @override
  String get nutritionInformation => 'Nutrition Information';

  @override
  String get ok => 'OK';

  @override
  String get oldPassword => 'Old Password';

  @override
  String get operations => 'Operations';

  @override
  String get order => 'Order';

  @override
  String get orderCancelledSuccessfully => 'Order cancelled successfully';

  @override
  String get orderCreatedSuccessfully => 'Order created successfully';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get orderDuration => 'Order Duration';

  @override
  String get orderItems => 'Order Items';

  @override
  String get orderNotFound => 'Order not found';

  @override
  String get orderProcessFailed => 'Failed to process order. Please retry.';

  @override
  String get orderStatusUpdated => 'Order status updated successfully';

  @override
  String get orders => 'Orders';

  @override
  String get ordersByStatus => 'Orders by Status';

  @override
  String get overview => 'Overview';

  @override
  String get ownerEmail => 'Owner Email';

  @override
  String get ownerPassword => 'Owner Password';

  @override
  String get password => 'Password';

  @override
  String get passwordChangedSuccess => 'Password changed successfully!';

  @override
  String get passwordLengthError => 'Password must be at least 8 characters';

  @override
  String get passwordMinLength => 'Min 8 characters';

  @override
  String get passwordsDoNotMatch => 'New passwords do not match';

  @override
  String get payNow => 'Pay Now';

  @override
  String get perDay => '/day';

  @override
  String get phone => 'Phone';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get pickUpOrder => 'PICK UP ORDER';

  @override
  String piecesCount(int count) {
    return '$count pcs';
  }

  @override
  String get pleaseEnterCategoryName => 'Please enter a category name';

  @override
  String get pleaseEnterDescription => 'Please enter a description';

  @override
  String get pleaseEnterEmail => 'Please enter an email';

  @override
  String get pleaseEnterName => 'Please enter a name';

  @override
  String get pleaseEnterPassword => 'Please enter a password';

  @override
  String get pleaseEnterPrice => 'Please enter a price';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get pleaseEnterValidNumber => 'Please enter a valid number';

  @override
  String get pleaseSelectDeliveryAddress => 'Please select a delivery address';

  @override
  String get pleaseSelectOwner => 'Please select an owner';

  @override
  String get popularMealPlans => 'Popular Meal Plans';

  @override
  String get price => 'Price';

  @override
  String get priceRange => 'Price Range';

  @override
  String get proceedToCheckout => 'Proceed to Checkout';

  @override
  String get productionDate => 'Production Date';

  @override
  String get productionPlan => 'Production Plan';

  @override
  String get productionSummary => 'Daily preparation summary';

  @override
  String get profile => 'Profile';

  @override
  String get protein => 'Protein';

  @override
  String get proteinRange => 'Protein Range';

  @override
  String quantity(int count) {
    return 'Quantity: $count';
  }

  @override
  String get quantityToCook => 'Quantity to Cook';

  @override
  String get register => 'Register';

  @override
  String get registrationSuccess => 'Registration successful!';

  @override
  String get requiredField => 'Required field';

  @override
  String get restaurantCategories => 'Restaurant Categories';

  @override
  String get restaurantCreatedImageFailed =>
      'Restaurant created, but image upload failed. Please retry.';

  @override
  String get restaurantCreatedSuccess => 'Restaurant created successfully!';

  @override
  String get restaurantDashboard => 'Restaurant Dashboard';

  @override
  String get restaurantDeleted => 'Restaurant deleted';

  @override
  String get restaurantDetails => 'Restaurant Details';

  @override
  String get restaurantName => 'Restaurant Name';

  @override
  String get restaurantOwner => 'Restaurant Owner';

  @override
  String get restaurantRevenue => 'Restaurant Revenue';

  @override
  String get restaurantUpdatedSuccess => 'Restaurant updated successfully!';

  @override
  String get restaurants => 'Restaurants';

  @override
  String get retry => 'Retry';

  @override
  String retryFailed(Object error) {
    return 'Retry failed: $error';
  }

  @override
  String get revenueTrend => 'Revenue Trend';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get roleCustomer => 'Customer';

  @override
  String get roleDriver => 'Driver';

  @override
  String get roleRestaurant => 'Restaurant';

  @override
  String get roleUpdated => 'Role updated successfully';

  @override
  String get save => 'Save';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get saveMeal => 'Save Meal';

  @override
  String get saveMealPlan => 'Save Meal Plan';

  @override
  String get search => 'Search...';

  @override
  String get searchByOrderNumber => 'Search by order number...';

  @override
  String get searchCategories => 'Search Categories';

  @override
  String get searchDriverDeliveries =>
      'Search by order ID, customer, or address...';

  @override
  String get searchDriversByEmail => 'Search drivers by email...';

  @override
  String get searchMealPlans => 'Search meal plans...';

  @override
  String get searchMeals => 'Search meals...';

  @override
  String get searchRestaurants => 'Search restaurants...';

  @override
  String get searchUsers => 'Search users by email...';

  @override
  String get selectAddress => 'Select Address';

  @override
  String get selectAtLeastOneMeal => 'Select at least one meal';

  @override
  String get selectCategories => 'Select Categories';

  @override
  String get selectDateRange => 'Select Date Range';

  @override
  String get selectExisting => 'Select Existing';

  @override
  String get selectImage => 'Select Image';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get selectMeal => 'Select Meal';

  @override
  String get selectOwner => 'Select Owner';

  @override
  String get selectedImageLabel => 'Selected:';

  @override
  String get selectedMeals => 'Selected Meals';

  @override
  String get selectedPeriod => 'Selected Period';

  @override
  String get setAsDefaultAddress => 'Set as default address';

  @override
  String showIncludedMeals(int count) {
    return 'Show Included Meals ($count)';
  }

  @override
  String get signInToContinue => 'Please sign in to continue';

  @override
  String get signUpToGetStarted => 'Sign up to get started';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get startBuilding => 'Start Building';

  @override
  String get statistics => 'Statistics';

  @override
  String get status => 'Status';

  @override
  String get statusActive => 'Active';

  @override
  String get statusAssigned => 'Assigned';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String statusChangeConfirmation(
    Object id,
    Object newStatus,
    Object oldStatus,
  ) {
    return 'Change order #$id status from $oldStatus to $newStatus?';
  }

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusFailed => 'Failed';

  @override
  String get statusPaid => 'Paid';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusPickedUp => 'Picked Up';

  @override
  String get statusReturned => 'Returned';

  @override
  String get statusUnpaid => 'Unpaid';

  @override
  String get street => 'Street';

  @override
  String get streetAddress => 'Street Address';

  @override
  String get summary => 'Summary';

  @override
  String get tapToAddCoverImage => 'Tap to add cover image';

  @override
  String get temporaryPassword => 'Temporary Password';

  @override
  String get total => 'Total:';

  @override
  String get totalMeals => 'Total Meals';

  @override
  String get totalOrders => 'Total Orders';

  @override
  String get totalPrice => 'Total Price';

  @override
  String get totalRevenue => 'Total Revenue';

  @override
  String get totalUsers => 'Total Users';

  @override
  String get unableToLoadHomeData => 'Unable to load home data';

  @override
  String get unassigned => 'Unassigned';

  @override
  String unexpectedError(String error) {
    return 'An unexpected error occurred: $error';
  }

  @override
  String get unknownRestaurant => 'Unknown Restaurant';

  @override
  String get updateSecurity => 'Update Security';

  @override
  String get updateSecurityDescription =>
      'Enter your current password and a new one.';

  @override
  String get userDeleted => 'User deleted successfully';

  @override
  String get viewAll => 'View All';

  @override
  String get viewMyPlans => 'View My Plans';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get yes => 'Yes';

  @override
  String get yourCartIsEmpty => 'Your cart is empty';

  @override
  String get zipCode => 'Zip Code';

  @override
  String get areYouSureYouWantToLogout => 'Are you sure you want to logout?';

  @override
  String get defaultAddress => 'Default Address';

  @override
  String get confirmDeleteAddress =>
      'Are you sure you want to delete this address? This action cannot be undone.';

  @override
  String get deletedMealPlan => 'Deleted Meal Plan';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get today => 'Today';

  @override
  String get topRestaurants => 'Top Restaurants';

  @override
  String get totalClients => 'Total Clients';

  @override
  String get totalDeliveries => 'Total Deliveries';

  @override
  String get totalStatsMealPlans => 'Total Meal Plans';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String dailyProgress(Object count, Object total) {
    return 'Daily Progress: $count/$total';
  }
}
