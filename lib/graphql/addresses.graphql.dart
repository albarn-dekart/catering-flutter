import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetUserAddresses {
  factory Variables$Query$GetUserAddresses({required String id}) =>
      Variables$Query$GetUserAddresses._({r'id': id});

  Variables$Query$GetUserAddresses._(this._$data);

  factory Variables$Query$GetUserAddresses.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetUserAddresses._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetUserAddresses<Variables$Query$GetUserAddresses>
  get copyWith => CopyWith$Variables$Query$GetUserAddresses(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUserAddresses ||
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

abstract class CopyWith$Variables$Query$GetUserAddresses<TRes> {
  factory CopyWith$Variables$Query$GetUserAddresses(
    Variables$Query$GetUserAddresses instance,
    TRes Function(Variables$Query$GetUserAddresses) then,
  ) = _CopyWithImpl$Variables$Query$GetUserAddresses;

  factory CopyWith$Variables$Query$GetUserAddresses.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUserAddresses;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetUserAddresses<TRes>
    implements CopyWith$Variables$Query$GetUserAddresses<TRes> {
  _CopyWithImpl$Variables$Query$GetUserAddresses(this._instance, this._then);

  final Variables$Query$GetUserAddresses _instance;

  final TRes Function(Variables$Query$GetUserAddresses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetUserAddresses._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetUserAddresses<TRes>
    implements CopyWith$Variables$Query$GetUserAddresses<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUserAddresses(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetUserAddresses {
  Query$GetUserAddresses({this.user, this.$__typename = 'Query'});

  factory Query$GetUserAddresses.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAddresses(
      user: l$user == null
          ? null
          : Query$GetUserAddresses$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUserAddresses$user? user;

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
    if (other is! Query$GetUserAddresses || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetUserAddresses on Query$GetUserAddresses {
  CopyWith$Query$GetUserAddresses<Query$GetUserAddresses> get copyWith =>
      CopyWith$Query$GetUserAddresses(this, (i) => i);
}

abstract class CopyWith$Query$GetUserAddresses<TRes> {
  factory CopyWith$Query$GetUserAddresses(
    Query$GetUserAddresses instance,
    TRes Function(Query$GetUserAddresses) then,
  ) = _CopyWithImpl$Query$GetUserAddresses;

  factory CopyWith$Query$GetUserAddresses.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserAddresses;

  TRes call({Query$GetUserAddresses$user? user, String? $__typename});
  CopyWith$Query$GetUserAddresses$user<TRes> get user;
}

class _CopyWithImpl$Query$GetUserAddresses<TRes>
    implements CopyWith$Query$GetUserAddresses<TRes> {
  _CopyWithImpl$Query$GetUserAddresses(this._instance, this._then);

  final Query$GetUserAddresses _instance;

  final TRes Function(Query$GetUserAddresses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUserAddresses(
          user: user == _undefined
              ? _instance.user
              : (user as Query$GetUserAddresses$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUserAddresses$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetUserAddresses$user.stub(_then(_instance))
        : CopyWith$Query$GetUserAddresses$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserAddresses<TRes>
    implements CopyWith$Query$GetUserAddresses<TRes> {
  _CopyWithStubImpl$Query$GetUserAddresses(this._res);

  TRes _res;

  call({Query$GetUserAddresses$user? user, String? $__typename}) => _res;

  CopyWith$Query$GetUserAddresses$user<TRes> get user =>
      CopyWith$Query$GetUserAddresses$user.stub(_res);
}

const documentNodeQueryGetUserAddresses = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUserAddresses'),
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
                  name: NameNode(value: 'addresses'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                      name: NameNode(value: 'first'),
                      value: IntValueNode(value: '100'),
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
                                    name: NameNode(value: 'firstName'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'lastName'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'phoneNumber'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'street'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'apartment'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'city'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'zipCode'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'isDefault'),
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
Query$GetUserAddresses _parserFn$Query$GetUserAddresses(
  Map<String, dynamic> data,
) => Query$GetUserAddresses.fromJson(data);
typedef OnQueryComplete$Query$GetUserAddresses =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetUserAddresses?);

class Options$Query$GetUserAddresses
    extends graphql.QueryOptions<Query$GetUserAddresses> {
  Options$Query$GetUserAddresses({
    String? operationName,
    required Variables$Query$GetUserAddresses variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserAddresses? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserAddresses? onComplete,
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
                 data == null ? null : _parserFn$Query$GetUserAddresses(data),
               ),
         onError: onError,
         document: documentNodeQueryGetUserAddresses,
         parserFn: _parserFn$Query$GetUserAddresses,
       );

  final OnQueryComplete$Query$GetUserAddresses? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetUserAddresses
    extends graphql.WatchQueryOptions<Query$GetUserAddresses> {
  WatchOptions$Query$GetUserAddresses({
    String? operationName,
    required Variables$Query$GetUserAddresses variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserAddresses? typedOptimisticResult,
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
         document: documentNodeQueryGetUserAddresses,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetUserAddresses,
       );
}

class FetchMoreOptions$Query$GetUserAddresses extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserAddresses({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUserAddresses variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetUserAddresses,
       );
}

extension ClientExtension$Query$GetUserAddresses on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserAddresses>> query$GetUserAddresses(
    Options$Query$GetUserAddresses options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetUserAddresses> watchQuery$GetUserAddresses(
    WatchOptions$Query$GetUserAddresses options,
  ) => this.watchQuery(options);

  void writeQuery$GetUserAddresses({
    required Query$GetUserAddresses data,
    required Variables$Query$GetUserAddresses variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetUserAddresses),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetUserAddresses? readQuery$GetUserAddresses({
    required Variables$Query$GetUserAddresses variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetUserAddresses,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserAddresses.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserAddresses>
useQuery$GetUserAddresses(Options$Query$GetUserAddresses options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetUserAddresses> useWatchQuery$GetUserAddresses(
  WatchOptions$Query$GetUserAddresses options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetUserAddresses$Widget
    extends graphql_flutter.Query<Query$GetUserAddresses> {
  Query$GetUserAddresses$Widget({
    widgets.Key? key,
    required Options$Query$GetUserAddresses options,
    required graphql_flutter.QueryBuilder<Query$GetUserAddresses> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetUserAddresses$user {
  Query$GetUserAddresses$user({
    required this.id,
    this.addresses,
    this.$__typename = 'User',
  });

  factory Query$GetUserAddresses$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$addresses = json['addresses'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAddresses$user(
      id: (l$id as String),
      addresses: l$addresses == null
          ? null
          : Query$GetUserAddresses$user$addresses.fromJson(
              (l$addresses as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetUserAddresses$user$addresses? addresses;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$addresses = addresses;
    _resultData['addresses'] = l$addresses?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$addresses = addresses;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$addresses, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserAddresses$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$addresses = addresses;
    final lOther$addresses = other.addresses;
    if (l$addresses != lOther$addresses) {
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

extension UtilityExtension$Query$GetUserAddresses$user
    on Query$GetUserAddresses$user {
  CopyWith$Query$GetUserAddresses$user<Query$GetUserAddresses$user>
  get copyWith => CopyWith$Query$GetUserAddresses$user(this, (i) => i);
}

abstract class CopyWith$Query$GetUserAddresses$user<TRes> {
  factory CopyWith$Query$GetUserAddresses$user(
    Query$GetUserAddresses$user instance,
    TRes Function(Query$GetUserAddresses$user) then,
  ) = _CopyWithImpl$Query$GetUserAddresses$user;

  factory CopyWith$Query$GetUserAddresses$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserAddresses$user;

  TRes call({
    String? id,
    Query$GetUserAddresses$user$addresses? addresses,
    String? $__typename,
  });
  CopyWith$Query$GetUserAddresses$user$addresses<TRes> get addresses;
}

class _CopyWithImpl$Query$GetUserAddresses$user<TRes>
    implements CopyWith$Query$GetUserAddresses$user<TRes> {
  _CopyWithImpl$Query$GetUserAddresses$user(this._instance, this._then);

  final Query$GetUserAddresses$user _instance;

  final TRes Function(Query$GetUserAddresses$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? addresses = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserAddresses$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      addresses: addresses == _undefined
          ? _instance.addresses
          : (addresses as Query$GetUserAddresses$user$addresses?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetUserAddresses$user$addresses<TRes> get addresses {
    final local$addresses = _instance.addresses;
    return local$addresses == null
        ? CopyWith$Query$GetUserAddresses$user$addresses.stub(_then(_instance))
        : CopyWith$Query$GetUserAddresses$user$addresses(
            local$addresses,
            (e) => call(addresses: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserAddresses$user<TRes>
    implements CopyWith$Query$GetUserAddresses$user<TRes> {
  _CopyWithStubImpl$Query$GetUserAddresses$user(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetUserAddresses$user$addresses? addresses,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUserAddresses$user$addresses<TRes> get addresses =>
      CopyWith$Query$GetUserAddresses$user$addresses.stub(_res);
}

class Query$GetUserAddresses$user$addresses {
  Query$GetUserAddresses$user$addresses({
    this.edges,
    this.$__typename = 'AddressCursorConnection',
  });

  factory Query$GetUserAddresses$user$addresses.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAddresses$user$addresses(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetUserAddresses$user$addresses$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUserAddresses$user$addresses$edges?>? edges;

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
    if (other is! Query$GetUserAddresses$user$addresses ||
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

extension UtilityExtension$Query$GetUserAddresses$user$addresses
    on Query$GetUserAddresses$user$addresses {
  CopyWith$Query$GetUserAddresses$user$addresses<
    Query$GetUserAddresses$user$addresses
  >
  get copyWith =>
      CopyWith$Query$GetUserAddresses$user$addresses(this, (i) => i);
}

abstract class CopyWith$Query$GetUserAddresses$user$addresses<TRes> {
  factory CopyWith$Query$GetUserAddresses$user$addresses(
    Query$GetUserAddresses$user$addresses instance,
    TRes Function(Query$GetUserAddresses$user$addresses) then,
  ) = _CopyWithImpl$Query$GetUserAddresses$user$addresses;

  factory CopyWith$Query$GetUserAddresses$user$addresses.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserAddresses$user$addresses;

  TRes call({
    List<Query$GetUserAddresses$user$addresses$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetUserAddresses$user$addresses$edges?>? Function(
      Iterable<
        CopyWith$Query$GetUserAddresses$user$addresses$edges<
          Query$GetUserAddresses$user$addresses$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetUserAddresses$user$addresses<TRes>
    implements CopyWith$Query$GetUserAddresses$user$addresses<TRes> {
  _CopyWithImpl$Query$GetUserAddresses$user$addresses(
    this._instance,
    this._then,
  );

  final Query$GetUserAddresses$user$addresses _instance;

  final TRes Function(Query$GetUserAddresses$user$addresses) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUserAddresses$user$addresses(
          edges: edges == _undefined
              ? _instance.edges
              : (edges as List<Query$GetUserAddresses$user$addresses$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetUserAddresses$user$addresses$edges?>? Function(
      Iterable<
        CopyWith$Query$GetUserAddresses$user$addresses$edges<
          Query$GetUserAddresses$user$addresses$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetUserAddresses$user$addresses$edges(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetUserAddresses$user$addresses<TRes>
    implements CopyWith$Query$GetUserAddresses$user$addresses<TRes> {
  _CopyWithStubImpl$Query$GetUserAddresses$user$addresses(this._res);

  TRes _res;

  call({
    List<Query$GetUserAddresses$user$addresses$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetUserAddresses$user$addresses$edges {
  Query$GetUserAddresses$user$addresses$edges({
    this.node,
    this.$__typename = 'AddressEdge',
  });

  factory Query$GetUserAddresses$user$addresses$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAddresses$user$addresses$edges(
      node: l$node == null
          ? null
          : Query$GetUserAddresses$user$addresses$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUserAddresses$user$addresses$edges$node? node;

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
    if (other is! Query$GetUserAddresses$user$addresses$edges ||
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

extension UtilityExtension$Query$GetUserAddresses$user$addresses$edges
    on Query$GetUserAddresses$user$addresses$edges {
  CopyWith$Query$GetUserAddresses$user$addresses$edges<
    Query$GetUserAddresses$user$addresses$edges
  >
  get copyWith =>
      CopyWith$Query$GetUserAddresses$user$addresses$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetUserAddresses$user$addresses$edges<TRes> {
  factory CopyWith$Query$GetUserAddresses$user$addresses$edges(
    Query$GetUserAddresses$user$addresses$edges instance,
    TRes Function(Query$GetUserAddresses$user$addresses$edges) then,
  ) = _CopyWithImpl$Query$GetUserAddresses$user$addresses$edges;

  factory CopyWith$Query$GetUserAddresses$user$addresses$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserAddresses$user$addresses$edges;

  TRes call({
    Query$GetUserAddresses$user$addresses$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetUserAddresses$user$addresses$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetUserAddresses$user$addresses$edges<TRes>
    implements CopyWith$Query$GetUserAddresses$user$addresses$edges<TRes> {
  _CopyWithImpl$Query$GetUserAddresses$user$addresses$edges(
    this._instance,
    this._then,
  );

  final Query$GetUserAddresses$user$addresses$edges _instance;

  final TRes Function(Query$GetUserAddresses$user$addresses$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUserAddresses$user$addresses$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetUserAddresses$user$addresses$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUserAddresses$user$addresses$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetUserAddresses$user$addresses$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetUserAddresses$user$addresses$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserAddresses$user$addresses$edges<TRes>
    implements CopyWith$Query$GetUserAddresses$user$addresses$edges<TRes> {
  _CopyWithStubImpl$Query$GetUserAddresses$user$addresses$edges(this._res);

  TRes _res;

  call({
    Query$GetUserAddresses$user$addresses$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUserAddresses$user$addresses$edges$node<TRes> get node =>
      CopyWith$Query$GetUserAddresses$user$addresses$edges$node.stub(_res);
}

class Query$GetUserAddresses$user$addresses$edges$node {
  Query$GetUserAddresses$user$addresses$edges$node({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.street,
    this.apartment,
    required this.city,
    required this.zipCode,
    required this.isDefault,
    this.$__typename = 'Address',
  });

  factory Query$GetUserAddresses$user$addresses$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$phoneNumber = json['phoneNumber'];
    final l$street = json['street'];
    final l$apartment = json['apartment'];
    final l$city = json['city'];
    final l$zipCode = json['zipCode'];
    final l$isDefault = json['isDefault'];
    final l$$__typename = json['__typename'];
    return Query$GetUserAddresses$user$addresses$edges$node(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      phoneNumber: (l$phoneNumber as String),
      street: (l$street as String),
      apartment: (l$apartment as String?),
      city: (l$city as String),
      zipCode: (l$zipCode as String),
      isDefault: (l$isDefault as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String lastName;

  final String phoneNumber;

  final String street;

  final String? apartment;

  final String city;

  final String zipCode;

  final bool isDefault;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$street = street;
    _resultData['street'] = l$street;
    final l$apartment = apartment;
    _resultData['apartment'] = l$apartment;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$zipCode = zipCode;
    _resultData['zipCode'] = l$zipCode;
    final l$isDefault = isDefault;
    _resultData['isDefault'] = l$isDefault;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$phoneNumber,
      l$street,
      l$apartment,
      l$city,
      l$zipCode,
      l$isDefault,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserAddresses$user$addresses$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUserAddresses$user$addresses$edges$node
    on Query$GetUserAddresses$user$addresses$edges$node {
  CopyWith$Query$GetUserAddresses$user$addresses$edges$node<
    Query$GetUserAddresses$user$addresses$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetUserAddresses$user$addresses$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetUserAddresses$user$addresses$edges$node<TRes> {
  factory CopyWith$Query$GetUserAddresses$user$addresses$edges$node(
    Query$GetUserAddresses$user$addresses$edges$node instance,
    TRes Function(Query$GetUserAddresses$user$addresses$edges$node) then,
  ) = _CopyWithImpl$Query$GetUserAddresses$user$addresses$edges$node;

  factory CopyWith$Query$GetUserAddresses$user$addresses$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetUserAddresses$user$addresses$edges$node;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUserAddresses$user$addresses$edges$node<TRes>
    implements CopyWith$Query$GetUserAddresses$user$addresses$edges$node<TRes> {
  _CopyWithImpl$Query$GetUserAddresses$user$addresses$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetUserAddresses$user$addresses$edges$node _instance;

  final TRes Function(Query$GetUserAddresses$user$addresses$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserAddresses$user$addresses$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      phoneNumber: phoneNumber == _undefined || phoneNumber == null
          ? _instance.phoneNumber
          : (phoneNumber as String),
      street: street == _undefined || street == null
          ? _instance.street
          : (street as String),
      apartment: apartment == _undefined
          ? _instance.apartment
          : (apartment as String?),
      city: city == _undefined || city == null
          ? _instance.city
          : (city as String),
      zipCode: zipCode == _undefined || zipCode == null
          ? _instance.zipCode
          : (zipCode as String),
      isDefault: isDefault == _undefined || isDefault == null
          ? _instance.isDefault
          : (isDefault as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetUserAddresses$user$addresses$edges$node<TRes>
    implements CopyWith$Query$GetUserAddresses$user$addresses$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetUserAddresses$user$addresses$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$CreateAddress {
  factory Variables$Mutation$CreateAddress({
    required Input$createAddressInput input,
  }) => Variables$Mutation$CreateAddress._({r'input': input});

  Variables$Mutation$CreateAddress._(this._$data);

  factory Variables$Mutation$CreateAddress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createAddressInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateAddress._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createAddressInput get input =>
      (_$data['input'] as Input$createAddressInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateAddress<Variables$Mutation$CreateAddress>
  get copyWith => CopyWith$Variables$Mutation$CreateAddress(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateAddress ||
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

abstract class CopyWith$Variables$Mutation$CreateAddress<TRes> {
  factory CopyWith$Variables$Mutation$CreateAddress(
    Variables$Mutation$CreateAddress instance,
    TRes Function(Variables$Mutation$CreateAddress) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateAddress;

  factory CopyWith$Variables$Mutation$CreateAddress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateAddress;

  TRes call({Input$createAddressInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateAddress<TRes>
    implements CopyWith$Variables$Mutation$CreateAddress<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateAddress(this._instance, this._then);

  final Variables$Mutation$CreateAddress _instance;

  final TRes Function(Variables$Mutation$CreateAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateAddress._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createAddressInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateAddress<TRes>
    implements CopyWith$Variables$Mutation$CreateAddress<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateAddress(this._res);

  TRes _res;

  call({Input$createAddressInput? input}) => _res;
}

class Mutation$CreateAddress {
  Mutation$CreateAddress({this.createAddress, this.$__typename = 'Mutation'});

  factory Mutation$CreateAddress.fromJson(Map<String, dynamic> json) {
    final l$createAddress = json['createAddress'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateAddress(
      createAddress: l$createAddress == null
          ? null
          : Mutation$CreateAddress$createAddress.fromJson(
              (l$createAddress as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateAddress$createAddress? createAddress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createAddress = createAddress;
    _resultData['createAddress'] = l$createAddress?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createAddress = createAddress;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createAddress, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateAddress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createAddress = createAddress;
    final lOther$createAddress = other.createAddress;
    if (l$createAddress != lOther$createAddress) {
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

extension UtilityExtension$Mutation$CreateAddress on Mutation$CreateAddress {
  CopyWith$Mutation$CreateAddress<Mutation$CreateAddress> get copyWith =>
      CopyWith$Mutation$CreateAddress(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateAddress<TRes> {
  factory CopyWith$Mutation$CreateAddress(
    Mutation$CreateAddress instance,
    TRes Function(Mutation$CreateAddress) then,
  ) = _CopyWithImpl$Mutation$CreateAddress;

  factory CopyWith$Mutation$CreateAddress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateAddress;

  TRes call({
    Mutation$CreateAddress$createAddress? createAddress,
    String? $__typename,
  });
  CopyWith$Mutation$CreateAddress$createAddress<TRes> get createAddress;
}

class _CopyWithImpl$Mutation$CreateAddress<TRes>
    implements CopyWith$Mutation$CreateAddress<TRes> {
  _CopyWithImpl$Mutation$CreateAddress(this._instance, this._then);

  final Mutation$CreateAddress _instance;

  final TRes Function(Mutation$CreateAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createAddress = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateAddress(
      createAddress: createAddress == _undefined
          ? _instance.createAddress
          : (createAddress as Mutation$CreateAddress$createAddress?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateAddress$createAddress<TRes> get createAddress {
    final local$createAddress = _instance.createAddress;
    return local$createAddress == null
        ? CopyWith$Mutation$CreateAddress$createAddress.stub(_then(_instance))
        : CopyWith$Mutation$CreateAddress$createAddress(
            local$createAddress,
            (e) => call(createAddress: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateAddress<TRes>
    implements CopyWith$Mutation$CreateAddress<TRes> {
  _CopyWithStubImpl$Mutation$CreateAddress(this._res);

  TRes _res;

  call({
    Mutation$CreateAddress$createAddress? createAddress,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateAddress$createAddress<TRes> get createAddress =>
      CopyWith$Mutation$CreateAddress$createAddress.stub(_res);
}

const documentNodeMutationCreateAddress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateAddress'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createAddressInput'),
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
            name: NameNode(value: 'createAddress'),
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
                  name: NameNode(value: 'address'),
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
                        name: NameNode(value: 'firstName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'lastName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'phoneNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'street'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'apartment'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'city'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'zipCode'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'isDefault'),
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
Mutation$CreateAddress _parserFn$Mutation$CreateAddress(
  Map<String, dynamic> data,
) => Mutation$CreateAddress.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateAddress =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateAddress?);

class Options$Mutation$CreateAddress
    extends graphql.MutationOptions<Mutation$CreateAddress> {
  Options$Mutation$CreateAddress({
    String? operationName,
    required Variables$Mutation$CreateAddress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateAddress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateAddress? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateAddress>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateAddress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateAddress,
         parserFn: _parserFn$Mutation$CreateAddress,
       );

  final OnMutationCompleted$Mutation$CreateAddress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateAddress
    extends graphql.WatchQueryOptions<Mutation$CreateAddress> {
  WatchOptions$Mutation$CreateAddress({
    String? operationName,
    required Variables$Mutation$CreateAddress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateAddress? typedOptimisticResult,
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
         document: documentNodeMutationCreateAddress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateAddress,
       );
}

extension ClientExtension$Mutation$CreateAddress on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateAddress>> mutate$CreateAddress(
    Options$Mutation$CreateAddress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateAddress> watchMutation$CreateAddress(
    WatchOptions$Mutation$CreateAddress options,
  ) => this.watchMutation(options);
}

class Mutation$CreateAddress$HookResult {
  Mutation$CreateAddress$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateAddress runMutation;

  final graphql.QueryResult<Mutation$CreateAddress> result;
}

Mutation$CreateAddress$HookResult useMutation$CreateAddress([
  WidgetOptions$Mutation$CreateAddress? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateAddress(),
  );
  return Mutation$CreateAddress$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateAddress> useWatchMutation$CreateAddress(
  WatchOptions$Mutation$CreateAddress options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateAddress
    extends graphql.MutationOptions<Mutation$CreateAddress> {
  WidgetOptions$Mutation$CreateAddress({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateAddress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateAddress? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateAddress>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateAddress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateAddress,
         parserFn: _parserFn$Mutation$CreateAddress,
       );

  final OnMutationCompleted$Mutation$CreateAddress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateAddress =
    graphql.MultiSourceResult<Mutation$CreateAddress> Function(
      Variables$Mutation$CreateAddress, {
      Object? optimisticResult,
      Mutation$CreateAddress? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateAddress =
    widgets.Widget Function(
      RunMutation$Mutation$CreateAddress,
      graphql.QueryResult<Mutation$CreateAddress>?,
    );

class Mutation$CreateAddress$Widget
    extends graphql_flutter.Mutation<Mutation$CreateAddress> {
  Mutation$CreateAddress$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateAddress? options,
    required Builder$Mutation$CreateAddress builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateAddress(),
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

class Mutation$CreateAddress$createAddress {
  Mutation$CreateAddress$createAddress({
    this.address,
    this.$__typename = 'createAddressPayload',
  });

  factory Mutation$CreateAddress$createAddress.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateAddress$createAddress(
      address: l$address == null
          ? null
          : Mutation$CreateAddress$createAddress$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateAddress$createAddress$address? address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([l$address, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateAddress$createAddress ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Mutation$CreateAddress$createAddress
    on Mutation$CreateAddress$createAddress {
  CopyWith$Mutation$CreateAddress$createAddress<
    Mutation$CreateAddress$createAddress
  >
  get copyWith => CopyWith$Mutation$CreateAddress$createAddress(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateAddress$createAddress<TRes> {
  factory CopyWith$Mutation$CreateAddress$createAddress(
    Mutation$CreateAddress$createAddress instance,
    TRes Function(Mutation$CreateAddress$createAddress) then,
  ) = _CopyWithImpl$Mutation$CreateAddress$createAddress;

  factory CopyWith$Mutation$CreateAddress$createAddress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateAddress$createAddress;

  TRes call({
    Mutation$CreateAddress$createAddress$address? address,
    String? $__typename,
  });
  CopyWith$Mutation$CreateAddress$createAddress$address<TRes> get address;
}

class _CopyWithImpl$Mutation$CreateAddress$createAddress<TRes>
    implements CopyWith$Mutation$CreateAddress$createAddress<TRes> {
  _CopyWithImpl$Mutation$CreateAddress$createAddress(
    this._instance,
    this._then,
  );

  final Mutation$CreateAddress$createAddress _instance;

  final TRes Function(Mutation$CreateAddress$createAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? address = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CreateAddress$createAddress(
          address: address == _undefined
              ? _instance.address
              : (address as Mutation$CreateAddress$createAddress$address?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$CreateAddress$createAddress$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Mutation$CreateAddress$createAddress$address.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateAddress$createAddress$address(
            local$address,
            (e) => call(address: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateAddress$createAddress<TRes>
    implements CopyWith$Mutation$CreateAddress$createAddress<TRes> {
  _CopyWithStubImpl$Mutation$CreateAddress$createAddress(this._res);

  TRes _res;

  call({
    Mutation$CreateAddress$createAddress$address? address,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateAddress$createAddress$address<TRes> get address =>
      CopyWith$Mutation$CreateAddress$createAddress$address.stub(_res);
}

class Mutation$CreateAddress$createAddress$address {
  Mutation$CreateAddress$createAddress$address({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.street,
    this.apartment,
    required this.city,
    required this.zipCode,
    required this.isDefault,
    this.$__typename = 'Address',
  });

  factory Mutation$CreateAddress$createAddress$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$phoneNumber = json['phoneNumber'];
    final l$street = json['street'];
    final l$apartment = json['apartment'];
    final l$city = json['city'];
    final l$zipCode = json['zipCode'];
    final l$isDefault = json['isDefault'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateAddress$createAddress$address(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      phoneNumber: (l$phoneNumber as String),
      street: (l$street as String),
      apartment: (l$apartment as String?),
      city: (l$city as String),
      zipCode: (l$zipCode as String),
      isDefault: (l$isDefault as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String lastName;

  final String phoneNumber;

  final String street;

  final String? apartment;

  final String city;

  final String zipCode;

  final bool isDefault;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$street = street;
    _resultData['street'] = l$street;
    final l$apartment = apartment;
    _resultData['apartment'] = l$apartment;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$zipCode = zipCode;
    _resultData['zipCode'] = l$zipCode;
    final l$isDefault = isDefault;
    _resultData['isDefault'] = l$isDefault;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$phoneNumber,
      l$street,
      l$apartment,
      l$city,
      l$zipCode,
      l$isDefault,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateAddress$createAddress$address ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateAddress$createAddress$address
    on Mutation$CreateAddress$createAddress$address {
  CopyWith$Mutation$CreateAddress$createAddress$address<
    Mutation$CreateAddress$createAddress$address
  >
  get copyWith =>
      CopyWith$Mutation$CreateAddress$createAddress$address(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateAddress$createAddress$address<TRes> {
  factory CopyWith$Mutation$CreateAddress$createAddress$address(
    Mutation$CreateAddress$createAddress$address instance,
    TRes Function(Mutation$CreateAddress$createAddress$address) then,
  ) = _CopyWithImpl$Mutation$CreateAddress$createAddress$address;

  factory CopyWith$Mutation$CreateAddress$createAddress$address.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateAddress$createAddress$address;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateAddress$createAddress$address<TRes>
    implements CopyWith$Mutation$CreateAddress$createAddress$address<TRes> {
  _CopyWithImpl$Mutation$CreateAddress$createAddress$address(
    this._instance,
    this._then,
  );

  final Mutation$CreateAddress$createAddress$address _instance;

  final TRes Function(Mutation$CreateAddress$createAddress$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateAddress$createAddress$address(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      phoneNumber: phoneNumber == _undefined || phoneNumber == null
          ? _instance.phoneNumber
          : (phoneNumber as String),
      street: street == _undefined || street == null
          ? _instance.street
          : (street as String),
      apartment: apartment == _undefined
          ? _instance.apartment
          : (apartment as String?),
      city: city == _undefined || city == null
          ? _instance.city
          : (city as String),
      zipCode: zipCode == _undefined || zipCode == null
          ? _instance.zipCode
          : (zipCode as String),
      isDefault: isDefault == _undefined || isDefault == null
          ? _instance.isDefault
          : (isDefault as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateAddress$createAddress$address<TRes>
    implements CopyWith$Mutation$CreateAddress$createAddress$address<TRes> {
  _CopyWithStubImpl$Mutation$CreateAddress$createAddress$address(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$UpdateAddress {
  factory Variables$Mutation$UpdateAddress({
    required Input$updateAddressInput input,
  }) => Variables$Mutation$UpdateAddress._({r'input': input});

  Variables$Mutation$UpdateAddress._(this._$data);

  factory Variables$Mutation$UpdateAddress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateAddressInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateAddress._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateAddressInput get input =>
      (_$data['input'] as Input$updateAddressInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateAddress<Variables$Mutation$UpdateAddress>
  get copyWith => CopyWith$Variables$Mutation$UpdateAddress(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateAddress ||
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

abstract class CopyWith$Variables$Mutation$UpdateAddress<TRes> {
  factory CopyWith$Variables$Mutation$UpdateAddress(
    Variables$Mutation$UpdateAddress instance,
    TRes Function(Variables$Mutation$UpdateAddress) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateAddress;

  factory CopyWith$Variables$Mutation$UpdateAddress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateAddress;

  TRes call({Input$updateAddressInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateAddress<TRes>
    implements CopyWith$Variables$Mutation$UpdateAddress<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateAddress(this._instance, this._then);

  final Variables$Mutation$UpdateAddress _instance;

  final TRes Function(Variables$Mutation$UpdateAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateAddress._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateAddressInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateAddress<TRes>
    implements CopyWith$Variables$Mutation$UpdateAddress<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateAddress(this._res);

  TRes _res;

  call({Input$updateAddressInput? input}) => _res;
}

class Mutation$UpdateAddress {
  Mutation$UpdateAddress({this.updateAddress, this.$__typename = 'Mutation'});

  factory Mutation$UpdateAddress.fromJson(Map<String, dynamic> json) {
    final l$updateAddress = json['updateAddress'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateAddress(
      updateAddress: l$updateAddress == null
          ? null
          : Mutation$UpdateAddress$updateAddress.fromJson(
              (l$updateAddress as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateAddress$updateAddress? updateAddress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateAddress = updateAddress;
    _resultData['updateAddress'] = l$updateAddress?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateAddress = updateAddress;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateAddress, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateAddress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateAddress = updateAddress;
    final lOther$updateAddress = other.updateAddress;
    if (l$updateAddress != lOther$updateAddress) {
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

extension UtilityExtension$Mutation$UpdateAddress on Mutation$UpdateAddress {
  CopyWith$Mutation$UpdateAddress<Mutation$UpdateAddress> get copyWith =>
      CopyWith$Mutation$UpdateAddress(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateAddress<TRes> {
  factory CopyWith$Mutation$UpdateAddress(
    Mutation$UpdateAddress instance,
    TRes Function(Mutation$UpdateAddress) then,
  ) = _CopyWithImpl$Mutation$UpdateAddress;

  factory CopyWith$Mutation$UpdateAddress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateAddress;

  TRes call({
    Mutation$UpdateAddress$updateAddress? updateAddress,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateAddress$updateAddress<TRes> get updateAddress;
}

class _CopyWithImpl$Mutation$UpdateAddress<TRes>
    implements CopyWith$Mutation$UpdateAddress<TRes> {
  _CopyWithImpl$Mutation$UpdateAddress(this._instance, this._then);

  final Mutation$UpdateAddress _instance;

  final TRes Function(Mutation$UpdateAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateAddress = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateAddress(
      updateAddress: updateAddress == _undefined
          ? _instance.updateAddress
          : (updateAddress as Mutation$UpdateAddress$updateAddress?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateAddress$updateAddress<TRes> get updateAddress {
    final local$updateAddress = _instance.updateAddress;
    return local$updateAddress == null
        ? CopyWith$Mutation$UpdateAddress$updateAddress.stub(_then(_instance))
        : CopyWith$Mutation$UpdateAddress$updateAddress(
            local$updateAddress,
            (e) => call(updateAddress: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateAddress<TRes>
    implements CopyWith$Mutation$UpdateAddress<TRes> {
  _CopyWithStubImpl$Mutation$UpdateAddress(this._res);

  TRes _res;

  call({
    Mutation$UpdateAddress$updateAddress? updateAddress,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateAddress$updateAddress<TRes> get updateAddress =>
      CopyWith$Mutation$UpdateAddress$updateAddress.stub(_res);
}

const documentNodeMutationUpdateAddress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateAddress'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateAddressInput'),
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
            name: NameNode(value: 'updateAddress'),
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
                  name: NameNode(value: 'address'),
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
                        name: NameNode(value: 'firstName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'lastName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'phoneNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'street'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'apartment'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'city'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'zipCode'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'isDefault'),
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
Mutation$UpdateAddress _parserFn$Mutation$UpdateAddress(
  Map<String, dynamic> data,
) => Mutation$UpdateAddress.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateAddress =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateAddress?);

class Options$Mutation$UpdateAddress
    extends graphql.MutationOptions<Mutation$UpdateAddress> {
  Options$Mutation$UpdateAddress({
    String? operationName,
    required Variables$Mutation$UpdateAddress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateAddress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateAddress? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateAddress>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateAddress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateAddress,
         parserFn: _parserFn$Mutation$UpdateAddress,
       );

  final OnMutationCompleted$Mutation$UpdateAddress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateAddress
    extends graphql.WatchQueryOptions<Mutation$UpdateAddress> {
  WatchOptions$Mutation$UpdateAddress({
    String? operationName,
    required Variables$Mutation$UpdateAddress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateAddress? typedOptimisticResult,
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
         document: documentNodeMutationUpdateAddress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateAddress,
       );
}

extension ClientExtension$Mutation$UpdateAddress on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateAddress>> mutate$UpdateAddress(
    Options$Mutation$UpdateAddress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateAddress> watchMutation$UpdateAddress(
    WatchOptions$Mutation$UpdateAddress options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateAddress$HookResult {
  Mutation$UpdateAddress$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateAddress runMutation;

  final graphql.QueryResult<Mutation$UpdateAddress> result;
}

Mutation$UpdateAddress$HookResult useMutation$UpdateAddress([
  WidgetOptions$Mutation$UpdateAddress? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateAddress(),
  );
  return Mutation$UpdateAddress$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateAddress> useWatchMutation$UpdateAddress(
  WatchOptions$Mutation$UpdateAddress options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateAddress
    extends graphql.MutationOptions<Mutation$UpdateAddress> {
  WidgetOptions$Mutation$UpdateAddress({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateAddress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateAddress? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateAddress>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateAddress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateAddress,
         parserFn: _parserFn$Mutation$UpdateAddress,
       );

  final OnMutationCompleted$Mutation$UpdateAddress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateAddress =
    graphql.MultiSourceResult<Mutation$UpdateAddress> Function(
      Variables$Mutation$UpdateAddress, {
      Object? optimisticResult,
      Mutation$UpdateAddress? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateAddress =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateAddress,
      graphql.QueryResult<Mutation$UpdateAddress>?,
    );

class Mutation$UpdateAddress$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateAddress> {
  Mutation$UpdateAddress$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateAddress? options,
    required Builder$Mutation$UpdateAddress builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateAddress(),
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

class Mutation$UpdateAddress$updateAddress {
  Mutation$UpdateAddress$updateAddress({
    this.address,
    this.$__typename = 'updateAddressPayload',
  });

  factory Mutation$UpdateAddress$updateAddress.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateAddress$updateAddress(
      address: l$address == null
          ? null
          : Mutation$UpdateAddress$updateAddress$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateAddress$updateAddress$address? address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([l$address, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateAddress$updateAddress ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Mutation$UpdateAddress$updateAddress
    on Mutation$UpdateAddress$updateAddress {
  CopyWith$Mutation$UpdateAddress$updateAddress<
    Mutation$UpdateAddress$updateAddress
  >
  get copyWith => CopyWith$Mutation$UpdateAddress$updateAddress(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateAddress$updateAddress<TRes> {
  factory CopyWith$Mutation$UpdateAddress$updateAddress(
    Mutation$UpdateAddress$updateAddress instance,
    TRes Function(Mutation$UpdateAddress$updateAddress) then,
  ) = _CopyWithImpl$Mutation$UpdateAddress$updateAddress;

  factory CopyWith$Mutation$UpdateAddress$updateAddress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateAddress$updateAddress;

  TRes call({
    Mutation$UpdateAddress$updateAddress$address? address,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateAddress$updateAddress$address<TRes> get address;
}

class _CopyWithImpl$Mutation$UpdateAddress$updateAddress<TRes>
    implements CopyWith$Mutation$UpdateAddress$updateAddress<TRes> {
  _CopyWithImpl$Mutation$UpdateAddress$updateAddress(
    this._instance,
    this._then,
  );

  final Mutation$UpdateAddress$updateAddress _instance;

  final TRes Function(Mutation$UpdateAddress$updateAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? address = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$UpdateAddress$updateAddress(
          address: address == _undefined
              ? _instance.address
              : (address as Mutation$UpdateAddress$updateAddress$address?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$UpdateAddress$updateAddress$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Mutation$UpdateAddress$updateAddress$address.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateAddress$updateAddress$address(
            local$address,
            (e) => call(address: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateAddress$updateAddress<TRes>
    implements CopyWith$Mutation$UpdateAddress$updateAddress<TRes> {
  _CopyWithStubImpl$Mutation$UpdateAddress$updateAddress(this._res);

  TRes _res;

  call({
    Mutation$UpdateAddress$updateAddress$address? address,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateAddress$updateAddress$address<TRes> get address =>
      CopyWith$Mutation$UpdateAddress$updateAddress$address.stub(_res);
}

class Mutation$UpdateAddress$updateAddress$address {
  Mutation$UpdateAddress$updateAddress$address({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.street,
    this.apartment,
    required this.city,
    required this.zipCode,
    required this.isDefault,
    this.$__typename = 'Address',
  });

  factory Mutation$UpdateAddress$updateAddress$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$phoneNumber = json['phoneNumber'];
    final l$street = json['street'];
    final l$apartment = json['apartment'];
    final l$city = json['city'];
    final l$zipCode = json['zipCode'];
    final l$isDefault = json['isDefault'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateAddress$updateAddress$address(
      id: (l$id as String),
      firstName: (l$firstName as String),
      lastName: (l$lastName as String),
      phoneNumber: (l$phoneNumber as String),
      street: (l$street as String),
      apartment: (l$apartment as String?),
      city: (l$city as String),
      zipCode: (l$zipCode as String),
      isDefault: (l$isDefault as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String firstName;

  final String lastName;

  final String phoneNumber;

  final String street;

  final String? apartment;

  final String city;

  final String zipCode;

  final bool isDefault;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$phoneNumber = phoneNumber;
    _resultData['phoneNumber'] = l$phoneNumber;
    final l$street = street;
    _resultData['street'] = l$street;
    final l$apartment = apartment;
    _resultData['apartment'] = l$apartment;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$zipCode = zipCode;
    _resultData['zipCode'] = l$zipCode;
    final l$isDefault = isDefault;
    _resultData['isDefault'] = l$isDefault;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$phoneNumber,
      l$street,
      l$apartment,
      l$city,
      l$zipCode,
      l$isDefault,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateAddress$updateAddress$address ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateAddress$updateAddress$address
    on Mutation$UpdateAddress$updateAddress$address {
  CopyWith$Mutation$UpdateAddress$updateAddress$address<
    Mutation$UpdateAddress$updateAddress$address
  >
  get copyWith =>
      CopyWith$Mutation$UpdateAddress$updateAddress$address(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateAddress$updateAddress$address<TRes> {
  factory CopyWith$Mutation$UpdateAddress$updateAddress$address(
    Mutation$UpdateAddress$updateAddress$address instance,
    TRes Function(Mutation$UpdateAddress$updateAddress$address) then,
  ) = _CopyWithImpl$Mutation$UpdateAddress$updateAddress$address;

  factory CopyWith$Mutation$UpdateAddress$updateAddress$address.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateAddress$updateAddress$address;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateAddress$updateAddress$address<TRes>
    implements CopyWith$Mutation$UpdateAddress$updateAddress$address<TRes> {
  _CopyWithImpl$Mutation$UpdateAddress$updateAddress$address(
    this._instance,
    this._then,
  );

  final Mutation$UpdateAddress$updateAddress$address _instance;

  final TRes Function(Mutation$UpdateAddress$updateAddress$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateAddress$updateAddress$address(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined || firstName == null
          ? _instance.firstName
          : (firstName as String),
      lastName: lastName == _undefined || lastName == null
          ? _instance.lastName
          : (lastName as String),
      phoneNumber: phoneNumber == _undefined || phoneNumber == null
          ? _instance.phoneNumber
          : (phoneNumber as String),
      street: street == _undefined || street == null
          ? _instance.street
          : (street as String),
      apartment: apartment == _undefined
          ? _instance.apartment
          : (apartment as String?),
      city: city == _undefined || city == null
          ? _instance.city
          : (city as String),
      zipCode: zipCode == _undefined || zipCode == null
          ? _instance.zipCode
          : (zipCode as String),
      isDefault: isDefault == _undefined || isDefault == null
          ? _instance.isDefault
          : (isDefault as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateAddress$updateAddress$address<TRes>
    implements CopyWith$Mutation$UpdateAddress$updateAddress$address<TRes> {
  _CopyWithStubImpl$Mutation$UpdateAddress$updateAddress$address(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$DeleteAddress {
  factory Variables$Mutation$DeleteAddress({
    required Input$deleteAddressInput input,
  }) => Variables$Mutation$DeleteAddress._({r'input': input});

  Variables$Mutation$DeleteAddress._(this._$data);

  factory Variables$Mutation$DeleteAddress.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteAddressInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteAddress._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteAddressInput get input =>
      (_$data['input'] as Input$deleteAddressInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteAddress<Variables$Mutation$DeleteAddress>
  get copyWith => CopyWith$Variables$Mutation$DeleteAddress(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteAddress ||
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

abstract class CopyWith$Variables$Mutation$DeleteAddress<TRes> {
  factory CopyWith$Variables$Mutation$DeleteAddress(
    Variables$Mutation$DeleteAddress instance,
    TRes Function(Variables$Mutation$DeleteAddress) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteAddress;

  factory CopyWith$Variables$Mutation$DeleteAddress.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteAddress;

  TRes call({Input$deleteAddressInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteAddress<TRes>
    implements CopyWith$Variables$Mutation$DeleteAddress<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteAddress(this._instance, this._then);

  final Variables$Mutation$DeleteAddress _instance;

  final TRes Function(Variables$Mutation$DeleteAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteAddress._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteAddressInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteAddress<TRes>
    implements CopyWith$Variables$Mutation$DeleteAddress<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteAddress(this._res);

  TRes _res;

  call({Input$deleteAddressInput? input}) => _res;
}

class Mutation$DeleteAddress {
  Mutation$DeleteAddress({this.deleteAddress, this.$__typename = 'Mutation'});

  factory Mutation$DeleteAddress.fromJson(Map<String, dynamic> json) {
    final l$deleteAddress = json['deleteAddress'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteAddress(
      deleteAddress: l$deleteAddress == null
          ? null
          : Mutation$DeleteAddress$deleteAddress.fromJson(
              (l$deleteAddress as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteAddress$deleteAddress? deleteAddress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteAddress = deleteAddress;
    _resultData['deleteAddress'] = l$deleteAddress?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteAddress = deleteAddress;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteAddress, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteAddress || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteAddress = deleteAddress;
    final lOther$deleteAddress = other.deleteAddress;
    if (l$deleteAddress != lOther$deleteAddress) {
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

extension UtilityExtension$Mutation$DeleteAddress on Mutation$DeleteAddress {
  CopyWith$Mutation$DeleteAddress<Mutation$DeleteAddress> get copyWith =>
      CopyWith$Mutation$DeleteAddress(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteAddress<TRes> {
  factory CopyWith$Mutation$DeleteAddress(
    Mutation$DeleteAddress instance,
    TRes Function(Mutation$DeleteAddress) then,
  ) = _CopyWithImpl$Mutation$DeleteAddress;

  factory CopyWith$Mutation$DeleteAddress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteAddress;

  TRes call({
    Mutation$DeleteAddress$deleteAddress? deleteAddress,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteAddress$deleteAddress<TRes> get deleteAddress;
}

class _CopyWithImpl$Mutation$DeleteAddress<TRes>
    implements CopyWith$Mutation$DeleteAddress<TRes> {
  _CopyWithImpl$Mutation$DeleteAddress(this._instance, this._then);

  final Mutation$DeleteAddress _instance;

  final TRes Function(Mutation$DeleteAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteAddress = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteAddress(
      deleteAddress: deleteAddress == _undefined
          ? _instance.deleteAddress
          : (deleteAddress as Mutation$DeleteAddress$deleteAddress?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteAddress$deleteAddress<TRes> get deleteAddress {
    final local$deleteAddress = _instance.deleteAddress;
    return local$deleteAddress == null
        ? CopyWith$Mutation$DeleteAddress$deleteAddress.stub(_then(_instance))
        : CopyWith$Mutation$DeleteAddress$deleteAddress(
            local$deleteAddress,
            (e) => call(deleteAddress: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteAddress<TRes>
    implements CopyWith$Mutation$DeleteAddress<TRes> {
  _CopyWithStubImpl$Mutation$DeleteAddress(this._res);

  TRes _res;

  call({
    Mutation$DeleteAddress$deleteAddress? deleteAddress,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteAddress$deleteAddress<TRes> get deleteAddress =>
      CopyWith$Mutation$DeleteAddress$deleteAddress.stub(_res);
}

const documentNodeMutationDeleteAddress = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteAddress'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteAddressInput'),
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
            name: NameNode(value: 'deleteAddress'),
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
                  name: NameNode(value: 'address'),
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
Mutation$DeleteAddress _parserFn$Mutation$DeleteAddress(
  Map<String, dynamic> data,
) => Mutation$DeleteAddress.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteAddress =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteAddress?);

class Options$Mutation$DeleteAddress
    extends graphql.MutationOptions<Mutation$DeleteAddress> {
  Options$Mutation$DeleteAddress({
    String? operationName,
    required Variables$Mutation$DeleteAddress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteAddress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteAddress? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteAddress>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteAddress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteAddress,
         parserFn: _parserFn$Mutation$DeleteAddress,
       );

  final OnMutationCompleted$Mutation$DeleteAddress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteAddress
    extends graphql.WatchQueryOptions<Mutation$DeleteAddress> {
  WatchOptions$Mutation$DeleteAddress({
    String? operationName,
    required Variables$Mutation$DeleteAddress variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteAddress? typedOptimisticResult,
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
         document: documentNodeMutationDeleteAddress,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteAddress,
       );
}

extension ClientExtension$Mutation$DeleteAddress on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteAddress>> mutate$DeleteAddress(
    Options$Mutation$DeleteAddress options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteAddress> watchMutation$DeleteAddress(
    WatchOptions$Mutation$DeleteAddress options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteAddress$HookResult {
  Mutation$DeleteAddress$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteAddress runMutation;

  final graphql.QueryResult<Mutation$DeleteAddress> result;
}

Mutation$DeleteAddress$HookResult useMutation$DeleteAddress([
  WidgetOptions$Mutation$DeleteAddress? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteAddress(),
  );
  return Mutation$DeleteAddress$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteAddress> useWatchMutation$DeleteAddress(
  WatchOptions$Mutation$DeleteAddress options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteAddress
    extends graphql.MutationOptions<Mutation$DeleteAddress> {
  WidgetOptions$Mutation$DeleteAddress({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteAddress? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteAddress? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteAddress>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteAddress(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteAddress,
         parserFn: _parserFn$Mutation$DeleteAddress,
       );

  final OnMutationCompleted$Mutation$DeleteAddress? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteAddress =
    graphql.MultiSourceResult<Mutation$DeleteAddress> Function(
      Variables$Mutation$DeleteAddress, {
      Object? optimisticResult,
      Mutation$DeleteAddress? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteAddress =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteAddress,
      graphql.QueryResult<Mutation$DeleteAddress>?,
    );

class Mutation$DeleteAddress$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteAddress> {
  Mutation$DeleteAddress$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteAddress? options,
    required Builder$Mutation$DeleteAddress builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteAddress(),
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

class Mutation$DeleteAddress$deleteAddress {
  Mutation$DeleteAddress$deleteAddress({
    this.address,
    this.$__typename = 'deleteAddressPayload',
  });

  factory Mutation$DeleteAddress$deleteAddress.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$address = json['address'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteAddress$deleteAddress(
      address: l$address == null
          ? null
          : Mutation$DeleteAddress$deleteAddress$address.fromJson(
              (l$address as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteAddress$deleteAddress$address? address;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$address = address;
    _resultData['address'] = l$address?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$address = address;
    final l$$__typename = $__typename;
    return Object.hashAll([l$address, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteAddress$deleteAddress ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$address = address;
    final lOther$address = other.address;
    if (l$address != lOther$address) {
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

extension UtilityExtension$Mutation$DeleteAddress$deleteAddress
    on Mutation$DeleteAddress$deleteAddress {
  CopyWith$Mutation$DeleteAddress$deleteAddress<
    Mutation$DeleteAddress$deleteAddress
  >
  get copyWith => CopyWith$Mutation$DeleteAddress$deleteAddress(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteAddress$deleteAddress<TRes> {
  factory CopyWith$Mutation$DeleteAddress$deleteAddress(
    Mutation$DeleteAddress$deleteAddress instance,
    TRes Function(Mutation$DeleteAddress$deleteAddress) then,
  ) = _CopyWithImpl$Mutation$DeleteAddress$deleteAddress;

  factory CopyWith$Mutation$DeleteAddress$deleteAddress.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteAddress$deleteAddress;

  TRes call({
    Mutation$DeleteAddress$deleteAddress$address? address,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteAddress$deleteAddress$address<TRes> get address;
}

class _CopyWithImpl$Mutation$DeleteAddress$deleteAddress<TRes>
    implements CopyWith$Mutation$DeleteAddress$deleteAddress<TRes> {
  _CopyWithImpl$Mutation$DeleteAddress$deleteAddress(
    this._instance,
    this._then,
  );

  final Mutation$DeleteAddress$deleteAddress _instance;

  final TRes Function(Mutation$DeleteAddress$deleteAddress) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? address = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteAddress$deleteAddress(
          address: address == _undefined
              ? _instance.address
              : (address as Mutation$DeleteAddress$deleteAddress$address?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$DeleteAddress$deleteAddress$address<TRes> get address {
    final local$address = _instance.address;
    return local$address == null
        ? CopyWith$Mutation$DeleteAddress$deleteAddress$address.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteAddress$deleteAddress$address(
            local$address,
            (e) => call(address: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteAddress$deleteAddress<TRes>
    implements CopyWith$Mutation$DeleteAddress$deleteAddress<TRes> {
  _CopyWithStubImpl$Mutation$DeleteAddress$deleteAddress(this._res);

  TRes _res;

  call({
    Mutation$DeleteAddress$deleteAddress$address? address,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteAddress$deleteAddress$address<TRes> get address =>
      CopyWith$Mutation$DeleteAddress$deleteAddress$address.stub(_res);
}

class Mutation$DeleteAddress$deleteAddress$address {
  Mutation$DeleteAddress$deleteAddress$address({
    required this.id,
    this.$__typename = 'Address',
  });

  factory Mutation$DeleteAddress$deleteAddress$address.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteAddress$deleteAddress$address(
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
    if (other is! Mutation$DeleteAddress$deleteAddress$address ||
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

extension UtilityExtension$Mutation$DeleteAddress$deleteAddress$address
    on Mutation$DeleteAddress$deleteAddress$address {
  CopyWith$Mutation$DeleteAddress$deleteAddress$address<
    Mutation$DeleteAddress$deleteAddress$address
  >
  get copyWith =>
      CopyWith$Mutation$DeleteAddress$deleteAddress$address(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteAddress$deleteAddress$address<TRes> {
  factory CopyWith$Mutation$DeleteAddress$deleteAddress$address(
    Mutation$DeleteAddress$deleteAddress$address instance,
    TRes Function(Mutation$DeleteAddress$deleteAddress$address) then,
  ) = _CopyWithImpl$Mutation$DeleteAddress$deleteAddress$address;

  factory CopyWith$Mutation$DeleteAddress$deleteAddress$address.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteAddress$deleteAddress$address;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteAddress$deleteAddress$address<TRes>
    implements CopyWith$Mutation$DeleteAddress$deleteAddress$address<TRes> {
  _CopyWithImpl$Mutation$DeleteAddress$deleteAddress$address(
    this._instance,
    this._then,
  );

  final Mutation$DeleteAddress$deleteAddress$address _instance;

  final TRes Function(Mutation$DeleteAddress$deleteAddress$address) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteAddress$deleteAddress$address(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteAddress$deleteAddress$address<TRes>
    implements CopyWith$Mutation$DeleteAddress$deleteAddress$address<TRes> {
  _CopyWithStubImpl$Mutation$DeleteAddress$deleteAddress$address(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
