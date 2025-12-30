import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// No description provided for @actionReportIssue.
  ///
  /// In en, this message translates to:
  /// **'Report Issue'**
  String get actionReportIssue;

  /// No description provided for @actionReturnToRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Return to Restaurant'**
  String get actionReturnToRestaurant;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @activeOrders.
  ///
  /// In en, this message translates to:
  /// **'Active Orders'**
  String get activeOrders;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddress;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addAddressToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add a new address to get started'**
  String get addAddressToGetStarted;

  /// No description provided for @addMeal.
  ///
  /// In en, this message translates to:
  /// **'Add Meal'**
  String get addMeal;

  /// No description provided for @addMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Add Meal Plan'**
  String get addMealPlan;

  /// No description provided for @addNewDietCategory.
  ///
  /// In en, this message translates to:
  /// **'Add New Diet Category'**
  String get addNewDietCategory;

  /// No description provided for @addRemoveMeals.
  ///
  /// In en, this message translates to:
  /// **'Add/Remove Meals'**
  String get addRemoveMeals;

  /// No description provided for @addRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Add Restaurant'**
  String get addRestaurant;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @addedToCart.
  ///
  /// In en, this message translates to:
  /// **'{item} added to cart'**
  String addedToCart(String item);

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboard;

  /// No description provided for @advancedFilters.
  ///
  /// In en, this message translates to:
  /// **'Advanced Filters'**
  String get advancedFilters;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @allTime.
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get allTime;

  /// No description provided for @allDeliveries.
  ///
  /// In en, this message translates to:
  /// **'All Deliveries ({count})'**
  String allDeliveries(int count);

  /// No description provided for @apartmentOptional.
  ///
  /// In en, this message translates to:
  /// **'Apartment / Unit (Optional)'**
  String get apartmentOptional;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Catering Service'**
  String get appTitle;

  /// No description provided for @areYouSureYouWantToCancelThisOrder.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this order?'**
  String get areYouSureYouWantToCancelThisOrder;

  /// No description provided for @assignDriver.
  ///
  /// In en, this message translates to:
  /// **'Assign Driver'**
  String get assignDriver;

  /// No description provided for @assignRole.
  ///
  /// In en, this message translates to:
  /// **'Assign Role'**
  String get assignRole;

  /// No description provided for @averageOrderValue.
  ///
  /// In en, this message translates to:
  /// **'Average Order Value'**
  String get averageOrderValue;

  /// No description provided for @basicInformation.
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// No description provided for @browseAllRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Browse All Restaurants'**
  String get browseAllRestaurants;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @caloriesRange.
  ///
  /// In en, this message translates to:
  /// **'Calories Range'**
  String get caloriesRange;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancelOrder.
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @carbsRange.
  ///
  /// In en, this message translates to:
  /// **'Carbs Range'**
  String get carbsRange;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @cartEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty.'**
  String get cartEmpty;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @categoryCreated.
  ///
  /// In en, this message translates to:
  /// **'{type} category created'**
  String categoryCreated(Object type);

  /// No description provided for @categoryDeleted.
  ///
  /// In en, this message translates to:
  /// **'Category deleted successfully'**
  String get categoryDeleted;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Category Name'**
  String get categoryName;

  /// No description provided for @categoryUpdated.
  ///
  /// In en, this message translates to:
  /// **'Category updated successfully'**
  String get categoryUpdated;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @changeImage.
  ///
  /// In en, this message translates to:
  /// **'Change Image'**
  String get changeImage;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @changeStatus.
  ///
  /// In en, this message translates to:
  /// **'Change Status'**
  String get changeStatus;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @clearAndAdd.
  ///
  /// In en, this message translates to:
  /// **'Clear and Add'**
  String get clearAndAdd;

  /// No description provided for @clearCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Your cart contains items from another restaurant. Do you want to clear your cart and add this item?'**
  String get clearCartMessage;

  /// No description provided for @clearCartQuestion.
  ///
  /// In en, this message translates to:
  /// **'Clear cart?'**
  String get clearCartQuestion;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clearFilter;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// No description provided for @confirmDeleteDriver.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete driver {email}? They will be unassigned from any deliveries.'**
  String confirmDeleteDriver(String email);

  /// No description provided for @confirmDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete user {email}? They will be unassigned from any restaurants or orders.'**
  String confirmDeleteUser(String email);

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @confirmOrder.
  ///
  /// In en, this message translates to:
  /// **'Confirm Order'**
  String get confirmOrder;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmStatusChange.
  ///
  /// In en, this message translates to:
  /// **'Confirm Status Change'**
  String get confirmStatusChange;

  /// No description provided for @contactDetails.
  ///
  /// In en, this message translates to:
  /// **'Contact Details'**
  String get contactDetails;

  /// No description provided for @couldNotLaunchMap.
  ///
  /// In en, this message translates to:
  /// **'Could not launch map'**
  String get couldNotLaunchMap;

  /// No description provided for @couldNotLaunchPhone.
  ///
  /// In en, this message translates to:
  /// **'Could not launch phone dialer'**
  String get couldNotLaunchPhone;

  /// No description provided for @count.
  ///
  /// In en, this message translates to:
  /// **'Count'**
  String get count;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createCustomPlan.
  ///
  /// In en, this message translates to:
  /// **'Create Custom Plan'**
  String get createCustomPlan;

  /// No description provided for @createMeal.
  ///
  /// In en, this message translates to:
  /// **'Create Meal'**
  String get createMeal;

  /// No description provided for @createMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Create Meal Plan'**
  String get createMealPlan;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get createNew;

  /// No description provided for @createRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Create Restaurant'**
  String get createRestaurant;

  /// No description provided for @customMealPlanPromoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select a restaurant and create a meal plan that fits your diet logic.'**
  String get customMealPlanPromoSubtitle;

  /// No description provided for @customMealPlanPromoTitle.
  ///
  /// In en, this message translates to:
  /// **'Build Your Perfect Meal Plan'**
  String get customMealPlanPromoTitle;

  /// No description provided for @customerLabel.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customerLabel;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @dailyOrders.
  ///
  /// In en, this message translates to:
  /// **'Daily Orders'**
  String get dailyOrders;

  /// No description provided for @daysCount.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String daysCount(int count);

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddress;

  /// No description provided for @deleteAddressConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this address?'**
  String get deleteAddressConfirmation;

  /// No description provided for @deleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete {type} Category'**
  String deleteCategory(Object type);

  /// No description provided for @deleteCategoryConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String deleteCategoryConfirmation(Object name);

  /// No description provided for @deleteDietCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Diet Category'**
  String get deleteDietCategory;

  /// No description provided for @deleteMeal.
  ///
  /// In en, this message translates to:
  /// **'Delete Meal'**
  String get deleteMeal;

  /// No description provided for @deleteMealConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String deleteMealConfirmation(Object name);

  /// No description provided for @deleteMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Delete Meal Plan'**
  String get deleteMealPlan;

  /// No description provided for @deleteMealPlanConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String deleteMealPlanConfirmation(Object name);

  /// No description provided for @deleteRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Delete Restaurant'**
  String get deleteRestaurant;

  /// No description provided for @deleteRestaurantConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String deleteRestaurantConfirmation(Object name);

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddress;

  /// No description provided for @deliveryDate.
  ///
  /// In en, this message translates to:
  /// **'Delivery Date'**
  String get deliveryDate;

  /// No description provided for @deliveryDateWithDate.
  ///
  /// In en, this message translates to:
  /// **'Delivery Date: {date}'**
  String deliveryDateWithDate(Object date);

  /// No description provided for @deliveryDays.
  ///
  /// In en, this message translates to:
  /// **'Delivery Days'**
  String get deliveryDays;

  /// No description provided for @deliveryDetails.
  ///
  /// In en, this message translates to:
  /// **'Delivery Details'**
  String get deliveryDetails;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @deliveryPricePLN.
  ///
  /// In en, this message translates to:
  /// **'Delivery Price (PLN)'**
  String get deliveryPricePLN;

  /// No description provided for @deliverySchedule.
  ///
  /// In en, this message translates to:
  /// **'Delivery Schedule'**
  String get deliverySchedule;

  /// No description provided for @deliveryStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Delivery status updated successfully'**
  String get deliveryStatusUpdated;

  /// No description provided for @deliverySuccess.
  ///
  /// In en, this message translates to:
  /// **'Delivery Success'**
  String get deliverySuccess;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @diet.
  ///
  /// In en, this message translates to:
  /// **'Diet'**
  String get diet;

  /// No description provided for @dietCategories.
  ///
  /// In en, this message translates to:
  /// **'Diet Categories'**
  String get dietCategories;

  /// No description provided for @dietCategoryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Vegan, Keto, Gluten-Free'**
  String get dietCategoryHint;

  /// No description provided for @discoverMessage.
  ///
  /// In en, this message translates to:
  /// **'Discover delicious meal plans from top restaurants'**
  String get discoverMessage;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @driverAssignFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to assign driver. Please retry.'**
  String get driverAssignFailed;

  /// No description provided for @driverAssignedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Driver assigned successfully.'**
  String get driverAssignedSuccess;

  /// No description provided for @driverDashboard.
  ///
  /// In en, this message translates to:
  /// **'Driver Dashboard'**
  String get driverDashboard;

  /// No description provided for @driverDeleted.
  ///
  /// In en, this message translates to:
  /// **'Driver deleted successfully'**
  String get driverDeleted;

  /// No description provided for @driverInviteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to invite driver: {error}'**
  String driverInviteFailed(Object error);

  /// No description provided for @driverInvitedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Driver invited successfully'**
  String get driverInvitedSuccess;

  /// No description provided for @driverPasswordWillBeEmailed.
  ///
  /// In en, this message translates to:
  /// **'A temporary password will be sent to this email address.'**
  String get driverPasswordWillBeEmailed;

  /// No description provided for @driverRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'DRIVER'**
  String get driverRoleLabel;

  /// No description provided for @driverWithName.
  ///
  /// In en, this message translates to:
  /// **'Driver: {name}'**
  String driverWithName(Object name);

  /// No description provided for @drivers.
  ///
  /// In en, this message translates to:
  /// **'Drivers'**
  String get drivers;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @editRestaurantCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Restaurant Category'**
  String get editRestaurantCategory;

  /// No description provided for @editDetails.
  ///
  /// In en, this message translates to:
  /// **'Edit Details'**
  String get editDetails;

  /// No description provided for @editDietCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit Diet Category'**
  String get editDietCategory;

  /// No description provided for @editMeal.
  ///
  /// In en, this message translates to:
  /// **'Edit Meal'**
  String get editMeal;

  /// No description provided for @editMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Edit Meal Plan'**
  String get editMealPlan;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter name...'**
  String get enterName;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Please check your internet connection.'**
  String get errorNetwork;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get errorServer;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request timed out. The server is taking too long to respond.'**
  String get errorTimeout;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Session expired. Please log in again.'**
  String get errorUnauthorized;

  /// No description provided for @exportFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to export data: {error}'**
  String exportFailed(Object error);

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data exported successfully'**
  String get exportSuccess;

  /// No description provided for @failedToChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Failed to change password'**
  String get failedToChangePassword;

  /// No description provided for @failedToCreateCategory.
  ///
  /// In en, this message translates to:
  /// **'Failed to create category'**
  String get failedToCreateCategory;

  /// No description provided for @failedToDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete category'**
  String get failedToDeleteCategory;

  /// No description provided for @failedToLoadCategories.
  ///
  /// In en, this message translates to:
  /// **'Failed to load categories'**
  String get failedToLoadCategories;

  /// No description provided for @failedToSaveRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Failed to save restaurant'**
  String get failedToSaveRestaurant;

  /// No description provided for @failedToUpdateCategory.
  ///
  /// In en, this message translates to:
  /// **'Failed to update category'**
  String get failedToUpdateCategory;

  /// No description provided for @failedToUpdateStatus.
  ///
  /// In en, this message translates to:
  /// **'Failed to update status'**
  String get failedToUpdateStatus;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @fatRange.
  ///
  /// In en, this message translates to:
  /// **'Fat Range'**
  String get fatRange;

  /// No description provided for @featuredRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Featured Restaurants'**
  String get featuredRestaurants;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get fieldRequired;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields'**
  String get fillAllFields;

  /// No description provided for @finalTotal.
  ///
  /// In en, this message translates to:
  /// **'Final Total'**
  String get finalTotal;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @hideIncludedMeals.
  ///
  /// In en, this message translates to:
  /// **'Hide Included Meals'**
  String get hideIncludedMeals;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @imageUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Image updated successfully!'**
  String get imageUpdatedSuccess;

  /// No description provided for @imageUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Image upload failed. Please retry.'**
  String get imageUploadFailed;

  /// No description provided for @imageUploadedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Image uploaded successfully!'**
  String get imageUploadedSuccess;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @invalidFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid format'**
  String get invalidFormat;

  /// No description provided for @invalidNip.
  ///
  /// In en, this message translates to:
  /// **'Invalid NIP (10 digits)'**
  String get invalidNip;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get invalidNumber;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid Phone Number'**
  String get invalidPhoneNumber;

  /// No description provided for @invalidZipCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid Zip Code'**
  String get invalidZipCode;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @inviteDriver.
  ///
  /// In en, this message translates to:
  /// **'Invite Driver'**
  String get inviteDriver;

  /// No description provided for @inviteNewDriver.
  ///
  /// In en, this message translates to:
  /// **'Invite New Driver'**
  String get inviteNewDriver;

  /// No description provided for @kitchenSchedule.
  ///
  /// In en, this message translates to:
  /// **'Kitchen Schedule'**
  String get kitchenSchedule;

  /// No description provided for @last30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get last30Days;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccess;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @manageDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Manage Deliveries'**
  String get manageDeliveries;

  /// No description provided for @manageDietCategories.
  ///
  /// In en, this message translates to:
  /// **'Manage Diet Categories'**
  String get manageDietCategories;

  /// No description provided for @manageDrivers.
  ///
  /// In en, this message translates to:
  /// **'Manage Drivers'**
  String get manageDrivers;

  /// No description provided for @manageMealPlans.
  ///
  /// In en, this message translates to:
  /// **'Manage Meal Plans'**
  String get manageMealPlans;

  /// No description provided for @manageMeals.
  ///
  /// In en, this message translates to:
  /// **'Manage Meals'**
  String get manageMeals;

  /// No description provided for @manageOrders.
  ///
  /// In en, this message translates to:
  /// **'Manage Orders'**
  String get manageOrders;

  /// No description provided for @manageRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Manage Restaurants'**
  String get manageRestaurants;

  /// No description provided for @manageUsers.
  ///
  /// In en, this message translates to:
  /// **'Manage Users'**
  String get manageUsers;

  /// No description provided for @management.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get management;

  /// No description provided for @markAsDelivered.
  ///
  /// In en, this message translates to:
  /// **'MARK AS DELIVERED'**
  String get markAsDelivered;

  /// No description provided for @markAsDeliveredAction.
  ///
  /// In en, this message translates to:
  /// **'Mark as Delivered'**
  String get markAsDeliveredAction;

  /// No description provided for @markAsPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Mark as Picked Up'**
  String get markAsPickedUp;

  /// No description provided for @mealDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete meal'**
  String get mealDeleteFailed;

  /// No description provided for @mealDeleted.
  ///
  /// In en, this message translates to:
  /// **'Meal deleted successfully!'**
  String get mealDeleted;

  /// No description provided for @mealName.
  ///
  /// In en, this message translates to:
  /// **'Meal Name'**
  String get mealName;

  /// No description provided for @mealPlanDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete meal plan'**
  String get mealPlanDeleteFailed;

  /// No description provided for @mealPlanDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan deleted successfully!'**
  String get mealPlanDeletedSuccess;

  /// No description provided for @mealPlanDetails.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan Details'**
  String get mealPlanDetails;

  /// No description provided for @mealPlanName.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan Name'**
  String get mealPlanName;

  /// No description provided for @mealPlanSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save Meal Plan'**
  String get mealPlanSaveFailed;

  /// No description provided for @mealPlanSavedImageFailed.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan saved, but image upload failed. Please retry.'**
  String get mealPlanSavedImageFailed;

  /// No description provided for @mealPlanSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan saved successfully!'**
  String get mealPlanSavedSuccess;

  /// No description provided for @mealPlans.
  ///
  /// In en, this message translates to:
  /// **'Meal Plans'**
  String get mealPlans;

  /// No description provided for @mealSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save Meal'**
  String get mealSaveFailed;

  /// No description provided for @mealSavedImageFailed.
  ///
  /// In en, this message translates to:
  /// **'Meal saved, but image upload failed. Please retry.'**
  String get mealSavedImageFailed;

  /// No description provided for @mealSavedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Meal saved successfully!'**
  String get mealSavedSuccess;

  /// No description provided for @mealsIncluded.
  ///
  /// In en, this message translates to:
  /// **'Meals Included'**
  String get mealsIncluded;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @myAddresses.
  ///
  /// In en, this message translates to:
  /// **'My Addresses'**
  String get myAddresses;

  /// No description provided for @myCustomPlans.
  ///
  /// In en, this message translates to:
  /// **'My Custom Plans'**
  String get myCustomPlans;

  /// No description provided for @myMealPlans.
  ///
  /// In en, this message translates to:
  /// **'My Meal Plans'**
  String get myMealPlans;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @newCategory.
  ///
  /// In en, this message translates to:
  /// **'New {type} Category'**
  String newCategory(Object type);

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @newPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'New password must be at least 8 characters'**
  String get newPasswordMinLength;

  /// No description provided for @newRestaurantDetails.
  ///
  /// In en, this message translates to:
  /// **'New Restaurant Details'**
  String get newRestaurantDetails;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noAddressesFound.
  ///
  /// In en, this message translates to:
  /// **'No addresses found'**
  String get noAddressesFound;

  /// No description provided for @noCategoriesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No categories available'**
  String get noCategoriesAvailable;

  /// No description provided for @noCategoriesFound.
  ///
  /// In en, this message translates to:
  /// **'No categories found'**
  String get noCategoriesFound;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataAvailable;

  /// No description provided for @noDeliveriesScheduled.
  ///
  /// In en, this message translates to:
  /// **'No deliveries scheduled'**
  String get noDeliveriesScheduled;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get noDescription;

  /// No description provided for @noDietCategoriesFound.
  ///
  /// In en, this message translates to:
  /// **'No diet categories found'**
  String get noDietCategoriesFound;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// No description provided for @noMealPlanData.
  ///
  /// In en, this message translates to:
  /// **'No meal plan data found'**
  String get noMealPlanData;

  /// No description provided for @noMealsSelected.
  ///
  /// In en, this message translates to:
  /// **'No meals selected.'**
  String get noMealsSelected;

  /// No description provided for @noOrderData.
  ///
  /// In en, this message translates to:
  /// **'No order data available'**
  String get noOrderData;

  /// No description provided for @noOrders.
  ///
  /// In en, this message translates to:
  /// **'You have no orders.'**
  String get noOrders;

  /// No description provided for @noOrdersWithStatus.
  ///
  /// In en, this message translates to:
  /// **'No orders with status \"{status}\"'**
  String noOrdersWithStatus(Object status);

  /// No description provided for @noOwner.
  ///
  /// In en, this message translates to:
  /// **'No Owner'**
  String get noOwner;

  /// No description provided for @noProductionData.
  ///
  /// In en, this message translates to:
  /// **'No production data for this date'**
  String get noProductionData;

  /// No description provided for @noRestaurantData.
  ///
  /// In en, this message translates to:
  /// **'No restaurant data.'**
  String get noRestaurantData;

  /// No description provided for @noRestaurantFound.
  ///
  /// In en, this message translates to:
  /// **'No restaurant found for this account.'**
  String get noRestaurantFound;

  /// No description provided for @noRevenueDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No revenue data available'**
  String get noRevenueDataAvailable;

  /// No description provided for @noStatisticsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No statistics available'**
  String get noStatisticsAvailable;

  /// No description provided for @nutritionInformation.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Information'**
  String get nutritionInformation;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @operations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get operations;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @orderCancelledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order cancelled successfully'**
  String get orderCancelledSuccessfully;

  /// No description provided for @orderCreatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Order created successfully'**
  String get orderCreatedSuccessfully;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @orderDuration.
  ///
  /// In en, this message translates to:
  /// **'Order Duration'**
  String get orderDuration;

  /// No description provided for @orderItems.
  ///
  /// In en, this message translates to:
  /// **'Order Items'**
  String get orderItems;

  /// No description provided for @orderNotFound.
  ///
  /// In en, this message translates to:
  /// **'Order not found'**
  String get orderNotFound;

  /// No description provided for @orderProcessFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to process order. Please retry.'**
  String get orderProcessFailed;

  /// No description provided for @orderStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Order status updated successfully'**
  String get orderStatusUpdated;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @ordersByStatus.
  ///
  /// In en, this message translates to:
  /// **'Orders by Status'**
  String get ordersByStatus;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @ownerEmail.
  ///
  /// In en, this message translates to:
  /// **'Owner Email'**
  String get ownerEmail;

  /// No description provided for @ownerPassword.
  ///
  /// In en, this message translates to:
  /// **'Owner Password'**
  String get ownerPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get passwordChangedSuccess;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordLengthError;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Min 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'New passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @perDay.
  ///
  /// In en, this message translates to:
  /// **'/day'**
  String get perDay;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @pickUpOrder.
  ///
  /// In en, this message translates to:
  /// **'PICK UP ORDER'**
  String get pickUpOrder;

  /// No description provided for @piecesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} pcs'**
  String piecesCount(int count);

  /// No description provided for @pleaseEnterCategoryName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a category name'**
  String get pleaseEnterCategoryName;

  /// No description provided for @pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get pleaseEnterDescription;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email'**
  String get pleaseEnterEmail;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get pleaseEnterName;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get pleaseEnterPassword;

  /// No description provided for @pleaseEnterPrice.
  ///
  /// In en, this message translates to:
  /// **'Please enter a price'**
  String get pleaseEnterPrice;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// No description provided for @pleaseEnterValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get pleaseEnterValidNumber;

  /// No description provided for @pleaseSelectDeliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Please select a delivery address'**
  String get pleaseSelectDeliveryAddress;

  /// No description provided for @pleaseSelectOwner.
  ///
  /// In en, this message translates to:
  /// **'Please select an owner'**
  String get pleaseSelectOwner;

  /// No description provided for @popularMealPlans.
  ///
  /// In en, this message translates to:
  /// **'Popular Meal Plans'**
  String get popularMealPlans;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @priceRange.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get priceRange;

  /// No description provided for @proceedToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Checkout'**
  String get proceedToCheckout;

  /// No description provided for @productionDate.
  ///
  /// In en, this message translates to:
  /// **'Production Date'**
  String get productionDate;

  /// No description provided for @productionPlan.
  ///
  /// In en, this message translates to:
  /// **'Production Plan'**
  String get productionPlan;

  /// No description provided for @productionSummary.
  ///
  /// In en, this message translates to:
  /// **'Daily preparation summary'**
  String get productionSummary;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @proteinRange.
  ///
  /// In en, this message translates to:
  /// **'Protein Range'**
  String get proteinRange;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity: {count}'**
  String quantity(int count);

  /// No description provided for @quantityToCook.
  ///
  /// In en, this message translates to:
  /// **'Quantity to Cook'**
  String get quantityToCook;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @registrationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Registration successful!'**
  String get registrationSuccess;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @restaurantCategories.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Categories'**
  String get restaurantCategories;

  /// No description provided for @restaurantCreatedImageFailed.
  ///
  /// In en, this message translates to:
  /// **'Restaurant created, but image upload failed. Please retry.'**
  String get restaurantCreatedImageFailed;

  /// No description provided for @restaurantCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restaurant created successfully!'**
  String get restaurantCreatedSuccess;

  /// No description provided for @restaurantDashboard.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Dashboard'**
  String get restaurantDashboard;

  /// No description provided for @restaurantDeleted.
  ///
  /// In en, this message translates to:
  /// **'Restaurant deleted'**
  String get restaurantDeleted;

  /// No description provided for @restaurantDetails.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Details'**
  String get restaurantDetails;

  /// No description provided for @restaurantName.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Name'**
  String get restaurantName;

  /// No description provided for @restaurantOwner.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Owner'**
  String get restaurantOwner;

  /// No description provided for @restaurantRevenue.
  ///
  /// In en, this message translates to:
  /// **'Restaurant Revenue'**
  String get restaurantRevenue;

  /// No description provided for @restaurantUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restaurant updated successfully!'**
  String get restaurantUpdatedSuccess;

  /// No description provided for @restaurants.
  ///
  /// In en, this message translates to:
  /// **'Restaurants'**
  String get restaurants;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @retryFailed.
  ///
  /// In en, this message translates to:
  /// **'Retry failed: {error}'**
  String retryFailed(Object error);

  /// No description provided for @revenueTrend.
  ///
  /// In en, this message translates to:
  /// **'Revenue Trend'**
  String get revenueTrend;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get roleAdmin;

  /// No description provided for @roleCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get roleCustomer;

  /// No description provided for @roleDriver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get roleDriver;

  /// No description provided for @roleRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Restaurant'**
  String get roleRestaurant;

  /// No description provided for @roleUpdated.
  ///
  /// In en, this message translates to:
  /// **'Role updated successfully'**
  String get roleUpdated;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @saveMeal.
  ///
  /// In en, this message translates to:
  /// **'Save Meal'**
  String get saveMeal;

  /// No description provided for @saveMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Save Meal Plan'**
  String get saveMealPlan;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @searchByOrderNumber.
  ///
  /// In en, this message translates to:
  /// **'Search by order number...'**
  String get searchByOrderNumber;

  /// No description provided for @searchCategories.
  ///
  /// In en, this message translates to:
  /// **'Search Categories'**
  String get searchCategories;

  /// No description provided for @searchDriverDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Search by order ID, customer, or address...'**
  String get searchDriverDeliveries;

  /// No description provided for @searchDriversByEmail.
  ///
  /// In en, this message translates to:
  /// **'Search drivers by email...'**
  String get searchDriversByEmail;

  /// No description provided for @searchMealPlans.
  ///
  /// In en, this message translates to:
  /// **'Search meal plans...'**
  String get searchMealPlans;

  /// No description provided for @searchMeals.
  ///
  /// In en, this message translates to:
  /// **'Search meals...'**
  String get searchMeals;

  /// No description provided for @searchRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Search restaurants...'**
  String get searchRestaurants;

  /// No description provided for @searchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search users by email...'**
  String get searchUsers;

  /// No description provided for @selectAddress.
  ///
  /// In en, this message translates to:
  /// **'Select Address'**
  String get selectAddress;

  /// No description provided for @selectAtLeastOneMeal.
  ///
  /// In en, this message translates to:
  /// **'Select at least one meal'**
  String get selectAtLeastOneMeal;

  /// No description provided for @selectCategories.
  ///
  /// In en, this message translates to:
  /// **'Select Categories'**
  String get selectCategories;

  /// No description provided for @selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select Date Range'**
  String get selectDateRange;

  /// No description provided for @selectExisting.
  ///
  /// In en, this message translates to:
  /// **'Select Existing'**
  String get selectExisting;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select Image'**
  String get selectImage;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @selectMeal.
  ///
  /// In en, this message translates to:
  /// **'Select Meal'**
  String get selectMeal;

  /// No description provided for @selectOwner.
  ///
  /// In en, this message translates to:
  /// **'Select Owner'**
  String get selectOwner;

  /// No description provided for @selectedImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Selected:'**
  String get selectedImageLabel;

  /// No description provided for @selectedMeals.
  ///
  /// In en, this message translates to:
  /// **'Selected Meals'**
  String get selectedMeals;

  /// No description provided for @selectedPeriod.
  ///
  /// In en, this message translates to:
  /// **'Selected Period'**
  String get selectedPeriod;

  /// No description provided for @setAsDefaultAddress.
  ///
  /// In en, this message translates to:
  /// **'Set as default address'**
  String get setAsDefaultAddress;

  /// No description provided for @showIncludedMeals.
  ///
  /// In en, this message translates to:
  /// **'Show Included Meals ({count})'**
  String showIncludedMeals(int count);

  /// No description provided for @signInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to continue'**
  String get signInToContinue;

  /// No description provided for @signUpToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Sign up to get started'**
  String get signUpToGetStarted;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @startBuilding.
  ///
  /// In en, this message translates to:
  /// **'Start Building'**
  String get startBuilding;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

  /// No description provided for @statusAssigned.
  ///
  /// In en, this message translates to:
  /// **'Assigned'**
  String get statusAssigned;

  /// No description provided for @statusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// No description provided for @statusChangeConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Change order #{id} status from {oldStatus} to {newStatus}?'**
  String statusChangeConfirmation(
    Object id,
    Object newStatus,
    Object oldStatus,
  );

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get statusDelivered;

  /// No description provided for @statusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get statusFailed;

  /// No description provided for @statusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get statusPaid;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Picked Up'**
  String get statusPickedUp;

  /// No description provided for @statusReturned.
  ///
  /// In en, this message translates to:
  /// **'Returned'**
  String get statusReturned;

  /// No description provided for @statusUnpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get statusUnpaid;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @streetAddress.
  ///
  /// In en, this message translates to:
  /// **'Street Address'**
  String get streetAddress;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @tapToAddCoverImage.
  ///
  /// In en, this message translates to:
  /// **'Tap to add cover image'**
  String get tapToAddCoverImage;

  /// No description provided for @temporaryPassword.
  ///
  /// In en, this message translates to:
  /// **'Temporary Password'**
  String get temporaryPassword;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total:'**
  String get total;

  /// No description provided for @totalMeals.
  ///
  /// In en, this message translates to:
  /// **'Total Meals'**
  String get totalMeals;

  /// No description provided for @totalOrders.
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get totalOrders;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get totalPrice;

  /// No description provided for @totalRevenue.
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get totalRevenue;

  /// No description provided for @totalUsers.
  ///
  /// In en, this message translates to:
  /// **'Total Users'**
  String get totalUsers;

  /// No description provided for @unableToLoadHomeData.
  ///
  /// In en, this message translates to:
  /// **'Unable to load home data'**
  String get unableToLoadHomeData;

  /// No description provided for @unassigned.
  ///
  /// In en, this message translates to:
  /// **'Unassigned'**
  String get unassigned;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred: {error}'**
  String unexpectedError(String error);

  /// No description provided for @unknownRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Unknown Restaurant'**
  String get unknownRestaurant;

  /// No description provided for @updateSecurity.
  ///
  /// In en, this message translates to:
  /// **'Update Security'**
  String get updateSecurity;

  /// No description provided for @updateSecurityDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password and a new one.'**
  String get updateSecurityDescription;

  /// No description provided for @userDeleted.
  ///
  /// In en, this message translates to:
  /// **'User deleted successfully'**
  String get userDeleted;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @viewMyPlans.
  ///
  /// In en, this message translates to:
  /// **'View My Plans'**
  String get viewMyPlans;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @zipCode.
  ///
  /// In en, this message translates to:
  /// **'Zip Code'**
  String get zipCode;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @defaultAddress.
  ///
  /// In en, this message translates to:
  /// **'Default Address'**
  String get defaultAddress;

  /// No description provided for @confirmDeleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this address? This action cannot be undone.'**
  String get confirmDeleteAddress;

  /// No description provided for @deletedMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Deleted Meal Plan'**
  String get deletedMealPlan;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @topRestaurants.
  ///
  /// In en, this message translates to:
  /// **'Top Restaurants'**
  String get topRestaurants;

  /// No description provided for @totalClients.
  ///
  /// In en, this message translates to:
  /// **'Total Clients'**
  String get totalClients;

  /// No description provided for @totalDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Total Deliveries'**
  String get totalDeliveries;

  /// No description provided for @totalStatsMealPlans.
  ///
  /// In en, this message translates to:
  /// **'Total Meal Plans'**
  String get totalStatsMealPlans;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @dailyProgress.
  ///
  /// In en, this message translates to:
  /// **'Daily Progress: {count}/{total}'**
  String dailyProgress(Object count, Object total);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
