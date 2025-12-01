class Input$createPaymentInput {
  factory Input$createPaymentInput({
    String? $_id,
    String? order,
    String? sessionId,
    String? url,
    String? clientMutationId,
  }) => Input$createPaymentInput._({
    if ($_id != null) r'_id': $_id,
    if (order != null) r'order': order,
    if (sessionId != null) r'sessionId': sessionId,
    if (url != null) r'url': url,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createPaymentInput._(this._$data);

  factory Input$createPaymentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_id')) {
      final l$$_id = data['_id'];
      result$data['_id'] = (l$$_id as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('sessionId')) {
      final l$sessionId = data['sessionId'];
      result$data['sessionId'] = (l$sessionId as String?);
    }
    if (data.containsKey('url')) {
      final l$url = data['url'];
      result$data['url'] = (l$url as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createPaymentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get $_id => (_$data['_id'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get sessionId => (_$data['sessionId'] as String?);

  String? get url => (_$data['url'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_id')) {
      final l$$_id = $_id;
      result$data['_id'] = l$$_id;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('sessionId')) {
      final l$sessionId = sessionId;
      result$data['sessionId'] = l$sessionId;
    }
    if (_$data.containsKey('url')) {
      final l$url = url;
      result$data['url'] = l$url;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createPaymentInput<Input$createPaymentInput> get copyWith =>
      CopyWith$Input$createPaymentInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createPaymentInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_id = $_id;
    final lOther$$_id = other.$_id;
    if (_$data.containsKey('_id') != other._$data.containsKey('_id')) {
      return false;
    }
    if (l$$_id != lOther$$_id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (_$data.containsKey('sessionId') !=
        other._$data.containsKey('sessionId')) {
      return false;
    }
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (_$data.containsKey('url') != other._$data.containsKey('url')) {
      return false;
    }
    if (l$url != lOther$url) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_id = $_id;
    final l$order = order;
    final l$sessionId = sessionId;
    final l$url = url;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('_id') ? l$$_id : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('sessionId') ? l$sessionId : const {},
      _$data.containsKey('url') ? l$url : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createPaymentInput<TRes> {
  factory CopyWith$Input$createPaymentInput(
    Input$createPaymentInput instance,
    TRes Function(Input$createPaymentInput) then,
  ) = _CopyWithImpl$Input$createPaymentInput;

  factory CopyWith$Input$createPaymentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createPaymentInput;

  TRes call({
    String? $_id,
    String? order,
    String? sessionId,
    String? url,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createPaymentInput<TRes>
    implements CopyWith$Input$createPaymentInput<TRes> {
  _CopyWithImpl$Input$createPaymentInput(this._instance, this._then);

  final Input$createPaymentInput _instance;

  final TRes Function(Input$createPaymentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_id = _undefined,
    Object? order = _undefined,
    Object? sessionId = _undefined,
    Object? url = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createPaymentInput._({
      ..._instance._$data,
      if ($_id != _undefined) '_id': ($_id as String?),
      if (order != _undefined) 'order': (order as String?),
      if (sessionId != _undefined) 'sessionId': (sessionId as String?),
      if (url != _undefined) 'url': (url as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createPaymentInput<TRes>
    implements CopyWith$Input$createPaymentInput<TRes> {
  _CopyWithStubImpl$Input$createPaymentInput(this._res);

  TRes _res;

  call({
    String? $_id,
    String? order,
    String? sessionId,
    String? url,
    String? clientMutationId,
  }) => _res;
}

class Input$createAddressInput {
  factory Input$createAddressInput({
    required String user,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String street,
    String? apartment,
    required String city,
    required String zipCode,
    required bool isDefault,
    String? clientMutationId,
  }) => Input$createAddressInput._({
    r'user': user,
    r'firstName': firstName,
    r'lastName': lastName,
    r'phoneNumber': phoneNumber,
    r'street': street,
    if (apartment != null) r'apartment': apartment,
    r'city': city,
    r'zipCode': zipCode,
    r'isDefault': isDefault,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createAddressInput._(this._$data);

  factory Input$createAddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user = data['user'];
    result$data['user'] = (l$user as String);
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    final l$street = data['street'];
    result$data['street'] = (l$street as String);
    if (data.containsKey('apartment')) {
      final l$apartment = data['apartment'];
      result$data['apartment'] = (l$apartment as String?);
    }
    final l$city = data['city'];
    result$data['city'] = (l$city as String);
    final l$zipCode = data['zipCode'];
    result$data['zipCode'] = (l$zipCode as String);
    final l$isDefault = data['isDefault'];
    result$data['isDefault'] = (l$isDefault as bool);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createAddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user => (_$data['user'] as String);

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  String get phoneNumber => (_$data['phoneNumber'] as String);

  String get street => (_$data['street'] as String);

  String? get apartment => (_$data['apartment'] as String?);

  String get city => (_$data['city'] as String);

  String get zipCode => (_$data['zipCode'] as String);

  bool get isDefault => (_$data['isDefault'] as bool);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user = user;
    result$data['user'] = l$user;
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    final l$street = street;
    result$data['street'] = l$street;
    if (_$data.containsKey('apartment')) {
      final l$apartment = apartment;
      result$data['apartment'] = l$apartment;
    }
    final l$city = city;
    result$data['city'] = l$city;
    final l$zipCode = zipCode;
    result$data['zipCode'] = l$zipCode;
    final l$isDefault = isDefault;
    result$data['isDefault'] = l$isDefault;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createAddressInput<Input$createAddressInput> get copyWith =>
      CopyWith$Input$createAddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createAddressInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (l$street != lOther$street) {
      return false;
    }
    final l$apartment = apartment;
    final lOther$apartment = other.apartment;
    if (_$data.containsKey('apartment') !=
        other._$data.containsKey('apartment')) {
      return false;
    }
    if (l$apartment != lOther$apartment) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$zipCode = zipCode;
    final lOther$zipCode = other.zipCode;
    if (l$zipCode != lOther$zipCode) {
      return false;
    }
    final l$isDefault = isDefault;
    final lOther$isDefault = other.isDefault;
    if (l$isDefault != lOther$isDefault) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$user,
      l$firstName,
      l$lastName,
      l$phoneNumber,
      l$street,
      _$data.containsKey('apartment') ? l$apartment : const {},
      l$city,
      l$zipCode,
      l$isDefault,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createAddressInput<TRes> {
  factory CopyWith$Input$createAddressInput(
    Input$createAddressInput instance,
    TRes Function(Input$createAddressInput) then,
  ) = _CopyWithImpl$Input$createAddressInput;

  factory CopyWith$Input$createAddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createAddressInput;

  TRes call({
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createAddressInput<TRes>
    implements CopyWith$Input$createAddressInput<TRes> {
  _CopyWithImpl$Input$createAddressInput(this._instance, this._then);

  final Input$createAddressInput _instance;

  final TRes Function(Input$createAddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createAddressInput._({
      ..._instance._$data,
      if (user != _undefined && user != null) 'user': (user as String),
      if (firstName != _undefined && firstName != null)
        'firstName': (firstName as String),
      if (lastName != _undefined && lastName != null)
        'lastName': (lastName as String),
      if (phoneNumber != _undefined && phoneNumber != null)
        'phoneNumber': (phoneNumber as String),
      if (street != _undefined && street != null) 'street': (street as String),
      if (apartment != _undefined) 'apartment': (apartment as String?),
      if (city != _undefined && city != null) 'city': (city as String),
      if (zipCode != _undefined && zipCode != null)
        'zipCode': (zipCode as String),
      if (isDefault != _undefined && isDefault != null)
        'isDefault': (isDefault as bool),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createAddressInput<TRes>
    implements CopyWith$Input$createAddressInput<TRes> {
  _CopyWithStubImpl$Input$createAddressInput(this._res);

  TRes _res;

  call({
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  }) => _res;
}

class Input$updateAddressInput {
  factory Input$updateAddressInput({
    required String id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  }) => Input$updateAddressInput._({
    r'id': id,
    if (user != null) r'user': user,
    if (firstName != null) r'firstName': firstName,
    if (lastName != null) r'lastName': lastName,
    if (phoneNumber != null) r'phoneNumber': phoneNumber,
    if (street != null) r'street': street,
    if (apartment != null) r'apartment': apartment,
    if (city != null) r'city': city,
    if (zipCode != null) r'zipCode': zipCode,
    if (isDefault != null) r'isDefault': isDefault,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateAddressInput._(this._$data);

  factory Input$updateAddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('user')) {
      final l$user = data['user'];
      result$data['user'] = (l$user as String?);
    }
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    if (data.containsKey('street')) {
      final l$street = data['street'];
      result$data['street'] = (l$street as String?);
    }
    if (data.containsKey('apartment')) {
      final l$apartment = data['apartment'];
      result$data['apartment'] = (l$apartment as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('zipCode')) {
      final l$zipCode = data['zipCode'];
      result$data['zipCode'] = (l$zipCode as String?);
    }
    if (data.containsKey('isDefault')) {
      final l$isDefault = data['isDefault'];
      result$data['isDefault'] = (l$isDefault as bool?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateAddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get user => (_$data['user'] as String?);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  String? get street => (_$data['street'] as String?);

  String? get apartment => (_$data['apartment'] as String?);

  String? get city => (_$data['city'] as String?);

  String? get zipCode => (_$data['zipCode'] as String?);

  bool? get isDefault => (_$data['isDefault'] as bool?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('user')) {
      final l$user = user;
      result$data['user'] = l$user;
    }
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    if (_$data.containsKey('street')) {
      final l$street = street;
      result$data['street'] = l$street;
    }
    if (_$data.containsKey('apartment')) {
      final l$apartment = apartment;
      result$data['apartment'] = l$apartment;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('zipCode')) {
      final l$zipCode = zipCode;
      result$data['zipCode'] = l$zipCode;
    }
    if (_$data.containsKey('isDefault')) {
      final l$isDefault = isDefault;
      result$data['isDefault'] = l$isDefault;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateAddressInput<Input$updateAddressInput> get copyWith =>
      CopyWith$Input$updateAddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateAddressInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (_$data.containsKey('user') != other._$data.containsKey('user')) {
      return false;
    }
    if (l$user != lOther$user) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (_$data.containsKey('street') != other._$data.containsKey('street')) {
      return false;
    }
    if (l$street != lOther$street) {
      return false;
    }
    final l$apartment = apartment;
    final lOther$apartment = other.apartment;
    if (_$data.containsKey('apartment') !=
        other._$data.containsKey('apartment')) {
      return false;
    }
    if (l$apartment != lOther$apartment) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$zipCode = zipCode;
    final lOther$zipCode = other.zipCode;
    if (_$data.containsKey('zipCode') != other._$data.containsKey('zipCode')) {
      return false;
    }
    if (l$zipCode != lOther$zipCode) {
      return false;
    }
    final l$isDefault = isDefault;
    final lOther$isDefault = other.isDefault;
    if (_$data.containsKey('isDefault') !=
        other._$data.containsKey('isDefault')) {
      return false;
    }
    if (l$isDefault != lOther$isDefault) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('user') ? l$user : const {},
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      _$data.containsKey('street') ? l$street : const {},
      _$data.containsKey('apartment') ? l$apartment : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('zipCode') ? l$zipCode : const {},
      _$data.containsKey('isDefault') ? l$isDefault : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateAddressInput<TRes> {
  factory CopyWith$Input$updateAddressInput(
    Input$updateAddressInput instance,
    TRes Function(Input$updateAddressInput) then,
  ) = _CopyWithImpl$Input$updateAddressInput;

  factory CopyWith$Input$updateAddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateAddressInput;

  TRes call({
    String? id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateAddressInput<TRes>
    implements CopyWith$Input$updateAddressInput<TRes> {
  _CopyWithImpl$Input$updateAddressInput(this._instance, this._then);

  final Input$updateAddressInput _instance;

  final TRes Function(Input$updateAddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateAddressInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (user != _undefined) 'user': (user as String?),
      if (firstName != _undefined) 'firstName': (firstName as String?),
      if (lastName != _undefined) 'lastName': (lastName as String?),
      if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
      if (street != _undefined) 'street': (street as String?),
      if (apartment != _undefined) 'apartment': (apartment as String?),
      if (city != _undefined) 'city': (city as String?),
      if (zipCode != _undefined) 'zipCode': (zipCode as String?),
      if (isDefault != _undefined) 'isDefault': (isDefault as bool?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateAddressInput<TRes>
    implements CopyWith$Input$updateAddressInput<TRes> {
  _CopyWithStubImpl$Input$updateAddressInput(this._res);

  TRes _res;

  call({
    String? id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteAddressInput {
  factory Input$deleteAddressInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteAddressInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteAddressInput._(this._$data);

  factory Input$deleteAddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteAddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteAddressInput<Input$deleteAddressInput> get copyWith =>
      CopyWith$Input$deleteAddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteAddressInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteAddressInput<TRes> {
  factory CopyWith$Input$deleteAddressInput(
    Input$deleteAddressInput instance,
    TRes Function(Input$deleteAddressInput) then,
  ) = _CopyWithImpl$Input$deleteAddressInput;

  factory CopyWith$Input$deleteAddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteAddressInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteAddressInput<TRes>
    implements CopyWith$Input$deleteAddressInput<TRes> {
  _CopyWithImpl$Input$deleteAddressInput(this._instance, this._then);

  final Input$deleteAddressInput _instance;

  final TRes Function(Input$deleteAddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteAddressInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteAddressInput<TRes>
    implements CopyWith$Input$deleteAddressInput<TRes> {
  _CopyWithStubImpl$Input$deleteAddressInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createCategoryInput {
  factory Input$createCategoryInput({
    required String name,
    String? clientMutationId,
  }) => Input$createCategoryInput._({
    r'name': name,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createCategoryInput._(this._$data);

  factory Input$createCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createCategoryInput<Input$createCategoryInput> get copyWith =>
      CopyWith$Input$createCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createCategoryInput<TRes> {
  factory CopyWith$Input$createCategoryInput(
    Input$createCategoryInput instance,
    TRes Function(Input$createCategoryInput) then,
  ) = _CopyWithImpl$Input$createCategoryInput;

  factory CopyWith$Input$createCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createCategoryInput;

  TRes call({String? name, String? clientMutationId});
}

class _CopyWithImpl$Input$createCategoryInput<TRes>
    implements CopyWith$Input$createCategoryInput<TRes> {
  _CopyWithImpl$Input$createCategoryInput(this._instance, this._then);

  final Input$createCategoryInput _instance;

  final TRes Function(Input$createCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createCategoryInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createCategoryInput<TRes>
    implements CopyWith$Input$createCategoryInput<TRes> {
  _CopyWithStubImpl$Input$createCategoryInput(this._res);

  TRes _res;

  call({String? name, String? clientMutationId}) => _res;
}

class Input$updateCategoryInput {
  factory Input$updateCategoryInput({
    required String id,
    String? name,
    String? clientMutationId,
  }) => Input$updateCategoryInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateCategoryInput._(this._$data);

  factory Input$updateCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateCategoryInput<Input$updateCategoryInput> get copyWith =>
      CopyWith$Input$updateCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateCategoryInput<TRes> {
  factory CopyWith$Input$updateCategoryInput(
    Input$updateCategoryInput instance,
    TRes Function(Input$updateCategoryInput) then,
  ) = _CopyWithImpl$Input$updateCategoryInput;

  factory CopyWith$Input$updateCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateCategoryInput;

  TRes call({String? id, String? name, String? clientMutationId});
}

class _CopyWithImpl$Input$updateCategoryInput<TRes>
    implements CopyWith$Input$updateCategoryInput<TRes> {
  _CopyWithImpl$Input$updateCategoryInput(this._instance, this._then);

  final Input$updateCategoryInput _instance;

  final TRes Function(Input$updateCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateCategoryInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateCategoryInput<TRes>
    implements CopyWith$Input$updateCategoryInput<TRes> {
  _CopyWithStubImpl$Input$updateCategoryInput(this._res);

  TRes _res;

  call({String? id, String? name, String? clientMutationId}) => _res;
}

class Input$deleteCategoryInput {
  factory Input$deleteCategoryInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteCategoryInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteCategoryInput._(this._$data);

  factory Input$deleteCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteCategoryInput<Input$deleteCategoryInput> get copyWith =>
      CopyWith$Input$deleteCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteCategoryInput<TRes> {
  factory CopyWith$Input$deleteCategoryInput(
    Input$deleteCategoryInput instance,
    TRes Function(Input$deleteCategoryInput) then,
  ) = _CopyWithImpl$Input$deleteCategoryInput;

  factory CopyWith$Input$deleteCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteCategoryInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteCategoryInput<TRes>
    implements CopyWith$Input$deleteCategoryInput<TRes> {
  _CopyWithImpl$Input$deleteCategoryInput(this._instance, this._then);

  final Input$deleteCategoryInput _instance;

  final TRes Function(Input$deleteCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteCategoryInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteCategoryInput<TRes>
    implements CopyWith$Input$deleteCategoryInput<TRes> {
  _CopyWithStubImpl$Input$deleteCategoryInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$updateDeliveryInput {
  factory Input$updateDeliveryInput({
    required String id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? clientMutationId,
  }) => Input$updateDeliveryInput._({
    r'id': id,
    if (driver != null) r'driver': driver,
    if (status != null) r'status': status,
    if (deliveryDate != null) r'deliveryDate': deliveryDate,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateDeliveryInput._(this._$data);

  factory Input$updateDeliveryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('driver')) {
      final l$driver = data['driver'];
      result$data['driver'] = (l$driver as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$DeliveryStatus((l$status as String));
    }
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateDeliveryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get driver => (_$data['driver'] as String?);

  Enum$DeliveryStatus? get status => (_$data['status'] as Enum$DeliveryStatus?);

  String? get deliveryDate => (_$data['deliveryDate'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('driver')) {
      final l$driver = driver;
      result$data['driver'] = l$driver;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$DeliveryStatus(l$status);
    }
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateDeliveryInput<Input$updateDeliveryInput> get copyWith =>
      CopyWith$Input$updateDeliveryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateDeliveryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (_$data.containsKey('driver') != other._$data.containsKey('driver')) {
      return false;
    }
    if (l$driver != lOther$driver) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$driver = driver;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('driver') ? l$driver : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('deliveryDate') ? l$deliveryDate : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateDeliveryInput<TRes> {
  factory CopyWith$Input$updateDeliveryInput(
    Input$updateDeliveryInput instance,
    TRes Function(Input$updateDeliveryInput) then,
  ) = _CopyWithImpl$Input$updateDeliveryInput;

  factory CopyWith$Input$updateDeliveryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateDeliveryInput;

  TRes call({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateDeliveryInput<TRes>
    implements CopyWith$Input$updateDeliveryInput<TRes> {
  _CopyWithImpl$Input$updateDeliveryInput(this._instance, this._then);

  final Input$updateDeliveryInput _instance;

  final TRes Function(Input$updateDeliveryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? driver = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateDeliveryInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (driver != _undefined) 'driver': (driver as String?),
      if (status != _undefined) 'status': (status as Enum$DeliveryStatus?),
      if (deliveryDate != _undefined) 'deliveryDate': (deliveryDate as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateDeliveryInput<TRes>
    implements CopyWith$Input$updateDeliveryInput<TRes> {
  _CopyWithStubImpl$Input$updateDeliveryInput(this._res);

  TRes _res;

  call({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteDeliveryInput {
  factory Input$deleteDeliveryInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteDeliveryInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteDeliveryInput._(this._$data);

  factory Input$deleteDeliveryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteDeliveryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteDeliveryInput<Input$deleteDeliveryInput> get copyWith =>
      CopyWith$Input$deleteDeliveryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteDeliveryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteDeliveryInput<TRes> {
  factory CopyWith$Input$deleteDeliveryInput(
    Input$deleteDeliveryInput instance,
    TRes Function(Input$deleteDeliveryInput) then,
  ) = _CopyWithImpl$Input$deleteDeliveryInput;

  factory CopyWith$Input$deleteDeliveryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteDeliveryInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteDeliveryInput<TRes>
    implements CopyWith$Input$deleteDeliveryInput<TRes> {
  _CopyWithImpl$Input$deleteDeliveryInput(this._instance, this._then);

  final Input$deleteDeliveryInput _instance;

  final TRes Function(Input$deleteDeliveryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteDeliveryInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteDeliveryInput<TRes>
    implements CopyWith$Input$deleteDeliveryInput<TRes> {
  _CopyWithStubImpl$Input$deleteDeliveryInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createMealInput {
  factory Input$createMealInput({
    required String name,
    String? description,
    required double calories,
    required double protein,
    required double fat,
    required double carbs,
    required int price,
    required String restaurant,
    String? clientMutationId,
  }) => Input$createMealInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'calories': calories,
    r'protein': protein,
    r'fat': fat,
    r'carbs': carbs,
    r'price': price,
    r'restaurant': restaurant,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createMealInput._(this._$data);

  factory Input$createMealInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$calories = data['calories'];
    result$data['calories'] = (l$calories as num).toDouble();
    final l$protein = data['protein'];
    result$data['protein'] = (l$protein as num).toDouble();
    final l$fat = data['fat'];
    result$data['fat'] = (l$fat as num).toDouble();
    final l$carbs = data['carbs'];
    result$data['carbs'] = (l$carbs as num).toDouble();
    final l$price = data['price'];
    result$data['price'] = (l$price as int);
    final l$restaurant = data['restaurant'];
    result$data['restaurant'] = (l$restaurant as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createMealInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  double get calories => (_$data['calories'] as double);

  double get protein => (_$data['protein'] as double);

  double get fat => (_$data['fat'] as double);

  double get carbs => (_$data['carbs'] as double);

  int get price => (_$data['price'] as int);

  String get restaurant => (_$data['restaurant'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$calories = calories;
    result$data['calories'] = l$calories;
    final l$protein = protein;
    result$data['protein'] = l$protein;
    final l$fat = fat;
    result$data['fat'] = l$fat;
    final l$carbs = carbs;
    result$data['carbs'] = l$carbs;
    final l$price = price;
    result$data['price'] = l$price;
    final l$restaurant = restaurant;
    result$data['restaurant'] = l$restaurant;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createMealInput<Input$createMealInput> get copyWith =>
      CopyWith$Input$createMealInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createMealInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$price = price;
    final l$restaurant = restaurant;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$calories,
      l$protein,
      l$fat,
      l$carbs,
      l$price,
      l$restaurant,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createMealInput<TRes> {
  factory CopyWith$Input$createMealInput(
    Input$createMealInput instance,
    TRes Function(Input$createMealInput) then,
  ) = _CopyWithImpl$Input$createMealInput;

  factory CopyWith$Input$createMealInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createMealInput;

  TRes call({
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createMealInput<TRes>
    implements CopyWith$Input$createMealInput<TRes> {
  _CopyWithImpl$Input$createMealInput(this._instance, this._then);

  final Input$createMealInput _instance;

  final TRes Function(Input$createMealInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? price = _undefined,
    Object? restaurant = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createMealInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (calories != _undefined && calories != null)
        'calories': (calories as double),
      if (protein != _undefined && protein != null)
        'protein': (protein as double),
      if (fat != _undefined && fat != null) 'fat': (fat as double),
      if (carbs != _undefined && carbs != null) 'carbs': (carbs as double),
      if (price != _undefined && price != null) 'price': (price as int),
      if (restaurant != _undefined && restaurant != null)
        'restaurant': (restaurant as String),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createMealInput<TRes>
    implements CopyWith$Input$createMealInput<TRes> {
  _CopyWithStubImpl$Input$createMealInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? clientMutationId,
  }) => _res;
}

class Input$updateMealInput {
  factory Input$updateMealInput({
    required String id,
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? clientMutationId,
  }) => Input$updateMealInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
    if (price != null) r'price': price,
    if (restaurant != null) r'restaurant': restaurant,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateMealInput._(this._$data);

  factory Input$updateMealInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as num?)?.toDouble();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as num?)?.toDouble();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as num?)?.toDouble();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as num?)?.toDouble();
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as int?);
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateMealInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  double? get calories => (_$data['calories'] as double?);

  double? get protein => (_$data['protein'] as double?);

  double? get fat => (_$data['fat'] as double?);

  double? get carbs => (_$data['carbs'] as double?);

  int? get price => (_$data['price'] as int?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories;
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein;
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat;
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateMealInput<Input$updateMealInput> get copyWith =>
      CopyWith$Input$updateMealInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateMealInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != lOther$price) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$price = price;
    final l$restaurant = restaurant;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('calories') ? l$calories : const {},
      _$data.containsKey('protein') ? l$protein : const {},
      _$data.containsKey('fat') ? l$fat : const {},
      _$data.containsKey('carbs') ? l$carbs : const {},
      _$data.containsKey('price') ? l$price : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateMealInput<TRes> {
  factory CopyWith$Input$updateMealInput(
    Input$updateMealInput instance,
    TRes Function(Input$updateMealInput) then,
  ) = _CopyWithImpl$Input$updateMealInput;

  factory CopyWith$Input$updateMealInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateMealInput;

  TRes call({
    String? id,
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateMealInput<TRes>
    implements CopyWith$Input$updateMealInput<TRes> {
  _CopyWithImpl$Input$updateMealInput(this._instance, this._then);

  final Input$updateMealInput _instance;

  final TRes Function(Input$updateMealInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? price = _undefined,
    Object? restaurant = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateMealInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (calories != _undefined) 'calories': (calories as double?),
      if (protein != _undefined) 'protein': (protein as double?),
      if (fat != _undefined) 'fat': (fat as double?),
      if (carbs != _undefined) 'carbs': (carbs as double?),
      if (price != _undefined) 'price': (price as int?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateMealInput<TRes>
    implements CopyWith$Input$updateMealInput<TRes> {
  _CopyWithStubImpl$Input$updateMealInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteMealInput {
  factory Input$deleteMealInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteMealInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteMealInput._(this._$data);

  factory Input$deleteMealInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteMealInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteMealInput<Input$deleteMealInput> get copyWith =>
      CopyWith$Input$deleteMealInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteMealInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteMealInput<TRes> {
  factory CopyWith$Input$deleteMealInput(
    Input$deleteMealInput instance,
    TRes Function(Input$deleteMealInput) then,
  ) = _CopyWithImpl$Input$deleteMealInput;

  factory CopyWith$Input$deleteMealInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteMealInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteMealInput<TRes>
    implements CopyWith$Input$deleteMealInput<TRes> {
  _CopyWithImpl$Input$deleteMealInput(this._instance, this._then);

  final Input$deleteMealInput _instance;

  final TRes Function(Input$deleteMealInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteMealInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteMealInput<TRes>
    implements CopyWith$Input$deleteMealInput<TRes> {
  _CopyWithStubImpl$Input$deleteMealInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createMealPlanInput {
  factory Input$createMealPlanInput({
    List<String?>? meals,
    List<String?>? categories,
    required String name,
    String? description,
    String? restaurant,
    String? clientMutationId,
  }) => Input$createMealPlanInput._({
    if (meals != null) r'meals': meals,
    if (categories != null) r'categories': categories,
    r'name': name,
    if (description != null) r'description': description,
    if (restaurant != null) r'restaurant': restaurant,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createMealPlanInput._(this._$data);

  factory Input$createMealPlanInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('meals')) {
      final l$meals = data['meals'];
      result$data['meals'] = (l$meals as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('categories')) {
      final l$categories = data['categories'];
      result$data['categories'] = (l$categories as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createMealPlanInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String?>? get meals => (_$data['meals'] as List<String?>?);

  List<String?>? get categories => (_$data['categories'] as List<String?>?);

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('meals')) {
      final l$meals = meals;
      result$data['meals'] = l$meals?.map((e) => e).toList();
    }
    if (_$data.containsKey('categories')) {
      final l$categories = categories;
      result$data['categories'] = l$categories?.map((e) => e).toList();
    }
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createMealPlanInput<Input$createMealPlanInput> get copyWith =>
      CopyWith$Input$createMealPlanInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createMealPlanInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$meals = meals;
    final lOther$meals = other.meals;
    if (_$data.containsKey('meals') != other._$data.containsKey('meals')) {
      return false;
    }
    if (l$meals != null && lOther$meals != null) {
      if (l$meals.length != lOther$meals.length) {
        return false;
      }
      for (int i = 0; i < l$meals.length; i++) {
        final l$meals$entry = l$meals[i];
        final lOther$meals$entry = lOther$meals[i];
        if (l$meals$entry != lOther$meals$entry) {
          return false;
        }
      }
    } else if (l$meals != lOther$meals) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (_$data.containsKey('categories') !=
        other._$data.containsKey('categories')) {
      return false;
    }
    if (l$categories != null && lOther$categories != null) {
      if (l$categories.length != lOther$categories.length) {
        return false;
      }
      for (int i = 0; i < l$categories.length; i++) {
        final l$categories$entry = l$categories[i];
        final lOther$categories$entry = lOther$categories[i];
        if (l$categories$entry != lOther$categories$entry) {
          return false;
        }
      }
    } else if (l$categories != lOther$categories) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$meals = meals;
    final l$categories = categories;
    final l$name = name;
    final l$description = description;
    final l$restaurant = restaurant;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('meals')
          ? l$meals == null
                ? null
                : Object.hashAll(l$meals.map((v) => v))
          : const {},
      _$data.containsKey('categories')
          ? l$categories == null
                ? null
                : Object.hashAll(l$categories.map((v) => v))
          : const {},
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createMealPlanInput<TRes> {
  factory CopyWith$Input$createMealPlanInput(
    Input$createMealPlanInput instance,
    TRes Function(Input$createMealPlanInput) then,
  ) = _CopyWithImpl$Input$createMealPlanInput;

  factory CopyWith$Input$createMealPlanInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createMealPlanInput;

  TRes call({
    List<String?>? meals,
    List<String?>? categories,
    String? name,
    String? description,
    String? restaurant,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createMealPlanInput<TRes>
    implements CopyWith$Input$createMealPlanInput<TRes> {
  _CopyWithImpl$Input$createMealPlanInput(this._instance, this._then);

  final Input$createMealPlanInput _instance;

  final TRes Function(Input$createMealPlanInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? meals = _undefined,
    Object? categories = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? restaurant = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createMealPlanInput._({
      ..._instance._$data,
      if (meals != _undefined) 'meals': (meals as List<String?>?),
      if (categories != _undefined)
        'categories': (categories as List<String?>?),
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createMealPlanInput<TRes>
    implements CopyWith$Input$createMealPlanInput<TRes> {
  _CopyWithStubImpl$Input$createMealPlanInput(this._res);

  TRes _res;

  call({
    List<String?>? meals,
    List<String?>? categories,
    String? name,
    String? description,
    String? restaurant,
    String? clientMutationId,
  }) => _res;
}

class Input$updateMealPlanInput {
  factory Input$updateMealPlanInput({
    required String id,
    List<String?>? meals,
    List<String?>? categories,
    String? name,
    String? description,
    String? restaurant,
    String? clientMutationId,
  }) => Input$updateMealPlanInput._({
    r'id': id,
    if (meals != null) r'meals': meals,
    if (categories != null) r'categories': categories,
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (restaurant != null) r'restaurant': restaurant,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateMealPlanInput._(this._$data);

  factory Input$updateMealPlanInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('meals')) {
      final l$meals = data['meals'];
      result$data['meals'] = (l$meals as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('categories')) {
      final l$categories = data['categories'];
      result$data['categories'] = (l$categories as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateMealPlanInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  List<String?>? get meals => (_$data['meals'] as List<String?>?);

  List<String?>? get categories => (_$data['categories'] as List<String?>?);

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('meals')) {
      final l$meals = meals;
      result$data['meals'] = l$meals?.map((e) => e).toList();
    }
    if (_$data.containsKey('categories')) {
      final l$categories = categories;
      result$data['categories'] = l$categories?.map((e) => e).toList();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateMealPlanInput<Input$updateMealPlanInput> get copyWith =>
      CopyWith$Input$updateMealPlanInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateMealPlanInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$meals = meals;
    final lOther$meals = other.meals;
    if (_$data.containsKey('meals') != other._$data.containsKey('meals')) {
      return false;
    }
    if (l$meals != null && lOther$meals != null) {
      if (l$meals.length != lOther$meals.length) {
        return false;
      }
      for (int i = 0; i < l$meals.length; i++) {
        final l$meals$entry = l$meals[i];
        final lOther$meals$entry = lOther$meals[i];
        if (l$meals$entry != lOther$meals$entry) {
          return false;
        }
      }
    } else if (l$meals != lOther$meals) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (_$data.containsKey('categories') !=
        other._$data.containsKey('categories')) {
      return false;
    }
    if (l$categories != null && lOther$categories != null) {
      if (l$categories.length != lOther$categories.length) {
        return false;
      }
      for (int i = 0; i < l$categories.length; i++) {
        final l$categories$entry = l$categories[i];
        final lOther$categories$entry = lOther$categories[i];
        if (l$categories$entry != lOther$categories$entry) {
          return false;
        }
      }
    } else if (l$categories != lOther$categories) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$meals = meals;
    final l$categories = categories;
    final l$name = name;
    final l$description = description;
    final l$restaurant = restaurant;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('meals')
          ? l$meals == null
                ? null
                : Object.hashAll(l$meals.map((v) => v))
          : const {},
      _$data.containsKey('categories')
          ? l$categories == null
                ? null
                : Object.hashAll(l$categories.map((v) => v))
          : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateMealPlanInput<TRes> {
  factory CopyWith$Input$updateMealPlanInput(
    Input$updateMealPlanInput instance,
    TRes Function(Input$updateMealPlanInput) then,
  ) = _CopyWithImpl$Input$updateMealPlanInput;

  factory CopyWith$Input$updateMealPlanInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateMealPlanInput;

  TRes call({
    String? id,
    List<String?>? meals,
    List<String?>? categories,
    String? name,
    String? description,
    String? restaurant,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateMealPlanInput<TRes>
    implements CopyWith$Input$updateMealPlanInput<TRes> {
  _CopyWithImpl$Input$updateMealPlanInput(this._instance, this._then);

  final Input$updateMealPlanInput _instance;

  final TRes Function(Input$updateMealPlanInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? meals = _undefined,
    Object? categories = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? restaurant = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateMealPlanInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (meals != _undefined) 'meals': (meals as List<String?>?),
      if (categories != _undefined)
        'categories': (categories as List<String?>?),
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateMealPlanInput<TRes>
    implements CopyWith$Input$updateMealPlanInput<TRes> {
  _CopyWithStubImpl$Input$updateMealPlanInput(this._res);

  TRes _res;

  call({
    String? id,
    List<String?>? meals,
    List<String?>? categories,
    String? name,
    String? description,
    String? restaurant,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteMealPlanInput {
  factory Input$deleteMealPlanInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteMealPlanInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteMealPlanInput._(this._$data);

  factory Input$deleteMealPlanInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteMealPlanInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteMealPlanInput<Input$deleteMealPlanInput> get copyWith =>
      CopyWith$Input$deleteMealPlanInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteMealPlanInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteMealPlanInput<TRes> {
  factory CopyWith$Input$deleteMealPlanInput(
    Input$deleteMealPlanInput instance,
    TRes Function(Input$deleteMealPlanInput) then,
  ) = _CopyWithImpl$Input$deleteMealPlanInput;

  factory CopyWith$Input$deleteMealPlanInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteMealPlanInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteMealPlanInput<TRes>
    implements CopyWith$Input$deleteMealPlanInput<TRes> {
  _CopyWithImpl$Input$deleteMealPlanInput(this._instance, this._then);

  final Input$deleteMealPlanInput _instance;

  final TRes Function(Input$deleteMealPlanInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteMealPlanInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteMealPlanInput<TRes>
    implements CopyWith$Input$deleteMealPlanInput<TRes> {
  _CopyWithStubImpl$Input$deleteMealPlanInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createOrderInput {
  factory Input$createOrderInput({
    String? customer,
    required Enum$OrderStatus status,
    List<Input$OrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$DeliveryNestedInput?>? deliveries,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? clientMutationId,
  }) => Input$createOrderInput._({
    if (customer != null) r'customer': customer,
    r'status': status,
    if (orderItems != null) r'orderItems': orderItems,
    if (restaurant != null) r'restaurant': restaurant,
    if (deliveries != null) r'deliveries': deliveries,
    if (deliveryFirstName != null) r'deliveryFirstName': deliveryFirstName,
    if (deliveryLastName != null) r'deliveryLastName': deliveryLastName,
    if (deliveryPhoneNumber != null)
      r'deliveryPhoneNumber': deliveryPhoneNumber,
    if (deliveryStreet != null) r'deliveryStreet': deliveryStreet,
    if (deliveryApartment != null) r'deliveryApartment': deliveryApartment,
    if (deliveryCity != null) r'deliveryCity': deliveryCity,
    if (deliveryZipCode != null) r'deliveryZipCode': deliveryZipCode,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createOrderInput._(this._$data);

  factory Input$createOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer')) {
      final l$customer = data['customer'];
      result$data['customer'] = (l$customer as String?);
    }
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$OrderStatus((l$status as String));
    if (data.containsKey('orderItems')) {
      final l$orderItems = data['orderItems'];
      result$data['orderItems'] = (l$orderItems as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$OrderItemNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('deliveries')) {
      final l$deliveries = data['deliveries'];
      result$data['deliveries'] = (l$deliveries as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$DeliveryNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = data['deliveryFirstName'];
      result$data['deliveryFirstName'] = (l$deliveryFirstName as String?);
    }
    if (data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = data['deliveryLastName'];
      result$data['deliveryLastName'] = (l$deliveryLastName as String?);
    }
    if (data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = data['deliveryPhoneNumber'];
      result$data['deliveryPhoneNumber'] = (l$deliveryPhoneNumber as String?);
    }
    if (data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = data['deliveryStreet'];
      result$data['deliveryStreet'] = (l$deliveryStreet as String?);
    }
    if (data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = data['deliveryApartment'];
      result$data['deliveryApartment'] = (l$deliveryApartment as String?);
    }
    if (data.containsKey('deliveryCity')) {
      final l$deliveryCity = data['deliveryCity'];
      result$data['deliveryCity'] = (l$deliveryCity as String?);
    }
    if (data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = data['deliveryZipCode'];
      result$data['deliveryZipCode'] = (l$deliveryZipCode as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get customer => (_$data['customer'] as String?);

  Enum$OrderStatus get status => (_$data['status'] as Enum$OrderStatus);

  List<Input$OrderItemNestedInput?>? get orderItems =>
      (_$data['orderItems'] as List<Input$OrderItemNestedInput?>?);

  String? get restaurant => (_$data['restaurant'] as String?);

  List<Input$DeliveryNestedInput?>? get deliveries =>
      (_$data['deliveries'] as List<Input$DeliveryNestedInput?>?);

  String? get deliveryFirstName => (_$data['deliveryFirstName'] as String?);

  String? get deliveryLastName => (_$data['deliveryLastName'] as String?);

  String? get deliveryPhoneNumber => (_$data['deliveryPhoneNumber'] as String?);

  String? get deliveryStreet => (_$data['deliveryStreet'] as String?);

  String? get deliveryApartment => (_$data['deliveryApartment'] as String?);

  String? get deliveryCity => (_$data['deliveryCity'] as String?);

  String? get deliveryZipCode => (_$data['deliveryZipCode'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer')) {
      final l$customer = customer;
      result$data['customer'] = l$customer;
    }
    final l$status = status;
    result$data['status'] = toJson$Enum$OrderStatus(l$status);
    if (_$data.containsKey('orderItems')) {
      final l$orderItems = orderItems;
      result$data['orderItems'] = l$orderItems
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('deliveries')) {
      final l$deliveries = deliveries;
      result$data['deliveries'] = l$deliveries
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = deliveryFirstName;
      result$data['deliveryFirstName'] = l$deliveryFirstName;
    }
    if (_$data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = deliveryLastName;
      result$data['deliveryLastName'] = l$deliveryLastName;
    }
    if (_$data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = deliveryPhoneNumber;
      result$data['deliveryPhoneNumber'] = l$deliveryPhoneNumber;
    }
    if (_$data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = deliveryStreet;
      result$data['deliveryStreet'] = l$deliveryStreet;
    }
    if (_$data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = deliveryApartment;
      result$data['deliveryApartment'] = l$deliveryApartment;
    }
    if (_$data.containsKey('deliveryCity')) {
      final l$deliveryCity = deliveryCity;
      result$data['deliveryCity'] = l$deliveryCity;
    }
    if (_$data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = deliveryZipCode;
      result$data['deliveryZipCode'] = l$deliveryZipCode;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createOrderInput<Input$createOrderInput> get copyWith =>
      CopyWith$Input$createOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (_$data.containsKey('customer') !=
        other._$data.containsKey('customer')) {
      return false;
    }
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (_$data.containsKey('orderItems') !=
        other._$data.containsKey('orderItems')) {
      return false;
    }
    if (l$orderItems != null && lOther$orderItems != null) {
      if (l$orderItems.length != lOther$orderItems.length) {
        return false;
      }
      for (int i = 0; i < l$orderItems.length; i++) {
        final l$orderItems$entry = l$orderItems[i];
        final lOther$orderItems$entry = lOther$orderItems[i];
        if (l$orderItems$entry != lOther$orderItems$entry) {
          return false;
        }
      }
    } else if (l$orderItems != lOther$orderItems) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (_$data.containsKey('deliveries') !=
        other._$data.containsKey('deliveries')) {
      return false;
    }
    if (l$deliveries != null && lOther$deliveries != null) {
      if (l$deliveries.length != lOther$deliveries.length) {
        return false;
      }
      for (int i = 0; i < l$deliveries.length; i++) {
        final l$deliveries$entry = l$deliveries[i];
        final lOther$deliveries$entry = lOther$deliveries[i];
        if (l$deliveries$entry != lOther$deliveries$entry) {
          return false;
        }
      }
    } else if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$deliveryFirstName = deliveryFirstName;
    final lOther$deliveryFirstName = other.deliveryFirstName;
    if (_$data.containsKey('deliveryFirstName') !=
        other._$data.containsKey('deliveryFirstName')) {
      return false;
    }
    if (l$deliveryFirstName != lOther$deliveryFirstName) {
      return false;
    }
    final l$deliveryLastName = deliveryLastName;
    final lOther$deliveryLastName = other.deliveryLastName;
    if (_$data.containsKey('deliveryLastName') !=
        other._$data.containsKey('deliveryLastName')) {
      return false;
    }
    if (l$deliveryLastName != lOther$deliveryLastName) {
      return false;
    }
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final lOther$deliveryPhoneNumber = other.deliveryPhoneNumber;
    if (_$data.containsKey('deliveryPhoneNumber') !=
        other._$data.containsKey('deliveryPhoneNumber')) {
      return false;
    }
    if (l$deliveryPhoneNumber != lOther$deliveryPhoneNumber) {
      return false;
    }
    final l$deliveryStreet = deliveryStreet;
    final lOther$deliveryStreet = other.deliveryStreet;
    if (_$data.containsKey('deliveryStreet') !=
        other._$data.containsKey('deliveryStreet')) {
      return false;
    }
    if (l$deliveryStreet != lOther$deliveryStreet) {
      return false;
    }
    final l$deliveryApartment = deliveryApartment;
    final lOther$deliveryApartment = other.deliveryApartment;
    if (_$data.containsKey('deliveryApartment') !=
        other._$data.containsKey('deliveryApartment')) {
      return false;
    }
    if (l$deliveryApartment != lOther$deliveryApartment) {
      return false;
    }
    final l$deliveryCity = deliveryCity;
    final lOther$deliveryCity = other.deliveryCity;
    if (_$data.containsKey('deliveryCity') !=
        other._$data.containsKey('deliveryCity')) {
      return false;
    }
    if (l$deliveryCity != lOther$deliveryCity) {
      return false;
    }
    final l$deliveryZipCode = deliveryZipCode;
    final lOther$deliveryZipCode = other.deliveryZipCode;
    if (_$data.containsKey('deliveryZipCode') !=
        other._$data.containsKey('deliveryZipCode')) {
      return false;
    }
    if (l$deliveryZipCode != lOther$deliveryZipCode) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer = customer;
    final l$status = status;
    final l$orderItems = orderItems;
    final l$restaurant = restaurant;
    final l$deliveries = deliveries;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('customer') ? l$customer : const {},
      l$status,
      _$data.containsKey('orderItems')
          ? l$orderItems == null
                ? null
                : Object.hashAll(l$orderItems.map((v) => v))
          : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('deliveries')
          ? l$deliveries == null
                ? null
                : Object.hashAll(l$deliveries.map((v) => v))
          : const {},
      _$data.containsKey('deliveryFirstName') ? l$deliveryFirstName : const {},
      _$data.containsKey('deliveryLastName') ? l$deliveryLastName : const {},
      _$data.containsKey('deliveryPhoneNumber')
          ? l$deliveryPhoneNumber
          : const {},
      _$data.containsKey('deliveryStreet') ? l$deliveryStreet : const {},
      _$data.containsKey('deliveryApartment') ? l$deliveryApartment : const {},
      _$data.containsKey('deliveryCity') ? l$deliveryCity : const {},
      _$data.containsKey('deliveryZipCode') ? l$deliveryZipCode : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createOrderInput<TRes> {
  factory CopyWith$Input$createOrderInput(
    Input$createOrderInput instance,
    TRes Function(Input$createOrderInput) then,
  ) = _CopyWithImpl$Input$createOrderInput;

  factory CopyWith$Input$createOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createOrderInput;

  TRes call({
    String? customer,
    Enum$OrderStatus? status,
    List<Input$OrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$DeliveryNestedInput?>? deliveries,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? clientMutationId,
  });
  TRes orderItems(
    Iterable<Input$OrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$OrderItemNestedInput<Input$OrderItemNestedInput>?
      >?,
    )
    _fn,
  );
  TRes deliveries(
    Iterable<Input$DeliveryNestedInput?>? Function(
      Iterable<CopyWith$Input$DeliveryNestedInput<Input$DeliveryNestedInput>?>?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$createOrderInput<TRes>
    implements CopyWith$Input$createOrderInput<TRes> {
  _CopyWithImpl$Input$createOrderInput(this._instance, this._then);

  final Input$createOrderInput _instance;

  final TRes Function(Input$createOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customer = _undefined,
    Object? status = _undefined,
    Object? orderItems = _undefined,
    Object? restaurant = _undefined,
    Object? deliveries = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createOrderInput._({
      ..._instance._$data,
      if (customer != _undefined) 'customer': (customer as String?),
      if (status != _undefined && status != null)
        'status': (status as Enum$OrderStatus),
      if (orderItems != _undefined)
        'orderItems': (orderItems as List<Input$OrderItemNestedInput?>?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (deliveries != _undefined)
        'deliveries': (deliveries as List<Input$DeliveryNestedInput?>?),
      if (deliveryFirstName != _undefined)
        'deliveryFirstName': (deliveryFirstName as String?),
      if (deliveryLastName != _undefined)
        'deliveryLastName': (deliveryLastName as String?),
      if (deliveryPhoneNumber != _undefined)
        'deliveryPhoneNumber': (deliveryPhoneNumber as String?),
      if (deliveryStreet != _undefined)
        'deliveryStreet': (deliveryStreet as String?),
      if (deliveryApartment != _undefined)
        'deliveryApartment': (deliveryApartment as String?),
      if (deliveryCity != _undefined) 'deliveryCity': (deliveryCity as String?),
      if (deliveryZipCode != _undefined)
        'deliveryZipCode': (deliveryZipCode as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );

  TRes orderItems(
    Iterable<Input$OrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$OrderItemNestedInput<Input$OrderItemNestedInput>?
      >?,
    )
    _fn,
  ) => call(
    orderItems: _fn(
      _instance.orderItems?.map(
        (e) =>
            e == null ? null : CopyWith$Input$OrderItemNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes deliveries(
    Iterable<Input$DeliveryNestedInput?>? Function(
      Iterable<CopyWith$Input$DeliveryNestedInput<Input$DeliveryNestedInput>?>?,
    )
    _fn,
  ) => call(
    deliveries: _fn(
      _instance.deliveries?.map(
        (e) =>
            e == null ? null : CopyWith$Input$DeliveryNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$createOrderInput<TRes>
    implements CopyWith$Input$createOrderInput<TRes> {
  _CopyWithStubImpl$Input$createOrderInput(this._res);

  TRes _res;

  call({
    String? customer,
    Enum$OrderStatus? status,
    List<Input$OrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$DeliveryNestedInput?>? deliveries,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? clientMutationId,
  }) => _res;

  orderItems(_fn) => _res;

  deliveries(_fn) => _res;
}

class Input$OrderItemNestedInput {
  factory Input$OrderItemNestedInput({
    String? id,
    String? order,
    required String mealPlan,
    required int quantity,
  }) => Input$OrderItemNestedInput._({
    if (id != null) r'id': id,
    if (order != null) r'order': order,
    r'mealPlan': mealPlan,
    r'quantity': quantity,
  });

  Input$OrderItemNestedInput._(this._$data);

  factory Input$OrderItemNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    final l$mealPlan = data['mealPlan'];
    result$data['mealPlan'] = (l$mealPlan as String);
    final l$quantity = data['quantity'];
    result$data['quantity'] = (l$quantity as int);
    return Input$OrderItemNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get order => (_$data['order'] as String?);

  String get mealPlan => (_$data['mealPlan'] as String);

  int get quantity => (_$data['quantity'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    final l$mealPlan = mealPlan;
    result$data['mealPlan'] = l$mealPlan;
    final l$quantity = quantity;
    result$data['quantity'] = l$quantity;
    return result$data;
  }

  CopyWith$Input$OrderItemNestedInput<Input$OrderItemNestedInput>
  get copyWith => CopyWith$Input$OrderItemNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$OrderItemNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$mealPlan = mealPlan;
    final l$quantity = quantity;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('order') ? l$order : const {},
      l$mealPlan,
      l$quantity,
    ]);
  }
}

abstract class CopyWith$Input$OrderItemNestedInput<TRes> {
  factory CopyWith$Input$OrderItemNestedInput(
    Input$OrderItemNestedInput instance,
    TRes Function(Input$OrderItemNestedInput) then,
  ) = _CopyWithImpl$Input$OrderItemNestedInput;

  factory CopyWith$Input$OrderItemNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrderItemNestedInput;

  TRes call({String? id, String? order, String? mealPlan, int? quantity});
}

class _CopyWithImpl$Input$OrderItemNestedInput<TRes>
    implements CopyWith$Input$OrderItemNestedInput<TRes> {
  _CopyWithImpl$Input$OrderItemNestedInput(this._instance, this._then);

  final Input$OrderItemNestedInput _instance;

  final TRes Function(Input$OrderItemNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? mealPlan = _undefined,
    Object? quantity = _undefined,
  }) => _then(
    Input$OrderItemNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (order != _undefined) 'order': (order as String?),
      if (mealPlan != _undefined && mealPlan != null)
        'mealPlan': (mealPlan as String),
      if (quantity != _undefined && quantity != null)
        'quantity': (quantity as int),
    }),
  );
}

class _CopyWithStubImpl$Input$OrderItemNestedInput<TRes>
    implements CopyWith$Input$OrderItemNestedInput<TRes> {
  _CopyWithStubImpl$Input$OrderItemNestedInput(this._res);

  TRes _res;

  call({String? id, String? order, String? mealPlan, int? quantity}) => _res;
}

class Input$DeliveryNestedInput {
  factory Input$DeliveryNestedInput({
    String? id,
    String? driver,
    required Enum$DeliveryStatus status,
    required String deliveryDate,
  }) => Input$DeliveryNestedInput._({
    if (id != null) r'id': id,
    if (driver != null) r'driver': driver,
    r'status': status,
    r'deliveryDate': deliveryDate,
  });

  Input$DeliveryNestedInput._(this._$data);

  factory Input$DeliveryNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('driver')) {
      final l$driver = data['driver'];
      result$data['driver'] = (l$driver as String?);
    }
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$DeliveryStatus((l$status as String));
    final l$deliveryDate = data['deliveryDate'];
    result$data['deliveryDate'] = (l$deliveryDate as String);
    return Input$DeliveryNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get driver => (_$data['driver'] as String?);

  Enum$DeliveryStatus get status => (_$data['status'] as Enum$DeliveryStatus);

  String get deliveryDate => (_$data['deliveryDate'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('driver')) {
      final l$driver = driver;
      result$data['driver'] = l$driver;
    }
    final l$status = status;
    result$data['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    result$data['deliveryDate'] = l$deliveryDate;
    return result$data;
  }

  CopyWith$Input$DeliveryNestedInput<Input$DeliveryNestedInput> get copyWith =>
      CopyWith$Input$DeliveryNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DeliveryNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (_$data.containsKey('driver') != other._$data.containsKey('driver')) {
      return false;
    }
    if (l$driver != lOther$driver) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$driver = driver;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('driver') ? l$driver : const {},
      l$status,
      l$deliveryDate,
    ]);
  }
}

abstract class CopyWith$Input$DeliveryNestedInput<TRes> {
  factory CopyWith$Input$DeliveryNestedInput(
    Input$DeliveryNestedInput instance,
    TRes Function(Input$DeliveryNestedInput) then,
  ) = _CopyWithImpl$Input$DeliveryNestedInput;

  factory CopyWith$Input$DeliveryNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$DeliveryNestedInput;

  TRes call({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
  });
}

class _CopyWithImpl$Input$DeliveryNestedInput<TRes>
    implements CopyWith$Input$DeliveryNestedInput<TRes> {
  _CopyWithImpl$Input$DeliveryNestedInput(this._instance, this._then);

  final Input$DeliveryNestedInput _instance;

  final TRes Function(Input$DeliveryNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? driver = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
  }) => _then(
    Input$DeliveryNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (driver != _undefined) 'driver': (driver as String?),
      if (status != _undefined && status != null)
        'status': (status as Enum$DeliveryStatus),
      if (deliveryDate != _undefined && deliveryDate != null)
        'deliveryDate': (deliveryDate as String),
    }),
  );
}

class _CopyWithStubImpl$Input$DeliveryNestedInput<TRes>
    implements CopyWith$Input$DeliveryNestedInput<TRes> {
  _CopyWithStubImpl$Input$DeliveryNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
  }) => _res;
}

class Input$updateOrderInput {
  factory Input$updateOrderInput({
    required String id,
    String? customer,
    Enum$OrderStatus? status,
    List<Input$updateOrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$updateDeliveryNestedInput?>? deliveries,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? clientMutationId,
  }) => Input$updateOrderInput._({
    r'id': id,
    if (customer != null) r'customer': customer,
    if (status != null) r'status': status,
    if (orderItems != null) r'orderItems': orderItems,
    if (restaurant != null) r'restaurant': restaurant,
    if (deliveries != null) r'deliveries': deliveries,
    if (deliveryFirstName != null) r'deliveryFirstName': deliveryFirstName,
    if (deliveryLastName != null) r'deliveryLastName': deliveryLastName,
    if (deliveryPhoneNumber != null)
      r'deliveryPhoneNumber': deliveryPhoneNumber,
    if (deliveryStreet != null) r'deliveryStreet': deliveryStreet,
    if (deliveryApartment != null) r'deliveryApartment': deliveryApartment,
    if (deliveryCity != null) r'deliveryCity': deliveryCity,
    if (deliveryZipCode != null) r'deliveryZipCode': deliveryZipCode,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateOrderInput._(this._$data);

  factory Input$updateOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('customer')) {
      final l$customer = data['customer'];
      result$data['customer'] = (l$customer as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$OrderStatus((l$status as String));
    }
    if (data.containsKey('orderItems')) {
      final l$orderItems = data['orderItems'];
      result$data['orderItems'] = (l$orderItems as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$updateOrderItemNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('deliveries')) {
      final l$deliveries = data['deliveries'];
      result$data['deliveries'] = (l$deliveries as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$updateDeliveryNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = data['deliveryFirstName'];
      result$data['deliveryFirstName'] = (l$deliveryFirstName as String?);
    }
    if (data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = data['deliveryLastName'];
      result$data['deliveryLastName'] = (l$deliveryLastName as String?);
    }
    if (data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = data['deliveryPhoneNumber'];
      result$data['deliveryPhoneNumber'] = (l$deliveryPhoneNumber as String?);
    }
    if (data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = data['deliveryStreet'];
      result$data['deliveryStreet'] = (l$deliveryStreet as String?);
    }
    if (data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = data['deliveryApartment'];
      result$data['deliveryApartment'] = (l$deliveryApartment as String?);
    }
    if (data.containsKey('deliveryCity')) {
      final l$deliveryCity = data['deliveryCity'];
      result$data['deliveryCity'] = (l$deliveryCity as String?);
    }
    if (data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = data['deliveryZipCode'];
      result$data['deliveryZipCode'] = (l$deliveryZipCode as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get customer => (_$data['customer'] as String?);

  Enum$OrderStatus? get status => (_$data['status'] as Enum$OrderStatus?);

  List<Input$updateOrderItemNestedInput?>? get orderItems =>
      (_$data['orderItems'] as List<Input$updateOrderItemNestedInput?>?);

  String? get restaurant => (_$data['restaurant'] as String?);

  List<Input$updateDeliveryNestedInput?>? get deliveries =>
      (_$data['deliveries'] as List<Input$updateDeliveryNestedInput?>?);

  String? get deliveryFirstName => (_$data['deliveryFirstName'] as String?);

  String? get deliveryLastName => (_$data['deliveryLastName'] as String?);

  String? get deliveryPhoneNumber => (_$data['deliveryPhoneNumber'] as String?);

  String? get deliveryStreet => (_$data['deliveryStreet'] as String?);

  String? get deliveryApartment => (_$data['deliveryApartment'] as String?);

  String? get deliveryCity => (_$data['deliveryCity'] as String?);

  String? get deliveryZipCode => (_$data['deliveryZipCode'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('customer')) {
      final l$customer = customer;
      result$data['customer'] = l$customer;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$OrderStatus(l$status);
    }
    if (_$data.containsKey('orderItems')) {
      final l$orderItems = orderItems;
      result$data['orderItems'] = l$orderItems
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('deliveries')) {
      final l$deliveries = deliveries;
      result$data['deliveries'] = l$deliveries
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = deliveryFirstName;
      result$data['deliveryFirstName'] = l$deliveryFirstName;
    }
    if (_$data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = deliveryLastName;
      result$data['deliveryLastName'] = l$deliveryLastName;
    }
    if (_$data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = deliveryPhoneNumber;
      result$data['deliveryPhoneNumber'] = l$deliveryPhoneNumber;
    }
    if (_$data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = deliveryStreet;
      result$data['deliveryStreet'] = l$deliveryStreet;
    }
    if (_$data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = deliveryApartment;
      result$data['deliveryApartment'] = l$deliveryApartment;
    }
    if (_$data.containsKey('deliveryCity')) {
      final l$deliveryCity = deliveryCity;
      result$data['deliveryCity'] = l$deliveryCity;
    }
    if (_$data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = deliveryZipCode;
      result$data['deliveryZipCode'] = l$deliveryZipCode;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateOrderInput<Input$updateOrderInput> get copyWith =>
      CopyWith$Input$updateOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (_$data.containsKey('customer') !=
        other._$data.containsKey('customer')) {
      return false;
    }
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (_$data.containsKey('orderItems') !=
        other._$data.containsKey('orderItems')) {
      return false;
    }
    if (l$orderItems != null && lOther$orderItems != null) {
      if (l$orderItems.length != lOther$orderItems.length) {
        return false;
      }
      for (int i = 0; i < l$orderItems.length; i++) {
        final l$orderItems$entry = l$orderItems[i];
        final lOther$orderItems$entry = lOther$orderItems[i];
        if (l$orderItems$entry != lOther$orderItems$entry) {
          return false;
        }
      }
    } else if (l$orderItems != lOther$orderItems) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (_$data.containsKey('deliveries') !=
        other._$data.containsKey('deliveries')) {
      return false;
    }
    if (l$deliveries != null && lOther$deliveries != null) {
      if (l$deliveries.length != lOther$deliveries.length) {
        return false;
      }
      for (int i = 0; i < l$deliveries.length; i++) {
        final l$deliveries$entry = l$deliveries[i];
        final lOther$deliveries$entry = lOther$deliveries[i];
        if (l$deliveries$entry != lOther$deliveries$entry) {
          return false;
        }
      }
    } else if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$deliveryFirstName = deliveryFirstName;
    final lOther$deliveryFirstName = other.deliveryFirstName;
    if (_$data.containsKey('deliveryFirstName') !=
        other._$data.containsKey('deliveryFirstName')) {
      return false;
    }
    if (l$deliveryFirstName != lOther$deliveryFirstName) {
      return false;
    }
    final l$deliveryLastName = deliveryLastName;
    final lOther$deliveryLastName = other.deliveryLastName;
    if (_$data.containsKey('deliveryLastName') !=
        other._$data.containsKey('deliveryLastName')) {
      return false;
    }
    if (l$deliveryLastName != lOther$deliveryLastName) {
      return false;
    }
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final lOther$deliveryPhoneNumber = other.deliveryPhoneNumber;
    if (_$data.containsKey('deliveryPhoneNumber') !=
        other._$data.containsKey('deliveryPhoneNumber')) {
      return false;
    }
    if (l$deliveryPhoneNumber != lOther$deliveryPhoneNumber) {
      return false;
    }
    final l$deliveryStreet = deliveryStreet;
    final lOther$deliveryStreet = other.deliveryStreet;
    if (_$data.containsKey('deliveryStreet') !=
        other._$data.containsKey('deliveryStreet')) {
      return false;
    }
    if (l$deliveryStreet != lOther$deliveryStreet) {
      return false;
    }
    final l$deliveryApartment = deliveryApartment;
    final lOther$deliveryApartment = other.deliveryApartment;
    if (_$data.containsKey('deliveryApartment') !=
        other._$data.containsKey('deliveryApartment')) {
      return false;
    }
    if (l$deliveryApartment != lOther$deliveryApartment) {
      return false;
    }
    final l$deliveryCity = deliveryCity;
    final lOther$deliveryCity = other.deliveryCity;
    if (_$data.containsKey('deliveryCity') !=
        other._$data.containsKey('deliveryCity')) {
      return false;
    }
    if (l$deliveryCity != lOther$deliveryCity) {
      return false;
    }
    final l$deliveryZipCode = deliveryZipCode;
    final lOther$deliveryZipCode = other.deliveryZipCode;
    if (_$data.containsKey('deliveryZipCode') !=
        other._$data.containsKey('deliveryZipCode')) {
      return false;
    }
    if (l$deliveryZipCode != lOther$deliveryZipCode) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customer = customer;
    final l$status = status;
    final l$orderItems = orderItems;
    final l$restaurant = restaurant;
    final l$deliveries = deliveries;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('customer') ? l$customer : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('orderItems')
          ? l$orderItems == null
                ? null
                : Object.hashAll(l$orderItems.map((v) => v))
          : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('deliveries')
          ? l$deliveries == null
                ? null
                : Object.hashAll(l$deliveries.map((v) => v))
          : const {},
      _$data.containsKey('deliveryFirstName') ? l$deliveryFirstName : const {},
      _$data.containsKey('deliveryLastName') ? l$deliveryLastName : const {},
      _$data.containsKey('deliveryPhoneNumber')
          ? l$deliveryPhoneNumber
          : const {},
      _$data.containsKey('deliveryStreet') ? l$deliveryStreet : const {},
      _$data.containsKey('deliveryApartment') ? l$deliveryApartment : const {},
      _$data.containsKey('deliveryCity') ? l$deliveryCity : const {},
      _$data.containsKey('deliveryZipCode') ? l$deliveryZipCode : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateOrderInput<TRes> {
  factory CopyWith$Input$updateOrderInput(
    Input$updateOrderInput instance,
    TRes Function(Input$updateOrderInput) then,
  ) = _CopyWithImpl$Input$updateOrderInput;

  factory CopyWith$Input$updateOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateOrderInput;

  TRes call({
    String? id,
    String? customer,
    Enum$OrderStatus? status,
    List<Input$updateOrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$updateDeliveryNestedInput?>? deliveries,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? clientMutationId,
  });
  TRes orderItems(
    Iterable<Input$updateOrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateOrderItemNestedInput<
          Input$updateOrderItemNestedInput
        >?
      >?,
    )
    _fn,
  );
  TRes deliveries(
    Iterable<Input$updateDeliveryNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateDeliveryNestedInput<
          Input$updateDeliveryNestedInput
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$updateOrderInput<TRes>
    implements CopyWith$Input$updateOrderInput<TRes> {
  _CopyWithImpl$Input$updateOrderInput(this._instance, this._then);

  final Input$updateOrderInput _instance;

  final TRes Function(Input$updateOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customer = _undefined,
    Object? status = _undefined,
    Object? orderItems = _undefined,
    Object? restaurant = _undefined,
    Object? deliveries = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateOrderInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (customer != _undefined) 'customer': (customer as String?),
      if (status != _undefined) 'status': (status as Enum$OrderStatus?),
      if (orderItems != _undefined)
        'orderItems': (orderItems as List<Input$updateOrderItemNestedInput?>?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (deliveries != _undefined)
        'deliveries': (deliveries as List<Input$updateDeliveryNestedInput?>?),
      if (deliveryFirstName != _undefined)
        'deliveryFirstName': (deliveryFirstName as String?),
      if (deliveryLastName != _undefined)
        'deliveryLastName': (deliveryLastName as String?),
      if (deliveryPhoneNumber != _undefined)
        'deliveryPhoneNumber': (deliveryPhoneNumber as String?),
      if (deliveryStreet != _undefined)
        'deliveryStreet': (deliveryStreet as String?),
      if (deliveryApartment != _undefined)
        'deliveryApartment': (deliveryApartment as String?),
      if (deliveryCity != _undefined) 'deliveryCity': (deliveryCity as String?),
      if (deliveryZipCode != _undefined)
        'deliveryZipCode': (deliveryZipCode as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );

  TRes orderItems(
    Iterable<Input$updateOrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateOrderItemNestedInput<
          Input$updateOrderItemNestedInput
        >?
      >?,
    )
    _fn,
  ) => call(
    orderItems: _fn(
      _instance.orderItems?.map(
        (e) => e == null
            ? null
            : CopyWith$Input$updateOrderItemNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes deliveries(
    Iterable<Input$updateDeliveryNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateDeliveryNestedInput<
          Input$updateDeliveryNestedInput
        >?
      >?,
    )
    _fn,
  ) => call(
    deliveries: _fn(
      _instance.deliveries?.map(
        (e) => e == null
            ? null
            : CopyWith$Input$updateDeliveryNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$updateOrderInput<TRes>
    implements CopyWith$Input$updateOrderInput<TRes> {
  _CopyWithStubImpl$Input$updateOrderInput(this._res);

  TRes _res;

  call({
    String? id,
    String? customer,
    Enum$OrderStatus? status,
    List<Input$updateOrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$updateDeliveryNestedInput?>? deliveries,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? clientMutationId,
  }) => _res;

  orderItems(_fn) => _res;

  deliveries(_fn) => _res;
}

class Input$updateOrderItemNestedInput {
  factory Input$updateOrderItemNestedInput({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? clientMutationId,
  }) => Input$updateOrderItemNestedInput._({
    if (id != null) r'id': id,
    if (order != null) r'order': order,
    if (mealPlan != null) r'mealPlan': mealPlan,
    if (quantity != null) r'quantity': quantity,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateOrderItemNestedInput._(this._$data);

  factory Input$updateOrderItemNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('mealPlan')) {
      final l$mealPlan = data['mealPlan'];
      result$data['mealPlan'] = (l$mealPlan as String?);
    }
    if (data.containsKey('quantity')) {
      final l$quantity = data['quantity'];
      result$data['quantity'] = (l$quantity as int?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateOrderItemNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get mealPlan => (_$data['mealPlan'] as String?);

  int? get quantity => (_$data['quantity'] as int?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('mealPlan')) {
      final l$mealPlan = mealPlan;
      result$data['mealPlan'] = l$mealPlan;
    }
    if (_$data.containsKey('quantity')) {
      final l$quantity = quantity;
      result$data['quantity'] = l$quantity;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateOrderItemNestedInput<Input$updateOrderItemNestedInput>
  get copyWith => CopyWith$Input$updateOrderItemNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateOrderItemNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (_$data.containsKey('mealPlan') !=
        other._$data.containsKey('mealPlan')) {
      return false;
    }
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (_$data.containsKey('quantity') !=
        other._$data.containsKey('quantity')) {
      return false;
    }
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$mealPlan = mealPlan;
    final l$quantity = quantity;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('mealPlan') ? l$mealPlan : const {},
      _$data.containsKey('quantity') ? l$quantity : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateOrderItemNestedInput<TRes> {
  factory CopyWith$Input$updateOrderItemNestedInput(
    Input$updateOrderItemNestedInput instance,
    TRes Function(Input$updateOrderItemNestedInput) then,
  ) = _CopyWithImpl$Input$updateOrderItemNestedInput;

  factory CopyWith$Input$updateOrderItemNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateOrderItemNestedInput;

  TRes call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateOrderItemNestedInput<TRes>
    implements CopyWith$Input$updateOrderItemNestedInput<TRes> {
  _CopyWithImpl$Input$updateOrderItemNestedInput(this._instance, this._then);

  final Input$updateOrderItemNestedInput _instance;

  final TRes Function(Input$updateOrderItemNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? mealPlan = _undefined,
    Object? quantity = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateOrderItemNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (order != _undefined) 'order': (order as String?),
      if (mealPlan != _undefined) 'mealPlan': (mealPlan as String?),
      if (quantity != _undefined) 'quantity': (quantity as int?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateOrderItemNestedInput<TRes>
    implements CopyWith$Input$updateOrderItemNestedInput<TRes> {
  _CopyWithStubImpl$Input$updateOrderItemNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? clientMutationId,
  }) => _res;
}

class Input$updateDeliveryNestedInput {
  factory Input$updateDeliveryNestedInput({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? clientMutationId,
  }) => Input$updateDeliveryNestedInput._({
    if (id != null) r'id': id,
    if (driver != null) r'driver': driver,
    if (status != null) r'status': status,
    if (deliveryDate != null) r'deliveryDate': deliveryDate,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateDeliveryNestedInput._(this._$data);

  factory Input$updateDeliveryNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('driver')) {
      final l$driver = data['driver'];
      result$data['driver'] = (l$driver as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$DeliveryStatus((l$status as String));
    }
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateDeliveryNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get driver => (_$data['driver'] as String?);

  Enum$DeliveryStatus? get status => (_$data['status'] as Enum$DeliveryStatus?);

  String? get deliveryDate => (_$data['deliveryDate'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('driver')) {
      final l$driver = driver;
      result$data['driver'] = l$driver;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$DeliveryStatus(l$status);
    }
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateDeliveryNestedInput<Input$updateDeliveryNestedInput>
  get copyWith => CopyWith$Input$updateDeliveryNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateDeliveryNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (_$data.containsKey('driver') != other._$data.containsKey('driver')) {
      return false;
    }
    if (l$driver != lOther$driver) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$driver = driver;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('driver') ? l$driver : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('deliveryDate') ? l$deliveryDate : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateDeliveryNestedInput<TRes> {
  factory CopyWith$Input$updateDeliveryNestedInput(
    Input$updateDeliveryNestedInput instance,
    TRes Function(Input$updateDeliveryNestedInput) then,
  ) = _CopyWithImpl$Input$updateDeliveryNestedInput;

  factory CopyWith$Input$updateDeliveryNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateDeliveryNestedInput;

  TRes call({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateDeliveryNestedInput<TRes>
    implements CopyWith$Input$updateDeliveryNestedInput<TRes> {
  _CopyWithImpl$Input$updateDeliveryNestedInput(this._instance, this._then);

  final Input$updateDeliveryNestedInput _instance;

  final TRes Function(Input$updateDeliveryNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? driver = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateDeliveryNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (driver != _undefined) 'driver': (driver as String?),
      if (status != _undefined) 'status': (status as Enum$DeliveryStatus?),
      if (deliveryDate != _undefined) 'deliveryDate': (deliveryDate as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateDeliveryNestedInput<TRes>
    implements CopyWith$Input$updateDeliveryNestedInput<TRes> {
  _CopyWithStubImpl$Input$updateDeliveryNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? driver,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteOrderInput {
  factory Input$deleteOrderInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteOrderInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteOrderInput._(this._$data);

  factory Input$deleteOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteOrderInput<Input$deleteOrderInput> get copyWith =>
      CopyWith$Input$deleteOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteOrderInput<TRes> {
  factory CopyWith$Input$deleteOrderInput(
    Input$deleteOrderInput instance,
    TRes Function(Input$deleteOrderInput) then,
  ) = _CopyWithImpl$Input$deleteOrderInput;

  factory CopyWith$Input$deleteOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteOrderInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteOrderInput<TRes>
    implements CopyWith$Input$deleteOrderInput<TRes> {
  _CopyWithImpl$Input$deleteOrderInput(this._instance, this._then);

  final Input$deleteOrderInput _instance;

  final TRes Function(Input$deleteOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteOrderInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteOrderInput<TRes>
    implements CopyWith$Input$deleteOrderInput<TRes> {
  _CopyWithStubImpl$Input$deleteOrderInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$updateOrderItemInput {
  factory Input$updateOrderItemInput({
    required String id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? clientMutationId,
  }) => Input$updateOrderItemInput._({
    r'id': id,
    if (order != null) r'order': order,
    if (mealPlan != null) r'mealPlan': mealPlan,
    if (quantity != null) r'quantity': quantity,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateOrderItemInput._(this._$data);

  factory Input$updateOrderItemInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('mealPlan')) {
      final l$mealPlan = data['mealPlan'];
      result$data['mealPlan'] = (l$mealPlan as String?);
    }
    if (data.containsKey('quantity')) {
      final l$quantity = data['quantity'];
      result$data['quantity'] = (l$quantity as int?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateOrderItemInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get order => (_$data['order'] as String?);

  String? get mealPlan => (_$data['mealPlan'] as String?);

  int? get quantity => (_$data['quantity'] as int?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('mealPlan')) {
      final l$mealPlan = mealPlan;
      result$data['mealPlan'] = l$mealPlan;
    }
    if (_$data.containsKey('quantity')) {
      final l$quantity = quantity;
      result$data['quantity'] = l$quantity;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateOrderItemInput<Input$updateOrderItemInput>
  get copyWith => CopyWith$Input$updateOrderItemInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateOrderItemInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (_$data.containsKey('mealPlan') !=
        other._$data.containsKey('mealPlan')) {
      return false;
    }
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (_$data.containsKey('quantity') !=
        other._$data.containsKey('quantity')) {
      return false;
    }
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$mealPlan = mealPlan;
    final l$quantity = quantity;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('mealPlan') ? l$mealPlan : const {},
      _$data.containsKey('quantity') ? l$quantity : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateOrderItemInput<TRes> {
  factory CopyWith$Input$updateOrderItemInput(
    Input$updateOrderItemInput instance,
    TRes Function(Input$updateOrderItemInput) then,
  ) = _CopyWithImpl$Input$updateOrderItemInput;

  factory CopyWith$Input$updateOrderItemInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateOrderItemInput;

  TRes call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateOrderItemInput<TRes>
    implements CopyWith$Input$updateOrderItemInput<TRes> {
  _CopyWithImpl$Input$updateOrderItemInput(this._instance, this._then);

  final Input$updateOrderItemInput _instance;

  final TRes Function(Input$updateOrderItemInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? mealPlan = _undefined,
    Object? quantity = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateOrderItemInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (order != _undefined) 'order': (order as String?),
      if (mealPlan != _undefined) 'mealPlan': (mealPlan as String?),
      if (quantity != _undefined) 'quantity': (quantity as int?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateOrderItemInput<TRes>
    implements CopyWith$Input$updateOrderItemInput<TRes> {
  _CopyWithStubImpl$Input$updateOrderItemInput(this._res);

  TRes _res;

  call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteOrderItemInput {
  factory Input$deleteOrderItemInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteOrderItemInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteOrderItemInput._(this._$data);

  factory Input$deleteOrderItemInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteOrderItemInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteOrderItemInput<Input$deleteOrderItemInput>
  get copyWith => CopyWith$Input$deleteOrderItemInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteOrderItemInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteOrderItemInput<TRes> {
  factory CopyWith$Input$deleteOrderItemInput(
    Input$deleteOrderItemInput instance,
    TRes Function(Input$deleteOrderItemInput) then,
  ) = _CopyWithImpl$Input$deleteOrderItemInput;

  factory CopyWith$Input$deleteOrderItemInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteOrderItemInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteOrderItemInput<TRes>
    implements CopyWith$Input$deleteOrderItemInput<TRes> {
  _CopyWithImpl$Input$deleteOrderItemInput(this._instance, this._then);

  final Input$deleteOrderItemInput _instance;

  final TRes Function(Input$deleteOrderItemInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteOrderItemInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteOrderItemInput<TRes>
    implements CopyWith$Input$deleteOrderItemInput<TRes> {
  _CopyWithStubImpl$Input$deleteOrderItemInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createRestaurantInput {
  factory Input$createRestaurantInput({
    required String name,
    String? description,
    List<String?>? categories,
    String? clientMutationId,
  }) => Input$createRestaurantInput._({
    r'name': name,
    if (description != null) r'description': description,
    if (categories != null) r'categories': categories,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createRestaurantInput._(this._$data);

  factory Input$createRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('categories')) {
      final l$categories = data['categories'];
      result$data['categories'] = (l$categories as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  List<String?>? get categories => (_$data['categories'] as List<String?>?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('categories')) {
      final l$categories = categories;
      result$data['categories'] = l$categories?.map((e) => e).toList();
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createRestaurantInput<Input$createRestaurantInput>
  get copyWith => CopyWith$Input$createRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createRestaurantInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (_$data.containsKey('categories') !=
        other._$data.containsKey('categories')) {
      return false;
    }
    if (l$categories != null && lOther$categories != null) {
      if (l$categories.length != lOther$categories.length) {
        return false;
      }
      for (int i = 0; i < l$categories.length; i++) {
        final l$categories$entry = l$categories[i];
        final lOther$categories$entry = lOther$categories[i];
        if (l$categories$entry != lOther$categories$entry) {
          return false;
        }
      }
    } else if (l$categories != lOther$categories) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$categories = categories;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('categories')
          ? l$categories == null
                ? null
                : Object.hashAll(l$categories.map((v) => v))
          : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createRestaurantInput<TRes> {
  factory CopyWith$Input$createRestaurantInput(
    Input$createRestaurantInput instance,
    TRes Function(Input$createRestaurantInput) then,
  ) = _CopyWithImpl$Input$createRestaurantInput;

  factory CopyWith$Input$createRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createRestaurantInput;

  TRes call({
    String? name,
    String? description,
    List<String?>? categories,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createRestaurantInput<TRes>
    implements CopyWith$Input$createRestaurantInput<TRes> {
  _CopyWithImpl$Input$createRestaurantInput(this._instance, this._then);

  final Input$createRestaurantInput _instance;

  final TRes Function(Input$createRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? categories = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createRestaurantInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (categories != _undefined)
        'categories': (categories as List<String?>?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createRestaurantInput<TRes>
    implements CopyWith$Input$createRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$createRestaurantInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    List<String?>? categories,
    String? clientMutationId,
  }) => _res;
}

class Input$updateRestaurantInput {
  factory Input$updateRestaurantInput({
    required String id,
    String? name,
    String? description,
    List<String?>? categories,
    String? clientMutationId,
  }) => Input$updateRestaurantInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (categories != null) r'categories': categories,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateRestaurantInput._(this._$data);

  factory Input$updateRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('categories')) {
      final l$categories = data['categories'];
      result$data['categories'] = (l$categories as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  List<String?>? get categories => (_$data['categories'] as List<String?>?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('categories')) {
      final l$categories = categories;
      result$data['categories'] = l$categories?.map((e) => e).toList();
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateRestaurantInput<Input$updateRestaurantInput>
  get copyWith => CopyWith$Input$updateRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateRestaurantInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (_$data.containsKey('categories') !=
        other._$data.containsKey('categories')) {
      return false;
    }
    if (l$categories != null && lOther$categories != null) {
      if (l$categories.length != lOther$categories.length) {
        return false;
      }
      for (int i = 0; i < l$categories.length; i++) {
        final l$categories$entry = l$categories[i];
        final lOther$categories$entry = lOther$categories[i];
        if (l$categories$entry != lOther$categories$entry) {
          return false;
        }
      }
    } else if (l$categories != lOther$categories) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$categories = categories;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('categories')
          ? l$categories == null
                ? null
                : Object.hashAll(l$categories.map((v) => v))
          : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateRestaurantInput<TRes> {
  factory CopyWith$Input$updateRestaurantInput(
    Input$updateRestaurantInput instance,
    TRes Function(Input$updateRestaurantInput) then,
  ) = _CopyWithImpl$Input$updateRestaurantInput;

  factory CopyWith$Input$updateRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateRestaurantInput;

  TRes call({
    String? id,
    String? name,
    String? description,
    List<String?>? categories,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateRestaurantInput<TRes>
    implements CopyWith$Input$updateRestaurantInput<TRes> {
  _CopyWithImpl$Input$updateRestaurantInput(this._instance, this._then);

  final Input$updateRestaurantInput _instance;

  final TRes Function(Input$updateRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? categories = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateRestaurantInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (categories != _undefined)
        'categories': (categories as List<String?>?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateRestaurantInput<TRes>
    implements CopyWith$Input$updateRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$updateRestaurantInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    List<String?>? categories,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteRestaurantInput {
  factory Input$deleteRestaurantInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteRestaurantInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteRestaurantInput._(this._$data);

  factory Input$deleteRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteRestaurantInput<Input$deleteRestaurantInput>
  get copyWith => CopyWith$Input$deleteRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteRestaurantInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteRestaurantInput<TRes> {
  factory CopyWith$Input$deleteRestaurantInput(
    Input$deleteRestaurantInput instance,
    TRes Function(Input$deleteRestaurantInput) then,
  ) = _CopyWithImpl$Input$deleteRestaurantInput;

  factory CopyWith$Input$deleteRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteRestaurantInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteRestaurantInput<TRes>
    implements CopyWith$Input$deleteRestaurantInput<TRes> {
  _CopyWithImpl$Input$deleteRestaurantInput(this._instance, this._then);

  final Input$deleteRestaurantInput _instance;

  final TRes Function(Input$deleteRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteRestaurantInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteRestaurantInput<TRes>
    implements CopyWith$Input$deleteRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$deleteRestaurantInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createUserInput {
  factory Input$createUserInput({
    required String email,
    String? plainPassword,
    required List<dynamic> roles,
    String? restaurant,
    String? clientMutationId,
  }) => Input$createUserInput._({
    r'email': email,
    if (plainPassword != null) r'plainPassword': plainPassword,
    r'roles': roles,
    if (restaurant != null) r'restaurant': restaurant,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createUserInput._(this._$data);

  factory Input$createUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('plainPassword')) {
      final l$plainPassword = data['plainPassword'];
      result$data['plainPassword'] = (l$plainPassword as String?);
    }
    final l$roles = data['roles'];
    result$data['roles'] = (l$roles as List<dynamic>);
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String? get plainPassword => (_$data['plainPassword'] as String?);

  List<dynamic> get roles => (_$data['roles'] as List<dynamic>);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('plainPassword')) {
      final l$plainPassword = plainPassword;
      result$data['plainPassword'] = l$plainPassword;
    }
    final l$roles = roles;
    result$data['roles'] = l$roles;
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createUserInput<Input$createUserInput> get copyWith =>
      CopyWith$Input$createUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$plainPassword = plainPassword;
    final lOther$plainPassword = other.plainPassword;
    if (_$data.containsKey('plainPassword') !=
        other._$data.containsKey('plainPassword')) {
      return false;
    }
    if (l$plainPassword != lOther$plainPassword) {
      return false;
    }
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles != lOther$roles) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$plainPassword = plainPassword;
    final l$roles = roles;
    final l$restaurant = restaurant;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$email,
      _$data.containsKey('plainPassword') ? l$plainPassword : const {},
      l$roles,
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createUserInput<TRes> {
  factory CopyWith$Input$createUserInput(
    Input$createUserInput instance,
    TRes Function(Input$createUserInput) then,
  ) = _CopyWithImpl$Input$createUserInput;

  factory CopyWith$Input$createUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createUserInput;

  TRes call({
    String? email,
    String? plainPassword,
    List<dynamic>? roles,
    String? restaurant,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createUserInput<TRes>
    implements CopyWith$Input$createUserInput<TRes> {
  _CopyWithImpl$Input$createUserInput(this._instance, this._then);

  final Input$createUserInput _instance;

  final TRes Function(Input$createUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? plainPassword = _undefined,
    Object? roles = _undefined,
    Object? restaurant = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createUserInput._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
      if (plainPassword != _undefined)
        'plainPassword': (plainPassword as String?),
      if (roles != _undefined && roles != null)
        'roles': (roles as List<dynamic>),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createUserInput<TRes>
    implements CopyWith$Input$createUserInput<TRes> {
  _CopyWithStubImpl$Input$createUserInput(this._res);

  TRes _res;

  call({
    String? email,
    String? plainPassword,
    List<dynamic>? roles,
    String? restaurant,
    String? clientMutationId,
  }) => _res;
}

class Input$updateUserInput {
  factory Input$updateUserInput({
    required String id,
    String? email,
    String? plainPassword,
    List<dynamic>? roles,
    String? restaurant,
    String? clientMutationId,
  }) => Input$updateUserInput._({
    r'id': id,
    if (email != null) r'email': email,
    if (plainPassword != null) r'plainPassword': plainPassword,
    if (roles != null) r'roles': roles,
    if (restaurant != null) r'restaurant': restaurant,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateUserInput._(this._$data);

  factory Input$updateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('plainPassword')) {
      final l$plainPassword = data['plainPassword'];
      result$data['plainPassword'] = (l$plainPassword as String?);
    }
    if (data.containsKey('roles')) {
      final l$roles = data['roles'];
      result$data['roles'] = (l$roles as List<dynamic>?);
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get email => (_$data['email'] as String?);

  String? get plainPassword => (_$data['plainPassword'] as String?);

  List<dynamic>? get roles => (_$data['roles'] as List<dynamic>?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('plainPassword')) {
      final l$plainPassword = plainPassword;
      result$data['plainPassword'] = l$plainPassword;
    }
    if (_$data.containsKey('roles')) {
      final l$roles = roles;
      result$data['roles'] = l$roles;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateUserInput<Input$updateUserInput> get copyWith =>
      CopyWith$Input$updateUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$plainPassword = plainPassword;
    final lOther$plainPassword = other.plainPassword;
    if (_$data.containsKey('plainPassword') !=
        other._$data.containsKey('plainPassword')) {
      return false;
    }
    if (l$plainPassword != lOther$plainPassword) {
      return false;
    }
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (_$data.containsKey('roles') != other._$data.containsKey('roles')) {
      return false;
    }
    if (l$roles != lOther$roles) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$plainPassword = plainPassword;
    final l$roles = roles;
    final l$restaurant = restaurant;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('plainPassword') ? l$plainPassword : const {},
      _$data.containsKey('roles') ? l$roles : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateUserInput<TRes> {
  factory CopyWith$Input$updateUserInput(
    Input$updateUserInput instance,
    TRes Function(Input$updateUserInput) then,
  ) = _CopyWithImpl$Input$updateUserInput;

  factory CopyWith$Input$updateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateUserInput;

  TRes call({
    String? id,
    String? email,
    String? plainPassword,
    List<dynamic>? roles,
    String? restaurant,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateUserInput<TRes>
    implements CopyWith$Input$updateUserInput<TRes> {
  _CopyWithImpl$Input$updateUserInput(this._instance, this._then);

  final Input$updateUserInput _instance;

  final TRes Function(Input$updateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? plainPassword = _undefined,
    Object? roles = _undefined,
    Object? restaurant = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateUserInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (email != _undefined) 'email': (email as String?),
      if (plainPassword != _undefined)
        'plainPassword': (plainPassword as String?),
      if (roles != _undefined) 'roles': (roles as List<dynamic>?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateUserInput<TRes>
    implements CopyWith$Input$updateUserInput<TRes> {
  _CopyWithStubImpl$Input$updateUserInput(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? plainPassword,
    List<dynamic>? roles,
    String? restaurant,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteUserInput {
  factory Input$deleteUserInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteUserInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteUserInput._(this._$data);

  factory Input$deleteUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteUserInput<Input$deleteUserInput> get copyWith =>
      CopyWith$Input$deleteUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteUserInput<TRes> {
  factory CopyWith$Input$deleteUserInput(
    Input$deleteUserInput instance,
    TRes Function(Input$deleteUserInput) then,
  ) = _CopyWithImpl$Input$deleteUserInput;

  factory CopyWith$Input$deleteUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteUserInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteUserInput<TRes>
    implements CopyWith$Input$deleteUserInput<TRes> {
  _CopyWithImpl$Input$deleteUserInput(this._instance, this._then);

  final Input$deleteUserInput _instance;

  final TRes Function(Input$deleteUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteUserInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteUserInput<TRes>
    implements CopyWith$Input$deleteUserInput<TRes> {
  _CopyWithStubImpl$Input$deleteUserInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

enum Enum$OrderStatus {
  Unpaid,
  Paid,
  Active,
  Completed,
  Cancelled,
  $unknown;

  factory Enum$OrderStatus.fromJson(String value) =>
      fromJson$Enum$OrderStatus(value);

  String toJson() => toJson$Enum$OrderStatus(this);
}

String toJson$Enum$OrderStatus(Enum$OrderStatus e) {
  switch (e) {
    case Enum$OrderStatus.Unpaid:
      return r'Unpaid';
    case Enum$OrderStatus.Paid:
      return r'Paid';
    case Enum$OrderStatus.Active:
      return r'Active';
    case Enum$OrderStatus.Completed:
      return r'Completed';
    case Enum$OrderStatus.Cancelled:
      return r'Cancelled';
    case Enum$OrderStatus.$unknown:
      return r'$unknown';
  }
}

Enum$OrderStatus fromJson$Enum$OrderStatus(String value) {
  switch (value) {
    case r'Unpaid':
      return Enum$OrderStatus.Unpaid;
    case r'Paid':
      return Enum$OrderStatus.Paid;
    case r'Active':
      return Enum$OrderStatus.Active;
    case r'Completed':
      return Enum$OrderStatus.Completed;
    case r'Cancelled':
      return Enum$OrderStatus.Cancelled;
    default:
      return Enum$OrderStatus.$unknown;
  }
}

enum Enum$DeliveryStatus {
  Pending,
  Assigned,
  Picked_up,
  Delivered,
  $unknown;

  factory Enum$DeliveryStatus.fromJson(String value) =>
      fromJson$Enum$DeliveryStatus(value);

  String toJson() => toJson$Enum$DeliveryStatus(this);
}

String toJson$Enum$DeliveryStatus(Enum$DeliveryStatus e) {
  switch (e) {
    case Enum$DeliveryStatus.Pending:
      return r'Pending';
    case Enum$DeliveryStatus.Assigned:
      return r'Assigned';
    case Enum$DeliveryStatus.Picked_up:
      return r'Picked_up';
    case Enum$DeliveryStatus.Delivered:
      return r'Delivered';
    case Enum$DeliveryStatus.$unknown:
      return r'$unknown';
  }
}

Enum$DeliveryStatus fromJson$Enum$DeliveryStatus(String value) {
  switch (value) {
    case r'Pending':
      return Enum$DeliveryStatus.Pending;
    case r'Assigned':
      return Enum$DeliveryStatus.Assigned;
    case r'Picked_up':
      return Enum$DeliveryStatus.Picked_up;
    case r'Delivered':
      return Enum$DeliveryStatus.Delivered;
    default:
      return Enum$DeliveryStatus.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {
    'Address',
    'Category',
    'Restaurant',
    'User',
    'Order',
    'OrderItem',
    'MealPlan',
    'Meal',
    'Delivery',
    'Payment',
  },
};
