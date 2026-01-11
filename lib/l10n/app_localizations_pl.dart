// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get actionReportIssue => 'Zgłoś Problem';

  @override
  String get actionReturnToRestaurant => 'Zwróć do Restauracji';

  @override
  String get actionUndoStatus => 'Cofnij Status';

  @override
  String get active => 'Aktywne';

  @override
  String get activeOrders => 'Aktywne Zamówienia';

  @override
  String get add => 'Dodaj';

  @override
  String get addAddress => 'Dodaj Adres';

  @override
  String get addAddressToGetStarted => 'Dodaj nowy adres, aby rozpocząć';

  @override
  String get addMeal => 'Dodaj Posiłek';

  @override
  String get addMealPlan => 'Dodaj Plan Posiłków';

  @override
  String get addNewDietCategory => 'Dodaj Nową Kategorię Diety';

  @override
  String get addRemoveMeals => 'Dodaj/Usuń Posiłki';

  @override
  String get addRestaurant => 'Dodaj Restaurację';

  @override
  String get addToCart => 'Dodaj do Koszyka';

  @override
  String addedToCart(String item) {
    return 'Dodano $item do koszyka';
  }

  @override
  String get address => 'Adres';

  @override
  String get adminDashboard => 'Panel Administratora';

  @override
  String get advancedFilters => 'Zaawansowane Filtry';

  @override
  String get all => 'Wszystkie';

  @override
  String allDeliveries(int count) {
    return 'Wszystkie Dostawy ($count)';
  }

  @override
  String get allTime => 'Cały okres';

  @override
  String allTimeProgress(Object count, Object total) {
    return 'Postęp (cały czas): $count/$total';
  }

  @override
  String get apartmentOptional => 'Mieszkanie / Lokal (Opcjonalne)';

  @override
  String get appTitle => 'Usługi Cateringowe';

  @override
  String get areYouSureYouWantToCancelThisOrder =>
      'Czy na pewno chcesz anulować to zamówienie?';

  @override
  String get areYouSureYouWantToLogout => 'Czy na pewno chcesz się wylogować?';

  @override
  String get assignCourier => 'Przypisz Kuriera';

  @override
  String get assignRole => 'Przypisz Rolę';

  @override
  String get averageOrderValue => 'Średnia Wartość Zamówienia';

  @override
  String get basicInformation => 'Informacje Podstawowe';

  @override
  String get browseAllRestaurants => 'Przeglądaj wszystkie restauracje';

  @override
  String get calories => 'Kalorie';

  @override
  String get caloriesRange => 'Zakres Kalorii';

  @override
  String get cancel => 'Anuluj';

  @override
  String get cancelOrder => 'Anuluj Zamówienie';

  @override
  String get carbs => 'Węglowodany';

  @override
  String get carbsRange => 'Zakres Węglowodanów';

  @override
  String get cart => 'Koszyk';

  @override
  String get cartEmpty => 'Twój koszyk jest pusty.';

  @override
  String get categories => 'Kategorie';

  @override
  String categoryCreated(Object type) {
    return 'Kategoria $type utworzona';
  }

  @override
  String get categoryDeleted => 'Kategoria usunięta pomyślnie';

  @override
  String get categoryName => 'Nazwa Kategorii';

  @override
  String get categoryUpdated => 'Kategoria zaktualizowana pomyślnie';

  @override
  String get change => 'Zmień';

  @override
  String get changeImage => 'Zmień Obraz';

  @override
  String get changePassword => 'Zmień Hasło';

  @override
  String get changeStatus => 'Zmień Status';

  @override
  String get city => 'Miasto';

  @override
  String get clearAndAdd => 'Wyczyść i Dodaj';

  @override
  String get clearCartMessage =>
      'Twój koszyk zawiera produkty z innej restauracji. Czy chcesz wyczyścić koszyk i dodać ten produkt?';

  @override
  String get clearCartQuestion => 'Wyczyścić koszyk?';

  @override
  String get clearFilter => 'Wyczyść filtr';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get confirmDelete => 'Potwierdź Usunięcie';

  @override
  String get confirmDeleteAddress =>
      'Czy na pewno chcesz usunąć ten adres? Tej operacji nie można cofnąć.';

  @override
  String confirmDeleteCourier(String email) {
    return 'Czy na pewno chcesz usunąć kuriera $email? On zostanie odłączony z wszystkich dostaw.';
  }

  @override
  String confirmDeleteUser(String email) {
    return 'Czy na pewno chcesz usunąć użytkownika $email? On zostanie odłączony z restauracji lub wszystkich zamówień.';
  }

  @override
  String get confirmNewPassword => 'Potwierdź Nowe Hasło';

  @override
  String get confirmOrder => 'Potwierdź Zamówienie';

  @override
  String get confirmPassword => 'Potwierdź hasło';

  @override
  String get confirmStatusChange => 'Potwierdź Zmianę Statusu';

  @override
  String get contactDetails => 'Dane Kontaktowe';

  @override
  String get couldNotLaunchMap => 'Nie można otworzyć mapy';

  @override
  String get couldNotLaunchPhone => 'Nie można otworzyć wybierania numeru';

  @override
  String get count => 'Liczba';

  @override
  String get courier => 'Kurier';

  @override
  String get courierAssignFailed =>
      'Nie udało się przypisać kuriera. Spróbuj ponownie.';

  @override
  String get courierAssignedSuccess => 'Kurier przypisany pomyślnie.';

  @override
  String get courierDashboard => 'Panel Kuriera';

  @override
  String get courierDeleted => 'Kurier został usunięty pomyślnie';

  @override
  String courierInviteFailed(Object error) {
    return 'Nie udało się zaprosić kuriera: $error';
  }

  @override
  String get courierInvitedSuccess => 'Kurier zaproszony pomyślnie';

  @override
  String get courierPasswordWillBeEmailed =>
      'Tymczasowe hasło zostanie wysłane na ten adres email.';

  @override
  String get courierRoleLabel => 'KURIER';

  @override
  String courierWithName(Object name) {
    return 'Kurier: $name';
  }

  @override
  String get couriers => 'Kurierzy';

  @override
  String get createAccount => 'Utwórz Konto';

  @override
  String get createCustomPlan => 'Stwórz Własny Plan';

  @override
  String get createMeal => 'Utwórz Posiłek';

  @override
  String get createMealPlan => 'Utwórz Plan Posiłków';

  @override
  String get createNew => 'Utwórz Nowego';

  @override
  String get createRestaurant => 'Utwórz Restaurację';

  @override
  String get customMealPlanPromoSubtitle =>
      'Wybierz restaurację i stwórz plan posiłków dopasowany do Twojej diety.';

  @override
  String get customMealPlanPromoTitle => 'Stwórz Swój Idealny Plan';

  @override
  String get customerLabel => 'Klient';

  @override
  String get customers => 'Klienci';

  @override
  String get dailyOrders => 'Dzienne Zamówienia';

  @override
  String dailyProgress(Object count, Object total) {
    return 'Postęp dnia: $count/$total';
  }

  @override
  String daysCount(int count) {
    return '$count dni';
  }

  @override
  String get defaultAddress => 'Adres domyślny';

  @override
  String get delete => 'Usuń';

  @override
  String get deleteAddress => 'Usuń Adres';

  @override
  String get deleteAddressConfirmation =>
      'Czy na pewno chcesz usunąć ten adres?';

  @override
  String deleteCategory(Object type) {
    return 'Usuń Kategorię $type';
  }

  @override
  String deleteCategoryConfirmation(Object name) {
    return 'Czy na pewno chcesz usunąć \"$name\"?';
  }

  @override
  String get deleteDietCategory => 'Usuń Kategorię Diety';

  @override
  String get deleteMeal => 'Usuń Posiłek';

  @override
  String deleteMealConfirmation(Object name) {
    return 'Czy na pewno chcesz usunąć \"$name\"?';
  }

  @override
  String get deleteMealPlan => 'Usuń Plan Posiłków';

  @override
  String deleteMealPlanConfirmation(Object name) {
    return 'Czy na pewno chcesz usunąć \"$name\"?';
  }

  @override
  String get deleteRestaurant => 'Usuń Restaurację';

  @override
  String deleteRestaurantConfirmation(Object name) {
    return 'Czy na pewno chcesz usunąć \"$name\"?';
  }

  @override
  String get deletedMealPlan => 'Usunięty Plan Posiłków';

  @override
  String get delivery => 'Dostawa';

  @override
  String get deliveryAddress => 'Adres Dostawy';

  @override
  String get deliveryDate => 'Data Dostawy';

  @override
  String deliveryDateWithDate(Object date) {
    return 'Data Dostawy: $date';
  }

  @override
  String get deliveryDays => 'Dni Dostawy';

  @override
  String get deliveryDetails => 'Szczegóły Dostawy';

  @override
  String get deliveryFee => 'Opłata za dostawę';

  @override
  String get deliverySchedule => 'Harmonogram Dostaw';

  @override
  String get deliveryStatusUpdated => 'Status dostawy zaktualizowany pomyślnie';

  @override
  String get deliverySuccess => 'Dostawy Pomyślne';

  @override
  String get description => 'Opis';

  @override
  String get diet => 'Dieta';

  @override
  String get dietCategories => 'Kategorie Diet';

  @override
  String get dietCategoryHint => 'np. Wegańska, Keto, Bezglutenowa';

  @override
  String get discoverMessage =>
      'Odkryj pyszne plany posiłków z najlepszych restauracji';

  @override
  String get done => 'Gotowe';

  @override
  String get dontHaveAccount => 'Nie masz konta? ';

  @override
  String get edit => 'Edytuj';

  @override
  String get editAddress => 'Edytuj Adres';

  @override
  String get editDetails => 'Edytuj Szczegóły';

  @override
  String get editDietCategory => 'Edytuj Kategorię Diety';

  @override
  String get editMeal => 'Edytuj Posiłek';

  @override
  String get editMealPlan => 'Edytuj Plan Posiłków';

  @override
  String get editRestaurantCategory => 'Edytuj Kategorię Restauracji';

  @override
  String get email => 'Email';

  @override
  String get enterName => 'Wpisz nazwę...';

  @override
  String get error => 'Błąd';

  @override
  String get errorConstraintViolation =>
      'Ta operacja nie może zostać ukończona z powodu konfliktu danych.';

  @override
  String get errorInvalidSchema =>
      'Błąd techniczny: Wersje aplikacji i serwera są niezgodne. Skontaktuj się z pomocą techniczną.';

  @override
  String get errorNetwork =>
      'Błąd sieci. Sprawdź swoje połączenie z internetem.';

  @override
  String get errorServer => 'Błąd serwera. Spróbuj ponownie później.';

  @override
  String get errorTimeout =>
      'Limit czasu żądania upłynął. Serwer zbyt długo nie odpowiada.';

  @override
  String get errorUnauthorized => 'Sesja wygasła. Zaloguj się ponownie.';

  @override
  String get exportData => 'Pobierz Dane';

  @override
  String exportFailed(Object error) {
    return 'Nie udało się pobrać danych: $error';
  }

  @override
  String get exportSuccess => 'Dane obrane pomyślnie';

  @override
  String get failedToChangePassword => 'Nie udało się zmienić hasła';

  @override
  String get failedToCreateCategory => 'Nie udało się utworzyć kategorii';

  @override
  String get failedToDeleteCategory => 'Nie udało się usunąć kategorii';

  @override
  String get failedToLoadCategories => 'Nie udało się pobrać kategorii';

  @override
  String get failedToSaveRestaurant => 'Nie udało się zapisać restauracji';

  @override
  String get failedToUpdateCategory => 'Nie udało się zaktualizować kategorii';

  @override
  String get failedToUpdateStatus => 'Nie udało się zaktualizować statusu';

  @override
  String get fat => 'Tłuszcz';

  @override
  String get fatRange => 'Zakres Tłuszczu';

  @override
  String get featuredRestaurants => 'Polecane Restauracje';

  @override
  String get fieldRequired => 'Wymagane';

  @override
  String get fillAllFields => 'Wypełnij wszystkie pola';

  @override
  String get finalTotal => 'Suma Końcowa';

  @override
  String get firstName => 'Imię';

  @override
  String get futureDeliveryNoActions =>
      'Akcje dla przyszłych dostaw są zablokowane do dnia dostawy.';

  @override
  String get hideIncludedMeals => 'Ukryj zawarte posiłki';

  @override
  String get history => 'Historia';

  @override
  String get home => 'Strona Główna';

  @override
  String get imageUpdatedSuccess => 'Obraz zaktualizowany pomyślnie!';

  @override
  String get imageUploadFailed =>
      'Przesłanie obrazu nie powiodło się. Spróbuj ponownie.';

  @override
  String get imageUploadedSuccess => 'Obraz przesłany pomyślnie!';

  @override
  String get invalidEmail => 'Nieprawidłowy email';

  @override
  String get invalidFormat => 'Nieprawidłowy format';

  @override
  String get invalidNip => 'Nieprawidłowy NIP (10 cyfr)';

  @override
  String get invalidNumber => 'Nieprawidłowa liczba';

  @override
  String get invalidPhoneNumber => 'Nieprawidłowy numer telefonu';

  @override
  String get invalidZipCode => 'Nieprawidłowy kod pocztowy';

  @override
  String get invite => 'Zaproś';

  @override
  String get inviteCourier => 'Zaproś Kuriera';

  @override
  String get inviteNewCourier => 'Zaproś Nowego Kuriera';

  @override
  String get kitchenSchedule => 'Harmonogram Kuchni';

  @override
  String get last30Days => 'Ostatnie 30 Dni';

  @override
  String get lastName => 'Nazwisko';

  @override
  String get login => 'Zaloguj';

  @override
  String get loginFailed => 'Logowanie nie powiodło się';

  @override
  String get loginSuccess => 'Logowanie udane!';

  @override
  String get logout => 'Wyloguj';

  @override
  String get manageCouriers => 'Zarządzaj Kurierami';

  @override
  String get manageDeliveries => 'Zarządzaj Dostawami';

  @override
  String get manageDietCategories => 'Zarządzaj Kategoriami Diet';

  @override
  String get manageMealPlans => 'Zarządzaj Planami Posiłków';

  @override
  String get manageMeals => 'Zarządzaj Posiłkami';

  @override
  String get manageOrders => 'Zarządzaj Zamówieniami';

  @override
  String get manageRestaurants => 'Zarządzaj Restauracjami';

  @override
  String get manageUsers => 'Zarządzaj Użytkownikami';

  @override
  String get management => 'Zarządzanie';

  @override
  String get markAsDelivered => 'OZNACZ JAKO DOSTARCZONE';

  @override
  String get markAsDeliveredAction => 'Oznacz jako Dostarczone';

  @override
  String get markAsPickedUp => 'Oznacz jako Odebrane';

  @override
  String get mealDeleteFailed => 'Nie udało się usunąć posiłku';

  @override
  String get mealDeleted => 'Posiłek usunięty pomyślnie!';

  @override
  String get mealName => 'Nazwa Posiłku';

  @override
  String get mealPlanDeleteFailed => 'Nie udało się usunąć planu posiłków';

  @override
  String get mealPlanDeletedSuccess => 'Plan posiłków usunięty pomyślnie!';

  @override
  String get mealPlanDetails => 'Szczegóły Planu Posiłków';

  @override
  String get mealPlanName => 'Nazwa Planu Posiłków';

  @override
  String get mealPlanSaveFailed => 'Nie udało się zapisać planu posiłków';

  @override
  String get mealPlanSavedImageFailed =>
      'Plan zapisany, ale przesłanie obrazu nie powiodło się. Spróbuj ponownie.';

  @override
  String get mealPlanSavedSuccess => 'Plan posiłków zapisany pomyślnie!';

  @override
  String get mealPlans => 'Plany Posiłków';

  @override
  String get mealSaveFailed => 'Nie udało się zapisać posiłku';

  @override
  String get mealSavedImageFailed =>
      'Posiłek zapisany, ale przesłanie obrazu nie powiodło się. Spróbuj ponownie.';

  @override
  String get mealSavedSuccess => 'Posiłek zapisany pomyślnie!';

  @override
  String get mealsIncluded => 'Zawarte Posiłki';

  @override
  String get menu => 'Menu';

  @override
  String get myAddresses => 'Moje Adresy';

  @override
  String get myCustomPlans => 'Moje Własne Plany';

  @override
  String get myMealPlans => 'Moje Plany Posiłków';

  @override
  String get myOrders => 'Moje Zamówienia';

  @override
  String newCategory(Object type) {
    return 'Nowa Kategoria $type';
  }

  @override
  String get newPassword => 'Nowe Hasło';

  @override
  String get newPasswordMinLength =>
      'Nowe hasło musi mieć co najmniej 8 znaków';

  @override
  String get newRestaurantDetails => 'Szczegóły Nowej Restauracji';

  @override
  String get no => 'Nie';

  @override
  String get noAddressesFound => 'Brak adresów';

  @override
  String get noCategoriesAvailable => 'Brak dostępnych kategorii';

  @override
  String get noCategoriesFound => 'Nie znaleziono kategorii';

  @override
  String get noDataAvailable => 'Brak dostępnych danych';

  @override
  String get noDeliveriesScheduled => 'Brak zaplanowanych dostaw';

  @override
  String get noDescription => 'Brak opisu';

  @override
  String get noDietCategoriesFound => 'Nie znaleziono kategorii diet';

  @override
  String get noItemsFound => 'Nie znaleziono elementów';

  @override
  String get noMealPlanData => 'Brak danych o planie posiłków';

  @override
  String get noMealsSelected => 'Brak wybranych posiłków.';

  @override
  String get noOrderData => 'Brak dostępnych danych o zamówieniach';

  @override
  String get noOrders => 'Nie masz żadnych zamówień.';

  @override
  String noOrdersWithStatus(Object status) {
    return 'Brak zamówień o statusie \"$status\"';
  }

  @override
  String get noOwner => 'Brak właściciela';

  @override
  String get noProductionData => 'Brak danych produkcyjnych na ten dzień';

  @override
  String get noRestaurantData => 'Brak danych restauracji.';

  @override
  String get noRestaurantFound => 'Nie znaleziono restauracji dla tego konta.';

  @override
  String get noRevenueDataAvailable => 'Brak dostępnych danych o przychodach';

  @override
  String get noStatisticsAvailable => 'Brak dostępnych statystyk';

  @override
  String get nutritionInformation => 'Wartości Odżywcze';

  @override
  String get ok => 'OK';

  @override
  String get oldPassword => 'Stare Hasło';

  @override
  String get operations => 'Operacje';

  @override
  String get order => 'Zamówienie';

  @override
  String get orderCancelledSuccessfully => 'Zamówienie anulowane pomyślnie';

  @override
  String get orderCreatedSuccessfully => 'Zamówienie utworzone pomyślnie';

  @override
  String get orderDetails => 'Szczegóły Zamówienia';

  @override
  String get orderDuration => 'Okres Zamówienia';

  @override
  String get orderItems => 'Pozycje Zamówienia';

  @override
  String get orderNotFound => 'Nie znaleziono zamówienia';

  @override
  String get orderProcessFailed =>
      'Przetworzenie zam. nie powiodło się. Spróbuj ponownie.';

  @override
  String get orderStatusUpdated => 'Status zamówienia zaktualizowany pomyślnie';

  @override
  String get orders => 'Zamówienia';

  @override
  String get ordersByStatus => 'Zamówienia według statusu';

  @override
  String get overview => 'Przegląd';

  @override
  String get ownerEmail => 'Email Właściciela';

  @override
  String get ownerPassword => 'Hasło Właściciela';

  @override
  String get password => 'Hasło';

  @override
  String get passwordChangedSuccess => 'Hasło zmienione pomyślnie!';

  @override
  String get passwordLengthError => 'Hasło musi mieć co najmniej 8 znaków';

  @override
  String get passwordMinLength => 'Min 8 znaków';

  @override
  String get passwordsDoNotMatch => 'Hasła nie są identyczne';

  @override
  String get payNow => 'Zapłać Teraz';

  @override
  String get perDay => '/dzień';

  @override
  String get phone => 'Telefon';

  @override
  String get phoneNumber => 'Numer telefonu';

  @override
  String get pickUpOrder => 'ODBIERZ ZAMÓWIENIE';

  @override
  String piecesCount(int count) {
    return '$count szt.';
  }

  @override
  String get pleaseEnterCategoryName => 'Proszę wpisać nazwę kategorii';

  @override
  String get pleaseEnterDescription => 'Wprowadź opis';

  @override
  String get pleaseEnterEmail => 'Wprowadź email';

  @override
  String get pleaseEnterName => 'Wprowadź nazwę';

  @override
  String get pleaseEnterPassword => 'Wprowadź hasło';

  @override
  String get pleaseEnterPrice => 'Wprowadź cenę';

  @override
  String get pleaseEnterValidEmail => 'Wprowadź poprawny email';

  @override
  String get pleaseEnterValidNumber => 'Wprowadź poprawną liczbę';

  @override
  String get pleaseSelectDeliveryAddress => 'Wybierz adres dostawy';

  @override
  String get pleaseSelectOwner => 'Wybierz właściciela';

  @override
  String get popularMealPlans => 'Popularne Plany Posiłków';

  @override
  String get price => 'Cena';

  @override
  String get priceRange => 'Zakres Cenowy';

  @override
  String get proceedToCheckout => 'Przejdź do kasy';

  @override
  String get productionDate => 'Data Produkcji';

  @override
  String get productionPlan => 'Plan Produkcji';

  @override
  String get productionSummary => 'Podsumowanie dzienne przygotowań';

  @override
  String get profile => 'Profil';

  @override
  String get protein => 'Białko';

  @override
  String get proteinRange => 'Zakres Białka';

  @override
  String quantity(int count) {
    return 'Ilość: $count';
  }

  @override
  String get quantityToCook => 'Do Ugotowania';

  @override
  String rangeProgress(Object count, Object total) {
    return 'Postęp (wybrany okres): $count/$total';
  }

  @override
  String get register => 'Zarejestruj';

  @override
  String get registrationSuccess => 'Rejestracja udana!';

  @override
  String get requiredField => 'Pole wymagane';

  @override
  String get restaurantCategories => 'Kategorie Restauracji';

  @override
  String get restaurantCreatedImageFailed =>
      'Restauracja utworzona, ale przesłanie obrazu nie powiodło się. Spróbuj ponownie.';

  @override
  String get restaurantCreatedSuccess => 'Restauracja utworzona pomyślnie!';

  @override
  String get restaurantDashboard => 'Panel Restauracji';

  @override
  String get restaurantDeleted => 'Restauracja usunięta';

  @override
  String get restaurantDetails => 'Szczegóły Restauracji';

  @override
  String get restaurantName => 'Nazwa Restauracji';

  @override
  String get restaurantOwner => 'Właściciel Restauracji';

  @override
  String get restaurantRevenue => 'Przychód Restauracji';

  @override
  String get restaurantUpdatedSuccess =>
      'Restauracja zaktualizowana pomyślnie!';

  @override
  String get restaurants => 'Restauracje';

  @override
  String get retry => 'Ponów';

  @override
  String retryFailed(Object error) {
    return 'Ponowna próba nie powiodła się: $error';
  }

  @override
  String get revenueTrend => 'Trend przychodów';

  @override
  String get revertGraceExpired => 'Czas na cofnięcie wygasł (60 sec)';

  @override
  String get revertStatusFailed => 'Błąd podczas przywracania statusu';

  @override
  String get revertStatusSuccess => 'Status został przywrócony';

  @override
  String get roleAdmin => 'Administrator';

  @override
  String get roleCourier => 'Kurier';

  @override
  String get roleCustomer => 'Klient';

  @override
  String get roleRestaurant => 'Restauracja';

  @override
  String get roleUpdated => 'Rola zaktualizowana pomyślnie';

  @override
  String get save => 'Zapisz';

  @override
  String get saveChanges => 'Zapisz Zmiany';

  @override
  String get saveMeal => 'Zapisz Posiłek';

  @override
  String get saveMealPlan => 'Zapisz Plan Posiłków';

  @override
  String get search => 'Szukaj...';

  @override
  String get searchByOrderNumber => 'Szukaj po numerze zamówienia...';

  @override
  String get searchCategories => 'Szukaj Kategorii';

  @override
  String get searchCourierDeliveries =>
      'Wyszukaj po numerze zamówienia, kliencie lub adresie...';

  @override
  String get searchCouriersByEmail => 'Szukaj kurierów po emailu...';

  @override
  String get searchMealPlans => 'Szukaj planów posiłków...';

  @override
  String get searchMeals => 'Szukaj posiłków...';

  @override
  String get searchRestaurants => 'Szukaj restauracji...';

  @override
  String get searchUsers => 'Szukaj użytkowników po emailu...';

  @override
  String get selectAddress => 'Wybierz Adres';

  @override
  String get selectAtLeastOneMeal => 'Wybierz przynajmniej jeden posiłek';

  @override
  String get selectCategories => 'Wybierz Kategorie';

  @override
  String get selectDateRange => 'Wybierz Zakres Dat';

  @override
  String get selectExisting => 'Wybierz Istniejącego';

  @override
  String get selectImage => 'Wybierz Obraz';

  @override
  String get selectLanguage => 'Wybierz Język';

  @override
  String get selectMeal => 'Wybierz Posiłek';

  @override
  String get selectOwner => 'Wybierz Właściciela';

  @override
  String get selectedImageLabel => 'Wybrano:';

  @override
  String get selectedMeals => 'Wybrane Posiłki';

  @override
  String get selectedPeriod => 'Wybrany Okres';

  @override
  String get setAsDefaultAddress => 'Ustaw jako adres domyślny';

  @override
  String showIncludedMeals(int count) {
    return 'Pokaż zawarte posiłki ($count)';
  }

  @override
  String showingXofY(Object count, Object total) {
    return 'Pokazano $count z $total';
  }

  @override
  String get signInToContinue => 'Zaloguj się, aby kontynuować';

  @override
  String get signUpToGetStarted => 'Zarejestruj się, aby rozpocząć';

  @override
  String get somethingWentWrong => 'Coś poszło nie tak';

  @override
  String get startBuilding => 'Zacznij Tworzyć';

  @override
  String get statistics => 'Statystyki';

  @override
  String get status => 'Status';

  @override
  String get statusActive => 'W realizacji';

  @override
  String get statusAssigned => 'Przypisane';

  @override
  String get statusCancelled => 'Anulowane';

  @override
  String statusChangeConfirmation(
    Object id,
    Object newStatus,
    Object oldStatus,
  ) {
    return 'Zmienić status zamówienia #$id z $oldStatus na $newStatus?';
  }

  @override
  String get statusCompleted => 'Zakończone';

  @override
  String get statusDelivered => 'Dostarczone';

  @override
  String get statusFailed => 'Niepowodzenie';

  @override
  String get statusPaid => 'Opłacone';

  @override
  String get statusPending => 'Oczekujące';

  @override
  String get statusPickedUp => 'Odebrane';

  @override
  String get statusReturned => 'Zwrócone';

  @override
  String get statusUnpaid => 'Nieopłacone';

  @override
  String get street => 'Ulica';

  @override
  String get streetAddress => 'Ulica i numer';

  @override
  String get summary => 'Podsumowanie';

  @override
  String get tapToAddCoverImage => 'Dotknij, aby dodać zdjęcie';

  @override
  String get temporaryPassword => 'Hasło Tymczasowe';

  @override
  String get today => 'Dzisiaj';

  @override
  String get tomorrow => 'Jutro';

  @override
  String get topRestaurants => 'Restauracje wg przychodu';

  @override
  String get total => 'Razem:';

  @override
  String get totalClients => 'Liczba Klientów';

  @override
  String get totalDeliveries => 'Liczba Dostaw';

  @override
  String get totalMeals => 'Suma Posiłków';

  @override
  String get totalOrders => 'Liczba Zamówień';

  @override
  String get totalPrice => 'Cena całkowita';

  @override
  String get totalRevenue => 'Całkowity Przychód';

  @override
  String get totalStatsMealPlans => 'Liczba Planów Posiłków';

  @override
  String get totalUsers => 'Użytkownicy';

  @override
  String get unableToLoadHomeData => 'Nie udało się załadować danych';

  @override
  String get unassigned => 'Nieprzypisany';

  @override
  String unexpectedError(String error) {
    return 'Wystąpił nieoczekiwany błąd: $error';
  }

  @override
  String get unknownRestaurant => 'Nieznana Restauracja';

  @override
  String get updateSecurity => 'Zaktualizuj Zabezpieczenia';

  @override
  String get updateSecurityDescription => 'Wprowadź obecne hasło i nowe.';

  @override
  String get userDeleted => 'Użytkownik został usunięty pomyślnie';

  @override
  String get viewAll => 'Zobacz Wszystkie';

  @override
  String get viewMyPlans => 'Zobacz Moje Plany';

  @override
  String get welcomeBack => 'Witaj ponownie';

  @override
  String get yes => 'Tak';

  @override
  String get yesterday => 'Wczoraj';

  @override
  String get yourCartIsEmpty => 'Twój koszyk jest pusty';

  @override
  String get zipCode => 'Kod pocztowy';
}
