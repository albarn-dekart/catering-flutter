import 'dart:async';
import 'meals.graphql.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetCouriersByRestaurant {
  factory Variables$Query$GetCouriersByRestaurant({
    required String id,
    String? search,
  }) => Variables$Query$GetCouriersByRestaurant._({
    r'id': id,
    if (search != null) r'search': search,
  });

  Variables$Query$GetCouriersByRestaurant._(this._$data);

  factory Variables$Query$GetCouriersByRestaurant.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    return Variables$Query$GetCouriersByRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get search => (_$data['search'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetCouriersByRestaurant<
    Variables$Query$GetCouriersByRestaurant
  >
  get copyWith =>
      CopyWith$Variables$Query$GetCouriersByRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetCouriersByRestaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$search = search;
    return Object.hashAll([
      l$id,
      _$data.containsKey('search') ? l$search : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetCouriersByRestaurant<TRes> {
  factory CopyWith$Variables$Query$GetCouriersByRestaurant(
    Variables$Query$GetCouriersByRestaurant instance,
    TRes Function(Variables$Query$GetCouriersByRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$GetCouriersByRestaurant;

  factory CopyWith$Variables$Query$GetCouriersByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCouriersByRestaurant;

  TRes call({String? id, String? search});
}

class _CopyWithImpl$Variables$Query$GetCouriersByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetCouriersByRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$GetCouriersByRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Query$GetCouriersByRestaurant _instance;

  final TRes Function(Variables$Query$GetCouriersByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? search = _undefined}) => _then(
    Variables$Query$GetCouriersByRestaurant._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (search != _undefined) 'search': (search as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetCouriersByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetCouriersByRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCouriersByRestaurant(this._res);

  TRes _res;

  call({String? id, String? search}) => _res;
}

class Query$GetCouriersByRestaurant {
  Query$GetCouriersByRestaurant({this.restaurant, this.$__typename = 'Query'});

  factory Query$GetCouriersByRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetCouriersByRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Query$GetCouriersByRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCouriersByRestaurant$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurant, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCouriersByRestaurant ||
        runtimeType != other.runtimeType) {
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
    return true;
  }
}

extension UtilityExtension$Query$GetCouriersByRestaurant
    on Query$GetCouriersByRestaurant {
  CopyWith$Query$GetCouriersByRestaurant<Query$GetCouriersByRestaurant>
  get copyWith => CopyWith$Query$GetCouriersByRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetCouriersByRestaurant<TRes> {
  factory CopyWith$Query$GetCouriersByRestaurant(
    Query$GetCouriersByRestaurant instance,
    TRes Function(Query$GetCouriersByRestaurant) then,
  ) = _CopyWithImpl$Query$GetCouriersByRestaurant;

  factory CopyWith$Query$GetCouriersByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCouriersByRestaurant;

  TRes call({
    Query$GetCouriersByRestaurant$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetCouriersByRestaurant$restaurant<TRes> get restaurant;
}

class _CopyWithImpl$Query$GetCouriersByRestaurant<TRes>
    implements CopyWith$Query$GetCouriersByRestaurant<TRes> {
  _CopyWithImpl$Query$GetCouriersByRestaurant(this._instance, this._then);

  final Query$GetCouriersByRestaurant _instance;

  final TRes Function(Query$GetCouriersByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCouriersByRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetCouriersByRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCouriersByRestaurant$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetCouriersByRestaurant$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetCouriersByRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCouriersByRestaurant<TRes>
    implements CopyWith$Query$GetCouriersByRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetCouriersByRestaurant(this._res);

  TRes _res;

  call({
    Query$GetCouriersByRestaurant$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetCouriersByRestaurant$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetCouriersByRestaurant$restaurant.stub(_res);
}

const documentNodeQueryGetCouriersByRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCouriersByRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
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
            name: NameNode(value: 'restaurant'),
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
                  name: NameNode(value: 'couriers'),
                  alias: null,
                  arguments: [
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
                                    name: NameNode(value: 'roles'),
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
Query$GetCouriersByRestaurant _parserFn$Query$GetCouriersByRestaurant(
  Map<String, dynamic> data,
) => Query$GetCouriersByRestaurant.fromJson(data);
typedef OnQueryComplete$Query$GetCouriersByRestaurant =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$GetCouriersByRestaurant?,
    );

class Options$Query$GetCouriersByRestaurant
    extends graphql.QueryOptions<Query$GetCouriersByRestaurant> {
  Options$Query$GetCouriersByRestaurant({
    String? operationName,
    required Variables$Query$GetCouriersByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCouriersByRestaurant? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetCouriersByRestaurant? onComplete,
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
                     : _parserFn$Query$GetCouriersByRestaurant(data),
               ),
         onError: onError,
         document: documentNodeQueryGetCouriersByRestaurant,
         parserFn: _parserFn$Query$GetCouriersByRestaurant,
       );

  final OnQueryComplete$Query$GetCouriersByRestaurant? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetCouriersByRestaurant
    extends graphql.WatchQueryOptions<Query$GetCouriersByRestaurant> {
  WatchOptions$Query$GetCouriersByRestaurant({
    String? operationName,
    required Variables$Query$GetCouriersByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCouriersByRestaurant? typedOptimisticResult,
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
         document: documentNodeQueryGetCouriersByRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetCouriersByRestaurant,
       );
}

class FetchMoreOptions$Query$GetCouriersByRestaurant
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetCouriersByRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetCouriersByRestaurant variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetCouriersByRestaurant,
       );
}

extension ClientExtension$Query$GetCouriersByRestaurant
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetCouriersByRestaurant>>
  query$GetCouriersByRestaurant(
    Options$Query$GetCouriersByRestaurant options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetCouriersByRestaurant>
  watchQuery$GetCouriersByRestaurant(
    WatchOptions$Query$GetCouriersByRestaurant options,
  ) => this.watchQuery(options);

  void writeQuery$GetCouriersByRestaurant({
    required Query$GetCouriersByRestaurant data,
    required Variables$Query$GetCouriersByRestaurant variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetCouriersByRestaurant,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetCouriersByRestaurant? readQuery$GetCouriersByRestaurant({
    required Variables$Query$GetCouriersByRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetCouriersByRestaurant,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetCouriersByRestaurant.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetCouriersByRestaurant>
useQuery$GetCouriersByRestaurant(
  Options$Query$GetCouriersByRestaurant options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetCouriersByRestaurant>
useWatchQuery$GetCouriersByRestaurant(
  WatchOptions$Query$GetCouriersByRestaurant options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetCouriersByRestaurant$Widget
    extends graphql_flutter.Query<Query$GetCouriersByRestaurant> {
  Query$GetCouriersByRestaurant$Widget({
    widgets.Key? key,
    required Options$Query$GetCouriersByRestaurant options,
    required graphql_flutter.QueryBuilder<Query$GetCouriersByRestaurant>
    builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetCouriersByRestaurant$restaurant {
  Query$GetCouriersByRestaurant$restaurant({
    required this.id,
    this.couriers,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetCouriersByRestaurant$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$couriers = json['couriers'];
    final l$$__typename = json['__typename'];
    return Query$GetCouriersByRestaurant$restaurant(
      id: (l$id as String),
      couriers: l$couriers == null
          ? null
          : Query$GetCouriersByRestaurant$restaurant$couriers.fromJson(
              (l$couriers as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetCouriersByRestaurant$restaurant$couriers? couriers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$couriers = couriers;
    _resultData['couriers'] = l$couriers?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$couriers = couriers;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$couriers, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCouriersByRestaurant$restaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$couriers = couriers;
    final lOther$couriers = other.couriers;
    if (l$couriers != lOther$couriers) {
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

extension UtilityExtension$Query$GetCouriersByRestaurant$restaurant
    on Query$GetCouriersByRestaurant$restaurant {
  CopyWith$Query$GetCouriersByRestaurant$restaurant<
    Query$GetCouriersByRestaurant$restaurant
  >
  get copyWith =>
      CopyWith$Query$GetCouriersByRestaurant$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetCouriersByRestaurant$restaurant<TRes> {
  factory CopyWith$Query$GetCouriersByRestaurant$restaurant(
    Query$GetCouriersByRestaurant$restaurant instance,
    TRes Function(Query$GetCouriersByRestaurant$restaurant) then,
  ) = _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant;

  factory CopyWith$Query$GetCouriersByRestaurant$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant;

  TRes call({
    String? id,
    Query$GetCouriersByRestaurant$restaurant$couriers? couriers,
    String? $__typename,
  });
  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<TRes> get couriers;
}

class _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetCouriersByRestaurant$restaurant<TRes> {
  _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetCouriersByRestaurant$restaurant _instance;

  final TRes Function(Query$GetCouriersByRestaurant$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? couriers = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCouriersByRestaurant$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      couriers: couriers == _undefined
          ? _instance.couriers
          : (couriers as Query$GetCouriersByRestaurant$restaurant$couriers?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<TRes>
  get couriers {
    final local$couriers = _instance.couriers;
    return local$couriers == null
        ? CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers(
            local$couriers,
            (e) => call(couriers: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetCouriersByRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetCouriersByRestaurant$restaurant$couriers? couriers,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<TRes>
  get couriers =>
      CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers.stub(_res);
}

class Query$GetCouriersByRestaurant$restaurant$couriers {
  Query$GetCouriersByRestaurant$restaurant$couriers({
    this.edges,
    this.$__typename = 'UserCursorConnection',
  });

  factory Query$GetCouriersByRestaurant$restaurant$couriers.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetCouriersByRestaurant$restaurant$couriers(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetCouriersByRestaurant$restaurant$couriers$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCouriersByRestaurant$restaurant$couriers$edges?>? edges;

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
    if (other is! Query$GetCouriersByRestaurant$restaurant$couriers ||
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

extension UtilityExtension$Query$GetCouriersByRestaurant$restaurant$couriers
    on Query$GetCouriersByRestaurant$restaurant$couriers {
  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<
    Query$GetCouriersByRestaurant$restaurant$couriers
  >
  get copyWith => CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<
  TRes
> {
  factory CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers(
    Query$GetCouriersByRestaurant$restaurant$couriers instance,
    TRes Function(Query$GetCouriersByRestaurant$restaurant$couriers) then,
  ) = _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers;

  factory CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers;

  TRes call({
    List<Query$GetCouriersByRestaurant$restaurant$couriers$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetCouriersByRestaurant$restaurant$couriers$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges<
          Query$GetCouriersByRestaurant$restaurant$couriers$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers<TRes>
    implements
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<TRes> {
  _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers(
    this._instance,
    this._then,
  );

  final Query$GetCouriersByRestaurant$restaurant$couriers _instance;

  final TRes Function(Query$GetCouriersByRestaurant$restaurant$couriers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetCouriersByRestaurant$restaurant$couriers(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Query$GetCouriersByRestaurant$restaurant$couriers$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetCouriersByRestaurant$restaurant$couriers$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges<
          Query$GetCouriersByRestaurant$restaurant$couriers$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers<TRes>
    implements
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers<TRes> {
  _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GetCouriersByRestaurant$restaurant$couriers$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetCouriersByRestaurant$restaurant$couriers$edges {
  Query$GetCouriersByRestaurant$restaurant$couriers$edges({
    this.node,
    this.$__typename = 'UserEdge',
  });

  factory Query$GetCouriersByRestaurant$restaurant$couriers$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetCouriersByRestaurant$restaurant$couriers$edges(
      node: l$node == null
          ? null
          : Query$GetCouriersByRestaurant$restaurant$couriers$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCouriersByRestaurant$restaurant$couriers$edges$node? node;

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
    if (other is! Query$GetCouriersByRestaurant$restaurant$couriers$edges ||
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

extension UtilityExtension$Query$GetCouriersByRestaurant$restaurant$couriers$edges
    on Query$GetCouriersByRestaurant$restaurant$couriers$edges {
  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges<
    Query$GetCouriersByRestaurant$restaurant$couriers$edges
  >
  get copyWith =>
      CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges<
  TRes
> {
  factory CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges(
    Query$GetCouriersByRestaurant$restaurant$couriers$edges instance,
    TRes Function(Query$GetCouriersByRestaurant$restaurant$couriers$edges) then,
  ) = _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges;

  factory CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges;

  TRes call({
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges<
  TRes
>
    implements
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges<TRes> {
  _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges(
    this._instance,
    this._then,
  );

  final Query$GetCouriersByRestaurant$restaurant$couriers$edges _instance;

  final TRes Function(Query$GetCouriersByRestaurant$restaurant$couriers$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCouriersByRestaurant$restaurant$couriers$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Query$GetCouriersByRestaurant$restaurant$couriers$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges<
  TRes
>
    implements
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges<TRes> {
  _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges(
    this._res,
  );

  TRes _res;

  call({
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<TRes>
  get node =>
      CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node.stub(
        _res,
      );
}

class Query$GetCouriersByRestaurant$restaurant$couriers$edges$node {
  Query$GetCouriersByRestaurant$restaurant$couriers$edges$node({
    required this.id,
    required this.email,
    required this.roles,
    this.$__typename = 'User',
  });

  factory Query$GetCouriersByRestaurant$restaurant$couriers$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$roles = json['roles'];
    final l$$__typename = json['__typename'];
    return Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
      id: (l$id as String),
      email: (l$email as String),
      roles: (l$roles as List<dynamic>),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final List<dynamic> roles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$roles = roles;
    _resultData['roles'] = l$roles;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$roles = roles;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$roles, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetCouriersByRestaurant$restaurant$couriers$edges$node ||
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
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles != lOther$roles) {
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

extension UtilityExtension$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node
    on Query$GetCouriersByRestaurant$restaurant$couriers$edges$node {
  CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<
  TRes
> {
  factory CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node instance,
    TRes Function(Query$GetCouriersByRestaurant$restaurant$couriers$edges$node)
    then,
  ) = _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node;

  factory CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node;

  TRes call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<
          TRes
        > {
  _CopyWithImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetCouriersByRestaurant$restaurant$couriers$edges$node _instance;

  final TRes Function(
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? roles = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<dynamic>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Query$GetCouriersByRestaurant$restaurant$couriers$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  }) => _res;
}

class Variables$Query$GetUsers {
  factory Variables$Query$GetUsers({
    int? first,
    String? after,
    String? search,
    String? role,
  }) => Variables$Query$GetUsers._({
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (search != null) r'search': search,
    if (role != null) r'role': role,
  });

  Variables$Query$GetUsers._(this._$data);

  factory Variables$Query$GetUsers.fromJson(Map<String, dynamic> data) {
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
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = (l$role as String?);
    }
    return Variables$Query$GetUsers._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get search => (_$data['search'] as String?);

  String? get role => (_$data['role'] as String?);

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
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] = l$role;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetUsers<Variables$Query$GetUsers> get copyWith =>
      CopyWith$Variables$Query$GetUsers(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUsers ||
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
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$search = search;
    final l$role = role;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('role') ? l$role : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetUsers<TRes> {
  factory CopyWith$Variables$Query$GetUsers(
    Variables$Query$GetUsers instance,
    TRes Function(Variables$Query$GetUsers) then,
  ) = _CopyWithImpl$Variables$Query$GetUsers;

  factory CopyWith$Variables$Query$GetUsers.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUsers;

  TRes call({int? first, String? after, String? search, String? role});
}

class _CopyWithImpl$Variables$Query$GetUsers<TRes>
    implements CopyWith$Variables$Query$GetUsers<TRes> {
  _CopyWithImpl$Variables$Query$GetUsers(this._instance, this._then);

  final Variables$Query$GetUsers _instance;

  final TRes Function(Variables$Query$GetUsers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? search = _undefined,
    Object? role = _undefined,
  }) => _then(
    Variables$Query$GetUsers._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (search != _undefined) 'search': (search as String?),
      if (role != _undefined) 'role': (role as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetUsers<TRes>
    implements CopyWith$Variables$Query$GetUsers<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUsers(this._res);

  TRes _res;

  call({int? first, String? after, String? search, String? role}) => _res;
}

class Query$GetUsers {
  Query$GetUsers({this.users, this.$__typename = 'Query'});

  factory Query$GetUsers.fromJson(Map<String, dynamic> json) {
    final l$users = json['users'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers(
      users: l$users == null
          ? null
          : Query$GetUsers$users.fromJson((l$users as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUsers$users? users;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$users = users;
    _resultData['users'] = l$users?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$users = users;
    final l$$__typename = $__typename;
    return Object.hashAll([l$users, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUsers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$users = users;
    final lOther$users = other.users;
    if (l$users != lOther$users) {
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

extension UtilityExtension$Query$GetUsers on Query$GetUsers {
  CopyWith$Query$GetUsers<Query$GetUsers> get copyWith =>
      CopyWith$Query$GetUsers(this, (i) => i);
}

abstract class CopyWith$Query$GetUsers<TRes> {
  factory CopyWith$Query$GetUsers(
    Query$GetUsers instance,
    TRes Function(Query$GetUsers) then,
  ) = _CopyWithImpl$Query$GetUsers;

  factory CopyWith$Query$GetUsers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers;

  TRes call({Query$GetUsers$users? users, String? $__typename});
  CopyWith$Query$GetUsers$users<TRes> get users;
}

class _CopyWithImpl$Query$GetUsers<TRes>
    implements CopyWith$Query$GetUsers<TRes> {
  _CopyWithImpl$Query$GetUsers(this._instance, this._then);

  final Query$GetUsers _instance;

  final TRes Function(Query$GetUsers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? users = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUsers(
          users: users == _undefined
              ? _instance.users
              : (users as Query$GetUsers$users?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUsers$users<TRes> get users {
    final local$users = _instance.users;
    return local$users == null
        ? CopyWith$Query$GetUsers$users.stub(_then(_instance))
        : CopyWith$Query$GetUsers$users(local$users, (e) => call(users: e));
  }
}

class _CopyWithStubImpl$Query$GetUsers<TRes>
    implements CopyWith$Query$GetUsers<TRes> {
  _CopyWithStubImpl$Query$GetUsers(this._res);

  TRes _res;

  call({Query$GetUsers$users? users, String? $__typename}) => _res;

  CopyWith$Query$GetUsers$users<TRes> get users =>
      CopyWith$Query$GetUsers$users.stub(_res);
}

const documentNodeQueryGetUsers = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUsers'),
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
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'role')),
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
            name: NameNode(value: 'users'),
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
              ArgumentNode(
                name: NameNode(value: 'role'),
                value: VariableNode(name: NameNode(value: 'role')),
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
                              name: NameNode(value: 'roles'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'ownedRestaurant'),
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
  ],
);
Query$GetUsers _parserFn$Query$GetUsers(Map<String, dynamic> data) =>
    Query$GetUsers.fromJson(data);
typedef OnQueryComplete$Query$GetUsers =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetUsers?);

class Options$Query$GetUsers extends graphql.QueryOptions<Query$GetUsers> {
  Options$Query$GetUsers({
    String? operationName,
    Variables$Query$GetUsers? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUsers? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUsers? onComplete,
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
                 data == null ? null : _parserFn$Query$GetUsers(data),
               ),
         onError: onError,
         document: documentNodeQueryGetUsers,
         parserFn: _parserFn$Query$GetUsers,
       );

  final OnQueryComplete$Query$GetUsers? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetUsers
    extends graphql.WatchQueryOptions<Query$GetUsers> {
  WatchOptions$Query$GetUsers({
    String? operationName,
    Variables$Query$GetUsers? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUsers? typedOptimisticResult,
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
         document: documentNodeQueryGetUsers,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetUsers,
       );
}

class FetchMoreOptions$Query$GetUsers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUsers({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetUsers? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetUsers,
       );
}

extension ClientExtension$Query$GetUsers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUsers>> query$GetUsers([
    Options$Query$GetUsers? options,
  ]) async => await this.query(options ?? Options$Query$GetUsers());

  graphql.ObservableQuery<Query$GetUsers> watchQuery$GetUsers([
    WatchOptions$Query$GetUsers? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetUsers());

  void writeQuery$GetUsers({
    required Query$GetUsers data,
    Variables$Query$GetUsers? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetUsers),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetUsers? readQuery$GetUsers({
    Variables$Query$GetUsers? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetUsers),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUsers.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUsers> useQuery$GetUsers([
  Options$Query$GetUsers? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetUsers());
graphql.ObservableQuery<Query$GetUsers> useWatchQuery$GetUsers([
  WatchOptions$Query$GetUsers? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetUsers());

class Query$GetUsers$Widget extends graphql_flutter.Query<Query$GetUsers> {
  Query$GetUsers$Widget({
    widgets.Key? key,
    Options$Query$GetUsers? options,
    required graphql_flutter.QueryBuilder<Query$GetUsers> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetUsers(),
         builder: builder,
       );
}

class Query$GetUsers$users {
  Query$GetUsers$users({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'UserCursorConnection',
  });

  factory Query$GetUsers$users.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers$users(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetUsers$users$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetUsers$users$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUsers$users$edges?>? edges;

  final Query$GetUsers$users$pageInfo pageInfo;

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
    if (other is! Query$GetUsers$users || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetUsers$users on Query$GetUsers$users {
  CopyWith$Query$GetUsers$users<Query$GetUsers$users> get copyWith =>
      CopyWith$Query$GetUsers$users(this, (i) => i);
}

abstract class CopyWith$Query$GetUsers$users<TRes> {
  factory CopyWith$Query$GetUsers$users(
    Query$GetUsers$users instance,
    TRes Function(Query$GetUsers$users) then,
  ) = _CopyWithImpl$Query$GetUsers$users;

  factory CopyWith$Query$GetUsers$users.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers$users;

  TRes call({
    List<Query$GetUsers$users$edges?>? edges,
    Query$GetUsers$users$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetUsers$users$edges?>? Function(
      Iterable<
        CopyWith$Query$GetUsers$users$edges<Query$GetUsers$users$edges>?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetUsers$users$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetUsers$users<TRes>
    implements CopyWith$Query$GetUsers$users<TRes> {
  _CopyWithImpl$Query$GetUsers$users(this._instance, this._then);

  final Query$GetUsers$users _instance;

  final TRes Function(Query$GetUsers$users) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUsers$users(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetUsers$users$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetUsers$users$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetUsers$users$edges?>? Function(
      Iterable<
        CopyWith$Query$GetUsers$users$edges<Query$GetUsers$users$edges>?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) =>
            e == null ? null : CopyWith$Query$GetUsers$users$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetUsers$users$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetUsers$users$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetUsers$users<TRes>
    implements CopyWith$Query$GetUsers$users<TRes> {
  _CopyWithStubImpl$Query$GetUsers$users(this._res);

  TRes _res;

  call({
    List<Query$GetUsers$users$edges?>? edges,
    Query$GetUsers$users$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetUsers$users$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetUsers$users$pageInfo.stub(_res);
}

class Query$GetUsers$users$edges {
  Query$GetUsers$users$edges({this.node, this.$__typename = 'UserEdge'});

  factory Query$GetUsers$users$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers$users$edges(
      node: l$node == null
          ? null
          : Query$GetUsers$users$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUsers$users$edges$node? node;

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
    if (other is! Query$GetUsers$users$edges ||
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

extension UtilityExtension$Query$GetUsers$users$edges
    on Query$GetUsers$users$edges {
  CopyWith$Query$GetUsers$users$edges<Query$GetUsers$users$edges>
  get copyWith => CopyWith$Query$GetUsers$users$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetUsers$users$edges<TRes> {
  factory CopyWith$Query$GetUsers$users$edges(
    Query$GetUsers$users$edges instance,
    TRes Function(Query$GetUsers$users$edges) then,
  ) = _CopyWithImpl$Query$GetUsers$users$edges;

  factory CopyWith$Query$GetUsers$users$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers$users$edges;

  TRes call({Query$GetUsers$users$edges$node? node, String? $__typename});
  CopyWith$Query$GetUsers$users$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetUsers$users$edges<TRes>
    implements CopyWith$Query$GetUsers$users$edges<TRes> {
  _CopyWithImpl$Query$GetUsers$users$edges(this._instance, this._then);

  final Query$GetUsers$users$edges _instance;

  final TRes Function(Query$GetUsers$users$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUsers$users$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetUsers$users$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUsers$users$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetUsers$users$edges$node.stub(_then(_instance))
        : CopyWith$Query$GetUsers$users$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUsers$users$edges<TRes>
    implements CopyWith$Query$GetUsers$users$edges<TRes> {
  _CopyWithStubImpl$Query$GetUsers$users$edges(this._res);

  TRes _res;

  call({Query$GetUsers$users$edges$node? node, String? $__typename}) => _res;

  CopyWith$Query$GetUsers$users$edges$node<TRes> get node =>
      CopyWith$Query$GetUsers$users$edges$node.stub(_res);
}

class Query$GetUsers$users$edges$node {
  Query$GetUsers$users$edges$node({
    required this.id,
    required this.email,
    required this.roles,
    this.ownedRestaurant,
    this.$__typename = 'User',
  });

  factory Query$GetUsers$users$edges$node.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$roles = json['roles'];
    final l$ownedRestaurant = json['ownedRestaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers$users$edges$node(
      id: (l$id as String),
      email: (l$email as String),
      roles: (l$roles as List<dynamic>),
      ownedRestaurant: l$ownedRestaurant == null
          ? null
          : Query$GetUsers$users$edges$node$ownedRestaurant.fromJson(
              (l$ownedRestaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final List<dynamic> roles;

  final Query$GetUsers$users$edges$node$ownedRestaurant? ownedRestaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$roles = roles;
    _resultData['roles'] = l$roles;
    final l$ownedRestaurant = ownedRestaurant;
    _resultData['ownedRestaurant'] = l$ownedRestaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$roles = roles;
    final l$ownedRestaurant = ownedRestaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$roles,
      l$ownedRestaurant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUsers$users$edges$node ||
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
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles != lOther$roles) {
      return false;
    }
    final l$ownedRestaurant = ownedRestaurant;
    final lOther$ownedRestaurant = other.ownedRestaurant;
    if (l$ownedRestaurant != lOther$ownedRestaurant) {
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

extension UtilityExtension$Query$GetUsers$users$edges$node
    on Query$GetUsers$users$edges$node {
  CopyWith$Query$GetUsers$users$edges$node<Query$GetUsers$users$edges$node>
  get copyWith => CopyWith$Query$GetUsers$users$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetUsers$users$edges$node<TRes> {
  factory CopyWith$Query$GetUsers$users$edges$node(
    Query$GetUsers$users$edges$node instance,
    TRes Function(Query$GetUsers$users$edges$node) then,
  ) = _CopyWithImpl$Query$GetUsers$users$edges$node;

  factory CopyWith$Query$GetUsers$users$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers$users$edges$node;

  TRes call({
    String? id,
    String? email,
    List<dynamic>? roles,
    Query$GetUsers$users$edges$node$ownedRestaurant? ownedRestaurant,
    String? $__typename,
  });
  CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<TRes>
  get ownedRestaurant;
}

class _CopyWithImpl$Query$GetUsers$users$edges$node<TRes>
    implements CopyWith$Query$GetUsers$users$edges$node<TRes> {
  _CopyWithImpl$Query$GetUsers$users$edges$node(this._instance, this._then);

  final Query$GetUsers$users$edges$node _instance;

  final TRes Function(Query$GetUsers$users$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? roles = _undefined,
    Object? ownedRestaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUsers$users$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<dynamic>),
      ownedRestaurant: ownedRestaurant == _undefined
          ? _instance.ownedRestaurant
          : (ownedRestaurant
                as Query$GetUsers$users$edges$node$ownedRestaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<TRes>
  get ownedRestaurant {
    final local$ownedRestaurant = _instance.ownedRestaurant;
    return local$ownedRestaurant == null
        ? CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant(
            local$ownedRestaurant,
            (e) => call(ownedRestaurant: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUsers$users$edges$node<TRes>
    implements CopyWith$Query$GetUsers$users$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetUsers$users$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    List<dynamic>? roles,
    Query$GetUsers$users$edges$node$ownedRestaurant? ownedRestaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<TRes>
  get ownedRestaurant =>
      CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant.stub(_res);
}

class Query$GetUsers$users$edges$node$ownedRestaurant {
  Query$GetUsers$users$edges$node$ownedRestaurant({
    required this.id,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetUsers$users$edges$node$ownedRestaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers$users$edges$node$ownedRestaurant(
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
    if (other is! Query$GetUsers$users$edges$node$ownedRestaurant ||
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

extension UtilityExtension$Query$GetUsers$users$edges$node$ownedRestaurant
    on Query$GetUsers$users$edges$node$ownedRestaurant {
  CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<
    Query$GetUsers$users$edges$node$ownedRestaurant
  >
  get copyWith =>
      CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<TRes> {
  factory CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant(
    Query$GetUsers$users$edges$node$ownedRestaurant instance,
    TRes Function(Query$GetUsers$users$edges$node$ownedRestaurant) then,
  ) = _CopyWithImpl$Query$GetUsers$users$edges$node$ownedRestaurant;

  factory CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetUsers$users$edges$node$ownedRestaurant;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Query$GetUsers$users$edges$node$ownedRestaurant<TRes>
    implements CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<TRes> {
  _CopyWithImpl$Query$GetUsers$users$edges$node$ownedRestaurant(
    this._instance,
    this._then,
  );

  final Query$GetUsers$users$edges$node$ownedRestaurant _instance;

  final TRes Function(Query$GetUsers$users$edges$node$ownedRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUsers$users$edges$node$ownedRestaurant(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Query$GetUsers$users$edges$node$ownedRestaurant<TRes>
    implements CopyWith$Query$GetUsers$users$edges$node$ownedRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetUsers$users$edges$node$ownedRestaurant(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}

class Query$GetUsers$users$pageInfo {
  Query$GetUsers$users$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'UserPageInfo',
  });

  factory Query$GetUsers$users$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetUsers$users$pageInfo(
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
    if (other is! Query$GetUsers$users$pageInfo ||
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

extension UtilityExtension$Query$GetUsers$users$pageInfo
    on Query$GetUsers$users$pageInfo {
  CopyWith$Query$GetUsers$users$pageInfo<Query$GetUsers$users$pageInfo>
  get copyWith => CopyWith$Query$GetUsers$users$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetUsers$users$pageInfo<TRes> {
  factory CopyWith$Query$GetUsers$users$pageInfo(
    Query$GetUsers$users$pageInfo instance,
    TRes Function(Query$GetUsers$users$pageInfo) then,
  ) = _CopyWithImpl$Query$GetUsers$users$pageInfo;

  factory CopyWith$Query$GetUsers$users$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUsers$users$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetUsers$users$pageInfo<TRes>
    implements CopyWith$Query$GetUsers$users$pageInfo<TRes> {
  _CopyWithImpl$Query$GetUsers$users$pageInfo(this._instance, this._then);

  final Query$GetUsers$users$pageInfo _instance;

  final TRes Function(Query$GetUsers$users$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUsers$users$pageInfo(
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

class _CopyWithStubImpl$Query$GetUsers$users$pageInfo<TRes>
    implements CopyWith$Query$GetUsers$users$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetUsers$users$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetUser {
  factory Variables$Query$GetUser({required String id}) =>
      Variables$Query$GetUser._({r'id': id});

  Variables$Query$GetUser._(this._$data);

  factory Variables$Query$GetUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetUser._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetUser<Variables$Query$GetUser> get copyWith =>
      CopyWith$Variables$Query$GetUser(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUser || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$GetUser<TRes> {
  factory CopyWith$Variables$Query$GetUser(
    Variables$Query$GetUser instance,
    TRes Function(Variables$Query$GetUser) then,
  ) = _CopyWithImpl$Variables$Query$GetUser;

  factory CopyWith$Variables$Query$GetUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUser;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetUser<TRes>
    implements CopyWith$Variables$Query$GetUser<TRes> {
  _CopyWithImpl$Variables$Query$GetUser(this._instance, this._then);

  final Variables$Query$GetUser _instance;

  final TRes Function(Variables$Query$GetUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetUser._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetUser<TRes>
    implements CopyWith$Variables$Query$GetUser<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUser(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetUser {
  Query$GetUser({this.user, this.$__typename = 'Query'});

  factory Query$GetUser.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetUser(
      user: l$user == null
          ? null
          : Query$GetUser$user.fromJson((l$user as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUser$user? user;

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
    if (other is! Query$GetUser || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetUser on Query$GetUser {
  CopyWith$Query$GetUser<Query$GetUser> get copyWith =>
      CopyWith$Query$GetUser(this, (i) => i);
}

abstract class CopyWith$Query$GetUser<TRes> {
  factory CopyWith$Query$GetUser(
    Query$GetUser instance,
    TRes Function(Query$GetUser) then,
  ) = _CopyWithImpl$Query$GetUser;

  factory CopyWith$Query$GetUser.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUser;

  TRes call({Query$GetUser$user? user, String? $__typename});
  CopyWith$Query$GetUser$user<TRes> get user;
}

class _CopyWithImpl$Query$GetUser<TRes>
    implements CopyWith$Query$GetUser<TRes> {
  _CopyWithImpl$Query$GetUser(this._instance, this._then);

  final Query$GetUser _instance;

  final TRes Function(Query$GetUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUser(
          user: user == _undefined
              ? _instance.user
              : (user as Query$GetUser$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUser$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetUser$user.stub(_then(_instance))
        : CopyWith$Query$GetUser$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Query$GetUser<TRes>
    implements CopyWith$Query$GetUser<TRes> {
  _CopyWithStubImpl$Query$GetUser(this._res);

  TRes _res;

  call({Query$GetUser$user? user, String? $__typename}) => _res;

  CopyWith$Query$GetUser$user<TRes> get user =>
      CopyWith$Query$GetUser$user.stub(_res);
}

const documentNodeQueryGetUser = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUser'),
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
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'roles'),
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
  ],
);
Query$GetUser _parserFn$Query$GetUser(Map<String, dynamic> data) =>
    Query$GetUser.fromJson(data);
typedef OnQueryComplete$Query$GetUser =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetUser?);

class Options$Query$GetUser extends graphql.QueryOptions<Query$GetUser> {
  Options$Query$GetUser({
    String? operationName,
    required Variables$Query$GetUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUser? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUser? onComplete,
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
                 data == null ? null : _parserFn$Query$GetUser(data),
               ),
         onError: onError,
         document: documentNodeQueryGetUser,
         parserFn: _parserFn$Query$GetUser,
       );

  final OnQueryComplete$Query$GetUser? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetUser
    extends graphql.WatchQueryOptions<Query$GetUser> {
  WatchOptions$Query$GetUser({
    String? operationName,
    required Variables$Query$GetUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUser? typedOptimisticResult,
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
         document: documentNodeQueryGetUser,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetUser,
       );
}

class FetchMoreOptions$Query$GetUser extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUser({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUser variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetUser,
       );
}

extension ClientExtension$Query$GetUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUser>> query$GetUser(
    Options$Query$GetUser options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetUser> watchQuery$GetUser(
    WatchOptions$Query$GetUser options,
  ) => this.watchQuery(options);

  void writeQuery$GetUser({
    required Query$GetUser data,
    required Variables$Query$GetUser variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetUser),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetUser? readQuery$GetUser({
    required Variables$Query$GetUser variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetUser),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUser.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUser> useQuery$GetUser(
  Options$Query$GetUser options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetUser> useWatchQuery$GetUser(
  WatchOptions$Query$GetUser options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetUser$Widget extends graphql_flutter.Query<Query$GetUser> {
  Query$GetUser$Widget({
    widgets.Key? key,
    required Options$Query$GetUser options,
    required graphql_flutter.QueryBuilder<Query$GetUser> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetUser$user {
  Query$GetUser$user({
    required this.id,
    required this.email,
    required this.roles,
    this.$__typename = 'User',
  });

  factory Query$GetUser$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$roles = json['roles'];
    final l$$__typename = json['__typename'];
    return Query$GetUser$user(
      id: (l$id as String),
      email: (l$email as String),
      roles: (l$roles as List<dynamic>),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final List<dynamic> roles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$roles = roles;
    _resultData['roles'] = l$roles;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$roles = roles;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$roles, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUser$user || runtimeType != other.runtimeType) {
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
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles != lOther$roles) {
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

extension UtilityExtension$Query$GetUser$user on Query$GetUser$user {
  CopyWith$Query$GetUser$user<Query$GetUser$user> get copyWith =>
      CopyWith$Query$GetUser$user(this, (i) => i);
}

abstract class CopyWith$Query$GetUser$user<TRes> {
  factory CopyWith$Query$GetUser$user(
    Query$GetUser$user instance,
    TRes Function(Query$GetUser$user) then,
  ) = _CopyWithImpl$Query$GetUser$user;

  factory CopyWith$Query$GetUser$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUser$user;

  TRes call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUser$user<TRes>
    implements CopyWith$Query$GetUser$user<TRes> {
  _CopyWithImpl$Query$GetUser$user(this._instance, this._then);

  final Query$GetUser$user _instance;

  final TRes Function(Query$GetUser$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? roles = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUser$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<dynamic>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetUser$user<TRes>
    implements CopyWith$Query$GetUser$user<TRes> {
  _CopyWithStubImpl$Query$GetUser$user(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$UpdateUser {
  factory Variables$Mutation$UpdateUser({
    required Input$updateUserInput input,
  }) => Variables$Mutation$UpdateUser._({r'input': input});

  Variables$Mutation$UpdateUser._(this._$data);

  factory Variables$Mutation$UpdateUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateUserInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateUser._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateUserInput get input => (_$data['input'] as Input$updateUserInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateUser<Variables$Mutation$UpdateUser>
  get copyWith => CopyWith$Variables$Mutation$UpdateUser(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateUser ||
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

abstract class CopyWith$Variables$Mutation$UpdateUser<TRes> {
  factory CopyWith$Variables$Mutation$UpdateUser(
    Variables$Mutation$UpdateUser instance,
    TRes Function(Variables$Mutation$UpdateUser) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateUser;

  factory CopyWith$Variables$Mutation$UpdateUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateUser;

  TRes call({Input$updateUserInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateUser<TRes>
    implements CopyWith$Variables$Mutation$UpdateUser<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateUser(this._instance, this._then);

  final Variables$Mutation$UpdateUser _instance;

  final TRes Function(Variables$Mutation$UpdateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateUser._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateUserInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateUser<TRes>
    implements CopyWith$Variables$Mutation$UpdateUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateUser(this._res);

  TRes _res;

  call({Input$updateUserInput? input}) => _res;
}

class Mutation$UpdateUser {
  Mutation$UpdateUser({this.updateUser, this.$__typename = 'Mutation'});

  factory Mutation$UpdateUser.fromJson(Map<String, dynamic> json) {
    final l$updateUser = json['updateUser'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateUser(
      updateUser: l$updateUser == null
          ? null
          : Mutation$UpdateUser$updateUser.fromJson(
              (l$updateUser as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateUser$updateUser? updateUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateUser = updateUser;
    _resultData['updateUser'] = l$updateUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateUser = updateUser;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateUser, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateUser = updateUser;
    final lOther$updateUser = other.updateUser;
    if (l$updateUser != lOther$updateUser) {
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

extension UtilityExtension$Mutation$UpdateUser on Mutation$UpdateUser {
  CopyWith$Mutation$UpdateUser<Mutation$UpdateUser> get copyWith =>
      CopyWith$Mutation$UpdateUser(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateUser<TRes> {
  factory CopyWith$Mutation$UpdateUser(
    Mutation$UpdateUser instance,
    TRes Function(Mutation$UpdateUser) then,
  ) = _CopyWithImpl$Mutation$UpdateUser;

  factory CopyWith$Mutation$UpdateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateUser;

  TRes call({Mutation$UpdateUser$updateUser? updateUser, String? $__typename});
  CopyWith$Mutation$UpdateUser$updateUser<TRes> get updateUser;
}

class _CopyWithImpl$Mutation$UpdateUser<TRes>
    implements CopyWith$Mutation$UpdateUser<TRes> {
  _CopyWithImpl$Mutation$UpdateUser(this._instance, this._then);

  final Mutation$UpdateUser _instance;

  final TRes Function(Mutation$UpdateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateUser = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateUser(
      updateUser: updateUser == _undefined
          ? _instance.updateUser
          : (updateUser as Mutation$UpdateUser$updateUser?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateUser$updateUser<TRes> get updateUser {
    final local$updateUser = _instance.updateUser;
    return local$updateUser == null
        ? CopyWith$Mutation$UpdateUser$updateUser.stub(_then(_instance))
        : CopyWith$Mutation$UpdateUser$updateUser(
            local$updateUser,
            (e) => call(updateUser: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateUser<TRes>
    implements CopyWith$Mutation$UpdateUser<TRes> {
  _CopyWithStubImpl$Mutation$UpdateUser(this._res);

  TRes _res;

  call({Mutation$UpdateUser$updateUser? updateUser, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UpdateUser$updateUser<TRes> get updateUser =>
      CopyWith$Mutation$UpdateUser$updateUser.stub(_res);
}

const documentNodeMutationUpdateUser = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateUser'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateUserInput'),
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
            name: NameNode(value: 'updateUser'),
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
                  name: NameNode(value: 'user'),
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
                        name: NameNode(value: 'roles'),
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
Mutation$UpdateUser _parserFn$Mutation$UpdateUser(Map<String, dynamic> data) =>
    Mutation$UpdateUser.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateUser =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateUser?);

class Options$Mutation$UpdateUser
    extends graphql.MutationOptions<Mutation$UpdateUser> {
  Options$Mutation$UpdateUser({
    String? operationName,
    required Variables$Mutation$UpdateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateUser>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateUser(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateUser,
         parserFn: _parserFn$Mutation$UpdateUser,
       );

  final OnMutationCompleted$Mutation$UpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateUser
    extends graphql.WatchQueryOptions<Mutation$UpdateUser> {
  WatchOptions$Mutation$UpdateUser({
    String? operationName,
    required Variables$Mutation$UpdateUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateUser? typedOptimisticResult,
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
         document: documentNodeMutationUpdateUser,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateUser,
       );
}

extension ClientExtension$Mutation$UpdateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateUser>> mutate$UpdateUser(
    Options$Mutation$UpdateUser options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateUser> watchMutation$UpdateUser(
    WatchOptions$Mutation$UpdateUser options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateUser$HookResult {
  Mutation$UpdateUser$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateUser runMutation;

  final graphql.QueryResult<Mutation$UpdateUser> result;
}

Mutation$UpdateUser$HookResult useMutation$UpdateUser([
  WidgetOptions$Mutation$UpdateUser? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateUser(),
  );
  return Mutation$UpdateUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateUser> useWatchMutation$UpdateUser(
  WatchOptions$Mutation$UpdateUser options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateUser
    extends graphql.MutationOptions<Mutation$UpdateUser> {
  WidgetOptions$Mutation$UpdateUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateUser>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateUser(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateUser,
         parserFn: _parserFn$Mutation$UpdateUser,
       );

  final OnMutationCompleted$Mutation$UpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateUser =
    graphql.MultiSourceResult<Mutation$UpdateUser> Function(
      Variables$Mutation$UpdateUser, {
      Object? optimisticResult,
      Mutation$UpdateUser? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateUser =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateUser,
      graphql.QueryResult<Mutation$UpdateUser>?,
    );

class Mutation$UpdateUser$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateUser> {
  Mutation$UpdateUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateUser? options,
    required Builder$Mutation$UpdateUser builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateUser(),
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

class Mutation$UpdateUser$updateUser {
  Mutation$UpdateUser$updateUser({
    this.user,
    this.$__typename = 'updateUserPayload',
  });

  factory Mutation$UpdateUser$updateUser.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateUser$updateUser(
      user: l$user == null
          ? null
          : Mutation$UpdateUser$updateUser$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateUser$updateUser$user? user;

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
    if (other is! Mutation$UpdateUser$updateUser ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$UpdateUser$updateUser
    on Mutation$UpdateUser$updateUser {
  CopyWith$Mutation$UpdateUser$updateUser<Mutation$UpdateUser$updateUser>
  get copyWith => CopyWith$Mutation$UpdateUser$updateUser(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateUser$updateUser<TRes> {
  factory CopyWith$Mutation$UpdateUser$updateUser(
    Mutation$UpdateUser$updateUser instance,
    TRes Function(Mutation$UpdateUser$updateUser) then,
  ) = _CopyWithImpl$Mutation$UpdateUser$updateUser;

  factory CopyWith$Mutation$UpdateUser$updateUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateUser$updateUser;

  TRes call({Mutation$UpdateUser$updateUser$user? user, String? $__typename});
  CopyWith$Mutation$UpdateUser$updateUser$user<TRes> get user;
}

class _CopyWithImpl$Mutation$UpdateUser$updateUser<TRes>
    implements CopyWith$Mutation$UpdateUser$updateUser<TRes> {
  _CopyWithImpl$Mutation$UpdateUser$updateUser(this._instance, this._then);

  final Mutation$UpdateUser$updateUser _instance;

  final TRes Function(Mutation$UpdateUser$updateUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$UpdateUser$updateUser(
          user: user == _undefined
              ? _instance.user
              : (user as Mutation$UpdateUser$updateUser$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$UpdateUser$updateUser$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Mutation$UpdateUser$updateUser$user.stub(_then(_instance))
        : CopyWith$Mutation$UpdateUser$updateUser$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateUser$updateUser<TRes>
    implements CopyWith$Mutation$UpdateUser$updateUser<TRes> {
  _CopyWithStubImpl$Mutation$UpdateUser$updateUser(this._res);

  TRes _res;

  call({Mutation$UpdateUser$updateUser$user? user, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UpdateUser$updateUser$user<TRes> get user =>
      CopyWith$Mutation$UpdateUser$updateUser$user.stub(_res);
}

class Mutation$UpdateUser$updateUser$user {
  Mutation$UpdateUser$updateUser$user({
    required this.id,
    required this.email,
    required this.roles,
    this.$__typename = 'User',
  });

  factory Mutation$UpdateUser$updateUser$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$roles = json['roles'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateUser$updateUser$user(
      id: (l$id as String),
      email: (l$email as String),
      roles: (l$roles as List<dynamic>),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final List<dynamic> roles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$roles = roles;
    _resultData['roles'] = l$roles;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$roles = roles;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$email, l$roles, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateUser$updateUser$user ||
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
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (l$roles != lOther$roles) {
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

extension UtilityExtension$Mutation$UpdateUser$updateUser$user
    on Mutation$UpdateUser$updateUser$user {
  CopyWith$Mutation$UpdateUser$updateUser$user<
    Mutation$UpdateUser$updateUser$user
  >
  get copyWith => CopyWith$Mutation$UpdateUser$updateUser$user(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateUser$updateUser$user<TRes> {
  factory CopyWith$Mutation$UpdateUser$updateUser$user(
    Mutation$UpdateUser$updateUser$user instance,
    TRes Function(Mutation$UpdateUser$updateUser$user) then,
  ) = _CopyWithImpl$Mutation$UpdateUser$updateUser$user;

  factory CopyWith$Mutation$UpdateUser$updateUser$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateUser$updateUser$user;

  TRes call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateUser$updateUser$user<TRes>
    implements CopyWith$Mutation$UpdateUser$updateUser$user<TRes> {
  _CopyWithImpl$Mutation$UpdateUser$updateUser$user(this._instance, this._then);

  final Mutation$UpdateUser$updateUser$user _instance;

  final TRes Function(Mutation$UpdateUser$updateUser$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? roles = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateUser$updateUser$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<dynamic>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateUser$updateUser$user<TRes>
    implements CopyWith$Mutation$UpdateUser$updateUser$user<TRes> {
  _CopyWithStubImpl$Mutation$UpdateUser$updateUser$user(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$DeleteUser {
  factory Variables$Mutation$DeleteUser({
    required Input$deleteUserInput input,
  }) => Variables$Mutation$DeleteUser._({r'input': input});

  Variables$Mutation$DeleteUser._(this._$data);

  factory Variables$Mutation$DeleteUser.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteUserInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteUser._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteUserInput get input => (_$data['input'] as Input$deleteUserInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteUser<Variables$Mutation$DeleteUser>
  get copyWith => CopyWith$Variables$Mutation$DeleteUser(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteUser ||
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

abstract class CopyWith$Variables$Mutation$DeleteUser<TRes> {
  factory CopyWith$Variables$Mutation$DeleteUser(
    Variables$Mutation$DeleteUser instance,
    TRes Function(Variables$Mutation$DeleteUser) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteUser;

  factory CopyWith$Variables$Mutation$DeleteUser.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteUser;

  TRes call({Input$deleteUserInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteUser<TRes>
    implements CopyWith$Variables$Mutation$DeleteUser<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteUser(this._instance, this._then);

  final Variables$Mutation$DeleteUser _instance;

  final TRes Function(Variables$Mutation$DeleteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteUser._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteUserInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteUser<TRes>
    implements CopyWith$Variables$Mutation$DeleteUser<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteUser(this._res);

  TRes _res;

  call({Input$deleteUserInput? input}) => _res;
}

class Mutation$DeleteUser {
  Mutation$DeleteUser({this.deleteUser, this.$__typename = 'Mutation'});

  factory Mutation$DeleteUser.fromJson(Map<String, dynamic> json) {
    final l$deleteUser = json['deleteUser'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteUser(
      deleteUser: l$deleteUser == null
          ? null
          : Mutation$DeleteUser$deleteUser.fromJson(
              (l$deleteUser as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteUser$deleteUser? deleteUser;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteUser = deleteUser;
    _resultData['deleteUser'] = l$deleteUser?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteUser = deleteUser;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteUser, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteUser || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteUser = deleteUser;
    final lOther$deleteUser = other.deleteUser;
    if (l$deleteUser != lOther$deleteUser) {
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

extension UtilityExtension$Mutation$DeleteUser on Mutation$DeleteUser {
  CopyWith$Mutation$DeleteUser<Mutation$DeleteUser> get copyWith =>
      CopyWith$Mutation$DeleteUser(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteUser<TRes> {
  factory CopyWith$Mutation$DeleteUser(
    Mutation$DeleteUser instance,
    TRes Function(Mutation$DeleteUser) then,
  ) = _CopyWithImpl$Mutation$DeleteUser;

  factory CopyWith$Mutation$DeleteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteUser;

  TRes call({Mutation$DeleteUser$deleteUser? deleteUser, String? $__typename});
  CopyWith$Mutation$DeleteUser$deleteUser<TRes> get deleteUser;
}

class _CopyWithImpl$Mutation$DeleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser<TRes> {
  _CopyWithImpl$Mutation$DeleteUser(this._instance, this._then);

  final Mutation$DeleteUser _instance;

  final TRes Function(Mutation$DeleteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteUser = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteUser(
      deleteUser: deleteUser == _undefined
          ? _instance.deleteUser
          : (deleteUser as Mutation$DeleteUser$deleteUser?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteUser$deleteUser<TRes> get deleteUser {
    final local$deleteUser = _instance.deleteUser;
    return local$deleteUser == null
        ? CopyWith$Mutation$DeleteUser$deleteUser.stub(_then(_instance))
        : CopyWith$Mutation$DeleteUser$deleteUser(
            local$deleteUser,
            (e) => call(deleteUser: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser<TRes> {
  _CopyWithStubImpl$Mutation$DeleteUser(this._res);

  TRes _res;

  call({Mutation$DeleteUser$deleteUser? deleteUser, String? $__typename}) =>
      _res;

  CopyWith$Mutation$DeleteUser$deleteUser<TRes> get deleteUser =>
      CopyWith$Mutation$DeleteUser$deleteUser.stub(_res);
}

const documentNodeMutationDeleteUser = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteUser'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteUserInput'),
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
            name: NameNode(value: 'deleteUser'),
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
                  name: NameNode(value: 'user'),
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
Mutation$DeleteUser _parserFn$Mutation$DeleteUser(Map<String, dynamic> data) =>
    Mutation$DeleteUser.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteUser =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteUser?);

class Options$Mutation$DeleteUser
    extends graphql.MutationOptions<Mutation$DeleteUser> {
  Options$Mutation$DeleteUser({
    String? operationName,
    required Variables$Mutation$DeleteUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteUser>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteUser(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteUser,
         parserFn: _parserFn$Mutation$DeleteUser,
       );

  final OnMutationCompleted$Mutation$DeleteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteUser
    extends graphql.WatchQueryOptions<Mutation$DeleteUser> {
  WatchOptions$Mutation$DeleteUser({
    String? operationName,
    required Variables$Mutation$DeleteUser variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteUser? typedOptimisticResult,
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
         document: documentNodeMutationDeleteUser,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteUser,
       );
}

extension ClientExtension$Mutation$DeleteUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteUser>> mutate$DeleteUser(
    Options$Mutation$DeleteUser options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteUser> watchMutation$DeleteUser(
    WatchOptions$Mutation$DeleteUser options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteUser$HookResult {
  Mutation$DeleteUser$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteUser runMutation;

  final graphql.QueryResult<Mutation$DeleteUser> result;
}

Mutation$DeleteUser$HookResult useMutation$DeleteUser([
  WidgetOptions$Mutation$DeleteUser? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteUser(),
  );
  return Mutation$DeleteUser$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteUser> useWatchMutation$DeleteUser(
  WatchOptions$Mutation$DeleteUser options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteUser
    extends graphql.MutationOptions<Mutation$DeleteUser> {
  WidgetOptions$Mutation$DeleteUser({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteUser? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteUser? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteUser>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteUser(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteUser,
         parserFn: _parserFn$Mutation$DeleteUser,
       );

  final OnMutationCompleted$Mutation$DeleteUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteUser =
    graphql.MultiSourceResult<Mutation$DeleteUser> Function(
      Variables$Mutation$DeleteUser, {
      Object? optimisticResult,
      Mutation$DeleteUser? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteUser =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteUser,
      graphql.QueryResult<Mutation$DeleteUser>?,
    );

class Mutation$DeleteUser$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteUser> {
  Mutation$DeleteUser$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteUser? options,
    required Builder$Mutation$DeleteUser builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteUser(),
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

class Mutation$DeleteUser$deleteUser {
  Mutation$DeleteUser$deleteUser({
    this.user,
    this.$__typename = 'deleteUserPayload',
  });

  factory Mutation$DeleteUser$deleteUser.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteUser$deleteUser(
      user: l$user == null
          ? null
          : Mutation$DeleteUser$deleteUser$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteUser$deleteUser$user? user;

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
    if (other is! Mutation$DeleteUser$deleteUser ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$DeleteUser$deleteUser
    on Mutation$DeleteUser$deleteUser {
  CopyWith$Mutation$DeleteUser$deleteUser<Mutation$DeleteUser$deleteUser>
  get copyWith => CopyWith$Mutation$DeleteUser$deleteUser(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteUser$deleteUser<TRes> {
  factory CopyWith$Mutation$DeleteUser$deleteUser(
    Mutation$DeleteUser$deleteUser instance,
    TRes Function(Mutation$DeleteUser$deleteUser) then,
  ) = _CopyWithImpl$Mutation$DeleteUser$deleteUser;

  factory CopyWith$Mutation$DeleteUser$deleteUser.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteUser$deleteUser;

  TRes call({Mutation$DeleteUser$deleteUser$user? user, String? $__typename});
  CopyWith$Mutation$DeleteUser$deleteUser$user<TRes> get user;
}

class _CopyWithImpl$Mutation$DeleteUser$deleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser$deleteUser<TRes> {
  _CopyWithImpl$Mutation$DeleteUser$deleteUser(this._instance, this._then);

  final Mutation$DeleteUser$deleteUser _instance;

  final TRes Function(Mutation$DeleteUser$deleteUser) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteUser$deleteUser(
          user: user == _undefined
              ? _instance.user
              : (user as Mutation$DeleteUser$deleteUser$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$DeleteUser$deleteUser$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Mutation$DeleteUser$deleteUser$user.stub(_then(_instance))
        : CopyWith$Mutation$DeleteUser$deleteUser$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteUser$deleteUser<TRes>
    implements CopyWith$Mutation$DeleteUser$deleteUser<TRes> {
  _CopyWithStubImpl$Mutation$DeleteUser$deleteUser(this._res);

  TRes _res;

  call({Mutation$DeleteUser$deleteUser$user? user, String? $__typename}) =>
      _res;

  CopyWith$Mutation$DeleteUser$deleteUser$user<TRes> get user =>
      CopyWith$Mutation$DeleteUser$deleteUser$user.stub(_res);
}

class Mutation$DeleteUser$deleteUser$user {
  Mutation$DeleteUser$deleteUser$user({
    required this.id,
    this.$__typename = 'User',
  });

  factory Mutation$DeleteUser$deleteUser$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteUser$deleteUser$user(
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
    if (other is! Mutation$DeleteUser$deleteUser$user ||
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

extension UtilityExtension$Mutation$DeleteUser$deleteUser$user
    on Mutation$DeleteUser$deleteUser$user {
  CopyWith$Mutation$DeleteUser$deleteUser$user<
    Mutation$DeleteUser$deleteUser$user
  >
  get copyWith => CopyWith$Mutation$DeleteUser$deleteUser$user(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteUser$deleteUser$user<TRes> {
  factory CopyWith$Mutation$DeleteUser$deleteUser$user(
    Mutation$DeleteUser$deleteUser$user instance,
    TRes Function(Mutation$DeleteUser$deleteUser$user) then,
  ) = _CopyWithImpl$Mutation$DeleteUser$deleteUser$user;

  factory CopyWith$Mutation$DeleteUser$deleteUser$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteUser$deleteUser$user;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteUser$deleteUser$user<TRes>
    implements CopyWith$Mutation$DeleteUser$deleteUser$user<TRes> {
  _CopyWithImpl$Mutation$DeleteUser$deleteUser$user(this._instance, this._then);

  final Mutation$DeleteUser$deleteUser$user _instance;

  final TRes Function(Mutation$DeleteUser$deleteUser$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteUser$deleteUser$user(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteUser$deleteUser$user<TRes>
    implements CopyWith$Mutation$DeleteUser$deleteUser$user<TRes> {
  _CopyWithStubImpl$Mutation$DeleteUser$deleteUser$user(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}

class Variables$Query$GetMyCustomMealPlans {
  factory Variables$Query$GetMyCustomMealPlans({
    required String id,
    String? search,
  }) => Variables$Query$GetMyCustomMealPlans._({
    r'id': id,
    if (search != null) r'search': search,
  });

  Variables$Query$GetMyCustomMealPlans._(this._$data);

  factory Variables$Query$GetMyCustomMealPlans.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    return Variables$Query$GetMyCustomMealPlans._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get search => (_$data['search'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMyCustomMealPlans<
    Variables$Query$GetMyCustomMealPlans
  >
  get copyWith => CopyWith$Variables$Query$GetMyCustomMealPlans(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMyCustomMealPlans ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$search = search;
    return Object.hashAll([
      l$id,
      _$data.containsKey('search') ? l$search : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetMyCustomMealPlans<TRes> {
  factory CopyWith$Variables$Query$GetMyCustomMealPlans(
    Variables$Query$GetMyCustomMealPlans instance,
    TRes Function(Variables$Query$GetMyCustomMealPlans) then,
  ) = _CopyWithImpl$Variables$Query$GetMyCustomMealPlans;

  factory CopyWith$Variables$Query$GetMyCustomMealPlans.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMyCustomMealPlans;

  TRes call({String? id, String? search});
}

class _CopyWithImpl$Variables$Query$GetMyCustomMealPlans<TRes>
    implements CopyWith$Variables$Query$GetMyCustomMealPlans<TRes> {
  _CopyWithImpl$Variables$Query$GetMyCustomMealPlans(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMyCustomMealPlans _instance;

  final TRes Function(Variables$Query$GetMyCustomMealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? search = _undefined}) => _then(
    Variables$Query$GetMyCustomMealPlans._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (search != _undefined) 'search': (search as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMyCustomMealPlans<TRes>
    implements CopyWith$Variables$Query$GetMyCustomMealPlans<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMyCustomMealPlans(this._res);

  TRes _res;

  call({String? id, String? search}) => _res;
}

class Query$GetMyCustomMealPlans {
  Query$GetMyCustomMealPlans({this.user, this.$__typename = 'Query'});

  factory Query$GetMyCustomMealPlans.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMyCustomMealPlans(
      user: l$user == null
          ? null
          : Query$GetMyCustomMealPlans$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMyCustomMealPlans$user? user;

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
    if (other is! Query$GetMyCustomMealPlans ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetMyCustomMealPlans
    on Query$GetMyCustomMealPlans {
  CopyWith$Query$GetMyCustomMealPlans<Query$GetMyCustomMealPlans>
  get copyWith => CopyWith$Query$GetMyCustomMealPlans(this, (i) => i);
}

abstract class CopyWith$Query$GetMyCustomMealPlans<TRes> {
  factory CopyWith$Query$GetMyCustomMealPlans(
    Query$GetMyCustomMealPlans instance,
    TRes Function(Query$GetMyCustomMealPlans) then,
  ) = _CopyWithImpl$Query$GetMyCustomMealPlans;

  factory CopyWith$Query$GetMyCustomMealPlans.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyCustomMealPlans;

  TRes call({Query$GetMyCustomMealPlans$user? user, String? $__typename});
  CopyWith$Query$GetMyCustomMealPlans$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMyCustomMealPlans<TRes>
    implements CopyWith$Query$GetMyCustomMealPlans<TRes> {
  _CopyWithImpl$Query$GetMyCustomMealPlans(this._instance, this._then);

  final Query$GetMyCustomMealPlans _instance;

  final TRes Function(Query$GetMyCustomMealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMyCustomMealPlans(
          user: user == _undefined
              ? _instance.user
              : (user as Query$GetMyCustomMealPlans$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetMyCustomMealPlans$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetMyCustomMealPlans$user.stub(_then(_instance))
        : CopyWith$Query$GetMyCustomMealPlans$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMyCustomMealPlans<TRes>
    implements CopyWith$Query$GetMyCustomMealPlans<TRes> {
  _CopyWithStubImpl$Query$GetMyCustomMealPlans(this._res);

  TRes _res;

  call({Query$GetMyCustomMealPlans$user? user, String? $__typename}) => _res;

  CopyWith$Query$GetMyCustomMealPlans$user<TRes> get user =>
      CopyWith$Query$GetMyCustomMealPlans$user.stub(_res);
}

const documentNodeQueryGetMyCustomMealPlans = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMyCustomMealPlans'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'id')),
          type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
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
                  name: NameNode(value: 'customMealPlans'),
                  alias: null,
                  arguments: [
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
                                    name: NameNode(
                                      value: 'MealPlanSummaryFragment',
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
    fragmentDefinitionMealPlanSummaryFragment,
  ],
);
Query$GetMyCustomMealPlans _parserFn$Query$GetMyCustomMealPlans(
  Map<String, dynamic> data,
) => Query$GetMyCustomMealPlans.fromJson(data);
typedef OnQueryComplete$Query$GetMyCustomMealPlans =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMyCustomMealPlans?);

class Options$Query$GetMyCustomMealPlans
    extends graphql.QueryOptions<Query$GetMyCustomMealPlans> {
  Options$Query$GetMyCustomMealPlans({
    String? operationName,
    required Variables$Query$GetMyCustomMealPlans variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyCustomMealPlans? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMyCustomMealPlans? onComplete,
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
                     : _parserFn$Query$GetMyCustomMealPlans(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMyCustomMealPlans,
         parserFn: _parserFn$Query$GetMyCustomMealPlans,
       );

  final OnQueryComplete$Query$GetMyCustomMealPlans? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMyCustomMealPlans
    extends graphql.WatchQueryOptions<Query$GetMyCustomMealPlans> {
  WatchOptions$Query$GetMyCustomMealPlans({
    String? operationName,
    required Variables$Query$GetMyCustomMealPlans variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyCustomMealPlans? typedOptimisticResult,
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
         document: documentNodeQueryGetMyCustomMealPlans,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMyCustomMealPlans,
       );
}

class FetchMoreOptions$Query$GetMyCustomMealPlans
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMyCustomMealPlans({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMyCustomMealPlans variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetMyCustomMealPlans,
       );
}

extension ClientExtension$Query$GetMyCustomMealPlans on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMyCustomMealPlans>>
  query$GetMyCustomMealPlans(
    Options$Query$GetMyCustomMealPlans options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetMyCustomMealPlans>
  watchQuery$GetMyCustomMealPlans(
    WatchOptions$Query$GetMyCustomMealPlans options,
  ) => this.watchQuery(options);

  void writeQuery$GetMyCustomMealPlans({
    required Query$GetMyCustomMealPlans data,
    required Variables$Query$GetMyCustomMealPlans variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetMyCustomMealPlans,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMyCustomMealPlans? readQuery$GetMyCustomMealPlans({
    required Variables$Query$GetMyCustomMealPlans variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetMyCustomMealPlans,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMyCustomMealPlans.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMyCustomMealPlans>
useQuery$GetMyCustomMealPlans(Options$Query$GetMyCustomMealPlans options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMyCustomMealPlans>
useWatchQuery$GetMyCustomMealPlans(
  WatchOptions$Query$GetMyCustomMealPlans options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetMyCustomMealPlans$Widget
    extends graphql_flutter.Query<Query$GetMyCustomMealPlans> {
  Query$GetMyCustomMealPlans$Widget({
    widgets.Key? key,
    required Options$Query$GetMyCustomMealPlans options,
    required graphql_flutter.QueryBuilder<Query$GetMyCustomMealPlans> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetMyCustomMealPlans$user {
  Query$GetMyCustomMealPlans$user({
    required this.id,
    this.customMealPlans,
    this.$__typename = 'User',
  });

  factory Query$GetMyCustomMealPlans$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$customMealPlans = json['customMealPlans'];
    final l$$__typename = json['__typename'];
    return Query$GetMyCustomMealPlans$user(
      id: (l$id as String),
      customMealPlans: l$customMealPlans == null
          ? null
          : Query$GetMyCustomMealPlans$user$customMealPlans.fromJson(
              (l$customMealPlans as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetMyCustomMealPlans$user$customMealPlans? customMealPlans;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$customMealPlans = customMealPlans;
    _resultData['customMealPlans'] = l$customMealPlans?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customMealPlans = customMealPlans;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$customMealPlans, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyCustomMealPlans$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$customMealPlans = customMealPlans;
    final lOther$customMealPlans = other.customMealPlans;
    if (l$customMealPlans != lOther$customMealPlans) {
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

extension UtilityExtension$Query$GetMyCustomMealPlans$user
    on Query$GetMyCustomMealPlans$user {
  CopyWith$Query$GetMyCustomMealPlans$user<Query$GetMyCustomMealPlans$user>
  get copyWith => CopyWith$Query$GetMyCustomMealPlans$user(this, (i) => i);
}

abstract class CopyWith$Query$GetMyCustomMealPlans$user<TRes> {
  factory CopyWith$Query$GetMyCustomMealPlans$user(
    Query$GetMyCustomMealPlans$user instance,
    TRes Function(Query$GetMyCustomMealPlans$user) then,
  ) = _CopyWithImpl$Query$GetMyCustomMealPlans$user;

  factory CopyWith$Query$GetMyCustomMealPlans$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyCustomMealPlans$user;

  TRes call({
    String? id,
    Query$GetMyCustomMealPlans$user$customMealPlans? customMealPlans,
    String? $__typename,
  });
  CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<TRes>
  get customMealPlans;
}

class _CopyWithImpl$Query$GetMyCustomMealPlans$user<TRes>
    implements CopyWith$Query$GetMyCustomMealPlans$user<TRes> {
  _CopyWithImpl$Query$GetMyCustomMealPlans$user(this._instance, this._then);

  final Query$GetMyCustomMealPlans$user _instance;

  final TRes Function(Query$GetMyCustomMealPlans$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customMealPlans = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMyCustomMealPlans$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      customMealPlans: customMealPlans == _undefined
          ? _instance.customMealPlans
          : (customMealPlans
                as Query$GetMyCustomMealPlans$user$customMealPlans?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<TRes>
  get customMealPlans {
    final local$customMealPlans = _instance.customMealPlans;
    return local$customMealPlans == null
        ? CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans(
            local$customMealPlans,
            (e) => call(customMealPlans: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMyCustomMealPlans$user<TRes>
    implements CopyWith$Query$GetMyCustomMealPlans$user<TRes> {
  _CopyWithStubImpl$Query$GetMyCustomMealPlans$user(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetMyCustomMealPlans$user$customMealPlans? customMealPlans,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<TRes>
  get customMealPlans =>
      CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans.stub(_res);
}

class Query$GetMyCustomMealPlans$user$customMealPlans {
  Query$GetMyCustomMealPlans$user$customMealPlans({
    this.edges,
    this.$__typename = 'MealPlanCursorConnection',
  });

  factory Query$GetMyCustomMealPlans$user$customMealPlans.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetMyCustomMealPlans$user$customMealPlans(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetMyCustomMealPlans$user$customMealPlans$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMyCustomMealPlans$user$customMealPlans$edges?>? edges;

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
    if (other is! Query$GetMyCustomMealPlans$user$customMealPlans ||
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

extension UtilityExtension$Query$GetMyCustomMealPlans$user$customMealPlans
    on Query$GetMyCustomMealPlans$user$customMealPlans {
  CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<
    Query$GetMyCustomMealPlans$user$customMealPlans
  >
  get copyWith =>
      CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans(this, (i) => i);
}

abstract class CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<TRes> {
  factory CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans(
    Query$GetMyCustomMealPlans$user$customMealPlans instance,
    TRes Function(Query$GetMyCustomMealPlans$user$customMealPlans) then,
  ) = _CopyWithImpl$Query$GetMyCustomMealPlans$user$customMealPlans;

  factory CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMyCustomMealPlans$user$customMealPlans;

  TRes call({
    List<Query$GetMyCustomMealPlans$user$customMealPlans$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetMyCustomMealPlans$user$customMealPlans$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges<
          Query$GetMyCustomMealPlans$user$customMealPlans$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetMyCustomMealPlans$user$customMealPlans<TRes>
    implements CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<TRes> {
  _CopyWithImpl$Query$GetMyCustomMealPlans$user$customMealPlans(
    this._instance,
    this._then,
  );

  final Query$GetMyCustomMealPlans$user$customMealPlans _instance;

  final TRes Function(Query$GetMyCustomMealPlans$user$customMealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMyCustomMealPlans$user$customMealPlans(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Query$GetMyCustomMealPlans$user$customMealPlans$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetMyCustomMealPlans$user$customMealPlans$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges<
          Query$GetMyCustomMealPlans$user$customMealPlans$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetMyCustomMealPlans$user$customMealPlans<TRes>
    implements CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans<TRes> {
  _CopyWithStubImpl$Query$GetMyCustomMealPlans$user$customMealPlans(this._res);

  TRes _res;

  call({
    List<Query$GetMyCustomMealPlans$user$customMealPlans$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetMyCustomMealPlans$user$customMealPlans$edges {
  Query$GetMyCustomMealPlans$user$customMealPlans$edges({
    this.node,
    this.$__typename = 'MealPlanEdge',
  });

  factory Query$GetMyCustomMealPlans$user$customMealPlans$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetMyCustomMealPlans$user$customMealPlans$edges(
      node: l$node == null
          ? null
          : Fragment$MealPlanSummaryFragment.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealPlanSummaryFragment? node;

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
    if (other is! Query$GetMyCustomMealPlans$user$customMealPlans$edges ||
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

extension UtilityExtension$Query$GetMyCustomMealPlans$user$customMealPlans$edges
    on Query$GetMyCustomMealPlans$user$customMealPlans$edges {
  CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges<
    Query$GetMyCustomMealPlans$user$customMealPlans$edges
  >
  get copyWith =>
      CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges<
  TRes
> {
  factory CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges(
    Query$GetMyCustomMealPlans$user$customMealPlans$edges instance,
    TRes Function(Query$GetMyCustomMealPlans$user$customMealPlans$edges) then,
  ) = _CopyWithImpl$Query$GetMyCustomMealPlans$user$customMealPlans$edges;

  factory CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMyCustomMealPlans$user$customMealPlans$edges;

  TRes call({Fragment$MealPlanSummaryFragment? node, String? $__typename});
  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetMyCustomMealPlans$user$customMealPlans$edges<TRes>
    implements
        CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges<TRes> {
  _CopyWithImpl$Query$GetMyCustomMealPlans$user$customMealPlans$edges(
    this._instance,
    this._then,
  );

  final Query$GetMyCustomMealPlans$user$customMealPlans$edges _instance;

  final TRes Function(Query$GetMyCustomMealPlans$user$customMealPlans$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMyCustomMealPlans$user$customMealPlans$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$MealPlanSummaryFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$MealPlanSummaryFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanSummaryFragment(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMyCustomMealPlans$user$customMealPlans$edges<
  TRes
>
    implements
        CopyWith$Query$GetMyCustomMealPlans$user$customMealPlans$edges<TRes> {
  _CopyWithStubImpl$Query$GetMyCustomMealPlans$user$customMealPlans$edges(
    this._res,
  );

  TRes _res;

  call({Fragment$MealPlanSummaryFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node =>
      CopyWith$Fragment$MealPlanSummaryFragment.stub(_res);
}
