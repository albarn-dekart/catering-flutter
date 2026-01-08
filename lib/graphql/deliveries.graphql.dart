import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Fragment$BasicDeliveryFragment {
  Fragment$BasicDeliveryFragment({
    required this.id,
    required this.status,
    required this.deliveryDate,
    this.statusUpdatedAt,
    this.order,
    this.courier,
    this.$__typename = 'Delivery',
  });

  factory Fragment$BasicDeliveryFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$deliveryDate = json['deliveryDate'];
    final l$statusUpdatedAt = json['statusUpdatedAt'];
    final l$order = json['order'];
    final l$courier = json['courier'];
    final l$$__typename = json['__typename'];
    return Fragment$BasicDeliveryFragment(
      id: (l$id as String),
      status: fromJson$Enum$DeliveryStatus((l$status as String)),
      deliveryDate: (l$deliveryDate as String),
      statusUpdatedAt: (l$statusUpdatedAt as String?),
      order: l$order == null
          ? null
          : Fragment$BasicDeliveryFragment$order.fromJson(
              (l$order as Map<String, dynamic>),
            ),
      courier: l$courier == null
          ? null
          : Fragment$BasicDeliveryFragment$courier.fromJson(
              (l$courier as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$DeliveryStatus status;

  final String deliveryDate;

  final String? statusUpdatedAt;

  final Fragment$BasicDeliveryFragment$order? order;

  final Fragment$BasicDeliveryFragment$courier? courier;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    _resultData['deliveryDate'] = l$deliveryDate;
    final l$statusUpdatedAt = statusUpdatedAt;
    _resultData['statusUpdatedAt'] = l$statusUpdatedAt;
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$courier = courier;
    _resultData['courier'] = l$courier?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$statusUpdatedAt = statusUpdatedAt;
    final l$order = order;
    final l$courier = courier;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$deliveryDate,
      l$statusUpdatedAt,
      l$order,
      l$courier,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$BasicDeliveryFragment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$statusUpdatedAt = statusUpdatedAt;
    final lOther$statusUpdatedAt = other.statusUpdatedAt;
    if (l$statusUpdatedAt != lOther$statusUpdatedAt) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$courier = courier;
    final lOther$courier = other.courier;
    if (l$courier != lOther$courier) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$BasicDeliveryFragment
    on Fragment$BasicDeliveryFragment {
  CopyWith$Fragment$BasicDeliveryFragment<Fragment$BasicDeliveryFragment>
  get copyWith => CopyWith$Fragment$BasicDeliveryFragment(this, (i) => i);
}

abstract class CopyWith$Fragment$BasicDeliveryFragment<TRes> {
  factory CopyWith$Fragment$BasicDeliveryFragment(
    Fragment$BasicDeliveryFragment instance,
    TRes Function(Fragment$BasicDeliveryFragment) then,
  ) = _CopyWithImpl$Fragment$BasicDeliveryFragment;

  factory CopyWith$Fragment$BasicDeliveryFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$BasicDeliveryFragment;

  TRes call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? statusUpdatedAt,
    Fragment$BasicDeliveryFragment$order? order,
    Fragment$BasicDeliveryFragment$courier? courier,
    String? $__typename,
  });
  CopyWith$Fragment$BasicDeliveryFragment$order<TRes> get order;
  CopyWith$Fragment$BasicDeliveryFragment$courier<TRes> get courier;
}

class _CopyWithImpl$Fragment$BasicDeliveryFragment<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment<TRes> {
  _CopyWithImpl$Fragment$BasicDeliveryFragment(this._instance, this._then);

  final Fragment$BasicDeliveryFragment _instance;

  final TRes Function(Fragment$BasicDeliveryFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? statusUpdatedAt = _undefined,
    Object? order = _undefined,
    Object? courier = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$BasicDeliveryFragment(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$DeliveryStatus),
      deliveryDate: deliveryDate == _undefined || deliveryDate == null
          ? _instance.deliveryDate
          : (deliveryDate as String),
      statusUpdatedAt: statusUpdatedAt == _undefined
          ? _instance.statusUpdatedAt
          : (statusUpdatedAt as String?),
      order: order == _undefined
          ? _instance.order
          : (order as Fragment$BasicDeliveryFragment$order?),
      courier: courier == _undefined
          ? _instance.courier
          : (courier as Fragment$BasicDeliveryFragment$courier?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$BasicDeliveryFragment$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Fragment$BasicDeliveryFragment$order.stub(_then(_instance))
        : CopyWith$Fragment$BasicDeliveryFragment$order(
            local$order,
            (e) => call(order: e),
          );
  }

  CopyWith$Fragment$BasicDeliveryFragment$courier<TRes> get courier {
    final local$courier = _instance.courier;
    return local$courier == null
        ? CopyWith$Fragment$BasicDeliveryFragment$courier.stub(_then(_instance))
        : CopyWith$Fragment$BasicDeliveryFragment$courier(
            local$courier,
            (e) => call(courier: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$BasicDeliveryFragment<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment<TRes> {
  _CopyWithStubImpl$Fragment$BasicDeliveryFragment(this._res);

  TRes _res;

  call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? statusUpdatedAt,
    Fragment$BasicDeliveryFragment$order? order,
    Fragment$BasicDeliveryFragment$courier? courier,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$BasicDeliveryFragment$order<TRes> get order =>
      CopyWith$Fragment$BasicDeliveryFragment$order.stub(_res);

  CopyWith$Fragment$BasicDeliveryFragment$courier<TRes> get courier =>
      CopyWith$Fragment$BasicDeliveryFragment$courier.stub(_res);
}

const fragmentDefinitionBasicDeliveryFragment = FragmentDefinitionNode(
  name: NameNode(value: 'BasicDeliveryFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Delivery'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'deliveryDate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'statusUpdatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'order'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'total'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'customer'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(
                selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ],
              ),
            ),
            FieldNode(
              name: NameNode(value: 'deliveryFirstName'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryLastName'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryPhoneNumber'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryStreet'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryApartment'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryCity'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryZipCode'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: 'courier'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'email'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentBasicDeliveryFragment = DocumentNode(
  definitions: [fragmentDefinitionBasicDeliveryFragment],
);

extension ClientExtension$Fragment$BasicDeliveryFragment
    on graphql.GraphQLClient {
  void writeFragment$BasicDeliveryFragment({
    required Fragment$BasicDeliveryFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'BasicDeliveryFragment',
        document: documentNodeFragmentBasicDeliveryFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$BasicDeliveryFragment? readFragment$BasicDeliveryFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'BasicDeliveryFragment',
          document: documentNodeFragmentBasicDeliveryFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$BasicDeliveryFragment.fromJson(result);
  }
}

class Fragment$BasicDeliveryFragment$order {
  Fragment$BasicDeliveryFragment$order({
    required this.id,
    required this.total,
    required this.status,
    this.customer,
    this.deliveryFirstName,
    this.deliveryLastName,
    this.deliveryPhoneNumber,
    this.deliveryStreet,
    this.deliveryApartment,
    this.deliveryCity,
    this.deliveryZipCode,
    this.$__typename = 'Order',
  });

  factory Fragment$BasicDeliveryFragment$order.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$total = json['total'];
    final l$status = json['status'];
    final l$customer = json['customer'];
    final l$deliveryFirstName = json['deliveryFirstName'];
    final l$deliveryLastName = json['deliveryLastName'];
    final l$deliveryPhoneNumber = json['deliveryPhoneNumber'];
    final l$deliveryStreet = json['deliveryStreet'];
    final l$deliveryApartment = json['deliveryApartment'];
    final l$deliveryCity = json['deliveryCity'];
    final l$deliveryZipCode = json['deliveryZipCode'];
    final l$$__typename = json['__typename'];
    return Fragment$BasicDeliveryFragment$order(
      id: (l$id as String),
      total: (l$total as int),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      customer: l$customer == null
          ? null
          : Fragment$BasicDeliveryFragment$order$customer.fromJson(
              (l$customer as Map<String, dynamic>),
            ),
      deliveryFirstName: (l$deliveryFirstName as String?),
      deliveryLastName: (l$deliveryLastName as String?),
      deliveryPhoneNumber: (l$deliveryPhoneNumber as String?),
      deliveryStreet: (l$deliveryStreet as String?),
      deliveryApartment: (l$deliveryApartment as String?),
      deliveryCity: (l$deliveryCity as String?),
      deliveryZipCode: (l$deliveryZipCode as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int total;

  final Enum$OrderStatus status;

  final Fragment$BasicDeliveryFragment$order$customer? customer;

  final String? deliveryFirstName;

  final String? deliveryLastName;

  final String? deliveryPhoneNumber;

  final String? deliveryStreet;

  final String? deliveryApartment;

  final String? deliveryCity;

  final String? deliveryZipCode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$deliveryFirstName = deliveryFirstName;
    _resultData['deliveryFirstName'] = l$deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    _resultData['deliveryLastName'] = l$deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    _resultData['deliveryPhoneNumber'] = l$deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    _resultData['deliveryStreet'] = l$deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    _resultData['deliveryApartment'] = l$deliveryApartment;
    final l$deliveryCity = deliveryCity;
    _resultData['deliveryCity'] = l$deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    _resultData['deliveryZipCode'] = l$deliveryZipCode;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$total = total;
    final l$status = status;
    final l$customer = customer;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$total,
      l$status,
      l$customer,
      l$deliveryFirstName,
      l$deliveryLastName,
      l$deliveryPhoneNumber,
      l$deliveryStreet,
      l$deliveryApartment,
      l$deliveryCity,
      l$deliveryZipCode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$BasicDeliveryFragment$order ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$deliveryFirstName = deliveryFirstName;
    final lOther$deliveryFirstName = other.deliveryFirstName;
    if (l$deliveryFirstName != lOther$deliveryFirstName) {
      return false;
    }
    final l$deliveryLastName = deliveryLastName;
    final lOther$deliveryLastName = other.deliveryLastName;
    if (l$deliveryLastName != lOther$deliveryLastName) {
      return false;
    }
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final lOther$deliveryPhoneNumber = other.deliveryPhoneNumber;
    if (l$deliveryPhoneNumber != lOther$deliveryPhoneNumber) {
      return false;
    }
    final l$deliveryStreet = deliveryStreet;
    final lOther$deliveryStreet = other.deliveryStreet;
    if (l$deliveryStreet != lOther$deliveryStreet) {
      return false;
    }
    final l$deliveryApartment = deliveryApartment;
    final lOther$deliveryApartment = other.deliveryApartment;
    if (l$deliveryApartment != lOther$deliveryApartment) {
      return false;
    }
    final l$deliveryCity = deliveryCity;
    final lOther$deliveryCity = other.deliveryCity;
    if (l$deliveryCity != lOther$deliveryCity) {
      return false;
    }
    final l$deliveryZipCode = deliveryZipCode;
    final lOther$deliveryZipCode = other.deliveryZipCode;
    if (l$deliveryZipCode != lOther$deliveryZipCode) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$BasicDeliveryFragment$order
    on Fragment$BasicDeliveryFragment$order {
  CopyWith$Fragment$BasicDeliveryFragment$order<
    Fragment$BasicDeliveryFragment$order
  >
  get copyWith => CopyWith$Fragment$BasicDeliveryFragment$order(this, (i) => i);
}

abstract class CopyWith$Fragment$BasicDeliveryFragment$order<TRes> {
  factory CopyWith$Fragment$BasicDeliveryFragment$order(
    Fragment$BasicDeliveryFragment$order instance,
    TRes Function(Fragment$BasicDeliveryFragment$order) then,
  ) = _CopyWithImpl$Fragment$BasicDeliveryFragment$order;

  factory CopyWith$Fragment$BasicDeliveryFragment$order.stub(TRes res) =
      _CopyWithStubImpl$Fragment$BasicDeliveryFragment$order;

  TRes call({
    String? id,
    int? total,
    Enum$OrderStatus? status,
    Fragment$BasicDeliveryFragment$order$customer? customer,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? $__typename,
  });
  CopyWith$Fragment$BasicDeliveryFragment$order$customer<TRes> get customer;
}

class _CopyWithImpl$Fragment$BasicDeliveryFragment$order<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment$order<TRes> {
  _CopyWithImpl$Fragment$BasicDeliveryFragment$order(
    this._instance,
    this._then,
  );

  final Fragment$BasicDeliveryFragment$order _instance;

  final TRes Function(Fragment$BasicDeliveryFragment$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? total = _undefined,
    Object? status = _undefined,
    Object? customer = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$BasicDeliveryFragment$order(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      customer: customer == _undefined
          ? _instance.customer
          : (customer as Fragment$BasicDeliveryFragment$order$customer?),
      deliveryFirstName: deliveryFirstName == _undefined
          ? _instance.deliveryFirstName
          : (deliveryFirstName as String?),
      deliveryLastName: deliveryLastName == _undefined
          ? _instance.deliveryLastName
          : (deliveryLastName as String?),
      deliveryPhoneNumber: deliveryPhoneNumber == _undefined
          ? _instance.deliveryPhoneNumber
          : (deliveryPhoneNumber as String?),
      deliveryStreet: deliveryStreet == _undefined
          ? _instance.deliveryStreet
          : (deliveryStreet as String?),
      deliveryApartment: deliveryApartment == _undefined
          ? _instance.deliveryApartment
          : (deliveryApartment as String?),
      deliveryCity: deliveryCity == _undefined
          ? _instance.deliveryCity
          : (deliveryCity as String?),
      deliveryZipCode: deliveryZipCode == _undefined
          ? _instance.deliveryZipCode
          : (deliveryZipCode as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$BasicDeliveryFragment$order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Fragment$BasicDeliveryFragment$order$customer.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$BasicDeliveryFragment$order$customer(
            local$customer,
            (e) => call(customer: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$BasicDeliveryFragment$order<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment$order<TRes> {
  _CopyWithStubImpl$Fragment$BasicDeliveryFragment$order(this._res);

  TRes _res;

  call({
    String? id,
    int? total,
    Enum$OrderStatus? status,
    Fragment$BasicDeliveryFragment$order$customer? customer,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$BasicDeliveryFragment$order$customer<TRes> get customer =>
      CopyWith$Fragment$BasicDeliveryFragment$order$customer.stub(_res);
}

class Fragment$BasicDeliveryFragment$order$customer {
  Fragment$BasicDeliveryFragment$order$customer({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Fragment$BasicDeliveryFragment$order$customer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Fragment$BasicDeliveryFragment$order$customer(
      id: (l$id as String),
      email: (l$email as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$BasicDeliveryFragment$order$customer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$BasicDeliveryFragment$order$customer
    on Fragment$BasicDeliveryFragment$order$customer {
  CopyWith$Fragment$BasicDeliveryFragment$order$customer<
    Fragment$BasicDeliveryFragment$order$customer
  >
  get copyWith =>
      CopyWith$Fragment$BasicDeliveryFragment$order$customer(this, (i) => i);
}

abstract class CopyWith$Fragment$BasicDeliveryFragment$order$customer<TRes> {
  factory CopyWith$Fragment$BasicDeliveryFragment$order$customer(
    Fragment$BasicDeliveryFragment$order$customer instance,
    TRes Function(Fragment$BasicDeliveryFragment$order$customer) then,
  ) = _CopyWithImpl$Fragment$BasicDeliveryFragment$order$customer;

  factory CopyWith$Fragment$BasicDeliveryFragment$order$customer.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$BasicDeliveryFragment$order$customer;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Fragment$BasicDeliveryFragment$order$customer<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment$order$customer<TRes> {
  _CopyWithImpl$Fragment$BasicDeliveryFragment$order$customer(
    this._instance,
    this._then,
  );

  final Fragment$BasicDeliveryFragment$order$customer _instance;

  final TRes Function(Fragment$BasicDeliveryFragment$order$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$BasicDeliveryFragment$order$customer(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$BasicDeliveryFragment$order$customer<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment$order$customer<TRes> {
  _CopyWithStubImpl$Fragment$BasicDeliveryFragment$order$customer(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Fragment$BasicDeliveryFragment$courier {
  Fragment$BasicDeliveryFragment$courier({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Fragment$BasicDeliveryFragment$courier.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Fragment$BasicDeliveryFragment$courier(
      id: (l$id as String),
      email: (l$email as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$BasicDeliveryFragment$courier ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$BasicDeliveryFragment$courier
    on Fragment$BasicDeliveryFragment$courier {
  CopyWith$Fragment$BasicDeliveryFragment$courier<
    Fragment$BasicDeliveryFragment$courier
  >
  get copyWith =>
      CopyWith$Fragment$BasicDeliveryFragment$courier(this, (i) => i);
}

abstract class CopyWith$Fragment$BasicDeliveryFragment$courier<TRes> {
  factory CopyWith$Fragment$BasicDeliveryFragment$courier(
    Fragment$BasicDeliveryFragment$courier instance,
    TRes Function(Fragment$BasicDeliveryFragment$courier) then,
  ) = _CopyWithImpl$Fragment$BasicDeliveryFragment$courier;

  factory CopyWith$Fragment$BasicDeliveryFragment$courier.stub(TRes res) =
      _CopyWithStubImpl$Fragment$BasicDeliveryFragment$courier;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Fragment$BasicDeliveryFragment$courier<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment$courier<TRes> {
  _CopyWithImpl$Fragment$BasicDeliveryFragment$courier(
    this._instance,
    this._then,
  );

  final Fragment$BasicDeliveryFragment$courier _instance;

  final TRes Function(Fragment$BasicDeliveryFragment$courier) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$BasicDeliveryFragment$courier(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$BasicDeliveryFragment$courier<TRes>
    implements CopyWith$Fragment$BasicDeliveryFragment$courier<TRes> {
  _CopyWithStubImpl$Fragment$BasicDeliveryFragment$courier(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Fragment$CourierDeliveryFragment {
  Fragment$CourierDeliveryFragment({
    required this.id,
    required this.status,
    required this.deliveryDate,
    this.statusUpdatedAt,
    this.order,
    this.courier,
    this.$__typename = 'Delivery',
  });

  factory Fragment$CourierDeliveryFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$deliveryDate = json['deliveryDate'];
    final l$statusUpdatedAt = json['statusUpdatedAt'];
    final l$order = json['order'];
    final l$courier = json['courier'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment(
      id: (l$id as String),
      status: fromJson$Enum$DeliveryStatus((l$status as String)),
      deliveryDate: (l$deliveryDate as String),
      statusUpdatedAt: (l$statusUpdatedAt as String?),
      order: l$order == null
          ? null
          : Fragment$CourierDeliveryFragment$order.fromJson(
              (l$order as Map<String, dynamic>),
            ),
      courier: l$courier == null
          ? null
          : Fragment$CourierDeliveryFragment$courier.fromJson(
              (l$courier as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$DeliveryStatus status;

  final String deliveryDate;

  final String? statusUpdatedAt;

  final Fragment$CourierDeliveryFragment$order? order;

  final Fragment$CourierDeliveryFragment$courier? courier;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    _resultData['deliveryDate'] = l$deliveryDate;
    final l$statusUpdatedAt = statusUpdatedAt;
    _resultData['statusUpdatedAt'] = l$statusUpdatedAt;
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$courier = courier;
    _resultData['courier'] = l$courier?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$statusUpdatedAt = statusUpdatedAt;
    final l$order = order;
    final l$courier = courier;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$deliveryDate,
      l$statusUpdatedAt,
      l$order,
      l$courier,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$statusUpdatedAt = statusUpdatedAt;
    final lOther$statusUpdatedAt = other.statusUpdatedAt;
    if (l$statusUpdatedAt != lOther$statusUpdatedAt) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
      return false;
    }
    final l$courier = courier;
    final lOther$courier = other.courier;
    if (l$courier != lOther$courier) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment
    on Fragment$CourierDeliveryFragment {
  CopyWith$Fragment$CourierDeliveryFragment<Fragment$CourierDeliveryFragment>
  get copyWith => CopyWith$Fragment$CourierDeliveryFragment(this, (i) => i);
}

abstract class CopyWith$Fragment$CourierDeliveryFragment<TRes> {
  factory CopyWith$Fragment$CourierDeliveryFragment(
    Fragment$CourierDeliveryFragment instance,
    TRes Function(Fragment$CourierDeliveryFragment) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment;

  factory CopyWith$Fragment$CourierDeliveryFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CourierDeliveryFragment;

  TRes call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? statusUpdatedAt,
    Fragment$CourierDeliveryFragment$order? order,
    Fragment$CourierDeliveryFragment$courier? courier,
    String? $__typename,
  });
  CopyWith$Fragment$CourierDeliveryFragment$order<TRes> get order;
  CopyWith$Fragment$CourierDeliveryFragment$courier<TRes> get courier;
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment(this._instance, this._then);

  final Fragment$CourierDeliveryFragment _instance;

  final TRes Function(Fragment$CourierDeliveryFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? statusUpdatedAt = _undefined,
    Object? order = _undefined,
    Object? courier = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$DeliveryStatus),
      deliveryDate: deliveryDate == _undefined || deliveryDate == null
          ? _instance.deliveryDate
          : (deliveryDate as String),
      statusUpdatedAt: statusUpdatedAt == _undefined
          ? _instance.statusUpdatedAt
          : (statusUpdatedAt as String?),
      order: order == _undefined
          ? _instance.order
          : (order as Fragment$CourierDeliveryFragment$order?),
      courier: courier == _undefined
          ? _instance.courier
          : (courier as Fragment$CourierDeliveryFragment$courier?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order.stub(_then(_instance))
        : CopyWith$Fragment$CourierDeliveryFragment$order(
            local$order,
            (e) => call(order: e),
          );
  }

  CopyWith$Fragment$CourierDeliveryFragment$courier<TRes> get courier {
    final local$courier = _instance.courier;
    return local$courier == null
        ? CopyWith$Fragment$CourierDeliveryFragment$courier.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$courier(
            local$courier,
            (e) => call(courier: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment(this._res);

  TRes _res;

  call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? statusUpdatedAt,
    Fragment$CourierDeliveryFragment$order? order,
    Fragment$CourierDeliveryFragment$courier? courier,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$CourierDeliveryFragment$order<TRes> get order =>
      CopyWith$Fragment$CourierDeliveryFragment$order.stub(_res);

  CopyWith$Fragment$CourierDeliveryFragment$courier<TRes> get courier =>
      CopyWith$Fragment$CourierDeliveryFragment$courier.stub(_res);
}

const fragmentDefinitionCourierDeliveryFragment = FragmentDefinitionNode(
  name: NameNode(value: 'CourierDeliveryFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Delivery'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'deliveryDate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'statusUpdatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'order'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'restaurant'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(
                selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ],
              ),
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: 'order'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'total'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'status'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'customer'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(
                selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ],
              ),
            ),
            FieldNode(
              name: NameNode(value: 'deliveryFirstName'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryLastName'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryPhoneNumber'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryStreet'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryApartment'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryCity'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'deliveryZipCode'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'orderItems'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(
                selections: [
                  FieldNode(
                    name: NameNode(value: 'edges'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(
                      selections: [
                        FieldNode(
                          name: NameNode(value: 'node'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(
                            selections: [
                              FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'quantity'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'mealPlan'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(
                                  selections: [
                                    FieldNode(
                                      name: NameNode(value: 'id'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'name'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'calories'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'protein'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'fat'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'carbs'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                    FieldNode(
                                      name: NameNode(value: 'meals'),
                                      alias: null,
                                      arguments: [
                                        ArgumentNode(
                                          name: NameNode(value: 'first'),
                                          value: IntValueNode(value: '20'),
                                        ),
                                      ],
                                      directives: [],
                                      selectionSet: SelectionSetNode(
                                        selections: [
                                          FieldNode(
                                            name: NameNode(value: 'edges'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: SelectionSetNode(
                                              selections: [
                                                FieldNode(
                                                  name: NameNode(value: 'node'),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet:
                                                      SelectionSetNode(
                                                        selections: [
                                                          FieldNode(
                                                            name: NameNode(
                                                              value: 'id',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                          FieldNode(
                                                            name: NameNode(
                                                              value: 'name',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                          FieldNode(
                                                            name: NameNode(
                                                              value: 'calories',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                          FieldNode(
                                                            name: NameNode(
                                                              value: 'protein',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                          FieldNode(
                                                            name: NameNode(
                                                              value: 'fat',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                          FieldNode(
                                                            name: NameNode(
                                                              value: 'carbs',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                          FieldNode(
                                                            name: NameNode(
                                                              value:
                                                                  '__typename',
                                                            ),
                                                            alias: null,
                                                            arguments: [],
                                                            directives: [],
                                                            selectionSet: null,
                                                          ),
                                                        ],
                                                      ),
                                                ),
                                                FieldNode(
                                                  name: NameNode(
                                                    value: '__typename',
                                                  ),
                                                  alias: null,
                                                  arguments: [],
                                                  directives: [],
                                                  selectionSet: null,
                                                ),
                                              ],
                                            ),
                                          ),
                                          FieldNode(
                                            name: NameNode(value: '__typename'),
                                            alias: null,
                                            arguments: [],
                                            directives: [],
                                            selectionSet: null,
                                          ),
                                        ],
                                      ),
                                    ),
                                    FieldNode(
                                      name: NameNode(value: '__typename'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null,
                                    ),
                                  ],
                                ),
                              ),
                              FieldNode(
                                name: NameNode(value: '__typename'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                            ],
                          ),
                        ),
                        FieldNode(
                          name: NameNode(value: '__typename'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                      ],
                    ),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ],
              ),
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: 'courier'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FieldNode(
              name: NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: 'email'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentCourierDeliveryFragment = DocumentNode(
  definitions: [fragmentDefinitionCourierDeliveryFragment],
);

extension ClientExtension$Fragment$CourierDeliveryFragment
    on graphql.GraphQLClient {
  void writeFragment$CourierDeliveryFragment({
    required Fragment$CourierDeliveryFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'CourierDeliveryFragment',
        document: documentNodeFragmentCourierDeliveryFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$CourierDeliveryFragment? readFragment$CourierDeliveryFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'CourierDeliveryFragment',
          document: documentNodeFragmentCourierDeliveryFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$CourierDeliveryFragment.fromJson(result);
  }
}

class Fragment$CourierDeliveryFragment$order {
  Fragment$CourierDeliveryFragment$order({
    required this.id,
    this.restaurant,
    this.$__typename = 'Order',
    required this.total,
    required this.status,
    this.customer,
    this.deliveryFirstName,
    this.deliveryLastName,
    this.deliveryPhoneNumber,
    this.deliveryStreet,
    this.deliveryApartment,
    this.deliveryCity,
    this.deliveryZipCode,
    this.orderItems,
  });

  factory Fragment$CourierDeliveryFragment$order.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    final l$total = json['total'];
    final l$status = json['status'];
    final l$customer = json['customer'];
    final l$deliveryFirstName = json['deliveryFirstName'];
    final l$deliveryLastName = json['deliveryLastName'];
    final l$deliveryPhoneNumber = json['deliveryPhoneNumber'];
    final l$deliveryStreet = json['deliveryStreet'];
    final l$deliveryApartment = json['deliveryApartment'];
    final l$deliveryCity = json['deliveryCity'];
    final l$deliveryZipCode = json['deliveryZipCode'];
    final l$orderItems = json['orderItems'];
    return Fragment$CourierDeliveryFragment$order(
      id: (l$id as String),
      restaurant: l$restaurant == null
          ? null
          : Fragment$CourierDeliveryFragment$order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
      total: (l$total as int),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      customer: l$customer == null
          ? null
          : Fragment$CourierDeliveryFragment$order$customer.fromJson(
              (l$customer as Map<String, dynamic>),
            ),
      deliveryFirstName: (l$deliveryFirstName as String?),
      deliveryLastName: (l$deliveryLastName as String?),
      deliveryPhoneNumber: (l$deliveryPhoneNumber as String?),
      deliveryStreet: (l$deliveryStreet as String?),
      deliveryApartment: (l$deliveryApartment as String?),
      deliveryCity: (l$deliveryCity as String?),
      deliveryZipCode: (l$deliveryZipCode as String?),
      orderItems: l$orderItems == null
          ? null
          : Fragment$CourierDeliveryFragment$order$orderItems.fromJson(
              (l$orderItems as Map<String, dynamic>),
            ),
    );
  }

  final String id;

  final Fragment$CourierDeliveryFragment$order$restaurant? restaurant;

  final String $__typename;

  final int total;

  final Enum$OrderStatus status;

  final Fragment$CourierDeliveryFragment$order$customer? customer;

  final String? deliveryFirstName;

  final String? deliveryLastName;

  final String? deliveryPhoneNumber;

  final String? deliveryStreet;

  final String? deliveryApartment;

  final String? deliveryCity;

  final String? deliveryZipCode;

  final Fragment$CourierDeliveryFragment$order$orderItems? orderItems;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$total = total;
    _resultData['total'] = l$total;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$deliveryFirstName = deliveryFirstName;
    _resultData['deliveryFirstName'] = l$deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    _resultData['deliveryLastName'] = l$deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    _resultData['deliveryPhoneNumber'] = l$deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    _resultData['deliveryStreet'] = l$deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    _resultData['deliveryApartment'] = l$deliveryApartment;
    final l$deliveryCity = deliveryCity;
    _resultData['deliveryCity'] = l$deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    _resultData['deliveryZipCode'] = l$deliveryZipCode;
    final l$orderItems = orderItems;
    _resultData['orderItems'] = l$orderItems?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    final l$total = total;
    final l$status = status;
    final l$customer = customer;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$orderItems = orderItems;
    return Object.hashAll([
      l$id,
      l$restaurant,
      l$$__typename,
      l$total,
      l$status,
      l$customer,
      l$deliveryFirstName,
      l$deliveryLastName,
      l$deliveryPhoneNumber,
      l$deliveryStreet,
      l$deliveryApartment,
      l$deliveryCity,
      l$deliveryZipCode,
      l$orderItems,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment$order ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$deliveryFirstName = deliveryFirstName;
    final lOther$deliveryFirstName = other.deliveryFirstName;
    if (l$deliveryFirstName != lOther$deliveryFirstName) {
      return false;
    }
    final l$deliveryLastName = deliveryLastName;
    final lOther$deliveryLastName = other.deliveryLastName;
    if (l$deliveryLastName != lOther$deliveryLastName) {
      return false;
    }
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final lOther$deliveryPhoneNumber = other.deliveryPhoneNumber;
    if (l$deliveryPhoneNumber != lOther$deliveryPhoneNumber) {
      return false;
    }
    final l$deliveryStreet = deliveryStreet;
    final lOther$deliveryStreet = other.deliveryStreet;
    if (l$deliveryStreet != lOther$deliveryStreet) {
      return false;
    }
    final l$deliveryApartment = deliveryApartment;
    final lOther$deliveryApartment = other.deliveryApartment;
    if (l$deliveryApartment != lOther$deliveryApartment) {
      return false;
    }
    final l$deliveryCity = deliveryCity;
    final lOther$deliveryCity = other.deliveryCity;
    if (l$deliveryCity != lOther$deliveryCity) {
      return false;
    }
    final l$deliveryZipCode = deliveryZipCode;
    final lOther$deliveryZipCode = other.deliveryZipCode;
    if (l$deliveryZipCode != lOther$deliveryZipCode) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (l$orderItems != lOther$orderItems) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order
    on Fragment$CourierDeliveryFragment$order {
  CopyWith$Fragment$CourierDeliveryFragment$order<
    Fragment$CourierDeliveryFragment$order
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order(this, (i) => i);
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order<TRes> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order(
    Fragment$CourierDeliveryFragment$order instance,
    TRes Function(Fragment$CourierDeliveryFragment$order) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order;

  factory CopyWith$Fragment$CourierDeliveryFragment$order.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order;

  TRes call({
    String? id,
    Fragment$CourierDeliveryFragment$order$restaurant? restaurant,
    String? $__typename,
    int? total,
    Enum$OrderStatus? status,
    Fragment$CourierDeliveryFragment$order$customer? customer,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Fragment$CourierDeliveryFragment$order$orderItems? orderItems,
  });
  CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<TRes>
  get restaurant;
  CopyWith$Fragment$CourierDeliveryFragment$order$customer<TRes> get customer;
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<TRes>
  get orderItems;
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment$order<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order _instance;

  final TRes Function(Fragment$CourierDeliveryFragment$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
    Object? total = _undefined,
    Object? status = _undefined,
    Object? customer = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? orderItems = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Fragment$CourierDeliveryFragment$order$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      customer: customer == _undefined
          ? _instance.customer
          : (customer as Fragment$CourierDeliveryFragment$order$customer?),
      deliveryFirstName: deliveryFirstName == _undefined
          ? _instance.deliveryFirstName
          : (deliveryFirstName as String?),
      deliveryLastName: deliveryLastName == _undefined
          ? _instance.deliveryLastName
          : (deliveryLastName as String?),
      deliveryPhoneNumber: deliveryPhoneNumber == _undefined
          ? _instance.deliveryPhoneNumber
          : (deliveryPhoneNumber as String?),
      deliveryStreet: deliveryStreet == _undefined
          ? _instance.deliveryStreet
          : (deliveryStreet as String?),
      deliveryApartment: deliveryApartment == _undefined
          ? _instance.deliveryApartment
          : (deliveryApartment as String?),
      deliveryCity: deliveryCity == _undefined
          ? _instance.deliveryCity
          : (deliveryCity as String?),
      deliveryZipCode: deliveryZipCode == _undefined
          ? _instance.deliveryZipCode
          : (deliveryZipCode as String?),
      orderItems: orderItems == _undefined
          ? _instance.orderItems
          : (orderItems as Fragment$CourierDeliveryFragment$order$orderItems?),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<TRes>
  get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Fragment$CourierDeliveryFragment$order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$customer.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$customer(
            local$customer,
            (e) => call(customer: e),
          );
  }

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<TRes>
  get orderItems {
    final local$orderItems = _instance.orderItems;
    return local$orderItems == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$orderItems.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems(
            local$orderItems,
            (e) => call(orderItems: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment$order<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order(this._res);

  TRes _res;

  call({
    String? id,
    Fragment$CourierDeliveryFragment$order$restaurant? restaurant,
    String? $__typename,
    int? total,
    Enum$OrderStatus? status,
    Fragment$CourierDeliveryFragment$order$customer? customer,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Fragment$CourierDeliveryFragment$order$orderItems? orderItems,
  }) => _res;

  CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<TRes>
  get restaurant =>
      CopyWith$Fragment$CourierDeliveryFragment$order$restaurant.stub(_res);

  CopyWith$Fragment$CourierDeliveryFragment$order$customer<TRes> get customer =>
      CopyWith$Fragment$CourierDeliveryFragment$order$customer.stub(_res);

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<TRes>
  get orderItems =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems.stub(_res);
}

class Fragment$CourierDeliveryFragment$order$restaurant {
  Fragment$CourierDeliveryFragment$order$restaurant({
    required this.id,
    required this.name,
    this.$__typename = 'Restaurant',
  });

  factory Fragment$CourierDeliveryFragment$order$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$restaurant(
      id: (l$id as String),
      name: (l$name as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment$order$restaurant ||
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
    if (l$name != lOther$name) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$restaurant
    on Fragment$CourierDeliveryFragment$order$restaurant {
  CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<
    Fragment$CourierDeliveryFragment$order$restaurant
  >
  get copyWith => CopyWith$Fragment$CourierDeliveryFragment$order$restaurant(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$restaurant(
    Fragment$CourierDeliveryFragment$order$restaurant instance,
    TRes Function(Fragment$CourierDeliveryFragment$order$restaurant) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$restaurant;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$restaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$restaurant;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$restaurant<TRes>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$restaurant(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$restaurant _instance;

  final TRes Function(Fragment$CourierDeliveryFragment$order$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$restaurant<TRes>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$restaurant<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$restaurant(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Fragment$CourierDeliveryFragment$order$customer {
  Fragment$CourierDeliveryFragment$order$customer({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Fragment$CourierDeliveryFragment$order$customer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$customer(
      id: (l$id as String),
      email: (l$email as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment$order$customer ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$customer
    on Fragment$CourierDeliveryFragment$order$customer {
  CopyWith$Fragment$CourierDeliveryFragment$order$customer<
    Fragment$CourierDeliveryFragment$order$customer
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$customer(this, (i) => i);
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$customer<TRes> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$customer(
    Fragment$CourierDeliveryFragment$order$customer instance,
    TRes Function(Fragment$CourierDeliveryFragment$order$customer) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$customer;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$customer.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$customer;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$customer<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment$order$customer<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$customer(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$customer _instance;

  final TRes Function(Fragment$CourierDeliveryFragment$order$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$customer(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$customer<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment$order$customer<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$customer(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Fragment$CourierDeliveryFragment$order$orderItems {
  Fragment$CourierDeliveryFragment$order$orderItems({
    this.edges,
    this.$__typename = 'OrderItemCursorConnection',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$CourierDeliveryFragment$order$orderItems$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$CourierDeliveryFragment$order$orderItems$edges?>? edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment$order$orderItems ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems
    on Fragment$CourierDeliveryFragment$order$orderItems {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<
    Fragment$CourierDeliveryFragment$order$orderItems
  >
  get copyWith => CopyWith$Fragment$CourierDeliveryFragment$order$orderItems(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems(
    Fragment$CourierDeliveryFragment$order$orderItems instance,
    TRes Function(Fragment$CourierDeliveryFragment$order$orderItems) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems;

  TRes call({
    List<Fragment$CourierDeliveryFragment$order$orderItems$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Fragment$CourierDeliveryFragment$order$orderItems$edges?>?
    Function(
      Iterable<
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges<
          Fragment$CourierDeliveryFragment$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems<TRes>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems _instance;

  final TRes Function(Fragment$CourierDeliveryFragment$order$orderItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Fragment$CourierDeliveryFragment$order$orderItems(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Fragment$CourierDeliveryFragment$order$orderItems$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Fragment$CourierDeliveryFragment$order$orderItems$edges?>?
    Function(
      Iterable<
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges<
          Fragment$CourierDeliveryFragment$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems<TRes>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems(
    this._res,
  );

  TRes _res;

  call({
    List<Fragment$CourierDeliveryFragment$order$orderItems$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Fragment$CourierDeliveryFragment$order$orderItems$edges {
  Fragment$CourierDeliveryFragment$order$orderItems$edges({
    this.node,
    this.$__typename = 'OrderItemEdge',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems$edges(
      node: l$node == null
          ? null
          : Fragment$CourierDeliveryFragment$order$orderItems$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment$order$orderItems$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems$edges
    on Fragment$CourierDeliveryFragment$order$orderItems$edges {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges<
    Fragment$CourierDeliveryFragment$order$orderItems$edges
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges(
    Fragment$CourierDeliveryFragment$order$orderItems$edges instance,
    TRes Function(Fragment$CourierDeliveryFragment$order$orderItems$edges) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges;

  TRes call({
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems$edges _instance;

  final TRes Function(Fragment$CourierDeliveryFragment$order$orderItems$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$orderItems$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Fragment$CourierDeliveryFragment$order$orderItems$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges(
    this._res,
  );

  TRes _res;

  call({
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<TRes>
  get node =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node.stub(
        _res,
      );
}

class Fragment$CourierDeliveryFragment$order$orderItems$edges$node {
  Fragment$CourierDeliveryFragment$order$orderItems$edges$node({
    required this.id,
    required this.quantity,
    this.mealPlan,
    this.$__typename = 'OrderItem',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
      id: (l$id as String),
      quantity: (l$quantity as int),
      mealPlan: l$mealPlan == null
          ? null
          : Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan.fromJson(
              (l$mealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int quantity;

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan?
  mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$quantity = quantity;
    final l$mealPlan = mealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$quantity, l$mealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$CourierDeliveryFragment$order$orderItems$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems$edges$node
    on Fragment$CourierDeliveryFragment$order$orderItems$edges$node {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node instance,
    TRes Function(Fragment$CourierDeliveryFragment$order$orderItems$edges$node)
    then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node;

  TRes call({
    String? id,
    int? quantity,
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan?
    mealPlan,
    String? $__typename,
  });
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan;
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<
          TRes
        > {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node _instance;

  final TRes Function(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      quantity: quantity == _undefined || quantity == null
          ? _instance.quantity
          : (quantity as int),
      mealPlan: mealPlan == _undefined
          ? _instance.mealPlan
          : (mealPlan
                as Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return local$mealPlan == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
            local$mealPlan,
            (e) => call(mealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    int? quantity,
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan?
    mealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan.stub(
        _res,
      );
}

class Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan {
  Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan({
    required this.id,
    required this.name,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.meals,
    this.$__typename = 'MealPlan',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$calories = json['calories'];
    final l$protein = json['protein'];
    final l$fat = json['fat'];
    final l$carbs = json['carbs'];
    final l$meals = json['meals'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
      id: (l$id as String),
      name: (l$name as String),
      calories: (l$calories as num?)?.toDouble(),
      protein: (l$protein as num?)?.toDouble(),
      fat: (l$fat as num?)?.toDouble(),
      carbs: (l$carbs as num?)?.toDouble(),
      meals: l$meals == null
          ? null
          : Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals.fromJson(
              (l$meals as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final double? calories;

  final double? protein;

  final double? fat;

  final double? carbs;

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals?
  meals;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$calories = calories;
    _resultData['calories'] = l$calories;
    final l$protein = protein;
    _resultData['protein'] = l$protein;
    final l$fat = fat;
    _resultData['fat'] = l$fat;
    final l$carbs = carbs;
    _resultData['carbs'] = l$carbs;
    final l$meals = meals;
    _resultData['meals'] = l$meals?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$meals = meals;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$calories,
      l$protein,
      l$fat,
      l$carbs,
      l$meals,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan ||
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
    if (l$name != lOther$name) {
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
    final l$meals = meals;
    final lOther$meals = other.meals;
    if (l$meals != lOther$meals) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan
    on Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan
    instance,
    TRes Function(
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan,
    )
    then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan;

  TRes call({
    String? id,
    String? name,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals?
    meals,
    String? $__typename,
  });
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
    TRes
  >
  get meals;
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan
  _instance;

  final TRes Function(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? meals = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      calories: calories == _undefined
          ? _instance.calories
          : (calories as double?),
      protein: protein == _undefined ? _instance.protein : (protein as double?),
      fat: fat == _undefined ? _instance.fat : (fat as double?),
      carbs: carbs == _undefined ? _instance.carbs : (carbs as double?),
      meals: meals == _undefined
          ? _instance.meals
          : (meals
                as Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
    TRes
  >
  get meals {
    final local$meals = _instance.meals;
    return local$meals == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
            local$meals,
            (e) => call(meals: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals?
    meals,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
    TRes
  >
  get meals =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals.stub(
        _res,
      );
}

class Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals {
  Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals({
    this.edges,
    this.$__typename = 'MealCursorConnection',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges?
  >?
  edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals
    on Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals
    instance,
    TRes Function(
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals,
    )
    then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals;

  TRes call({
    List<
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges?
    >?
    edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges?
    >?
    Function(
      Iterable<
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
          Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
          TRes
        > {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals
  _instance;

  final TRes Function(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<
                  Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges?
                >?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges?
    >?
    Function(
      Iterable<
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
          Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals<
          TRes
        > {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals(
    this._res,
  );

  TRes _res;

  call({
    List<
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges?
    >?
    edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges {
  Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges({
    this.node,
    this.$__typename = 'MealEdge',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
      node: l$node == null
          ? null
          : Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node?
  node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges
    on
        Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges
    instance,
    TRes Function(
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges,
    )
    then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges;

  TRes call({
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node?
    node,
    String? $__typename,
  });
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
    TRes
  >
  get node;
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
          TRes
        > {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges
  _instance;

  final TRes Function(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
    TRes
  >
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges<
          TRes
        > {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges(
    this._res,
  );

  TRes _res;

  call({
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node?
    node,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
    TRes
  >
  get node =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node.stub(
        _res,
      );
}

class Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node {
  Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node({
    required this.id,
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.$__typename = 'Meal',
  });

  factory Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$calories = json['calories'];
    final l$protein = json['protein'];
    final l$fat = json['fat'];
    final l$carbs = json['carbs'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      calories: (l$calories as num).toDouble(),
      protein: (l$protein as num).toDouble(),
      fat: (l$fat as num).toDouble(),
      carbs: (l$carbs as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final double calories;

  final double protein;

  final double fat;

  final double carbs;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$calories = calories;
    _resultData['calories'] = l$calories;
    final l$protein = protein;
    _resultData['protein'] = l$protein;
    final l$fat = fat;
    _resultData['fat'] = l$fat;
    final l$carbs = carbs;
    _resultData['carbs'] = l$carbs;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$calories,
      l$protein,
      l$fat,
      l$carbs,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node ||
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
    if (l$name != lOther$name) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node
    on
        Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node {
  CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
  TRes
> {
  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node
    instance,
    TRes Function(
      Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node,
    )
    then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node;

  factory CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node;

  TRes call({
    String? id,
    String? name,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
          TRes
        > {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node
  _instance;

  final TRes Function(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      calories: calories == _undefined || calories == null
          ? _instance.calories
          : (calories as double),
      protein: protein == _undefined || protein == null
          ? _instance.protein
          : (protein as double),
      fat: fat == _undefined || fat == null ? _instance.fat : (fat as double),
      carbs: carbs == _undefined || carbs == null
          ? _instance.carbs
          : (carbs as double),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$order$orderItems$edges$node$mealPlan$meals$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? $__typename,
  }) => _res;
}

class Fragment$CourierDeliveryFragment$courier {
  Fragment$CourierDeliveryFragment$courier({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Fragment$CourierDeliveryFragment$courier.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Fragment$CourierDeliveryFragment$courier(
      id: (l$id as String),
      email: (l$email as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$CourierDeliveryFragment$courier ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CourierDeliveryFragment$courier
    on Fragment$CourierDeliveryFragment$courier {
  CopyWith$Fragment$CourierDeliveryFragment$courier<
    Fragment$CourierDeliveryFragment$courier
  >
  get copyWith =>
      CopyWith$Fragment$CourierDeliveryFragment$courier(this, (i) => i);
}

abstract class CopyWith$Fragment$CourierDeliveryFragment$courier<TRes> {
  factory CopyWith$Fragment$CourierDeliveryFragment$courier(
    Fragment$CourierDeliveryFragment$courier instance,
    TRes Function(Fragment$CourierDeliveryFragment$courier) then,
  ) = _CopyWithImpl$Fragment$CourierDeliveryFragment$courier;

  factory CopyWith$Fragment$CourierDeliveryFragment$courier.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CourierDeliveryFragment$courier;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Fragment$CourierDeliveryFragment$courier<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment$courier<TRes> {
  _CopyWithImpl$Fragment$CourierDeliveryFragment$courier(
    this._instance,
    this._then,
  );

  final Fragment$CourierDeliveryFragment$courier _instance;

  final TRes Function(Fragment$CourierDeliveryFragment$courier) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$CourierDeliveryFragment$courier(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$CourierDeliveryFragment$courier<TRes>
    implements CopyWith$Fragment$CourierDeliveryFragment$courier<TRes> {
  _CopyWithStubImpl$Fragment$CourierDeliveryFragment$courier(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Variables$Query$GetDeliveries {
  factory Variables$Query$GetDeliveries({
    int? first,
    String? after,
    String? search,
  }) => Variables$Query$GetDeliveries._({
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (search != null) r'search': search,
  });

  Variables$Query$GetDeliveries._(this._$data);

  factory Variables$Query$GetDeliveries.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    return Variables$Query$GetDeliveries._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get search => (_$data['search'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetDeliveries<Variables$Query$GetDeliveries>
  get copyWith => CopyWith$Variables$Query$GetDeliveries(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDeliveries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$search = search;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('search') ? l$search : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetDeliveries<TRes> {
  factory CopyWith$Variables$Query$GetDeliveries(
    Variables$Query$GetDeliveries instance,
    TRes Function(Variables$Query$GetDeliveries) then,
  ) = _CopyWithImpl$Variables$Query$GetDeliveries;

  factory CopyWith$Variables$Query$GetDeliveries.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDeliveries;

  TRes call({int? first, String? after, String? search});
}

class _CopyWithImpl$Variables$Query$GetDeliveries<TRes>
    implements CopyWith$Variables$Query$GetDeliveries<TRes> {
  _CopyWithImpl$Variables$Query$GetDeliveries(this._instance, this._then);

  final Variables$Query$GetDeliveries _instance;

  final TRes Function(Variables$Query$GetDeliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? search = _undefined,
  }) => _then(
    Variables$Query$GetDeliveries._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (search != _undefined) 'search': (search as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetDeliveries<TRes>
    implements CopyWith$Variables$Query$GetDeliveries<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDeliveries(this._res);

  TRes _res;

  call({int? first, String? after, String? search}) => _res;
}

class Query$GetDeliveries {
  Query$GetDeliveries({this.deliveries, this.$__typename = 'Query'});

  factory Query$GetDeliveries.fromJson(Map<String, dynamic> json) {
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveries(
      deliveries: l$deliveries == null
          ? null
          : Query$GetDeliveries$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDeliveries$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deliveries, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveries || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveries on Query$GetDeliveries {
  CopyWith$Query$GetDeliveries<Query$GetDeliveries> get copyWith =>
      CopyWith$Query$GetDeliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveries<TRes> {
  factory CopyWith$Query$GetDeliveries(
    Query$GetDeliveries instance,
    TRes Function(Query$GetDeliveries) then,
  ) = _CopyWithImpl$Query$GetDeliveries;

  factory CopyWith$Query$GetDeliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveries;

  TRes call({Query$GetDeliveries$deliveries? deliveries, String? $__typename});
  CopyWith$Query$GetDeliveries$deliveries<TRes> get deliveries;
}

class _CopyWithImpl$Query$GetDeliveries<TRes>
    implements CopyWith$Query$GetDeliveries<TRes> {
  _CopyWithImpl$Query$GetDeliveries(this._instance, this._then);

  final Query$GetDeliveries _instance;

  final TRes Function(Query$GetDeliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDeliveries(
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Query$GetDeliveries$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetDeliveries$deliveries<TRes> get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Query$GetDeliveries$deliveries.stub(_then(_instance))
        : CopyWith$Query$GetDeliveries$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDeliveries<TRes>
    implements CopyWith$Query$GetDeliveries<TRes> {
  _CopyWithStubImpl$Query$GetDeliveries(this._res);

  TRes _res;

  call({Query$GetDeliveries$deliveries? deliveries, String? $__typename}) =>
      _res;

  CopyWith$Query$GetDeliveries$deliveries<TRes> get deliveries =>
      CopyWith$Query$GetDeliveries$deliveries.stub(_res);
}

const documentNodeQueryGetDeliveries = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetDeliveries'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'first')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'after')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'search')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deliveries'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: VariableNode(name: NameNode(value: 'first')),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'after')),
              ),
              ArgumentNode(
                name: NameNode(value: 'search'),
                value: VariableNode(name: NameNode(value: 'search')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FragmentSpreadNode(
                              name: NameNode(value: 'BasicDeliveryFragment'),
                              directives: [],
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'endCursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionBasicDeliveryFragment,
  ],
);
Query$GetDeliveries _parserFn$Query$GetDeliveries(Map<String, dynamic> data) =>
    Query$GetDeliveries.fromJson(data);
typedef OnQueryComplete$Query$GetDeliveries =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetDeliveries?);

class Options$Query$GetDeliveries
    extends graphql.QueryOptions<Query$GetDeliveries> {
  Options$Query$GetDeliveries({
    String? operationName,
    Variables$Query$GetDeliveries? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDeliveries? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDeliveries? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetDeliveries(data),
               ),
         onError: onError,
         document: documentNodeQueryGetDeliveries,
         parserFn: _parserFn$Query$GetDeliveries,
       );

  final OnQueryComplete$Query$GetDeliveries? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetDeliveries
    extends graphql.WatchQueryOptions<Query$GetDeliveries> {
  WatchOptions$Query$GetDeliveries({
    String? operationName,
    Variables$Query$GetDeliveries? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDeliveries? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables?.toJson() ?? {},
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetDeliveries,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetDeliveries,
       );
}

class FetchMoreOptions$Query$GetDeliveries extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDeliveries({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetDeliveries? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetDeliveries,
       );
}

extension ClientExtension$Query$GetDeliveries on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDeliveries>> query$GetDeliveries([
    Options$Query$GetDeliveries? options,
  ]) async => await this.query(options ?? Options$Query$GetDeliveries());

  graphql.ObservableQuery<Query$GetDeliveries> watchQuery$GetDeliveries([
    WatchOptions$Query$GetDeliveries? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetDeliveries());

  void writeQuery$GetDeliveries({
    required Query$GetDeliveries data,
    Variables$Query$GetDeliveries? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetDeliveries),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetDeliveries? readQuery$GetDeliveries({
    Variables$Query$GetDeliveries? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetDeliveries),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDeliveries.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDeliveries> useQuery$GetDeliveries([
  Options$Query$GetDeliveries? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetDeliveries());
graphql.ObservableQuery<Query$GetDeliveries> useWatchQuery$GetDeliveries([
  WatchOptions$Query$GetDeliveries? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetDeliveries(),
);

class Query$GetDeliveries$Widget
    extends graphql_flutter.Query<Query$GetDeliveries> {
  Query$GetDeliveries$Widget({
    widgets.Key? key,
    Options$Query$GetDeliveries? options,
    required graphql_flutter.QueryBuilder<Query$GetDeliveries> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetDeliveries(),
         builder: builder,
       );
}

class Query$GetDeliveries$deliveries {
  Query$GetDeliveries$deliveries({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Query$GetDeliveries$deliveries.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveries$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetDeliveries$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetDeliveries$deliveries$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetDeliveries$deliveries$edges?>? edges;

  final Query$GetDeliveries$deliveries$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveries$deliveries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveries$deliveries
    on Query$GetDeliveries$deliveries {
  CopyWith$Query$GetDeliveries$deliveries<Query$GetDeliveries$deliveries>
  get copyWith => CopyWith$Query$GetDeliveries$deliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveries$deliveries<TRes> {
  factory CopyWith$Query$GetDeliveries$deliveries(
    Query$GetDeliveries$deliveries instance,
    TRes Function(Query$GetDeliveries$deliveries) then,
  ) = _CopyWithImpl$Query$GetDeliveries$deliveries;

  factory CopyWith$Query$GetDeliveries$deliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveries$deliveries;

  TRes call({
    List<Query$GetDeliveries$deliveries$edges?>? edges,
    Query$GetDeliveries$deliveries$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetDeliveries$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetDeliveries$deliveries$edges<
          Query$GetDeliveries$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetDeliveries$deliveries$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetDeliveries$deliveries<TRes>
    implements CopyWith$Query$GetDeliveries$deliveries<TRes> {
  _CopyWithImpl$Query$GetDeliveries$deliveries(this._instance, this._then);

  final Query$GetDeliveries$deliveries _instance;

  final TRes Function(Query$GetDeliveries$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDeliveries$deliveries(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetDeliveries$deliveries$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetDeliveries$deliveries$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetDeliveries$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetDeliveries$deliveries$edges<
          Query$GetDeliveries$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetDeliveries$deliveries$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetDeliveries$deliveries$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetDeliveries$deliveries$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetDeliveries$deliveries<TRes>
    implements CopyWith$Query$GetDeliveries$deliveries<TRes> {
  _CopyWithStubImpl$Query$GetDeliveries$deliveries(this._res);

  TRes _res;

  call({
    List<Query$GetDeliveries$deliveries$edges?>? edges,
    Query$GetDeliveries$deliveries$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetDeliveries$deliveries$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetDeliveries$deliveries$pageInfo.stub(_res);
}

class Query$GetDeliveries$deliveries$edges {
  Query$GetDeliveries$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Query$GetDeliveries$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveries$deliveries$edges(
      node: l$node == null
          ? null
          : Fragment$BasicDeliveryFragment.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$BasicDeliveryFragment? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveries$deliveries$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveries$deliveries$edges
    on Query$GetDeliveries$deliveries$edges {
  CopyWith$Query$GetDeliveries$deliveries$edges<
    Query$GetDeliveries$deliveries$edges
  >
  get copyWith => CopyWith$Query$GetDeliveries$deliveries$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveries$deliveries$edges<TRes> {
  factory CopyWith$Query$GetDeliveries$deliveries$edges(
    Query$GetDeliveries$deliveries$edges instance,
    TRes Function(Query$GetDeliveries$deliveries$edges) then,
  ) = _CopyWithImpl$Query$GetDeliveries$deliveries$edges;

  factory CopyWith$Query$GetDeliveries$deliveries$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveries$deliveries$edges;

  TRes call({Fragment$BasicDeliveryFragment? node, String? $__typename});
  CopyWith$Fragment$BasicDeliveryFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetDeliveries$deliveries$edges<TRes>
    implements CopyWith$Query$GetDeliveries$deliveries$edges<TRes> {
  _CopyWithImpl$Query$GetDeliveries$deliveries$edges(
    this._instance,
    this._then,
  );

  final Query$GetDeliveries$deliveries$edges _instance;

  final TRes Function(Query$GetDeliveries$deliveries$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetDeliveries$deliveries$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$BasicDeliveryFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$BasicDeliveryFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$BasicDeliveryFragment.stub(_then(_instance))
        : CopyWith$Fragment$BasicDeliveryFragment(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDeliveries$deliveries$edges<TRes>
    implements CopyWith$Query$GetDeliveries$deliveries$edges<TRes> {
  _CopyWithStubImpl$Query$GetDeliveries$deliveries$edges(this._res);

  TRes _res;

  call({Fragment$BasicDeliveryFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$BasicDeliveryFragment<TRes> get node =>
      CopyWith$Fragment$BasicDeliveryFragment.stub(_res);
}

class Query$GetDeliveries$deliveries$pageInfo {
  Query$GetDeliveries$deliveries$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'DeliveryPageInfo',
  });

  factory Query$GetDeliveries$deliveries$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveries$deliveries$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$hasNextPage, l$endCursor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveries$deliveries$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveries$deliveries$pageInfo
    on Query$GetDeliveries$deliveries$pageInfo {
  CopyWith$Query$GetDeliveries$deliveries$pageInfo<
    Query$GetDeliveries$deliveries$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetDeliveries$deliveries$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveries$deliveries$pageInfo<TRes> {
  factory CopyWith$Query$GetDeliveries$deliveries$pageInfo(
    Query$GetDeliveries$deliveries$pageInfo instance,
    TRes Function(Query$GetDeliveries$deliveries$pageInfo) then,
  ) = _CopyWithImpl$Query$GetDeliveries$deliveries$pageInfo;

  factory CopyWith$Query$GetDeliveries$deliveries$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveries$deliveries$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetDeliveries$deliveries$pageInfo<TRes>
    implements CopyWith$Query$GetDeliveries$deliveries$pageInfo<TRes> {
  _CopyWithImpl$Query$GetDeliveries$deliveries$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetDeliveries$deliveries$pageInfo _instance;

  final TRes Function(Query$GetDeliveries$deliveries$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDeliveries$deliveries$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      endCursor: endCursor == _undefined
          ? _instance.endCursor
          : (endCursor as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetDeliveries$deliveries$pageInfo<TRes>
    implements CopyWith$Query$GetDeliveries$deliveries$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetDeliveries$deliveries$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetUserDeliveries {
  factory Variables$Query$GetUserDeliveries({
    required String id,
    int? first,
    String? after,
    List<String?>? status,
    String? search,
    List<Input$DeliveryFilter_order?>? order,
    List<Input$DeliveryFilter_deliveryDate?>? deliveryDate,
  }) => Variables$Query$GetUserDeliveries._({
    r'id': id,
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (status != null) r'status': status,
    if (search != null) r'search': search,
    if (order != null) r'order': order,
    if (deliveryDate != null) r'deliveryDate': deliveryDate,
  });

  Variables$Query$GetUserDeliveries._(this._$data);

  factory Variables$Query$GetUserDeliveries.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$DeliveryFilter_order.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$DeliveryFilter_deliveryDate.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    return Variables$Query$GetUserDeliveries._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  List<String?>? get status => (_$data['status'] as List<String?>?);

  String? get search => (_$data['search'] as String?);

  List<Input$DeliveryFilter_order?>? get order =>
      (_$data['order'] as List<Input$DeliveryFilter_order?>?);

  List<Input$DeliveryFilter_deliveryDate?>? get deliveryDate =>
      (_$data['deliveryDate'] as List<Input$DeliveryFilter_deliveryDate?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status?.map((e) => e).toList();
    }
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate
          ?.map((e) => e?.toJson())
          .toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetUserDeliveries<Variables$Query$GetUserDeliveries>
  get copyWith => CopyWith$Variables$Query$GetUserDeliveries(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUserDeliveries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != null && lOther$status != null) {
      if (l$status.length != lOther$status.length) {
        return false;
      }
      for (int i = 0; i < l$status.length; i++) {
        final l$status$entry = l$status[i];
        final lOther$status$entry = lOther$status[i];
        if (l$status$entry != lOther$status$entry) {
          return false;
        }
      }
    } else if (l$status != lOther$status) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != null && lOther$order != null) {
      if (l$order.length != lOther$order.length) {
        return false;
      }
      for (int i = 0; i < l$order.length; i++) {
        final l$order$entry = l$order[i];
        final lOther$order$entry = lOther$order[i];
        if (l$order$entry != lOther$order$entry) {
          return false;
        }
      }
    } else if (l$order != lOther$order) {
      return false;
    }
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != null && lOther$deliveryDate != null) {
      if (l$deliveryDate.length != lOther$deliveryDate.length) {
        return false;
      }
      for (int i = 0; i < l$deliveryDate.length; i++) {
        final l$deliveryDate$entry = l$deliveryDate[i];
        final lOther$deliveryDate$entry = lOther$deliveryDate[i];
        if (l$deliveryDate$entry != lOther$deliveryDate$entry) {
          return false;
        }
      }
    } else if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$first = first;
    final l$after = after;
    final l$status = status;
    final l$search = search;
    final l$order = order;
    final l$deliveryDate = deliveryDate;
    return Object.hashAll([
      l$id,
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('status')
          ? l$status == null
                ? null
                : Object.hashAll(l$status.map((v) => v))
          : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('order')
          ? l$order == null
                ? null
                : Object.hashAll(l$order.map((v) => v))
          : const {},
      _$data.containsKey('deliveryDate')
          ? l$deliveryDate == null
                ? null
                : Object.hashAll(l$deliveryDate.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetUserDeliveries<TRes> {
  factory CopyWith$Variables$Query$GetUserDeliveries(
    Variables$Query$GetUserDeliveries instance,
    TRes Function(Variables$Query$GetUserDeliveries) then,
  ) = _CopyWithImpl$Variables$Query$GetUserDeliveries;

  factory CopyWith$Variables$Query$GetUserDeliveries.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUserDeliveries;

  TRes call({
    String? id,
    int? first,
    String? after,
    List<String?>? status,
    String? search,
    List<Input$DeliveryFilter_order?>? order,
    List<Input$DeliveryFilter_deliveryDate?>? deliveryDate,
  });
}

class _CopyWithImpl$Variables$Query$GetUserDeliveries<TRes>
    implements CopyWith$Variables$Query$GetUserDeliveries<TRes> {
  _CopyWithImpl$Variables$Query$GetUserDeliveries(this._instance, this._then);

  final Variables$Query$GetUserDeliveries _instance;

  final TRes Function(Variables$Query$GetUserDeliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
    Object? status = _undefined,
    Object? search = _undefined,
    Object? order = _undefined,
    Object? deliveryDate = _undefined,
  }) => _then(
    Variables$Query$GetUserDeliveries._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (status != _undefined) 'status': (status as List<String?>?),
      if (search != _undefined) 'search': (search as String?),
      if (order != _undefined)
        'order': (order as List<Input$DeliveryFilter_order?>?),
      if (deliveryDate != _undefined)
        'deliveryDate':
            (deliveryDate as List<Input$DeliveryFilter_deliveryDate?>?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetUserDeliveries<TRes>
    implements CopyWith$Variables$Query$GetUserDeliveries<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUserDeliveries(this._res);

  TRes _res;

  call({
    String? id,
    int? first,
    String? after,
    List<String?>? status,
    String? search,
    List<Input$DeliveryFilter_order?>? order,
    List<Input$DeliveryFilter_deliveryDate?>? deliveryDate,
  }) => _res;
}

class Query$GetUserDeliveries {
  Query$GetUserDeliveries({this.user, this.$__typename = 'Query'});

  factory Query$GetUserDeliveries.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDeliveries(
      user: l$user == null
          ? null
          : Query$GetUserDeliveries$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUserDeliveries$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDeliveries || runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDeliveries on Query$GetUserDeliveries {
  CopyWith$Query$GetUserDeliveries<Query$GetUserDeliveries> get copyWith =>
      CopyWith$Query$GetUserDeliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetUserDeliveries<TRes> {
  factory CopyWith$Query$GetUserDeliveries(
    Query$GetUserDeliveries instance,
    TRes Function(Query$GetUserDeliveries) then,
  ) = _CopyWithImpl$Query$GetUserDeliveries;

  factory CopyWith$Query$GetUserDeliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserDeliveries;

  TRes call({Query$GetUserDeliveries$user? user, String? $__typename});
  CopyWith$Query$GetUserDeliveries$user<TRes> get user;
}

class _CopyWithImpl$Query$GetUserDeliveries<TRes>
    implements CopyWith$Query$GetUserDeliveries<TRes> {
  _CopyWithImpl$Query$GetUserDeliveries(this._instance, this._then);

  final Query$GetUserDeliveries _instance;

  final TRes Function(Query$GetUserDeliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUserDeliveries(
          user: user == _undefined
              ? _instance.user
              : (user as Query$GetUserDeliveries$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUserDeliveries$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetUserDeliveries$user.stub(_then(_instance))
        : CopyWith$Query$GetUserDeliveries$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserDeliveries<TRes>
    implements CopyWith$Query$GetUserDeliveries<TRes> {
  _CopyWithStubImpl$Query$GetUserDeliveries(this._res);

  TRes _res;

  call({Query$GetUserDeliveries$user? user, String? $__typename}) => _res;

  CopyWith$Query$GetUserDeliveries$user<TRes> get user =>
      CopyWith$Query$GetUserDeliveries$user.stub(_res);
}

const documentNodeQueryGetUserDeliveries = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUserDeliveries'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'first')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'after')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'String'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'search')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'order')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'DeliveryFilter_order'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'deliveryDate')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'DeliveryFilter_deliveryDate'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'deliveries'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                      name: NameNode(value: 'first'),
                      value: VariableNode(name: NameNode(value: 'first')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'after'),
                      value: VariableNode(name: NameNode(value: 'after')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'status_list'),
                      value: VariableNode(name: NameNode(value: 'status')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'search'),
                      value: VariableNode(name: NameNode(value: 'search')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'order'),
                      value: VariableNode(name: NameNode(value: 'order')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'deliveryDate'),
                      value: VariableNode(
                        name: NameNode(value: 'deliveryDate'),
                      ),
                    ),
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'edges'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'node'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(
                                selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(
                                      value: 'CourierDeliveryFragment',
                                    ),
                                    directives: [],
                                  ),
                                  FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ],
                              ),
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: 'pageInfo'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FieldNode(
                              name: NameNode(value: 'hasNextPage'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'endCursor'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionCourierDeliveryFragment,
  ],
);
Query$GetUserDeliveries _parserFn$Query$GetUserDeliveries(
  Map<String, dynamic> data,
) => Query$GetUserDeliveries.fromJson(data);
typedef OnQueryComplete$Query$GetUserDeliveries =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetUserDeliveries?);

class Options$Query$GetUserDeliveries
    extends graphql.QueryOptions<Query$GetUserDeliveries> {
  Options$Query$GetUserDeliveries({
    String? operationName,
    required Variables$Query$GetUserDeliveries variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserDeliveries? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserDeliveries? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetUserDeliveries(data),
               ),
         onError: onError,
         document: documentNodeQueryGetUserDeliveries,
         parserFn: _parserFn$Query$GetUserDeliveries,
       );

  final OnQueryComplete$Query$GetUserDeliveries? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetUserDeliveries
    extends graphql.WatchQueryOptions<Query$GetUserDeliveries> {
  WatchOptions$Query$GetUserDeliveries({
    String? operationName,
    required Variables$Query$GetUserDeliveries variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserDeliveries? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetUserDeliveries,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetUserDeliveries,
       );
}

class FetchMoreOptions$Query$GetUserDeliveries
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserDeliveries({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUserDeliveries variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetUserDeliveries,
       );
}

extension ClientExtension$Query$GetUserDeliveries on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserDeliveries>> query$GetUserDeliveries(
    Options$Query$GetUserDeliveries options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetUserDeliveries> watchQuery$GetUserDeliveries(
    WatchOptions$Query$GetUserDeliveries options,
  ) => this.watchQuery(options);

  void writeQuery$GetUserDeliveries({
    required Query$GetUserDeliveries data,
    required Variables$Query$GetUserDeliveries variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetUserDeliveries,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetUserDeliveries? readQuery$GetUserDeliveries({
    required Variables$Query$GetUserDeliveries variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetUserDeliveries,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserDeliveries.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserDeliveries>
useQuery$GetUserDeliveries(Options$Query$GetUserDeliveries options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetUserDeliveries>
useWatchQuery$GetUserDeliveries(WatchOptions$Query$GetUserDeliveries options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetUserDeliveries$Widget
    extends graphql_flutter.Query<Query$GetUserDeliveries> {
  Query$GetUserDeliveries$Widget({
    widgets.Key? key,
    required Options$Query$GetUserDeliveries options,
    required graphql_flutter.QueryBuilder<Query$GetUserDeliveries> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetUserDeliveries$user {
  Query$GetUserDeliveries$user({
    required this.id,
    this.deliveries,
    this.$__typename = 'User',
  });

  factory Query$GetUserDeliveries$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDeliveries$user(
      id: (l$id as String),
      deliveries: l$deliveries == null
          ? null
          : Query$GetUserDeliveries$user$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetUserDeliveries$user$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$deliveries, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDeliveries$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDeliveries$user
    on Query$GetUserDeliveries$user {
  CopyWith$Query$GetUserDeliveries$user<Query$GetUserDeliveries$user>
  get copyWith => CopyWith$Query$GetUserDeliveries$user(this, (i) => i);
}

abstract class CopyWith$Query$GetUserDeliveries$user<TRes> {
  factory CopyWith$Query$GetUserDeliveries$user(
    Query$GetUserDeliveries$user instance,
    TRes Function(Query$GetUserDeliveries$user) then,
  ) = _CopyWithImpl$Query$GetUserDeliveries$user;

  factory CopyWith$Query$GetUserDeliveries$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserDeliveries$user;

  TRes call({
    String? id,
    Query$GetUserDeliveries$user$deliveries? deliveries,
    String? $__typename,
  });
  CopyWith$Query$GetUserDeliveries$user$deliveries<TRes> get deliveries;
}

class _CopyWithImpl$Query$GetUserDeliveries$user<TRes>
    implements CopyWith$Query$GetUserDeliveries$user<TRes> {
  _CopyWithImpl$Query$GetUserDeliveries$user(this._instance, this._then);

  final Query$GetUserDeliveries$user _instance;

  final TRes Function(Query$GetUserDeliveries$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserDeliveries$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Query$GetUserDeliveries$user$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetUserDeliveries$user$deliveries<TRes> get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Query$GetUserDeliveries$user$deliveries.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetUserDeliveries$user$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserDeliveries$user<TRes>
    implements CopyWith$Query$GetUserDeliveries$user<TRes> {
  _CopyWithStubImpl$Query$GetUserDeliveries$user(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetUserDeliveries$user$deliveries? deliveries,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUserDeliveries$user$deliveries<TRes> get deliveries =>
      CopyWith$Query$GetUserDeliveries$user$deliveries.stub(_res);
}

class Query$GetUserDeliveries$user$deliveries {
  Query$GetUserDeliveries$user$deliveries({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Query$GetUserDeliveries$user$deliveries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDeliveries$user$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetUserDeliveries$user$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetUserDeliveries$user$deliveries$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUserDeliveries$user$deliveries$edges?>? edges;

  final Query$GetUserDeliveries$user$deliveries$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDeliveries$user$deliveries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDeliveries$user$deliveries
    on Query$GetUserDeliveries$user$deliveries {
  CopyWith$Query$GetUserDeliveries$user$deliveries<
    Query$GetUserDeliveries$user$deliveries
  >
  get copyWith =>
      CopyWith$Query$GetUserDeliveries$user$deliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetUserDeliveries$user$deliveries<TRes> {
  factory CopyWith$Query$GetUserDeliveries$user$deliveries(
    Query$GetUserDeliveries$user$deliveries instance,
    TRes Function(Query$GetUserDeliveries$user$deliveries) then,
  ) = _CopyWithImpl$Query$GetUserDeliveries$user$deliveries;

  factory CopyWith$Query$GetUserDeliveries$user$deliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries;

  TRes call({
    List<Query$GetUserDeliveries$user$deliveries$edges?>? edges,
    Query$GetUserDeliveries$user$deliveries$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetUserDeliveries$user$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetUserDeliveries$user$deliveries$edges<
          Query$GetUserDeliveries$user$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetUserDeliveries$user$deliveries<TRes>
    implements CopyWith$Query$GetUserDeliveries$user$deliveries<TRes> {
  _CopyWithImpl$Query$GetUserDeliveries$user$deliveries(
    this._instance,
    this._then,
  );

  final Query$GetUserDeliveries$user$deliveries _instance;

  final TRes Function(Query$GetUserDeliveries$user$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserDeliveries$user$deliveries(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetUserDeliveries$user$deliveries$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetUserDeliveries$user$deliveries$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetUserDeliveries$user$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetUserDeliveries$user$deliveries$edges<
          Query$GetUserDeliveries$user$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetUserDeliveries$user$deliveries$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries<TRes>
    implements CopyWith$Query$GetUserDeliveries$user$deliveries<TRes> {
  _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries(this._res);

  TRes _res;

  call({
    List<Query$GetUserDeliveries$user$deliveries$edges?>? edges,
    Query$GetUserDeliveries$user$deliveries$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo.stub(_res);
}

class Query$GetUserDeliveries$user$deliveries$edges {
  Query$GetUserDeliveries$user$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Query$GetUserDeliveries$user$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDeliveries$user$deliveries$edges(
      node: l$node == null
          ? null
          : Fragment$CourierDeliveryFragment.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CourierDeliveryFragment? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDeliveries$user$deliveries$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDeliveries$user$deliveries$edges
    on Query$GetUserDeliveries$user$deliveries$edges {
  CopyWith$Query$GetUserDeliveries$user$deliveries$edges<
    Query$GetUserDeliveries$user$deliveries$edges
  >
  get copyWith =>
      CopyWith$Query$GetUserDeliveries$user$deliveries$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetUserDeliveries$user$deliveries$edges<TRes> {
  factory CopyWith$Query$GetUserDeliveries$user$deliveries$edges(
    Query$GetUserDeliveries$user$deliveries$edges instance,
    TRes Function(Query$GetUserDeliveries$user$deliveries$edges) then,
  ) = _CopyWithImpl$Query$GetUserDeliveries$user$deliveries$edges;

  factory CopyWith$Query$GetUserDeliveries$user$deliveries$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries$edges;

  TRes call({Fragment$CourierDeliveryFragment? node, String? $__typename});
  CopyWith$Fragment$CourierDeliveryFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetUserDeliveries$user$deliveries$edges<TRes>
    implements CopyWith$Query$GetUserDeliveries$user$deliveries$edges<TRes> {
  _CopyWithImpl$Query$GetUserDeliveries$user$deliveries$edges(
    this._instance,
    this._then,
  );

  final Query$GetUserDeliveries$user$deliveries$edges _instance;

  final TRes Function(Query$GetUserDeliveries$user$deliveries$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUserDeliveries$user$deliveries$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$CourierDeliveryFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$CourierDeliveryFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$CourierDeliveryFragment.stub(_then(_instance))
        : CopyWith$Fragment$CourierDeliveryFragment(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries$edges<TRes>
    implements CopyWith$Query$GetUserDeliveries$user$deliveries$edges<TRes> {
  _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries$edges(this._res);

  TRes _res;

  call({Fragment$CourierDeliveryFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$CourierDeliveryFragment<TRes> get node =>
      CopyWith$Fragment$CourierDeliveryFragment.stub(_res);
}

class Query$GetUserDeliveries$user$deliveries$pageInfo {
  Query$GetUserDeliveries$user$deliveries$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'DeliveryPageInfo',
  });

  factory Query$GetUserDeliveries$user$deliveries$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetUserDeliveries$user$deliveries$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$hasNextPage, l$endCursor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserDeliveries$user$deliveries$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserDeliveries$user$deliveries$pageInfo
    on Query$GetUserDeliveries$user$deliveries$pageInfo {
  CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<
    Query$GetUserDeliveries$user$deliveries$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes> {
  factory CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo(
    Query$GetUserDeliveries$user$deliveries$pageInfo instance,
    TRes Function(Query$GetUserDeliveries$user$deliveries$pageInfo) then,
  ) = _CopyWithImpl$Query$GetUserDeliveries$user$deliveries$pageInfo;

  factory CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes>
    implements CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes> {
  _CopyWithImpl$Query$GetUserDeliveries$user$deliveries$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetUserDeliveries$user$deliveries$pageInfo _instance;

  final TRes Function(Query$GetUserDeliveries$user$deliveries$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserDeliveries$user$deliveries$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      endCursor: endCursor == _undefined
          ? _instance.endCursor
          : (endCursor as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes>
    implements CopyWith$Query$GetUserDeliveries$user$deliveries$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetUserDeliveries$user$deliveries$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetDelivery {
  factory Variables$Query$GetDelivery({required String id}) =>
      Variables$Query$GetDelivery._({r'id': id});

  Variables$Query$GetDelivery._(this._$data);

  factory Variables$Query$GetDelivery.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetDelivery._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetDelivery<Variables$Query$GetDelivery>
  get copyWith => CopyWith$Variables$Query$GetDelivery(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDelivery ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetDelivery<TRes> {
  factory CopyWith$Variables$Query$GetDelivery(
    Variables$Query$GetDelivery instance,
    TRes Function(Variables$Query$GetDelivery) then,
  ) = _CopyWithImpl$Variables$Query$GetDelivery;

  factory CopyWith$Variables$Query$GetDelivery.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDelivery;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetDelivery<TRes>
    implements CopyWith$Variables$Query$GetDelivery<TRes> {
  _CopyWithImpl$Variables$Query$GetDelivery(this._instance, this._then);

  final Variables$Query$GetDelivery _instance;

  final TRes Function(Variables$Query$GetDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetDelivery._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetDelivery<TRes>
    implements CopyWith$Variables$Query$GetDelivery<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDelivery(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetDelivery {
  Query$GetDelivery({this.delivery, this.$__typename = 'Query'});

  factory Query$GetDelivery.fromJson(Map<String, dynamic> json) {
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Query$GetDelivery(
      delivery: l$delivery == null
          ? null
          : Fragment$BasicDeliveryFragment.fromJson(
              (l$delivery as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$BasicDeliveryFragment? delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([l$delivery, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDelivery || runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDelivery on Query$GetDelivery {
  CopyWith$Query$GetDelivery<Query$GetDelivery> get copyWith =>
      CopyWith$Query$GetDelivery(this, (i) => i);
}

abstract class CopyWith$Query$GetDelivery<TRes> {
  factory CopyWith$Query$GetDelivery(
    Query$GetDelivery instance,
    TRes Function(Query$GetDelivery) then,
  ) = _CopyWithImpl$Query$GetDelivery;

  factory CopyWith$Query$GetDelivery.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDelivery;

  TRes call({Fragment$BasicDeliveryFragment? delivery, String? $__typename});
  CopyWith$Fragment$BasicDeliveryFragment<TRes> get delivery;
}

class _CopyWithImpl$Query$GetDelivery<TRes>
    implements CopyWith$Query$GetDelivery<TRes> {
  _CopyWithImpl$Query$GetDelivery(this._instance, this._then);

  final Query$GetDelivery _instance;

  final TRes Function(Query$GetDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDelivery(
      delivery: delivery == _undefined
          ? _instance.delivery
          : (delivery as Fragment$BasicDeliveryFragment?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$BasicDeliveryFragment<TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Fragment$BasicDeliveryFragment.stub(_then(_instance))
        : CopyWith$Fragment$BasicDeliveryFragment(
            local$delivery,
            (e) => call(delivery: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDelivery<TRes>
    implements CopyWith$Query$GetDelivery<TRes> {
  _CopyWithStubImpl$Query$GetDelivery(this._res);

  TRes _res;

  call({Fragment$BasicDeliveryFragment? delivery, String? $__typename}) => _res;

  CopyWith$Fragment$BasicDeliveryFragment<TRes> get delivery =>
      CopyWith$Fragment$BasicDeliveryFragment.stub(_res);
}

const documentNodeQueryGetDelivery = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetDelivery'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'delivery'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'BasicDeliveryFragment'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionBasicDeliveryFragment,
  ],
);
Query$GetDelivery _parserFn$Query$GetDelivery(Map<String, dynamic> data) =>
    Query$GetDelivery.fromJson(data);
typedef OnQueryComplete$Query$GetDelivery =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetDelivery?);

class Options$Query$GetDelivery
    extends graphql.QueryOptions<Query$GetDelivery> {
  Options$Query$GetDelivery({
    String? operationName,
    required Variables$Query$GetDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDelivery? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDelivery? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetDelivery(data),
               ),
         onError: onError,
         document: documentNodeQueryGetDelivery,
         parserFn: _parserFn$Query$GetDelivery,
       );

  final OnQueryComplete$Query$GetDelivery? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetDelivery
    extends graphql.WatchQueryOptions<Query$GetDelivery> {
  WatchOptions$Query$GetDelivery({
    String? operationName,
    required Variables$Query$GetDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDelivery? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetDelivery,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetDelivery,
       );
}

class FetchMoreOptions$Query$GetDelivery extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDelivery({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetDelivery variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetDelivery,
       );
}

extension ClientExtension$Query$GetDelivery on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDelivery>> query$GetDelivery(
    Options$Query$GetDelivery options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetDelivery> watchQuery$GetDelivery(
    WatchOptions$Query$GetDelivery options,
  ) => this.watchQuery(options);

  void writeQuery$GetDelivery({
    required Query$GetDelivery data,
    required Variables$Query$GetDelivery variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetDelivery),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetDelivery? readQuery$GetDelivery({
    required Variables$Query$GetDelivery variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetDelivery),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDelivery.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDelivery> useQuery$GetDelivery(
  Options$Query$GetDelivery options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetDelivery> useWatchQuery$GetDelivery(
  WatchOptions$Query$GetDelivery options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetDelivery$Widget
    extends graphql_flutter.Query<Query$GetDelivery> {
  Query$GetDelivery$Widget({
    widgets.Key? key,
    required Options$Query$GetDelivery options,
    required graphql_flutter.QueryBuilder<Query$GetDelivery> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Query$GetDeliveriesByRestaurant {
  factory Variables$Query$GetDeliveriesByRestaurant({
    required String restaurantId,
    int? first,
    String? after,
    String? status,
    List<Input$DeliveryFilter_order?>? order,
    String? search,
    List<Input$DeliveryFilter_deliveryDate?>? deliveryDate,
  }) => Variables$Query$GetDeliveriesByRestaurant._({
    r'restaurantId': restaurantId,
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (status != null) r'status': status,
    if (order != null) r'order': order,
    if (search != null) r'search': search,
    if (deliveryDate != null) r'deliveryDate': deliveryDate,
  });

  Variables$Query$GetDeliveriesByRestaurant._(this._$data);

  factory Variables$Query$GetDeliveriesByRestaurant.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$restaurantId = data['restaurantId'];
    result$data['restaurantId'] = (l$restaurantId as String);
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$DeliveryFilter_order.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$DeliveryFilter_deliveryDate.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    return Variables$Query$GetDeliveriesByRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  String get restaurantId => (_$data['restaurantId'] as String);

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get status => (_$data['status'] as String?);

  List<Input$DeliveryFilter_order?>? get order =>
      (_$data['order'] as List<Input$DeliveryFilter_order?>?);

  String? get search => (_$data['search'] as String?);

  List<Input$DeliveryFilter_deliveryDate?>? get deliveryDate =>
      (_$data['deliveryDate'] as List<Input$DeliveryFilter_deliveryDate?>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$restaurantId = restaurantId;
    result$data['restaurantId'] = l$restaurantId;
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate
          ?.map((e) => e?.toJson())
          .toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetDeliveriesByRestaurant<
    Variables$Query$GetDeliveriesByRestaurant
  >
  get copyWith =>
      CopyWith$Variables$Query$GetDeliveriesByRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDeliveriesByRestaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantId = restaurantId;
    final lOther$restaurantId = other.restaurantId;
    if (l$restaurantId != lOther$restaurantId) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
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
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != null && lOther$order != null) {
      if (l$order.length != lOther$order.length) {
        return false;
      }
      for (int i = 0; i < l$order.length; i++) {
        final l$order$entry = l$order[i];
        final lOther$order$entry = lOther$order[i];
        if (l$order$entry != lOther$order$entry) {
          return false;
        }
      }
    } else if (l$order != lOther$order) {
      return false;
    }
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != null && lOther$deliveryDate != null) {
      if (l$deliveryDate.length != lOther$deliveryDate.length) {
        return false;
      }
      for (int i = 0; i < l$deliveryDate.length; i++) {
        final l$deliveryDate$entry = l$deliveryDate[i];
        final lOther$deliveryDate$entry = lOther$deliveryDate[i];
        if (l$deliveryDate$entry != lOther$deliveryDate$entry) {
          return false;
        }
      }
    } else if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    final l$first = first;
    final l$after = after;
    final l$status = status;
    final l$order = order;
    final l$search = search;
    final l$deliveryDate = deliveryDate;
    return Object.hashAll([
      l$restaurantId,
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('order')
          ? l$order == null
                ? null
                : Object.hashAll(l$order.map((v) => v))
          : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('deliveryDate')
          ? l$deliveryDate == null
                ? null
                : Object.hashAll(l$deliveryDate.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetDeliveriesByRestaurant<TRes> {
  factory CopyWith$Variables$Query$GetDeliveriesByRestaurant(
    Variables$Query$GetDeliveriesByRestaurant instance,
    TRes Function(Variables$Query$GetDeliveriesByRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$GetDeliveriesByRestaurant;

  factory CopyWith$Variables$Query$GetDeliveriesByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDeliveriesByRestaurant;

  TRes call({
    String? restaurantId,
    int? first,
    String? after,
    String? status,
    List<Input$DeliveryFilter_order?>? order,
    String? search,
    List<Input$DeliveryFilter_deliveryDate?>? deliveryDate,
  });
}

class _CopyWithImpl$Variables$Query$GetDeliveriesByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetDeliveriesByRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$GetDeliveriesByRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Query$GetDeliveriesByRestaurant _instance;

  final TRes Function(Variables$Query$GetDeliveriesByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantId = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
    Object? status = _undefined,
    Object? order = _undefined,
    Object? search = _undefined,
    Object? deliveryDate = _undefined,
  }) => _then(
    Variables$Query$GetDeliveriesByRestaurant._({
      ..._instance._$data,
      if (restaurantId != _undefined && restaurantId != null)
        'restaurantId': (restaurantId as String),
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (status != _undefined) 'status': (status as String?),
      if (order != _undefined)
        'order': (order as List<Input$DeliveryFilter_order?>?),
      if (search != _undefined) 'search': (search as String?),
      if (deliveryDate != _undefined)
        'deliveryDate':
            (deliveryDate as List<Input$DeliveryFilter_deliveryDate?>?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetDeliveriesByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetDeliveriesByRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDeliveriesByRestaurant(this._res);

  TRes _res;

  call({
    String? restaurantId,
    int? first,
    String? after,
    String? status,
    List<Input$DeliveryFilter_order?>? order,
    String? search,
    List<Input$DeliveryFilter_deliveryDate?>? deliveryDate,
  }) => _res;
}

class Query$GetDeliveriesByRestaurant {
  Query$GetDeliveriesByRestaurant({
    this.deliveries,
    this.$__typename = 'Query',
  });

  factory Query$GetDeliveriesByRestaurant.fromJson(Map<String, dynamic> json) {
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveriesByRestaurant(
      deliveries: l$deliveries == null
          ? null
          : Query$GetDeliveriesByRestaurant$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDeliveriesByRestaurant$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deliveries, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveriesByRestaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveriesByRestaurant
    on Query$GetDeliveriesByRestaurant {
  CopyWith$Query$GetDeliveriesByRestaurant<Query$GetDeliveriesByRestaurant>
  get copyWith => CopyWith$Query$GetDeliveriesByRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveriesByRestaurant<TRes> {
  factory CopyWith$Query$GetDeliveriesByRestaurant(
    Query$GetDeliveriesByRestaurant instance,
    TRes Function(Query$GetDeliveriesByRestaurant) then,
  ) = _CopyWithImpl$Query$GetDeliveriesByRestaurant;

  factory CopyWith$Query$GetDeliveriesByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveriesByRestaurant;

  TRes call({
    Query$GetDeliveriesByRestaurant$deliveries? deliveries,
    String? $__typename,
  });
  CopyWith$Query$GetDeliveriesByRestaurant$deliveries<TRes> get deliveries;
}

class _CopyWithImpl$Query$GetDeliveriesByRestaurant<TRes>
    implements CopyWith$Query$GetDeliveriesByRestaurant<TRes> {
  _CopyWithImpl$Query$GetDeliveriesByRestaurant(this._instance, this._then);

  final Query$GetDeliveriesByRestaurant _instance;

  final TRes Function(Query$GetDeliveriesByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDeliveriesByRestaurant(
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Query$GetDeliveriesByRestaurant$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetDeliveriesByRestaurant$deliveries<TRes> get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Query$GetDeliveriesByRestaurant$deliveries.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetDeliveriesByRestaurant$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDeliveriesByRestaurant<TRes>
    implements CopyWith$Query$GetDeliveriesByRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetDeliveriesByRestaurant(this._res);

  TRes _res;

  call({
    Query$GetDeliveriesByRestaurant$deliveries? deliveries,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetDeliveriesByRestaurant$deliveries<TRes> get deliveries =>
      CopyWith$Query$GetDeliveriesByRestaurant$deliveries.stub(_res);
}

const documentNodeQueryGetDeliveriesByRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetDeliveriesByRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'restaurantId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'first')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'after')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'status')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'order')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'DeliveryFilter_order'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'search')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'deliveryDate')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'DeliveryFilter_deliveryDate'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deliveries'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: VariableNode(name: NameNode(value: 'first')),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'after')),
              ),
              ArgumentNode(
                name: NameNode(value: 'status'),
                value: VariableNode(name: NameNode(value: 'status')),
              ),
              ArgumentNode(
                name: NameNode(value: 'search'),
                value: VariableNode(name: NameNode(value: 'search')),
              ),
              ArgumentNode(
                name: NameNode(value: 'order'),
                value: VariableNode(name: NameNode(value: 'order')),
              ),
              ArgumentNode(
                name: NameNode(value: 'order_restaurant'),
                value: VariableNode(name: NameNode(value: 'restaurantId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'deliveryDate'),
                value: VariableNode(name: NameNode(value: 'deliveryDate')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(
                          selections: [
                            FragmentSpreadNode(
                              name: NameNode(value: 'BasicDeliveryFragment'),
                              directives: [],
                            ),
                            FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                          ],
                        ),
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: 'pageInfo'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'hasNextPage'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'endCursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionBasicDeliveryFragment,
  ],
);
Query$GetDeliveriesByRestaurant _parserFn$Query$GetDeliveriesByRestaurant(
  Map<String, dynamic> data,
) => Query$GetDeliveriesByRestaurant.fromJson(data);
typedef OnQueryComplete$Query$GetDeliveriesByRestaurant =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$GetDeliveriesByRestaurant?,
    );

class Options$Query$GetDeliveriesByRestaurant
    extends graphql.QueryOptions<Query$GetDeliveriesByRestaurant> {
  Options$Query$GetDeliveriesByRestaurant({
    String? operationName,
    required Variables$Query$GetDeliveriesByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDeliveriesByRestaurant? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDeliveriesByRestaurant? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null
                     ? null
                     : _parserFn$Query$GetDeliveriesByRestaurant(data),
               ),
         onError: onError,
         document: documentNodeQueryGetDeliveriesByRestaurant,
         parserFn: _parserFn$Query$GetDeliveriesByRestaurant,
       );

  final OnQueryComplete$Query$GetDeliveriesByRestaurant? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetDeliveriesByRestaurant
    extends graphql.WatchQueryOptions<Query$GetDeliveriesByRestaurant> {
  WatchOptions$Query$GetDeliveriesByRestaurant({
    String? operationName,
    required Variables$Query$GetDeliveriesByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDeliveriesByRestaurant? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetDeliveriesByRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetDeliveriesByRestaurant,
       );
}

class FetchMoreOptions$Query$GetDeliveriesByRestaurant
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDeliveriesByRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetDeliveriesByRestaurant variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetDeliveriesByRestaurant,
       );
}

extension ClientExtension$Query$GetDeliveriesByRestaurant
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDeliveriesByRestaurant>>
  query$GetDeliveriesByRestaurant(
    Options$Query$GetDeliveriesByRestaurant options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetDeliveriesByRestaurant>
  watchQuery$GetDeliveriesByRestaurant(
    WatchOptions$Query$GetDeliveriesByRestaurant options,
  ) => this.watchQuery(options);

  void writeQuery$GetDeliveriesByRestaurant({
    required Query$GetDeliveriesByRestaurant data,
    required Variables$Query$GetDeliveriesByRestaurant variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetDeliveriesByRestaurant,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetDeliveriesByRestaurant? readQuery$GetDeliveriesByRestaurant({
    required Variables$Query$GetDeliveriesByRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetDeliveriesByRestaurant,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetDeliveriesByRestaurant.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDeliveriesByRestaurant>
useQuery$GetDeliveriesByRestaurant(
  Options$Query$GetDeliveriesByRestaurant options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetDeliveriesByRestaurant>
useWatchQuery$GetDeliveriesByRestaurant(
  WatchOptions$Query$GetDeliveriesByRestaurant options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetDeliveriesByRestaurant$Widget
    extends graphql_flutter.Query<Query$GetDeliveriesByRestaurant> {
  Query$GetDeliveriesByRestaurant$Widget({
    widgets.Key? key,
    required Options$Query$GetDeliveriesByRestaurant options,
    required graphql_flutter.QueryBuilder<Query$GetDeliveriesByRestaurant>
    builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetDeliveriesByRestaurant$deliveries {
  Query$GetDeliveriesByRestaurant$deliveries({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Query$GetDeliveriesByRestaurant$deliveries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveriesByRestaurant$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetDeliveriesByRestaurant$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetDeliveriesByRestaurant$deliveries$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetDeliveriesByRestaurant$deliveries$edges?>? edges;

  final Query$GetDeliveriesByRestaurant$deliveries$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveriesByRestaurant$deliveries ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges != null && lOther$edges != null) {
      if (l$edges.length != lOther$edges.length) {
        return false;
      }
      for (int i = 0; i < l$edges.length; i++) {
        final l$edges$entry = l$edges[i];
        final lOther$edges$entry = lOther$edges[i];
        if (l$edges$entry != lOther$edges$entry) {
          return false;
        }
      }
    } else if (l$edges != lOther$edges) {
      return false;
    }
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveriesByRestaurant$deliveries
    on Query$GetDeliveriesByRestaurant$deliveries {
  CopyWith$Query$GetDeliveriesByRestaurant$deliveries<
    Query$GetDeliveriesByRestaurant$deliveries
  >
  get copyWith =>
      CopyWith$Query$GetDeliveriesByRestaurant$deliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveriesByRestaurant$deliveries<TRes> {
  factory CopyWith$Query$GetDeliveriesByRestaurant$deliveries(
    Query$GetDeliveriesByRestaurant$deliveries instance,
    TRes Function(Query$GetDeliveriesByRestaurant$deliveries) then,
  ) = _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries;

  factory CopyWith$Query$GetDeliveriesByRestaurant$deliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries;

  TRes call({
    List<Query$GetDeliveriesByRestaurant$deliveries$edges?>? edges,
    Query$GetDeliveriesByRestaurant$deliveries$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetDeliveriesByRestaurant$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges<
          Query$GetDeliveriesByRestaurant$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<TRes>
  get pageInfo;
}

class _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries<TRes>
    implements CopyWith$Query$GetDeliveriesByRestaurant$deliveries<TRes> {
  _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries(
    this._instance,
    this._then,
  );

  final Query$GetDeliveriesByRestaurant$deliveries _instance;

  final TRes Function(Query$GetDeliveriesByRestaurant$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDeliveriesByRestaurant$deliveries(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetDeliveriesByRestaurant$deliveries$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetDeliveriesByRestaurant$deliveries$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetDeliveriesByRestaurant$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges<
          Query$GetDeliveriesByRestaurant$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<TRes>
  get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries<TRes>
    implements CopyWith$Query$GetDeliveriesByRestaurant$deliveries<TRes> {
  _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries(this._res);

  TRes _res;

  call({
    List<Query$GetDeliveriesByRestaurant$deliveries$edges?>? edges,
    Query$GetDeliveriesByRestaurant$deliveries$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo.stub(_res);
}

class Query$GetDeliveriesByRestaurant$deliveries$edges {
  Query$GetDeliveriesByRestaurant$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Query$GetDeliveriesByRestaurant$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveriesByRestaurant$deliveries$edges(
      node: l$node == null
          ? null
          : Fragment$BasicDeliveryFragment.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$BasicDeliveryFragment? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([l$node, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveriesByRestaurant$deliveries$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveriesByRestaurant$deliveries$edges
    on Query$GetDeliveriesByRestaurant$deliveries$edges {
  CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges<
    Query$GetDeliveriesByRestaurant$deliveries$edges
  >
  get copyWith =>
      CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges<TRes> {
  factory CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges(
    Query$GetDeliveriesByRestaurant$deliveries$edges instance,
    TRes Function(Query$GetDeliveriesByRestaurant$deliveries$edges) then,
  ) = _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries$edges;

  factory CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries$edges;

  TRes call({Fragment$BasicDeliveryFragment? node, String? $__typename});
  CopyWith$Fragment$BasicDeliveryFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries$edges<TRes>
    implements CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges<TRes> {
  _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries$edges(
    this._instance,
    this._then,
  );

  final Query$GetDeliveriesByRestaurant$deliveries$edges _instance;

  final TRes Function(Query$GetDeliveriesByRestaurant$deliveries$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetDeliveriesByRestaurant$deliveries$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$BasicDeliveryFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$BasicDeliveryFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$BasicDeliveryFragment.stub(_then(_instance))
        : CopyWith$Fragment$BasicDeliveryFragment(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries$edges<TRes>
    implements CopyWith$Query$GetDeliveriesByRestaurant$deliveries$edges<TRes> {
  _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries$edges(this._res);

  TRes _res;

  call({Fragment$BasicDeliveryFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$BasicDeliveryFragment<TRes> get node =>
      CopyWith$Fragment$BasicDeliveryFragment.stub(_res);
}

class Query$GetDeliveriesByRestaurant$deliveries$pageInfo {
  Query$GetDeliveriesByRestaurant$deliveries$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'DeliveryPageInfo',
  });

  factory Query$GetDeliveriesByRestaurant$deliveries$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([l$hasNextPage, l$endCursor, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDeliveriesByRestaurant$deliveries$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetDeliveriesByRestaurant$deliveries$pageInfo
    on Query$GetDeliveriesByRestaurant$deliveries$pageInfo {
  CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<
    Query$GetDeliveriesByRestaurant$deliveries$pageInfo
  >
  get copyWith => CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<
  TRes
> {
  factory CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
    Query$GetDeliveriesByRestaurant$deliveries$pageInfo instance,
    TRes Function(Query$GetDeliveriesByRestaurant$deliveries$pageInfo) then,
  ) = _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries$pageInfo;

  factory CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<TRes>
    implements
        CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<TRes> {
  _CopyWithImpl$Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetDeliveriesByRestaurant$deliveries$pageInfo _instance;

  final TRes Function(Query$GetDeliveriesByRestaurant$deliveries$pageInfo)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
      hasNextPage: hasNextPage == _undefined || hasNextPage == null
          ? _instance.hasNextPage
          : (hasNextPage as bool),
      endCursor: endCursor == _undefined
          ? _instance.endCursor
          : (endCursor as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<
  TRes
>
    implements
        CopyWith$Query$GetDeliveriesByRestaurant$deliveries$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetDeliveriesByRestaurant$deliveries$pageInfo(
    this._res,
  );

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Mutation$UpdateDelivery {
  factory Variables$Mutation$UpdateDelivery({
    required Input$updateDeliveryInput input,
  }) => Variables$Mutation$UpdateDelivery._({r'input': input});

  Variables$Mutation$UpdateDelivery._(this._$data);

  factory Variables$Mutation$UpdateDelivery.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateDeliveryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateDelivery._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateDeliveryInput get input =>
      (_$data['input'] as Input$updateDeliveryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateDelivery<Variables$Mutation$UpdateDelivery>
  get copyWith => CopyWith$Variables$Mutation$UpdateDelivery(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateDelivery ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateDelivery<TRes> {
  factory CopyWith$Variables$Mutation$UpdateDelivery(
    Variables$Mutation$UpdateDelivery instance,
    TRes Function(Variables$Mutation$UpdateDelivery) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateDelivery;

  factory CopyWith$Variables$Mutation$UpdateDelivery.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateDelivery;

  TRes call({Input$updateDeliveryInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateDelivery<TRes>
    implements CopyWith$Variables$Mutation$UpdateDelivery<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateDelivery(this._instance, this._then);

  final Variables$Mutation$UpdateDelivery _instance;

  final TRes Function(Variables$Mutation$UpdateDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateDelivery._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateDeliveryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateDelivery<TRes>
    implements CopyWith$Variables$Mutation$UpdateDelivery<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateDelivery(this._res);

  TRes _res;

  call({Input$updateDeliveryInput? input}) => _res;
}

class Mutation$UpdateDelivery {
  Mutation$UpdateDelivery({this.updateDelivery, this.$__typename = 'Mutation'});

  factory Mutation$UpdateDelivery.fromJson(Map<String, dynamic> json) {
    final l$updateDelivery = json['updateDelivery'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateDelivery(
      updateDelivery: l$updateDelivery == null
          ? null
          : Mutation$UpdateDelivery$updateDelivery.fromJson(
              (l$updateDelivery as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateDelivery$updateDelivery? updateDelivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateDelivery = updateDelivery;
    _resultData['updateDelivery'] = l$updateDelivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateDelivery = updateDelivery;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateDelivery, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateDelivery || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateDelivery = updateDelivery;
    final lOther$updateDelivery = other.updateDelivery;
    if (l$updateDelivery != lOther$updateDelivery) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateDelivery on Mutation$UpdateDelivery {
  CopyWith$Mutation$UpdateDelivery<Mutation$UpdateDelivery> get copyWith =>
      CopyWith$Mutation$UpdateDelivery(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateDelivery<TRes> {
  factory CopyWith$Mutation$UpdateDelivery(
    Mutation$UpdateDelivery instance,
    TRes Function(Mutation$UpdateDelivery) then,
  ) = _CopyWithImpl$Mutation$UpdateDelivery;

  factory CopyWith$Mutation$UpdateDelivery.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateDelivery;

  TRes call({
    Mutation$UpdateDelivery$updateDelivery? updateDelivery,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateDelivery$updateDelivery<TRes> get updateDelivery;
}

class _CopyWithImpl$Mutation$UpdateDelivery<TRes>
    implements CopyWith$Mutation$UpdateDelivery<TRes> {
  _CopyWithImpl$Mutation$UpdateDelivery(this._instance, this._then);

  final Mutation$UpdateDelivery _instance;

  final TRes Function(Mutation$UpdateDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateDelivery = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateDelivery(
      updateDelivery: updateDelivery == _undefined
          ? _instance.updateDelivery
          : (updateDelivery as Mutation$UpdateDelivery$updateDelivery?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateDelivery$updateDelivery<TRes> get updateDelivery {
    final local$updateDelivery = _instance.updateDelivery;
    return local$updateDelivery == null
        ? CopyWith$Mutation$UpdateDelivery$updateDelivery.stub(_then(_instance))
        : CopyWith$Mutation$UpdateDelivery$updateDelivery(
            local$updateDelivery,
            (e) => call(updateDelivery: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateDelivery<TRes>
    implements CopyWith$Mutation$UpdateDelivery<TRes> {
  _CopyWithStubImpl$Mutation$UpdateDelivery(this._res);

  TRes _res;

  call({
    Mutation$UpdateDelivery$updateDelivery? updateDelivery,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateDelivery$updateDelivery<TRes> get updateDelivery =>
      CopyWith$Mutation$UpdateDelivery$updateDelivery.stub(_res);
}

const documentNodeMutationUpdateDelivery = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateDelivery'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateDeliveryInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateDelivery'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'delivery'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'CourierDeliveryFragment'),
                        directives: [],
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionCourierDeliveryFragment,
  ],
);
Mutation$UpdateDelivery _parserFn$Mutation$UpdateDelivery(
  Map<String, dynamic> data,
) => Mutation$UpdateDelivery.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateDelivery =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateDelivery?);

class Options$Mutation$UpdateDelivery
    extends graphql.MutationOptions<Mutation$UpdateDelivery> {
  Options$Mutation$UpdateDelivery({
    String? operationName,
    required Variables$Mutation$UpdateDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateDelivery? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateDelivery? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateDelivery>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UpdateDelivery(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateDelivery,
         parserFn: _parserFn$Mutation$UpdateDelivery,
       );

  final OnMutationCompleted$Mutation$UpdateDelivery? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateDelivery
    extends graphql.WatchQueryOptions<Mutation$UpdateDelivery> {
  WatchOptions$Mutation$UpdateDelivery({
    String? operationName,
    required Variables$Mutation$UpdateDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateDelivery? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUpdateDelivery,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateDelivery,
       );
}

extension ClientExtension$Mutation$UpdateDelivery on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateDelivery>> mutate$UpdateDelivery(
    Options$Mutation$UpdateDelivery options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateDelivery> watchMutation$UpdateDelivery(
    WatchOptions$Mutation$UpdateDelivery options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateDelivery$HookResult {
  Mutation$UpdateDelivery$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateDelivery runMutation;

  final graphql.QueryResult<Mutation$UpdateDelivery> result;
}

Mutation$UpdateDelivery$HookResult useMutation$UpdateDelivery([
  WidgetOptions$Mutation$UpdateDelivery? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateDelivery(),
  );
  return Mutation$UpdateDelivery$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateDelivery>
useWatchMutation$UpdateDelivery(WatchOptions$Mutation$UpdateDelivery options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateDelivery
    extends graphql.MutationOptions<Mutation$UpdateDelivery> {
  WidgetOptions$Mutation$UpdateDelivery({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateDelivery? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateDelivery? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateDelivery>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UpdateDelivery(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateDelivery,
         parserFn: _parserFn$Mutation$UpdateDelivery,
       );

  final OnMutationCompleted$Mutation$UpdateDelivery? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateDelivery =
    graphql.MultiSourceResult<Mutation$UpdateDelivery> Function(
      Variables$Mutation$UpdateDelivery, {
      Object? optimisticResult,
      Mutation$UpdateDelivery? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateDelivery =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateDelivery,
      graphql.QueryResult<Mutation$UpdateDelivery>?,
    );

class Mutation$UpdateDelivery$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateDelivery> {
  Mutation$UpdateDelivery$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateDelivery? options,
    required Builder$Mutation$UpdateDelivery builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateDelivery(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$UpdateDelivery$updateDelivery {
  Mutation$UpdateDelivery$updateDelivery({
    this.delivery,
    this.$__typename = 'updateDeliveryPayload',
  });

  factory Mutation$UpdateDelivery$updateDelivery.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateDelivery$updateDelivery(
      delivery: l$delivery == null
          ? null
          : Fragment$CourierDeliveryFragment.fromJson(
              (l$delivery as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$CourierDeliveryFragment? delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([l$delivery, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateDelivery$updateDelivery ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateDelivery$updateDelivery
    on Mutation$UpdateDelivery$updateDelivery {
  CopyWith$Mutation$UpdateDelivery$updateDelivery<
    Mutation$UpdateDelivery$updateDelivery
  >
  get copyWith =>
      CopyWith$Mutation$UpdateDelivery$updateDelivery(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateDelivery$updateDelivery<TRes> {
  factory CopyWith$Mutation$UpdateDelivery$updateDelivery(
    Mutation$UpdateDelivery$updateDelivery instance,
    TRes Function(Mutation$UpdateDelivery$updateDelivery) then,
  ) = _CopyWithImpl$Mutation$UpdateDelivery$updateDelivery;

  factory CopyWith$Mutation$UpdateDelivery$updateDelivery.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateDelivery$updateDelivery;

  TRes call({Fragment$CourierDeliveryFragment? delivery, String? $__typename});
  CopyWith$Fragment$CourierDeliveryFragment<TRes> get delivery;
}

class _CopyWithImpl$Mutation$UpdateDelivery$updateDelivery<TRes>
    implements CopyWith$Mutation$UpdateDelivery$updateDelivery<TRes> {
  _CopyWithImpl$Mutation$UpdateDelivery$updateDelivery(
    this._instance,
    this._then,
  );

  final Mutation$UpdateDelivery$updateDelivery _instance;

  final TRes Function(Mutation$UpdateDelivery$updateDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateDelivery$updateDelivery(
      delivery: delivery == _undefined
          ? _instance.delivery
          : (delivery as Fragment$CourierDeliveryFragment?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$CourierDeliveryFragment<TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Fragment$CourierDeliveryFragment.stub(_then(_instance))
        : CopyWith$Fragment$CourierDeliveryFragment(
            local$delivery,
            (e) => call(delivery: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateDelivery$updateDelivery<TRes>
    implements CopyWith$Mutation$UpdateDelivery$updateDelivery<TRes> {
  _CopyWithStubImpl$Mutation$UpdateDelivery$updateDelivery(this._res);

  TRes _res;

  call({Fragment$CourierDeliveryFragment? delivery, String? $__typename}) =>
      _res;

  CopyWith$Fragment$CourierDeliveryFragment<TRes> get delivery =>
      CopyWith$Fragment$CourierDeliveryFragment.stub(_res);
}

class Variables$Mutation$DeleteDelivery {
  factory Variables$Mutation$DeleteDelivery({
    required Input$deleteDeliveryInput input,
  }) => Variables$Mutation$DeleteDelivery._({r'input': input});

  Variables$Mutation$DeleteDelivery._(this._$data);

  factory Variables$Mutation$DeleteDelivery.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteDeliveryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteDelivery._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteDeliveryInput get input =>
      (_$data['input'] as Input$deleteDeliveryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteDelivery<Variables$Mutation$DeleteDelivery>
  get copyWith => CopyWith$Variables$Mutation$DeleteDelivery(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteDelivery ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteDelivery<TRes> {
  factory CopyWith$Variables$Mutation$DeleteDelivery(
    Variables$Mutation$DeleteDelivery instance,
    TRes Function(Variables$Mutation$DeleteDelivery) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteDelivery;

  factory CopyWith$Variables$Mutation$DeleteDelivery.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteDelivery;

  TRes call({Input$deleteDeliveryInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteDelivery<TRes>
    implements CopyWith$Variables$Mutation$DeleteDelivery<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteDelivery(this._instance, this._then);

  final Variables$Mutation$DeleteDelivery _instance;

  final TRes Function(Variables$Mutation$DeleteDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteDelivery._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteDeliveryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteDelivery<TRes>
    implements CopyWith$Variables$Mutation$DeleteDelivery<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteDelivery(this._res);

  TRes _res;

  call({Input$deleteDeliveryInput? input}) => _res;
}

class Mutation$DeleteDelivery {
  Mutation$DeleteDelivery({this.deleteDelivery, this.$__typename = 'Mutation'});

  factory Mutation$DeleteDelivery.fromJson(Map<String, dynamic> json) {
    final l$deleteDelivery = json['deleteDelivery'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteDelivery(
      deleteDelivery: l$deleteDelivery == null
          ? null
          : Mutation$DeleteDelivery$deleteDelivery.fromJson(
              (l$deleteDelivery as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteDelivery$deleteDelivery? deleteDelivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteDelivery = deleteDelivery;
    _resultData['deleteDelivery'] = l$deleteDelivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteDelivery = deleteDelivery;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteDelivery, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteDelivery || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteDelivery = deleteDelivery;
    final lOther$deleteDelivery = other.deleteDelivery;
    if (l$deleteDelivery != lOther$deleteDelivery) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteDelivery on Mutation$DeleteDelivery {
  CopyWith$Mutation$DeleteDelivery<Mutation$DeleteDelivery> get copyWith =>
      CopyWith$Mutation$DeleteDelivery(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteDelivery<TRes> {
  factory CopyWith$Mutation$DeleteDelivery(
    Mutation$DeleteDelivery instance,
    TRes Function(Mutation$DeleteDelivery) then,
  ) = _CopyWithImpl$Mutation$DeleteDelivery;

  factory CopyWith$Mutation$DeleteDelivery.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteDelivery;

  TRes call({
    Mutation$DeleteDelivery$deleteDelivery? deleteDelivery,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteDelivery$deleteDelivery<TRes> get deleteDelivery;
}

class _CopyWithImpl$Mutation$DeleteDelivery<TRes>
    implements CopyWith$Mutation$DeleteDelivery<TRes> {
  _CopyWithImpl$Mutation$DeleteDelivery(this._instance, this._then);

  final Mutation$DeleteDelivery _instance;

  final TRes Function(Mutation$DeleteDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteDelivery = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteDelivery(
      deleteDelivery: deleteDelivery == _undefined
          ? _instance.deleteDelivery
          : (deleteDelivery as Mutation$DeleteDelivery$deleteDelivery?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteDelivery$deleteDelivery<TRes> get deleteDelivery {
    final local$deleteDelivery = _instance.deleteDelivery;
    return local$deleteDelivery == null
        ? CopyWith$Mutation$DeleteDelivery$deleteDelivery.stub(_then(_instance))
        : CopyWith$Mutation$DeleteDelivery$deleteDelivery(
            local$deleteDelivery,
            (e) => call(deleteDelivery: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteDelivery<TRes>
    implements CopyWith$Mutation$DeleteDelivery<TRes> {
  _CopyWithStubImpl$Mutation$DeleteDelivery(this._res);

  TRes _res;

  call({
    Mutation$DeleteDelivery$deleteDelivery? deleteDelivery,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteDelivery$deleteDelivery<TRes> get deleteDelivery =>
      CopyWith$Mutation$DeleteDelivery$deleteDelivery.stub(_res);
}

const documentNodeMutationDeleteDelivery = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteDelivery'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteDeliveryInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteDelivery'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'input'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'delivery'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ],
                  ),
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
  ],
);
Mutation$DeleteDelivery _parserFn$Mutation$DeleteDelivery(
  Map<String, dynamic> data,
) => Mutation$DeleteDelivery.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteDelivery =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteDelivery?);

class Options$Mutation$DeleteDelivery
    extends graphql.MutationOptions<Mutation$DeleteDelivery> {
  Options$Mutation$DeleteDelivery({
    String? operationName,
    required Variables$Mutation$DeleteDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteDelivery? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteDelivery? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteDelivery>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$DeleteDelivery(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteDelivery,
         parserFn: _parserFn$Mutation$DeleteDelivery,
       );

  final OnMutationCompleted$Mutation$DeleteDelivery? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteDelivery
    extends graphql.WatchQueryOptions<Mutation$DeleteDelivery> {
  WatchOptions$Mutation$DeleteDelivery({
    String? operationName,
    required Variables$Mutation$DeleteDelivery variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteDelivery? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationDeleteDelivery,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteDelivery,
       );
}

extension ClientExtension$Mutation$DeleteDelivery on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteDelivery>> mutate$DeleteDelivery(
    Options$Mutation$DeleteDelivery options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteDelivery> watchMutation$DeleteDelivery(
    WatchOptions$Mutation$DeleteDelivery options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteDelivery$HookResult {
  Mutation$DeleteDelivery$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteDelivery runMutation;

  final graphql.QueryResult<Mutation$DeleteDelivery> result;
}

Mutation$DeleteDelivery$HookResult useMutation$DeleteDelivery([
  WidgetOptions$Mutation$DeleteDelivery? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteDelivery(),
  );
  return Mutation$DeleteDelivery$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteDelivery>
useWatchMutation$DeleteDelivery(WatchOptions$Mutation$DeleteDelivery options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteDelivery
    extends graphql.MutationOptions<Mutation$DeleteDelivery> {
  WidgetOptions$Mutation$DeleteDelivery({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteDelivery? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteDelivery? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteDelivery>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$DeleteDelivery(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteDelivery,
         parserFn: _parserFn$Mutation$DeleteDelivery,
       );

  final OnMutationCompleted$Mutation$DeleteDelivery? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteDelivery =
    graphql.MultiSourceResult<Mutation$DeleteDelivery> Function(
      Variables$Mutation$DeleteDelivery, {
      Object? optimisticResult,
      Mutation$DeleteDelivery? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteDelivery =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteDelivery,
      graphql.QueryResult<Mutation$DeleteDelivery>?,
    );

class Mutation$DeleteDelivery$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteDelivery> {
  Mutation$DeleteDelivery$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteDelivery? options,
    required Builder$Mutation$DeleteDelivery builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteDelivery(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Mutation$DeleteDelivery$deleteDelivery {
  Mutation$DeleteDelivery$deleteDelivery({
    this.delivery,
    this.$__typename = 'deleteDeliveryPayload',
  });

  factory Mutation$DeleteDelivery$deleteDelivery.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$delivery = json['delivery'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteDelivery$deleteDelivery(
      delivery: l$delivery == null
          ? null
          : Mutation$DeleteDelivery$deleteDelivery$delivery.fromJson(
              (l$delivery as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteDelivery$deleteDelivery$delivery? delivery;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$delivery = delivery;
    _resultData['delivery'] = l$delivery?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$delivery = delivery;
    final l$$__typename = $__typename;
    return Object.hashAll([l$delivery, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteDelivery$deleteDelivery ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$delivery = delivery;
    final lOther$delivery = other.delivery;
    if (l$delivery != lOther$delivery) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteDelivery$deleteDelivery
    on Mutation$DeleteDelivery$deleteDelivery {
  CopyWith$Mutation$DeleteDelivery$deleteDelivery<
    Mutation$DeleteDelivery$deleteDelivery
  >
  get copyWith =>
      CopyWith$Mutation$DeleteDelivery$deleteDelivery(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteDelivery$deleteDelivery<TRes> {
  factory CopyWith$Mutation$DeleteDelivery$deleteDelivery(
    Mutation$DeleteDelivery$deleteDelivery instance,
    TRes Function(Mutation$DeleteDelivery$deleteDelivery) then,
  ) = _CopyWithImpl$Mutation$DeleteDelivery$deleteDelivery;

  factory CopyWith$Mutation$DeleteDelivery$deleteDelivery.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteDelivery$deleteDelivery;

  TRes call({
    Mutation$DeleteDelivery$deleteDelivery$delivery? delivery,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes> get delivery;
}

class _CopyWithImpl$Mutation$DeleteDelivery$deleteDelivery<TRes>
    implements CopyWith$Mutation$DeleteDelivery$deleteDelivery<TRes> {
  _CopyWithImpl$Mutation$DeleteDelivery$deleteDelivery(
    this._instance,
    this._then,
  );

  final Mutation$DeleteDelivery$deleteDelivery _instance;

  final TRes Function(Mutation$DeleteDelivery$deleteDelivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? delivery = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteDelivery$deleteDelivery(
      delivery: delivery == _undefined
          ? _instance.delivery
          : (delivery as Mutation$DeleteDelivery$deleteDelivery$delivery?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes> get delivery {
    final local$delivery = _instance.delivery;
    return local$delivery == null
        ? CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery(
            local$delivery,
            (e) => call(delivery: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteDelivery$deleteDelivery<TRes>
    implements CopyWith$Mutation$DeleteDelivery$deleteDelivery<TRes> {
  _CopyWithStubImpl$Mutation$DeleteDelivery$deleteDelivery(this._res);

  TRes _res;

  call({
    Mutation$DeleteDelivery$deleteDelivery$delivery? delivery,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes> get delivery =>
      CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery.stub(_res);
}

class Mutation$DeleteDelivery$deleteDelivery$delivery {
  Mutation$DeleteDelivery$deleteDelivery$delivery({
    required this.id,
    this.$__typename = 'Delivery',
  });

  factory Mutation$DeleteDelivery$deleteDelivery$delivery.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteDelivery$deleteDelivery$delivery(
      id: (l$id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteDelivery$deleteDelivery$delivery ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$DeleteDelivery$deleteDelivery$delivery
    on Mutation$DeleteDelivery$deleteDelivery$delivery {
  CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<
    Mutation$DeleteDelivery$deleteDelivery$delivery
  >
  get copyWith =>
      CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes> {
  factory CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery(
    Mutation$DeleteDelivery$deleteDelivery$delivery instance,
    TRes Function(Mutation$DeleteDelivery$deleteDelivery$delivery) then,
  ) = _CopyWithImpl$Mutation$DeleteDelivery$deleteDelivery$delivery;

  factory CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteDelivery$deleteDelivery$delivery;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes>
    implements CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes> {
  _CopyWithImpl$Mutation$DeleteDelivery$deleteDelivery$delivery(
    this._instance,
    this._then,
  );

  final Mutation$DeleteDelivery$deleteDelivery$delivery _instance;

  final TRes Function(Mutation$DeleteDelivery$deleteDelivery$delivery) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteDelivery$deleteDelivery$delivery(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes>
    implements CopyWith$Mutation$DeleteDelivery$deleteDelivery$delivery<TRes> {
  _CopyWithStubImpl$Mutation$DeleteDelivery$deleteDelivery$delivery(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
