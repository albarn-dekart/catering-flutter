import 'package:catering_flutter/core/services/api_service.dart';
import 'package:catering_flutter/graphql/addresses.graphql.dart';
import 'package:catering_flutter/graphql/schema.graphql.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:catering_flutter/core/utils/ui_error_handler.dart';

typedef Address = Query$GetUserAddresses$user$addresses$edges$node;

class AddressService extends ChangeNotifier {
  final GraphQLClient _client;
  List<Address> _addresses = [];
  bool _isLoading = false;
  String? _errorMessage;

  AddressService(this._client);

  List<Address> get addresses => _addresses;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  Address? get defaultAddress {
    try {
      return _addresses.firstWhere((a) => a.isDefault);
    } catch (_) {
      return _addresses.isNotEmpty ? _addresses.first : null;
    }
  }

  Future<void> fetchAddresses(String userIri) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = QueryOptions(
        document: documentNodeQueryGetUserAddresses,
        variables: Variables$Query$GetUserAddresses(id: userIri).toJson(),
        fetchPolicy: FetchPolicy.networkOnly,
      );
      final response = await _client.query(options);
      ApiService.check(response);

      final data = Query$GetUserAddresses.fromJson(response.data!);
      final edges = data.user?.addresses?.edges;

      if (edges != null) {
        _addresses = edges
            .where((e) => e?.node != null)
            .map((e) => e!.node!)
            .toList();
      } else {
        _addresses = [];
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createAddress({
    required String userIri,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String street,
    String? apartment,
    required String city,
    required String zipCode,
    bool isDefault = false,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationCreateAddress,
        variables: Variables$Mutation$CreateAddress(
          input: Input$createAddressInput(
            user: userIri,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            street: street,
            apartment: apartment,
            city: city,
            zipCode: zipCode,
            isDefault: isDefault,
          ),
        ).toJson(),
      );

      final response = await _client.mutate(options);
      ApiService.check(response);

      final data = Mutation$CreateAddress.fromJson(response.data!);
      final newAddressRaw = data.createAddress?.address;
      if (newAddressRaw != null) {
        final newAddress = Address.fromJson(newAddressRaw.toJson());

        // 1. Handle default flag update locally based on backend response
        if (newAddress.isDefault) {
          // Unset default for all others
          _addresses = _addresses.map((a) {
            if (a.id != newAddress.id && a.isDefault) {
              // Assuming this workaround for immutable generated classes
              final jsonMap = a.toJson();
              jsonMap['isDefault'] = false;
              return Address.fromJson(jsonMap);
            }
            return a;
          }).toList();
        }

        _addresses.insert(0, newAddress);
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateAddress({
    required String id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationUpdateAddress,
        variables: Variables$Mutation$UpdateAddress(
          input: Input$updateAddressInput(
            id: id,
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            street: street,
            apartment: apartment,
            city: city,
            zipCode: zipCode,
            isDefault: isDefault,
          ),
        ).toJson(),
      );

      final response = await _client.mutate(options);
      ApiService.check(response);

      final data = Mutation$UpdateAddress.fromJson(response.data!);
      final updatedAddressRaw = data.updateAddress?.address;

      if (updatedAddressRaw != null) {
        final updatedAddress = Address.fromJson(updatedAddressRaw.toJson());

        // 1. Handle default flag update locally based on backend response
        if (updatedAddress.isDefault) {
          // Unset default for all others
          _addresses = _addresses.map((a) {
            if (a.id != updatedAddress.id && a.isDefault) {
              // Assuming this workaround for immutable generated classes
              final jsonMap = a.toJson();
              jsonMap['isDefault'] = false;
              return Address.fromJson(jsonMap);
            }
            return a;
          }).toList();
        }

        // 2. Find and replace the specific address
        final index = _addresses.indexWhere((a) => a.id == updatedAddress.id);
        if (index != -1) {
          _addresses[index] = updatedAddress;
        }
      }
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteAddress(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final options = MutationOptions(
        document: documentNodeMutationDeleteAddress,
        variables: Variables$Mutation$DeleteAddress(
          input: Input$deleteAddressInput(id: id),
        ).toJson(),
      );

      final response = await _client.mutate(options);
      ApiService.check(response);

      // We can trust the input ID for deletion if successful
      _addresses.removeWhere((a) => a.id == id);
    } catch (e) {
      _errorMessage = UIErrorHandler.mapExceptionToMessage(e);
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
