import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetOrders {
  factory Variables$Query$GetOrders({int? first, String? after}) =>
      Variables$Query$GetOrders._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$GetOrders._(this._$data);

  factory Variables$Query$GetOrders.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$GetOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

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
    return result$data;
  }

  CopyWith$Variables$Query$GetOrders<Variables$Query$GetOrders> get copyWith =>
      CopyWith$Variables$Query$GetOrders(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetOrders ||
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
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetOrders<TRes> {
  factory CopyWith$Variables$Query$GetOrders(
    Variables$Query$GetOrders instance,
    TRes Function(Variables$Query$GetOrders) then,
  ) = _CopyWithImpl$Variables$Query$GetOrders;

  factory CopyWith$Variables$Query$GetOrders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetOrders;

  TRes call({int? first, String? after});
}

class _CopyWithImpl$Variables$Query$GetOrders<TRes>
    implements CopyWith$Variables$Query$GetOrders<TRes> {
  _CopyWithImpl$Variables$Query$GetOrders(this._instance, this._then);

  final Variables$Query$GetOrders _instance;

  final TRes Function(Variables$Query$GetOrders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? first = _undefined, Object? after = _undefined}) => _then(
    Variables$Query$GetOrders._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetOrders<TRes>
    implements CopyWith$Variables$Query$GetOrders<TRes> {
  _CopyWithStubImpl$Variables$Query$GetOrders(this._res);

  TRes _res;

  call({int? first, String? after}) => _res;
}

class Query$GetOrders {
  Query$GetOrders({this.orders, this.$__typename = 'Query'});

  factory Query$GetOrders.fromJson(Map<String, dynamic> json) {
    final l$orders = json['orders'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders(
      orders: l$orders == null
          ? null
          : Query$GetOrders$orders.fromJson((l$orders as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders? orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$orders = orders;
    _resultData['orders'] = l$orders?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$orders = orders;
    final l$$__typename = $__typename;
    return Object.hashAll([l$orders, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrders || runtimeType != other.runtimeType) {
      return false;
    }
    final l$orders = orders;
    final lOther$orders = other.orders;
    if (l$orders != lOther$orders) {
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

extension UtilityExtension$Query$GetOrders on Query$GetOrders {
  CopyWith$Query$GetOrders<Query$GetOrders> get copyWith =>
      CopyWith$Query$GetOrders(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders<TRes> {
  factory CopyWith$Query$GetOrders(
    Query$GetOrders instance,
    TRes Function(Query$GetOrders) then,
  ) = _CopyWithImpl$Query$GetOrders;

  factory CopyWith$Query$GetOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders;

  TRes call({Query$GetOrders$orders? orders, String? $__typename});
  CopyWith$Query$GetOrders$orders<TRes> get orders;
}

class _CopyWithImpl$Query$GetOrders<TRes>
    implements CopyWith$Query$GetOrders<TRes> {
  _CopyWithImpl$Query$GetOrders(this._instance, this._then);

  final Query$GetOrders _instance;

  final TRes Function(Query$GetOrders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? orders = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrders(
          orders: orders == _undefined
              ? _instance.orders
              : (orders as Query$GetOrders$orders?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetOrders$orders<TRes> get orders {
    final local$orders = _instance.orders;
    return local$orders == null
        ? CopyWith$Query$GetOrders$orders.stub(_then(_instance))
        : CopyWith$Query$GetOrders$orders(local$orders, (e) => call(orders: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders<TRes>
    implements CopyWith$Query$GetOrders<TRes> {
  _CopyWithStubImpl$Query$GetOrders(this._res);

  TRes _res;

  call({Query$GetOrders$orders? orders, String? $__typename}) => _res;

  CopyWith$Query$GetOrders$orders<TRes> get orders =>
      CopyWith$Query$GetOrders$orders.stub(_res);
}

const documentNodeQueryGetOrders = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetOrders'),
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
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'orders'),
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
                              name: NameNode(value: 'status'),
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
                                                name: NameNode(
                                                  value: 'quantity',
                                                ),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(
                                                  value: 'mealPlan',
                                                ),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: SelectionSetNode(
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
                                                        value: 'price',
                                                      ),
                                                      alias: null,
                                                      arguments: [],
                                                      directives: [],
                                                      selectionSet: null,
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
                              name: NameNode(value: 'deliveries'),
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
                                                name: NameNode(value: 'status'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(
                                                  value: 'deliveryDate',
                                                ),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
                                              ),
                                              FieldNode(
                                                name: NameNode(value: 'driver'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: SelectionSetNode(
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
                                                        value: 'email',
                                                      ),
                                                      alias: null,
                                                      arguments: [],
                                                      directives: [],
                                                      selectionSet: null,
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
Query$GetOrders _parserFn$Query$GetOrders(Map<String, dynamic> data) =>
    Query$GetOrders.fromJson(data);
typedef OnQueryComplete$Query$GetOrders =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetOrders?);

class Options$Query$GetOrders extends graphql.QueryOptions<Query$GetOrders> {
  Options$Query$GetOrders({
    String? operationName,
    Variables$Query$GetOrders? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetOrders? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetOrders? onComplete,
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
                 data == null ? null : _parserFn$Query$GetOrders(data),
               ),
         onError: onError,
         document: documentNodeQueryGetOrders,
         parserFn: _parserFn$Query$GetOrders,
       );

  final OnQueryComplete$Query$GetOrders? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetOrders
    extends graphql.WatchQueryOptions<Query$GetOrders> {
  WatchOptions$Query$GetOrders({
    String? operationName,
    Variables$Query$GetOrders? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetOrders? typedOptimisticResult,
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
         document: documentNodeQueryGetOrders,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetOrders,
       );
}

class FetchMoreOptions$Query$GetOrders extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetOrders({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetOrders? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetOrders,
       );
}

extension ClientExtension$Query$GetOrders on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetOrders>> query$GetOrders([
    Options$Query$GetOrders? options,
  ]) async => await this.query(options ?? Options$Query$GetOrders());

  graphql.ObservableQuery<Query$GetOrders> watchQuery$GetOrders([
    WatchOptions$Query$GetOrders? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetOrders());

  void writeQuery$GetOrders({
    required Query$GetOrders data,
    Variables$Query$GetOrders? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetOrders),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetOrders? readQuery$GetOrders({
    Variables$Query$GetOrders? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetOrders),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetOrders.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetOrders> useQuery$GetOrders([
  Options$Query$GetOrders? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetOrders());
graphql.ObservableQuery<Query$GetOrders> useWatchQuery$GetOrders([
  WatchOptions$Query$GetOrders? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetOrders());

class Query$GetOrders$Widget extends graphql_flutter.Query<Query$GetOrders> {
  Query$GetOrders$Widget({
    widgets.Key? key,
    Options$Query$GetOrders? options,
    required graphql_flutter.QueryBuilder<Query$GetOrders> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetOrders(),
         builder: builder,
       );
}

class Query$GetOrders$orders {
  Query$GetOrders$orders({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'OrderCursorConnection',
  });

  factory Query$GetOrders$orders.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetOrders$orders$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetOrders$orders$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrders$orders$edges?>? edges;

  final Query$GetOrders$orders$pageInfo pageInfo;

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
    if (other is! Query$GetOrders$orders || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetOrders$orders on Query$GetOrders$orders {
  CopyWith$Query$GetOrders$orders<Query$GetOrders$orders> get copyWith =>
      CopyWith$Query$GetOrders$orders(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders<TRes> {
  factory CopyWith$Query$GetOrders$orders(
    Query$GetOrders$orders instance,
    TRes Function(Query$GetOrders$orders) then,
  ) = _CopyWithImpl$Query$GetOrders$orders;

  factory CopyWith$Query$GetOrders$orders.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders;

  TRes call({
    List<Query$GetOrders$orders$edges?>? edges,
    Query$GetOrders$orders$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetOrders$orders$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrders$orders$edges<Query$GetOrders$orders$edges>?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetOrders$orders$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetOrders$orders<TRes>
    implements CopyWith$Query$GetOrders$orders<TRes> {
  _CopyWithImpl$Query$GetOrders$orders(this._instance, this._then);

  final Query$GetOrders$orders _instance;

  final TRes Function(Query$GetOrders$orders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetOrders$orders$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetOrders$orders$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetOrders$orders$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrders$orders$edges<Query$GetOrders$orders$edges>?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetOrders$orders$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetOrders$orders$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetOrders$orders$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders<TRes>
    implements CopyWith$Query$GetOrders$orders<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders(this._res);

  TRes _res;

  call({
    List<Query$GetOrders$orders$edges?>? edges,
    Query$GetOrders$orders$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetOrders$orders$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetOrders$orders$pageInfo.stub(_res);
}

class Query$GetOrders$orders$edges {
  Query$GetOrders$orders$edges({this.node, this.$__typename = 'OrderEdge'});

  factory Query$GetOrders$orders$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges(
      node: l$node == null
          ? null
          : Query$GetOrders$orders$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders$edges$node? node;

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
    if (other is! Query$GetOrders$orders$edges ||
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

extension UtilityExtension$Query$GetOrders$orders$edges
    on Query$GetOrders$orders$edges {
  CopyWith$Query$GetOrders$orders$edges<Query$GetOrders$orders$edges>
  get copyWith => CopyWith$Query$GetOrders$orders$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$edges<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges(
    Query$GetOrders$orders$edges instance,
    TRes Function(Query$GetOrders$orders$edges) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges;

  factory CopyWith$Query$GetOrders$orders$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges;

  TRes call({Query$GetOrders$orders$edges$node? node, String? $__typename});
  CopyWith$Query$GetOrders$orders$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetOrders$orders$edges<TRes>
    implements CopyWith$Query$GetOrders$orders$edges<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges(this._instance, this._then);

  final Query$GetOrders$orders$edges _instance;

  final TRes Function(Query$GetOrders$orders$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrders$orders$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetOrders$orders$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetOrders$orders$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetOrders$orders$edges$node.stub(_then(_instance))
        : CopyWith$Query$GetOrders$orders$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges<TRes>
    implements CopyWith$Query$GetOrders$orders$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges(this._res);

  TRes _res;

  call({Query$GetOrders$orders$edges$node? node, String? $__typename}) => _res;

  CopyWith$Query$GetOrders$orders$edges$node<TRes> get node =>
      CopyWith$Query$GetOrders$orders$edges$node.stub(_res);
}

class Query$GetOrders$orders$edges$node {
  Query$GetOrders$orders$edges$node({
    required this.id,
    required this.status,
    required this.total,
    this.customer,
    this.restaurant,
    this.orderItems,
    this.deliveries,
    this.$__typename = 'Order',
  });

  factory Query$GetOrders$orders$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$total = json['total'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$orderItems = json['orderItems'];
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node(
      id: (l$id as String),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      total: (l$total as int),
      customer: l$customer == null
          ? null
          : Query$GetOrders$orders$edges$node$customer.fromJson(
              (l$customer as Map<String, dynamic>),
            ),
      restaurant: l$restaurant == null
          ? null
          : Query$GetOrders$orders$edges$node$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      orderItems: l$orderItems == null
          ? null
          : Query$GetOrders$orders$edges$node$orderItems.fromJson(
              (l$orderItems as Map<String, dynamic>),
            ),
      deliveries: l$deliveries == null
          ? null
          : Query$GetOrders$orders$edges$node$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$OrderStatus status;

  final int total;

  final Query$GetOrders$orders$edges$node$customer? customer;

  final Query$GetOrders$orders$edges$node$restaurant? restaurant;

  final Query$GetOrders$orders$edges$node$orderItems? orderItems;

  final Query$GetOrders$orders$edges$node$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$total = total;
    _resultData['total'] = l$total;
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$orderItems = orderItems;
    _resultData['orderItems'] = l$orderItems?.toJson();
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$total = total;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$orderItems = orderItems;
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$total,
      l$customer,
      l$restaurant,
      l$orderItems,
      l$deliveries,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrders$orders$edges$node ||
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
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (l$orderItems != lOther$orderItems) {
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

extension UtilityExtension$Query$GetOrders$orders$edges$node
    on Query$GetOrders$orders$edges$node {
  CopyWith$Query$GetOrders$orders$edges$node<Query$GetOrders$orders$edges$node>
  get copyWith => CopyWith$Query$GetOrders$orders$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$edges$node<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node(
    Query$GetOrders$orders$edges$node instance,
    TRes Function(Query$GetOrders$orders$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node;

  factory CopyWith$Query$GetOrders$orders$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node;

  TRes call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    Query$GetOrders$orders$edges$node$customer? customer,
    Query$GetOrders$orders$edges$node$restaurant? restaurant,
    Query$GetOrders$orders$edges$node$orderItems? orderItems,
    Query$GetOrders$orders$edges$node$deliveries? deliveries,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$customer<TRes> get customer;
  CopyWith$Query$GetOrders$orders$edges$node$restaurant<TRes> get restaurant;
  CopyWith$Query$GetOrders$orders$edges$node$orderItems<TRes> get orderItems;
  CopyWith$Query$GetOrders$orders$edges$node$deliveries<TRes> get deliveries;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node(this._instance, this._then);

  final Query$GetOrders$orders$edges$node _instance;

  final TRes Function(Query$GetOrders$orders$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? total = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? orderItems = _undefined,
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      customer: customer == _undefined
          ? _instance.customer
          : (customer as Query$GetOrders$orders$edges$node$customer?),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetOrders$orders$edges$node$restaurant?),
      orderItems: orderItems == _undefined
          ? _instance.orderItems
          : (orderItems as Query$GetOrders$orders$edges$node$orderItems?),
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Query$GetOrders$orders$edges$node$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrders$orders$edges$node$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetOrders$orders$edges$node$customer.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$customer(
            local$customer,
            (e) => call(customer: e),
          );
  }

  CopyWith$Query$GetOrders$orders$edges$node$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetOrders$orders$edges$node$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Query$GetOrders$orders$edges$node$orderItems<TRes> get orderItems {
    final local$orderItems = _instance.orderItems;
    return local$orderItems == null
        ? CopyWith$Query$GetOrders$orders$edges$node$orderItems.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$orderItems(
            local$orderItems,
            (e) => call(orderItems: e),
          );
  }

  CopyWith$Query$GetOrders$orders$edges$node$deliveries<TRes> get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Query$GetOrders$orders$edges$node$deliveries.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    Query$GetOrders$orders$edges$node$customer? customer,
    Query$GetOrders$orders$edges$node$restaurant? restaurant,
    Query$GetOrders$orders$edges$node$orderItems? orderItems,
    Query$GetOrders$orders$edges$node$deliveries? deliveries,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrders$orders$edges$node$customer<TRes> get customer =>
      CopyWith$Query$GetOrders$orders$edges$node$customer.stub(_res);

  CopyWith$Query$GetOrders$orders$edges$node$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetOrders$orders$edges$node$restaurant.stub(_res);

  CopyWith$Query$GetOrders$orders$edges$node$orderItems<TRes> get orderItems =>
      CopyWith$Query$GetOrders$orders$edges$node$orderItems.stub(_res);

  CopyWith$Query$GetOrders$orders$edges$node$deliveries<TRes> get deliveries =>
      CopyWith$Query$GetOrders$orders$edges$node$deliveries.stub(_res);
}

class Query$GetOrders$orders$edges$node$customer {
  Query$GetOrders$orders$edges$node$customer({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$GetOrders$orders$edges$node$customer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$customer(
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
    if (other is! Query$GetOrders$orders$edges$node$customer ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$customer
    on Query$GetOrders$orders$edges$node$customer {
  CopyWith$Query$GetOrders$orders$edges$node$customer<
    Query$GetOrders$orders$edges$node$customer
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$customer(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$customer<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$customer(
    Query$GetOrders$orders$edges$node$customer instance,
    TRes Function(Query$GetOrders$orders$edges$node$customer) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$customer;

  factory CopyWith$Query$GetOrders$orders$edges$node$customer.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$customer;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$customer<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$customer<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$customer(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$customer _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$customer(
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

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$customer<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$customer<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$customer(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Query$GetOrders$orders$edges$node$restaurant {
  Query$GetOrders$orders$edges$node$restaurant({
    required this.id,
    required this.name,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetOrders$orders$edges$node$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$restaurant(
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
    if (other is! Query$GetOrders$orders$edges$node$restaurant ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$restaurant
    on Query$GetOrders$orders$edges$node$restaurant {
  CopyWith$Query$GetOrders$orders$edges$node$restaurant<
    Query$GetOrders$orders$edges$node$restaurant
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$restaurant<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$restaurant(
    Query$GetOrders$orders$edges$node$restaurant instance,
    TRes Function(Query$GetOrders$orders$edges$node$restaurant) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$restaurant;

  factory CopyWith$Query$GetOrders$orders$edges$node$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$restaurant;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$restaurant<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$restaurant<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$restaurant _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$restaurant(
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

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$restaurant<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$restaurant(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetOrders$orders$edges$node$orderItems {
  Query$GetOrders$orders$edges$node$orderItems({
    this.edges,
    this.$__typename = 'OrderItemCursorConnection',
  });

  factory Query$GetOrders$orders$edges$node$orderItems.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$orderItems(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetOrders$orders$edges$node$orderItems$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrders$orders$edges$node$orderItems$edges?>? edges;

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
    if (other is! Query$GetOrders$orders$edges$node$orderItems ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$orderItems
    on Query$GetOrders$orders$edges$node$orderItems {
  CopyWith$Query$GetOrders$orders$edges$node$orderItems<
    Query$GetOrders$orders$edges$node$orderItems
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$orderItems(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$orderItems<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems(
    Query$GetOrders$orders$edges$node$orderItems instance,
    TRes Function(Query$GetOrders$orders$edges$node$orderItems) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems;

  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems;

  TRes call({
    List<Query$GetOrders$orders$edges$node$orderItems$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetOrders$orders$edges$node$orderItems$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges<
          Query$GetOrders$orders$edges$node$orderItems$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$orderItems<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$orderItems _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$orderItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$orderItems(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<Query$GetOrders$orders$edges$node$orderItems$edges?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetOrders$orders$edges$node$orderItems$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges<
          Query$GetOrders$orders$edges$node$orderItems$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$orderItems<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems(this._res);

  TRes _res;

  call({
    List<Query$GetOrders$orders$edges$node$orderItems$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetOrders$orders$edges$node$orderItems$edges {
  Query$GetOrders$orders$edges$node$orderItems$edges({
    this.node,
    this.$__typename = 'OrderItemEdge',
  });

  factory Query$GetOrders$orders$edges$node$orderItems$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$orderItems$edges(
      node: l$node == null
          ? null
          : Query$GetOrders$orders$edges$node$orderItems$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders$edges$node$orderItems$edges$node? node;

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
    if (other is! Query$GetOrders$orders$edges$node$orderItems$edges ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$orderItems$edges
    on Query$GetOrders$orders$edges$node$orderItems$edges {
  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges<
    Query$GetOrders$orders$edges$node$orderItems$edges
  >
  get copyWith => CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges<
  TRes
> {
  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges(
    Query$GetOrders$orders$edges$node$orderItems$edges instance,
    TRes Function(Query$GetOrders$orders$edges$node$orderItems$edges) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges;

  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges;

  TRes call({
    Query$GetOrders$orders$edges$node$orderItems$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$orderItems$edges _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$orderItems$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$orderItems$edges(
      node: node == _undefined
          ? _instance.node
          : (node as Query$GetOrders$orders$edges$node$orderItems$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges(
    this._res,
  );

  TRes _res;

  call({
    Query$GetOrders$orders$edges$node$orderItems$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<TRes>
  get node =>
      CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node.stub(
        _res,
      );
}

class Query$GetOrders$orders$edges$node$orderItems$edges$node {
  Query$GetOrders$orders$edges$node$orderItems$edges$node({
    required this.id,
    required this.quantity,
    required this.mealPlan,
    this.$__typename = 'OrderItem',
  });

  factory Query$GetOrders$orders$edges$node$orderItems$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$orderItems$edges$node(
      id: (l$id as String),
      quantity: (l$quantity as int),
      mealPlan:
          Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan.fromJson(
            (l$mealPlan as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int quantity;

  final Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan
  mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan.toJson();
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
    if (other is! Query$GetOrders$orders$edges$node$orderItems$edges$node ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$orderItems$edges$node
    on Query$GetOrders$orders$edges$node$orderItems$edges$node {
  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<
    Query$GetOrders$orders$edges$node$orderItems$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<
  TRes
> {
  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node(
    Query$GetOrders$orders$edges$node$orderItems$edges$node instance,
    TRes Function(Query$GetOrders$orders$edges$node$orderItems$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node;

  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node;

  TRes call({
    String? id,
    int? quantity,
    Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan? mealPlan,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$orderItems$edges$node _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$orderItems$edges$node)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$orderItems$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      quantity: quantity == _undefined || quantity == null
          ? _instance.quantity
          : (quantity as int),
      mealPlan: mealPlan == _undefined || mealPlan == null
          ? _instance.mealPlan
          : (mealPlan
                as Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
      local$mealPlan,
      (e) => call(mealPlan: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    int? quantity,
    Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan? mealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan =>
      CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan.stub(
        _res,
      );
}

class Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan {
  Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan({
    required this.id,
    required this.name,
    this.price,
    this.$__typename = 'MealPlan',
  });

  factory Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int? price;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$price, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan ||
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
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan
    on Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan {
  CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
    Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
  TRes
> {
  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
    Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan instance,
    TRes Function(
      Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan,
    )
    then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan;

  factory CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan;

  TRes call({String? id, String? name, int? price, String? $__typename});
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan
  _instance;

  final TRes Function(
    Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      price: price == _undefined ? _instance.price : (price as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$orderItems$edges$node$mealPlan(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, int? price, String? $__typename}) => _res;
}

class Query$GetOrders$orders$edges$node$deliveries {
  Query$GetOrders$orders$edges$node$deliveries({
    this.edges,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Query$GetOrders$orders$edges$node$deliveries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetOrders$orders$edges$node$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrders$orders$edges$node$deliveries$edges?>? edges;

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
    if (other is! Query$GetOrders$orders$edges$node$deliveries ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$deliveries
    on Query$GetOrders$orders$edges$node$deliveries {
  CopyWith$Query$GetOrders$orders$edges$node$deliveries<
    Query$GetOrders$orders$edges$node$deliveries
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$deliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$deliveries<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries(
    Query$GetOrders$orders$edges$node$deliveries instance,
    TRes Function(Query$GetOrders$orders$edges$node$deliveries) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries;

  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries;

  TRes call({
    List<Query$GetOrders$orders$edges$node$deliveries$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetOrders$orders$edges$node$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges<
          Query$GetOrders$orders$edges$node$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$deliveries<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$deliveries _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$deliveries(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<Query$GetOrders$orders$edges$node$deliveries$edges?>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetOrders$orders$edges$node$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges<
          Query$GetOrders$orders$edges$node$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$deliveries<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries(this._res);

  TRes _res;

  call({
    List<Query$GetOrders$orders$edges$node$deliveries$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetOrders$orders$edges$node$deliveries$edges {
  Query$GetOrders$orders$edges$node$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Query$GetOrders$orders$edges$node$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$deliveries$edges(
      node: l$node == null
          ? null
          : Query$GetOrders$orders$edges$node$deliveries$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders$edges$node$deliveries$edges$node? node;

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
    if (other is! Query$GetOrders$orders$edges$node$deliveries$edges ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$deliveries$edges
    on Query$GetOrders$orders$edges$node$deliveries$edges {
  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges<
    Query$GetOrders$orders$edges$node$deliveries$edges
  >
  get copyWith => CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges<
  TRes
> {
  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges(
    Query$GetOrders$orders$edges$node$deliveries$edges instance,
    TRes Function(Query$GetOrders$orders$edges$node$deliveries$edges) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges;

  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges;

  TRes call({
    Query$GetOrders$orders$edges$node$deliveries$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$deliveries$edges _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$deliveries$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$deliveries$edges(
      node: node == _undefined
          ? _instance.node
          : (node as Query$GetOrders$orders$edges$node$deliveries$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges(
    this._res,
  );

  TRes _res;

  call({
    Query$GetOrders$orders$edges$node$deliveries$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<TRes>
  get node =>
      CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node.stub(
        _res,
      );
}

class Query$GetOrders$orders$edges$node$deliveries$edges$node {
  Query$GetOrders$orders$edges$node$deliveries$edges$node({
    required this.id,
    required this.status,
    required this.deliveryDate,
    this.driver,
    this.$__typename = 'Delivery',
  });

  factory Query$GetOrders$orders$edges$node$deliveries$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$deliveryDate = json['deliveryDate'];
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$deliveries$edges$node(
      id: (l$id as String),
      status: fromJson$Enum$DeliveryStatus((l$status as String)),
      deliveryDate: (l$deliveryDate as String),
      driver: l$driver == null
          ? null
          : Query$GetOrders$orders$edges$node$deliveries$edges$node$driver.fromJson(
              (l$driver as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$DeliveryStatus status;

  final String deliveryDate;

  final Query$GetOrders$orders$edges$node$deliveries$edges$node$driver? driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    _resultData['deliveryDate'] = l$deliveryDate;
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$deliveryDate,
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrders$orders$edges$node$deliveries$edges$node ||
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
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$deliveries$edges$node
    on Query$GetOrders$orders$edges$node$deliveries$edges$node {
  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<
    Query$GetOrders$orders$edges$node$deliveries$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<
  TRes
> {
  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node(
    Query$GetOrders$orders$edges$node$deliveries$edges$node instance,
    TRes Function(Query$GetOrders$orders$edges$node$deliveries$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node;

  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node;

  TRes call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Query$GetOrders$orders$edges$node$deliveries$edges$node$driver? driver,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<TRes>
  get driver;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$deliveries$edges$node _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$deliveries$edges$node)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$deliveries$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$DeliveryStatus),
      deliveryDate: deliveryDate == _undefined || deliveryDate == null
          ? _instance.deliveryDate
          : (deliveryDate as String),
      driver: driver == _undefined
          ? _instance.driver
          : (driver
                as Query$GetOrders$orders$edges$node$deliveries$edges$node$driver?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<TRes>
  get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
            local$driver,
            (e) => call(driver: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Query$GetOrders$orders$edges$node$deliveries$edges$node$driver? driver,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<TRes>
  get driver =>
      CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver.stub(
        _res,
      );
}

class Query$GetOrders$orders$edges$node$deliveries$edges$node$driver {
  Query$GetOrders$orders$edges$node$deliveries$edges$node$driver({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$GetOrders$orders$edges$node$deliveries$edges$node$driver.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
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
    if (other
            is! Query$GetOrders$orders$edges$node$deliveries$edges$node$driver ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver
    on Query$GetOrders$orders$edges$node$deliveries$edges$node$driver {
  CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<
    Query$GetOrders$orders$edges$node$deliveries$edges$node$driver
  >
  get copyWith =>
      CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<
  TRes
> {
  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
    Query$GetOrders$orders$edges$node$deliveries$edges$node$driver instance,
    TRes Function(
      Query$GetOrders$orders$edges$node$deliveries$edges$node$driver,
    )
    then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver;

  factory CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<
          TRes
        > {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$deliveries$edges$node$driver
  _instance;

  final TRes Function(
    Query$GetOrders$orders$edges$node$deliveries$edges$node$driver,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
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

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<
  TRes
>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver<
          TRes
        > {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$deliveries$edges$node$driver(
    this._res,
  );

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Query$GetOrders$orders$pageInfo {
  Query$GetOrders$orders$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'OrderPageInfo',
  });

  factory Query$GetOrders$orders$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$pageInfo(
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
    if (other is! Query$GetOrders$orders$pageInfo ||
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

extension UtilityExtension$Query$GetOrders$orders$pageInfo
    on Query$GetOrders$orders$pageInfo {
  CopyWith$Query$GetOrders$orders$pageInfo<Query$GetOrders$orders$pageInfo>
  get copyWith => CopyWith$Query$GetOrders$orders$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetOrders$orders$pageInfo<TRes> {
  factory CopyWith$Query$GetOrders$orders$pageInfo(
    Query$GetOrders$orders$pageInfo instance,
    TRes Function(Query$GetOrders$orders$pageInfo) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$pageInfo;

  factory CopyWith$Query$GetOrders$orders$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetOrders$orders$pageInfo<TRes>
    implements CopyWith$Query$GetOrders$orders$pageInfo<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$pageInfo(this._instance, this._then);

  final Query$GetOrders$orders$pageInfo _instance;

  final TRes Function(Query$GetOrders$orders$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrders$orders$pageInfo(
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

class _CopyWithStubImpl$Query$GetOrders$orders$pageInfo<TRes>
    implements CopyWith$Query$GetOrders$orders$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetOrder {
  factory Variables$Query$GetOrder({required String id}) =>
      Variables$Query$GetOrder._({r'id': id});

  Variables$Query$GetOrder._(this._$data);

  factory Variables$Query$GetOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetOrder<Variables$Query$GetOrder> get copyWith =>
      CopyWith$Variables$Query$GetOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetOrder ||
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

abstract class CopyWith$Variables$Query$GetOrder<TRes> {
  factory CopyWith$Variables$Query$GetOrder(
    Variables$Query$GetOrder instance,
    TRes Function(Variables$Query$GetOrder) then,
  ) = _CopyWithImpl$Variables$Query$GetOrder;

  factory CopyWith$Variables$Query$GetOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetOrder;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetOrder<TRes>
    implements CopyWith$Variables$Query$GetOrder<TRes> {
  _CopyWithImpl$Variables$Query$GetOrder(this._instance, this._then);

  final Variables$Query$GetOrder _instance;

  final TRes Function(Variables$Query$GetOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetOrder._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetOrder<TRes>
    implements CopyWith$Variables$Query$GetOrder<TRes> {
  _CopyWithStubImpl$Variables$Query$GetOrder(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetOrder {
  Query$GetOrder({this.order, this.$__typename = 'Query'});

  factory Query$GetOrder.fromJson(Map<String, dynamic> json) {
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder(
      order: l$order == null
          ? null
          : Query$GetOrder$order.fromJson((l$order as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrder$order? order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([l$order, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
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

extension UtilityExtension$Query$GetOrder on Query$GetOrder {
  CopyWith$Query$GetOrder<Query$GetOrder> get copyWith =>
      CopyWith$Query$GetOrder(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder<TRes> {
  factory CopyWith$Query$GetOrder(
    Query$GetOrder instance,
    TRes Function(Query$GetOrder) then,
  ) = _CopyWithImpl$Query$GetOrder;

  factory CopyWith$Query$GetOrder.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder;

  TRes call({Query$GetOrder$order? order, String? $__typename});
  CopyWith$Query$GetOrder$order<TRes> get order;
}

class _CopyWithImpl$Query$GetOrder<TRes>
    implements CopyWith$Query$GetOrder<TRes> {
  _CopyWithImpl$Query$GetOrder(this._instance, this._then);

  final Query$GetOrder _instance;

  final TRes Function(Query$GetOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrder(
          order: order == _undefined
              ? _instance.order
              : (order as Query$GetOrder$order?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetOrder$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Query$GetOrder$order.stub(_then(_instance))
        : CopyWith$Query$GetOrder$order(local$order, (e) => call(order: e));
  }
}

class _CopyWithStubImpl$Query$GetOrder<TRes>
    implements CopyWith$Query$GetOrder<TRes> {
  _CopyWithStubImpl$Query$GetOrder(this._res);

  TRes _res;

  call({Query$GetOrder$order? order, String? $__typename}) => _res;

  CopyWith$Query$GetOrder$order<TRes> get order =>
      CopyWith$Query$GetOrder$order.stub(_res);
}

const documentNodeQueryGetOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetOrder'),
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
            name: NameNode(value: 'order'),
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
                  name: NameNode(value: 'status'),
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
                  name: NameNode(value: 'paymentIntentId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
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
                                          name: NameNode(value: 'price'),
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
                  name: NameNode(value: 'deliveries'),
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
                                    name: NameNode(value: 'driver'),
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
Query$GetOrder _parserFn$Query$GetOrder(Map<String, dynamic> data) =>
    Query$GetOrder.fromJson(data);
typedef OnQueryComplete$Query$GetOrder =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetOrder?);

class Options$Query$GetOrder extends graphql.QueryOptions<Query$GetOrder> {
  Options$Query$GetOrder({
    String? operationName,
    required Variables$Query$GetOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetOrder? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetOrder? onComplete,
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
                 data == null ? null : _parserFn$Query$GetOrder(data),
               ),
         onError: onError,
         document: documentNodeQueryGetOrder,
         parserFn: _parserFn$Query$GetOrder,
       );

  final OnQueryComplete$Query$GetOrder? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetOrder
    extends graphql.WatchQueryOptions<Query$GetOrder> {
  WatchOptions$Query$GetOrder({
    String? operationName,
    required Variables$Query$GetOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetOrder? typedOptimisticResult,
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
         document: documentNodeQueryGetOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetOrder,
       );
}

class FetchMoreOptions$Query$GetOrder extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetOrder({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetOrder variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetOrder,
       );
}

extension ClientExtension$Query$GetOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetOrder>> query$GetOrder(
    Options$Query$GetOrder options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetOrder> watchQuery$GetOrder(
    WatchOptions$Query$GetOrder options,
  ) => this.watchQuery(options);

  void writeQuery$GetOrder({
    required Query$GetOrder data,
    required Variables$Query$GetOrder variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetOrder),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetOrder? readQuery$GetOrder({
    required Variables$Query$GetOrder variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetOrder),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetOrder.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetOrder> useQuery$GetOrder(
  Options$Query$GetOrder options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetOrder> useWatchQuery$GetOrder(
  WatchOptions$Query$GetOrder options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetOrder$Widget extends graphql_flutter.Query<Query$GetOrder> {
  Query$GetOrder$Widget({
    widgets.Key? key,
    required Options$Query$GetOrder options,
    required graphql_flutter.QueryBuilder<Query$GetOrder> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetOrder$order {
  Query$GetOrder$order({
    required this.id,
    required this.status,
    required this.total,
    this.paymentIntentId,
    this.deliveryFirstName,
    this.deliveryLastName,
    this.deliveryPhoneNumber,
    this.deliveryStreet,
    this.deliveryApartment,
    this.deliveryCity,
    this.deliveryZipCode,
    this.customer,
    this.restaurant,
    this.orderItems,
    this.deliveries,
    this.$__typename = 'Order',
  });

  factory Query$GetOrder$order.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$total = json['total'];
    final l$paymentIntentId = json['paymentIntentId'];
    final l$deliveryFirstName = json['deliveryFirstName'];
    final l$deliveryLastName = json['deliveryLastName'];
    final l$deliveryPhoneNumber = json['deliveryPhoneNumber'];
    final l$deliveryStreet = json['deliveryStreet'];
    final l$deliveryApartment = json['deliveryApartment'];
    final l$deliveryCity = json['deliveryCity'];
    final l$deliveryZipCode = json['deliveryZipCode'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$orderItems = json['orderItems'];
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order(
      id: (l$id as String),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      total: (l$total as int),
      paymentIntentId: (l$paymentIntentId as String?),
      deliveryFirstName: (l$deliveryFirstName as String?),
      deliveryLastName: (l$deliveryLastName as String?),
      deliveryPhoneNumber: (l$deliveryPhoneNumber as String?),
      deliveryStreet: (l$deliveryStreet as String?),
      deliveryApartment: (l$deliveryApartment as String?),
      deliveryCity: (l$deliveryCity as String?),
      deliveryZipCode: (l$deliveryZipCode as String?),
      customer: l$customer == null
          ? null
          : Query$GetOrder$order$customer.fromJson(
              (l$customer as Map<String, dynamic>),
            ),
      restaurant: l$restaurant == null
          ? null
          : Query$GetOrder$order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      orderItems: l$orderItems == null
          ? null
          : Query$GetOrder$order$orderItems.fromJson(
              (l$orderItems as Map<String, dynamic>),
            ),
      deliveries: l$deliveries == null
          ? null
          : Query$GetOrder$order$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$OrderStatus status;

  final int total;

  final String? paymentIntentId;

  final String? deliveryFirstName;

  final String? deliveryLastName;

  final String? deliveryPhoneNumber;

  final String? deliveryStreet;

  final String? deliveryApartment;

  final String? deliveryCity;

  final String? deliveryZipCode;

  final Query$GetOrder$order$customer? customer;

  final Query$GetOrder$order$restaurant? restaurant;

  final Query$GetOrder$order$orderItems? orderItems;

  final Query$GetOrder$order$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$total = total;
    _resultData['total'] = l$total;
    final l$paymentIntentId = paymentIntentId;
    _resultData['paymentIntentId'] = l$paymentIntentId;
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
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$orderItems = orderItems;
    _resultData['orderItems'] = l$orderItems?.toJson();
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$total = total;
    final l$paymentIntentId = paymentIntentId;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$orderItems = orderItems;
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$total,
      l$paymentIntentId,
      l$deliveryFirstName,
      l$deliveryLastName,
      l$deliveryPhoneNumber,
      l$deliveryStreet,
      l$deliveryApartment,
      l$deliveryCity,
      l$deliveryZipCode,
      l$customer,
      l$restaurant,
      l$orderItems,
      l$deliveries,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder$order || runtimeType != other.runtimeType) {
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
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$paymentIntentId = paymentIntentId;
    final lOther$paymentIntentId = other.paymentIntentId;
    if (l$paymentIntentId != lOther$paymentIntentId) {
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
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (l$orderItems != lOther$orderItems) {
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

extension UtilityExtension$Query$GetOrder$order on Query$GetOrder$order {
  CopyWith$Query$GetOrder$order<Query$GetOrder$order> get copyWith =>
      CopyWith$Query$GetOrder$order(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order<TRes> {
  factory CopyWith$Query$GetOrder$order(
    Query$GetOrder$order instance,
    TRes Function(Query$GetOrder$order) then,
  ) = _CopyWithImpl$Query$GetOrder$order;

  factory CopyWith$Query$GetOrder$order.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order;

  TRes call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Query$GetOrder$order$customer? customer,
    Query$GetOrder$order$restaurant? restaurant,
    Query$GetOrder$order$orderItems? orderItems,
    Query$GetOrder$order$deliveries? deliveries,
    String? $__typename,
  });
  CopyWith$Query$GetOrder$order$customer<TRes> get customer;
  CopyWith$Query$GetOrder$order$restaurant<TRes> get restaurant;
  CopyWith$Query$GetOrder$order$orderItems<TRes> get orderItems;
  CopyWith$Query$GetOrder$order$deliveries<TRes> get deliveries;
}

class _CopyWithImpl$Query$GetOrder$order<TRes>
    implements CopyWith$Query$GetOrder$order<TRes> {
  _CopyWithImpl$Query$GetOrder$order(this._instance, this._then);

  final Query$GetOrder$order _instance;

  final TRes Function(Query$GetOrder$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? total = _undefined,
    Object? paymentIntentId = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? orderItems = _undefined,
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      paymentIntentId: paymentIntentId == _undefined
          ? _instance.paymentIntentId
          : (paymentIntentId as String?),
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
      customer: customer == _undefined
          ? _instance.customer
          : (customer as Query$GetOrder$order$customer?),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetOrder$order$restaurant?),
      orderItems: orderItems == _undefined
          ? _instance.orderItems
          : (orderItems as Query$GetOrder$order$orderItems?),
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Query$GetOrder$order$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrder$order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Query$GetOrder$order$customer.stub(_then(_instance))
        : CopyWith$Query$GetOrder$order$customer(
            local$customer,
            (e) => call(customer: e),
          );
  }

  CopyWith$Query$GetOrder$order$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetOrder$order$restaurant.stub(_then(_instance))
        : CopyWith$Query$GetOrder$order$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Query$GetOrder$order$orderItems<TRes> get orderItems {
    final local$orderItems = _instance.orderItems;
    return local$orderItems == null
        ? CopyWith$Query$GetOrder$order$orderItems.stub(_then(_instance))
        : CopyWith$Query$GetOrder$order$orderItems(
            local$orderItems,
            (e) => call(orderItems: e),
          );
  }

  CopyWith$Query$GetOrder$order$deliveries<TRes> get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Query$GetOrder$order$deliveries.stub(_then(_instance))
        : CopyWith$Query$GetOrder$order$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrder$order<TRes>
    implements CopyWith$Query$GetOrder$order<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order(this._res);

  TRes _res;

  call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Query$GetOrder$order$customer? customer,
    Query$GetOrder$order$restaurant? restaurant,
    Query$GetOrder$order$orderItems? orderItems,
    Query$GetOrder$order$deliveries? deliveries,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrder$order$customer<TRes> get customer =>
      CopyWith$Query$GetOrder$order$customer.stub(_res);

  CopyWith$Query$GetOrder$order$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetOrder$order$restaurant.stub(_res);

  CopyWith$Query$GetOrder$order$orderItems<TRes> get orderItems =>
      CopyWith$Query$GetOrder$order$orderItems.stub(_res);

  CopyWith$Query$GetOrder$order$deliveries<TRes> get deliveries =>
      CopyWith$Query$GetOrder$order$deliveries.stub(_res);
}

class Query$GetOrder$order$customer {
  Query$GetOrder$order$customer({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$GetOrder$order$customer.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$customer(
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
    if (other is! Query$GetOrder$order$customer ||
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

extension UtilityExtension$Query$GetOrder$order$customer
    on Query$GetOrder$order$customer {
  CopyWith$Query$GetOrder$order$customer<Query$GetOrder$order$customer>
  get copyWith => CopyWith$Query$GetOrder$order$customer(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$customer<TRes> {
  factory CopyWith$Query$GetOrder$order$customer(
    Query$GetOrder$order$customer instance,
    TRes Function(Query$GetOrder$order$customer) then,
  ) = _CopyWithImpl$Query$GetOrder$order$customer;

  factory CopyWith$Query$GetOrder$order$customer.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$customer;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Query$GetOrder$order$customer<TRes>
    implements CopyWith$Query$GetOrder$order$customer<TRes> {
  _CopyWithImpl$Query$GetOrder$order$customer(this._instance, this._then);

  final Query$GetOrder$order$customer _instance;

  final TRes Function(Query$GetOrder$order$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$customer(
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

class _CopyWithStubImpl$Query$GetOrder$order$customer<TRes>
    implements CopyWith$Query$GetOrder$order$customer<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$customer(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Query$GetOrder$order$restaurant {
  Query$GetOrder$order$restaurant({
    required this.id,
    required this.name,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetOrder$order$restaurant.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$restaurant(
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
    if (other is! Query$GetOrder$order$restaurant ||
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

extension UtilityExtension$Query$GetOrder$order$restaurant
    on Query$GetOrder$order$restaurant {
  CopyWith$Query$GetOrder$order$restaurant<Query$GetOrder$order$restaurant>
  get copyWith => CopyWith$Query$GetOrder$order$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$restaurant<TRes> {
  factory CopyWith$Query$GetOrder$order$restaurant(
    Query$GetOrder$order$restaurant instance,
    TRes Function(Query$GetOrder$order$restaurant) then,
  ) = _CopyWithImpl$Query$GetOrder$order$restaurant;

  factory CopyWith$Query$GetOrder$order$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$restaurant;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetOrder$order$restaurant<TRes>
    implements CopyWith$Query$GetOrder$order$restaurant<TRes> {
  _CopyWithImpl$Query$GetOrder$order$restaurant(this._instance, this._then);

  final Query$GetOrder$order$restaurant _instance;

  final TRes Function(Query$GetOrder$order$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$restaurant(
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

class _CopyWithStubImpl$Query$GetOrder$order$restaurant<TRes>
    implements CopyWith$Query$GetOrder$order$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$restaurant(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetOrder$order$orderItems {
  Query$GetOrder$order$orderItems({
    this.edges,
    this.$__typename = 'OrderItemCursorConnection',
  });

  factory Query$GetOrder$order$orderItems.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$orderItems(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetOrder$order$orderItems$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrder$order$orderItems$edges?>? edges;

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
    if (other is! Query$GetOrder$order$orderItems ||
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

extension UtilityExtension$Query$GetOrder$order$orderItems
    on Query$GetOrder$order$orderItems {
  CopyWith$Query$GetOrder$order$orderItems<Query$GetOrder$order$orderItems>
  get copyWith => CopyWith$Query$GetOrder$order$orderItems(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$orderItems<TRes> {
  factory CopyWith$Query$GetOrder$order$orderItems(
    Query$GetOrder$order$orderItems instance,
    TRes Function(Query$GetOrder$order$orderItems) then,
  ) = _CopyWithImpl$Query$GetOrder$order$orderItems;

  factory CopyWith$Query$GetOrder$order$orderItems.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$orderItems;

  TRes call({
    List<Query$GetOrder$order$orderItems$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetOrder$order$orderItems$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrder$order$orderItems$edges<
          Query$GetOrder$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetOrder$order$orderItems<TRes>
    implements CopyWith$Query$GetOrder$order$orderItems<TRes> {
  _CopyWithImpl$Query$GetOrder$order$orderItems(this._instance, this._then);

  final Query$GetOrder$order$orderItems _instance;

  final TRes Function(Query$GetOrder$order$orderItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrder$order$orderItems(
          edges: edges == _undefined
              ? _instance.edges
              : (edges as List<Query$GetOrder$order$orderItems$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetOrder$order$orderItems$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrder$order$orderItems$edges<
          Query$GetOrder$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetOrder$order$orderItems$edges(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetOrder$order$orderItems<TRes>
    implements CopyWith$Query$GetOrder$order$orderItems<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$orderItems(this._res);

  TRes _res;

  call({
    List<Query$GetOrder$order$orderItems$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetOrder$order$orderItems$edges {
  Query$GetOrder$order$orderItems$edges({
    this.node,
    this.$__typename = 'OrderItemEdge',
  });

  factory Query$GetOrder$order$orderItems$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$orderItems$edges(
      node: l$node == null
          ? null
          : Query$GetOrder$order$orderItems$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrder$order$orderItems$edges$node? node;

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
    if (other is! Query$GetOrder$order$orderItems$edges ||
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

extension UtilityExtension$Query$GetOrder$order$orderItems$edges
    on Query$GetOrder$order$orderItems$edges {
  CopyWith$Query$GetOrder$order$orderItems$edges<
    Query$GetOrder$order$orderItems$edges
  >
  get copyWith =>
      CopyWith$Query$GetOrder$order$orderItems$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$orderItems$edges<TRes> {
  factory CopyWith$Query$GetOrder$order$orderItems$edges(
    Query$GetOrder$order$orderItems$edges instance,
    TRes Function(Query$GetOrder$order$orderItems$edges) then,
  ) = _CopyWithImpl$Query$GetOrder$order$orderItems$edges;

  factory CopyWith$Query$GetOrder$order$orderItems$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges;

  TRes call({
    Query$GetOrder$order$orderItems$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetOrder$order$orderItems$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetOrder$order$orderItems$edges<TRes>
    implements CopyWith$Query$GetOrder$order$orderItems$edges<TRes> {
  _CopyWithImpl$Query$GetOrder$order$orderItems$edges(
    this._instance,
    this._then,
  );

  final Query$GetOrder$order$orderItems$edges _instance;

  final TRes Function(Query$GetOrder$order$orderItems$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrder$order$orderItems$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetOrder$order$orderItems$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetOrder$order$orderItems$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetOrder$order$orderItems$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrder$order$orderItems$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges<TRes>
    implements CopyWith$Query$GetOrder$order$orderItems$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges(this._res);

  TRes _res;

  call({
    Query$GetOrder$order$orderItems$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrder$order$orderItems$edges$node<TRes> get node =>
      CopyWith$Query$GetOrder$order$orderItems$edges$node.stub(_res);
}

class Query$GetOrder$order$orderItems$edges$node {
  Query$GetOrder$order$orderItems$edges$node({
    required this.id,
    required this.quantity,
    required this.mealPlan,
    this.$__typename = 'OrderItem',
  });

  factory Query$GetOrder$order$orderItems$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$orderItems$edges$node(
      id: (l$id as String),
      quantity: (l$quantity as int),
      mealPlan: Query$GetOrder$order$orderItems$edges$node$mealPlan.fromJson(
        (l$mealPlan as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int quantity;

  final Query$GetOrder$order$orderItems$edges$node$mealPlan mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan.toJson();
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
    if (other is! Query$GetOrder$order$orderItems$edges$node ||
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

extension UtilityExtension$Query$GetOrder$order$orderItems$edges$node
    on Query$GetOrder$order$orderItems$edges$node {
  CopyWith$Query$GetOrder$order$orderItems$edges$node<
    Query$GetOrder$order$orderItems$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetOrder$order$orderItems$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$orderItems$edges$node<TRes> {
  factory CopyWith$Query$GetOrder$order$orderItems$edges$node(
    Query$GetOrder$order$orderItems$edges$node instance,
    TRes Function(Query$GetOrder$order$orderItems$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrder$order$orderItems$edges$node;

  factory CopyWith$Query$GetOrder$order$orderItems$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges$node;

  TRes call({
    String? id,
    int? quantity,
    Query$GetOrder$order$orderItems$edges$node$mealPlan? mealPlan,
    String? $__typename,
  });
  CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<TRes>
  get mealPlan;
}

class _CopyWithImpl$Query$GetOrder$order$orderItems$edges$node<TRes>
    implements CopyWith$Query$GetOrder$order$orderItems$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrder$order$orderItems$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetOrder$order$orderItems$edges$node _instance;

  final TRes Function(Query$GetOrder$order$orderItems$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$orderItems$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      quantity: quantity == _undefined || quantity == null
          ? _instance.quantity
          : (quantity as int),
      mealPlan: mealPlan == _undefined || mealPlan == null
          ? _instance.mealPlan
          : (mealPlan as Query$GetOrder$order$orderItems$edges$node$mealPlan),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<TRes>
  get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan(
      local$mealPlan,
      (e) => call(mealPlan: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges$node<TRes>
    implements CopyWith$Query$GetOrder$order$orderItems$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    int? quantity,
    Query$GetOrder$order$orderItems$edges$node$mealPlan? mealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<TRes>
  get mealPlan =>
      CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan.stub(_res);
}

class Query$GetOrder$order$orderItems$edges$node$mealPlan {
  Query$GetOrder$order$orderItems$edges$node$mealPlan({
    required this.id,
    required this.name,
    this.price,
    this.$__typename = 'MealPlan',
  });

  factory Query$GetOrder$order$orderItems$edges$node$mealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$orderItems$edges$node$mealPlan(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int? price;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$price, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder$order$orderItems$edges$node$mealPlan ||
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
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
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

extension UtilityExtension$Query$GetOrder$order$orderItems$edges$node$mealPlan
    on Query$GetOrder$order$orderItems$edges$node$mealPlan {
  CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<
    Query$GetOrder$order$orderItems$edges$node$mealPlan
  >
  get copyWith => CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<
  TRes
> {
  factory CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan(
    Query$GetOrder$order$orderItems$edges$node$mealPlan instance,
    TRes Function(Query$GetOrder$order$orderItems$edges$node$mealPlan) then,
  ) = _CopyWithImpl$Query$GetOrder$order$orderItems$edges$node$mealPlan;

  factory CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges$node$mealPlan;

  TRes call({String? id, String? name, int? price, String? $__typename});
}

class _CopyWithImpl$Query$GetOrder$order$orderItems$edges$node$mealPlan<TRes>
    implements
        CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<TRes> {
  _CopyWithImpl$Query$GetOrder$order$orderItems$edges$node$mealPlan(
    this._instance,
    this._then,
  );

  final Query$GetOrder$order$orderItems$edges$node$mealPlan _instance;

  final TRes Function(Query$GetOrder$order$orderItems$edges$node$mealPlan)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$orderItems$edges$node$mealPlan(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      price: price == _undefined ? _instance.price : (price as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Query$GetOrder$order$orderItems$edges$node$mealPlan<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$orderItems$edges$node$mealPlan(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, int? price, String? $__typename}) => _res;
}

class Query$GetOrder$order$deliveries {
  Query$GetOrder$order$deliveries({
    this.edges,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Query$GetOrder$order$deliveries.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetOrder$order$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrder$order$deliveries$edges?>? edges;

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
    if (other is! Query$GetOrder$order$deliveries ||
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

extension UtilityExtension$Query$GetOrder$order$deliveries
    on Query$GetOrder$order$deliveries {
  CopyWith$Query$GetOrder$order$deliveries<Query$GetOrder$order$deliveries>
  get copyWith => CopyWith$Query$GetOrder$order$deliveries(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$deliveries<TRes> {
  factory CopyWith$Query$GetOrder$order$deliveries(
    Query$GetOrder$order$deliveries instance,
    TRes Function(Query$GetOrder$order$deliveries) then,
  ) = _CopyWithImpl$Query$GetOrder$order$deliveries;

  factory CopyWith$Query$GetOrder$order$deliveries.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$deliveries;

  TRes call({
    List<Query$GetOrder$order$deliveries$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetOrder$order$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrder$order$deliveries$edges<
          Query$GetOrder$order$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetOrder$order$deliveries<TRes>
    implements CopyWith$Query$GetOrder$order$deliveries<TRes> {
  _CopyWithImpl$Query$GetOrder$order$deliveries(this._instance, this._then);

  final Query$GetOrder$order$deliveries _instance;

  final TRes Function(Query$GetOrder$order$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrder$order$deliveries(
          edges: edges == _undefined
              ? _instance.edges
              : (edges as List<Query$GetOrder$order$deliveries$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetOrder$order$deliveries$edges?>? Function(
      Iterable<
        CopyWith$Query$GetOrder$order$deliveries$edges<
          Query$GetOrder$order$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetOrder$order$deliveries$edges(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetOrder$order$deliveries<TRes>
    implements CopyWith$Query$GetOrder$order$deliveries<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$deliveries(this._res);

  TRes _res;

  call({
    List<Query$GetOrder$order$deliveries$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetOrder$order$deliveries$edges {
  Query$GetOrder$order$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Query$GetOrder$order$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$deliveries$edges(
      node: l$node == null
          ? null
          : Query$GetOrder$order$deliveries$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrder$order$deliveries$edges$node? node;

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
    if (other is! Query$GetOrder$order$deliveries$edges ||
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

extension UtilityExtension$Query$GetOrder$order$deliveries$edges
    on Query$GetOrder$order$deliveries$edges {
  CopyWith$Query$GetOrder$order$deliveries$edges<
    Query$GetOrder$order$deliveries$edges
  >
  get copyWith =>
      CopyWith$Query$GetOrder$order$deliveries$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$deliveries$edges<TRes> {
  factory CopyWith$Query$GetOrder$order$deliveries$edges(
    Query$GetOrder$order$deliveries$edges instance,
    TRes Function(Query$GetOrder$order$deliveries$edges) then,
  ) = _CopyWithImpl$Query$GetOrder$order$deliveries$edges;

  factory CopyWith$Query$GetOrder$order$deliveries$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges;

  TRes call({
    Query$GetOrder$order$deliveries$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetOrder$order$deliveries$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetOrder$order$deliveries$edges<TRes>
    implements CopyWith$Query$GetOrder$order$deliveries$edges<TRes> {
  _CopyWithImpl$Query$GetOrder$order$deliveries$edges(
    this._instance,
    this._then,
  );

  final Query$GetOrder$order$deliveries$edges _instance;

  final TRes Function(Query$GetOrder$order$deliveries$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetOrder$order$deliveries$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetOrder$order$deliveries$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetOrder$order$deliveries$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetOrder$order$deliveries$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrder$order$deliveries$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges<TRes>
    implements CopyWith$Query$GetOrder$order$deliveries$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges(this._res);

  TRes _res;

  call({
    Query$GetOrder$order$deliveries$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrder$order$deliveries$edges$node<TRes> get node =>
      CopyWith$Query$GetOrder$order$deliveries$edges$node.stub(_res);
}

class Query$GetOrder$order$deliveries$edges$node {
  Query$GetOrder$order$deliveries$edges$node({
    required this.id,
    required this.status,
    required this.deliveryDate,
    this.driver,
    this.$__typename = 'Delivery',
  });

  factory Query$GetOrder$order$deliveries$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$deliveryDate = json['deliveryDate'];
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$deliveries$edges$node(
      id: (l$id as String),
      status: fromJson$Enum$DeliveryStatus((l$status as String)),
      deliveryDate: (l$deliveryDate as String),
      driver: l$driver == null
          ? null
          : Query$GetOrder$order$deliveries$edges$node$driver.fromJson(
              (l$driver as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$DeliveryStatus status;

  final String deliveryDate;

  final Query$GetOrder$order$deliveries$edges$node$driver? driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    _resultData['deliveryDate'] = l$deliveryDate;
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$deliveryDate,
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrder$order$deliveries$edges$node ||
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
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Query$GetOrder$order$deliveries$edges$node
    on Query$GetOrder$order$deliveries$edges$node {
  CopyWith$Query$GetOrder$order$deliveries$edges$node<
    Query$GetOrder$order$deliveries$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetOrder$order$deliveries$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetOrder$order$deliveries$edges$node<TRes> {
  factory CopyWith$Query$GetOrder$order$deliveries$edges$node(
    Query$GetOrder$order$deliveries$edges$node instance,
    TRes Function(Query$GetOrder$order$deliveries$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrder$order$deliveries$edges$node;

  factory CopyWith$Query$GetOrder$order$deliveries$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges$node;

  TRes call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Query$GetOrder$order$deliveries$edges$node$driver? driver,
    String? $__typename,
  });
  CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<TRes> get driver;
}

class _CopyWithImpl$Query$GetOrder$order$deliveries$edges$node<TRes>
    implements CopyWith$Query$GetOrder$order$deliveries$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrder$order$deliveries$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetOrder$order$deliveries$edges$node _instance;

  final TRes Function(Query$GetOrder$order$deliveries$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$deliveries$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$DeliveryStatus),
      deliveryDate: deliveryDate == _undefined || deliveryDate == null
          ? _instance.deliveryDate
          : (deliveryDate as String),
      driver: driver == _undefined
          ? _instance.driver
          : (driver as Query$GetOrder$order$deliveries$edges$node$driver?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<TRes> get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Query$GetOrder$order$deliveries$edges$node$driver.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetOrder$order$deliveries$edges$node$driver(
            local$driver,
            (e) => call(driver: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges$node<TRes>
    implements CopyWith$Query$GetOrder$order$deliveries$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Query$GetOrder$order$deliveries$edges$node$driver? driver,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<TRes> get driver =>
      CopyWith$Query$GetOrder$order$deliveries$edges$node$driver.stub(_res);
}

class Query$GetOrder$order$deliveries$edges$node$driver {
  Query$GetOrder$order$deliveries$edges$node$driver({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$GetOrder$order$deliveries$edges$node$driver.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetOrder$order$deliveries$edges$node$driver(
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
    if (other is! Query$GetOrder$order$deliveries$edges$node$driver ||
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

extension UtilityExtension$Query$GetOrder$order$deliveries$edges$node$driver
    on Query$GetOrder$order$deliveries$edges$node$driver {
  CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<
    Query$GetOrder$order$deliveries$edges$node$driver
  >
  get copyWith => CopyWith$Query$GetOrder$order$deliveries$edges$node$driver(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<
  TRes
> {
  factory CopyWith$Query$GetOrder$order$deliveries$edges$node$driver(
    Query$GetOrder$order$deliveries$edges$node$driver instance,
    TRes Function(Query$GetOrder$order$deliveries$edges$node$driver) then,
  ) = _CopyWithImpl$Query$GetOrder$order$deliveries$edges$node$driver;

  factory CopyWith$Query$GetOrder$order$deliveries$edges$node$driver.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges$node$driver;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Query$GetOrder$order$deliveries$edges$node$driver<TRes>
    implements
        CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<TRes> {
  _CopyWithImpl$Query$GetOrder$order$deliveries$edges$node$driver(
    this._instance,
    this._then,
  );

  final Query$GetOrder$order$deliveries$edges$node$driver _instance;

  final TRes Function(Query$GetOrder$order$deliveries$edges$node$driver) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetOrder$order$deliveries$edges$node$driver(
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

class _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges$node$driver<TRes>
    implements
        CopyWith$Query$GetOrder$order$deliveries$edges$node$driver<TRes> {
  _CopyWithStubImpl$Query$GetOrder$order$deliveries$edges$node$driver(
    this._res,
  );

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Variables$Mutation$CreateOrder {
  factory Variables$Mutation$CreateOrder({
    required Input$createOrderInput input,
  }) => Variables$Mutation$CreateOrder._({r'input': input});

  Variables$Mutation$CreateOrder._(this._$data);

  factory Variables$Mutation$CreateOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createOrderInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createOrderInput get input =>
      (_$data['input'] as Input$createOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateOrder<Variables$Mutation$CreateOrder>
  get copyWith => CopyWith$Variables$Mutation$CreateOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateOrder ||
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

abstract class CopyWith$Variables$Mutation$CreateOrder<TRes> {
  factory CopyWith$Variables$Mutation$CreateOrder(
    Variables$Mutation$CreateOrder instance,
    TRes Function(Variables$Mutation$CreateOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateOrder;

  factory CopyWith$Variables$Mutation$CreateOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateOrder;

  TRes call({Input$createOrderInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateOrder<TRes>
    implements CopyWith$Variables$Mutation$CreateOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateOrder(this._instance, this._then);

  final Variables$Mutation$CreateOrder _instance;

  final TRes Function(Variables$Mutation$CreateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateOrder._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createOrderInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateOrder<TRes>
    implements CopyWith$Variables$Mutation$CreateOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateOrder(this._res);

  TRes _res;

  call({Input$createOrderInput? input}) => _res;
}

class Mutation$CreateOrder {
  Mutation$CreateOrder({this.createOrder, this.$__typename = 'Mutation'});

  factory Mutation$CreateOrder.fromJson(Map<String, dynamic> json) {
    final l$createOrder = json['createOrder'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder(
      createOrder: l$createOrder == null
          ? null
          : Mutation$CreateOrder$createOrder.fromJson(
              (l$createOrder as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateOrder$createOrder? createOrder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createOrder = createOrder;
    _resultData['createOrder'] = l$createOrder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createOrder = createOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createOrder = createOrder;
    final lOther$createOrder = other.createOrder;
    if (l$createOrder != lOther$createOrder) {
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

extension UtilityExtension$Mutation$CreateOrder on Mutation$CreateOrder {
  CopyWith$Mutation$CreateOrder<Mutation$CreateOrder> get copyWith =>
      CopyWith$Mutation$CreateOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder<TRes> {
  factory CopyWith$Mutation$CreateOrder(
    Mutation$CreateOrder instance,
    TRes Function(Mutation$CreateOrder) then,
  ) = _CopyWithImpl$Mutation$CreateOrder;

  factory CopyWith$Mutation$CreateOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateOrder;

  TRes call({
    Mutation$CreateOrder$createOrder? createOrder,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder<TRes> get createOrder;
}

class _CopyWithImpl$Mutation$CreateOrder<TRes>
    implements CopyWith$Mutation$CreateOrder<TRes> {
  _CopyWithImpl$Mutation$CreateOrder(this._instance, this._then);

  final Mutation$CreateOrder _instance;

  final TRes Function(Mutation$CreateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createOrder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder(
      createOrder: createOrder == _undefined
          ? _instance.createOrder
          : (createOrder as Mutation$CreateOrder$createOrder?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder<TRes> get createOrder {
    final local$createOrder = _instance.createOrder;
    return local$createOrder == null
        ? CopyWith$Mutation$CreateOrder$createOrder.stub(_then(_instance))
        : CopyWith$Mutation$CreateOrder$createOrder(
            local$createOrder,
            (e) => call(createOrder: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder<TRes>
    implements CopyWith$Mutation$CreateOrder<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder(this._res);

  TRes _res;

  call({Mutation$CreateOrder$createOrder? createOrder, String? $__typename}) =>
      _res;

  CopyWith$Mutation$CreateOrder$createOrder<TRes> get createOrder =>
      CopyWith$Mutation$CreateOrder$createOrder.stub(_res);
}

const documentNodeMutationCreateOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createOrderInput'),
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
            name: NameNode(value: 'createOrder'),
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
                        name: NameNode(value: 'status'),
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
                        name: NameNode(value: 'paymentIntentId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
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
                                                name: NameNode(value: 'price'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
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
                        name: NameNode(value: 'deliveries'),
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
                                          name: NameNode(value: 'driver'),
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
  ],
);
Mutation$CreateOrder _parserFn$Mutation$CreateOrder(
  Map<String, dynamic> data,
) => Mutation$CreateOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateOrder =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateOrder?);

class Options$Mutation$CreateOrder
    extends graphql.MutationOptions<Mutation$CreateOrder> {
  Options$Mutation$CreateOrder({
    String? operationName,
    required Variables$Mutation$CreateOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateOrder>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateOrder,
         parserFn: _parserFn$Mutation$CreateOrder,
       );

  final OnMutationCompleted$Mutation$CreateOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateOrder
    extends graphql.WatchQueryOptions<Mutation$CreateOrder> {
  WatchOptions$Mutation$CreateOrder({
    String? operationName,
    required Variables$Mutation$CreateOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateOrder? typedOptimisticResult,
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
         document: documentNodeMutationCreateOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateOrder,
       );
}

extension ClientExtension$Mutation$CreateOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateOrder>> mutate$CreateOrder(
    Options$Mutation$CreateOrder options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateOrder> watchMutation$CreateOrder(
    WatchOptions$Mutation$CreateOrder options,
  ) => this.watchMutation(options);
}

class Mutation$CreateOrder$HookResult {
  Mutation$CreateOrder$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateOrder runMutation;

  final graphql.QueryResult<Mutation$CreateOrder> result;
}

Mutation$CreateOrder$HookResult useMutation$CreateOrder([
  WidgetOptions$Mutation$CreateOrder? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateOrder(),
  );
  return Mutation$CreateOrder$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateOrder> useWatchMutation$CreateOrder(
  WatchOptions$Mutation$CreateOrder options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateOrder
    extends graphql.MutationOptions<Mutation$CreateOrder> {
  WidgetOptions$Mutation$CreateOrder({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateOrder>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateOrder,
         parserFn: _parserFn$Mutation$CreateOrder,
       );

  final OnMutationCompleted$Mutation$CreateOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateOrder =
    graphql.MultiSourceResult<Mutation$CreateOrder> Function(
      Variables$Mutation$CreateOrder, {
      Object? optimisticResult,
      Mutation$CreateOrder? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateOrder =
    widgets.Widget Function(
      RunMutation$Mutation$CreateOrder,
      graphql.QueryResult<Mutation$CreateOrder>?,
    );

class Mutation$CreateOrder$Widget
    extends graphql_flutter.Mutation<Mutation$CreateOrder> {
  Mutation$CreateOrder$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateOrder? options,
    required Builder$Mutation$CreateOrder builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateOrder(),
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

class Mutation$CreateOrder$createOrder {
  Mutation$CreateOrder$createOrder({
    this.order,
    this.$__typename = 'createOrderPayload',
  });

  factory Mutation$CreateOrder$createOrder.fromJson(Map<String, dynamic> json) {
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder(
      order: l$order == null
          ? null
          : Mutation$CreateOrder$createOrder$order.fromJson(
              (l$order as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateOrder$createOrder$order? order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([l$order, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateOrder$createOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
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

extension UtilityExtension$Mutation$CreateOrder$createOrder
    on Mutation$CreateOrder$createOrder {
  CopyWith$Mutation$CreateOrder$createOrder<Mutation$CreateOrder$createOrder>
  get copyWith => CopyWith$Mutation$CreateOrder$createOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder$createOrder<TRes> {
  factory CopyWith$Mutation$CreateOrder$createOrder(
    Mutation$CreateOrder$createOrder instance,
    TRes Function(Mutation$CreateOrder$createOrder) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder;

  factory CopyWith$Mutation$CreateOrder$createOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateOrder$createOrder;

  TRes call({
    Mutation$CreateOrder$createOrder$order? order,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder$order<TRes> get order;
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder(this._instance, this._then);

  final Mutation$CreateOrder$createOrder _instance;

  final TRes Function(Mutation$CreateOrder$createOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CreateOrder$createOrder(
          order: order == _undefined
              ? _instance.order
              : (order as Mutation$CreateOrder$createOrder$order?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$CreateOrder$createOrder$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order.stub(_then(_instance))
        : CopyWith$Mutation$CreateOrder$createOrder$order(
            local$order,
            (e) => call(order: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder(this._res);

  TRes _res;

  call({Mutation$CreateOrder$createOrder$order? order, String? $__typename}) =>
      _res;

  CopyWith$Mutation$CreateOrder$createOrder$order<TRes> get order =>
      CopyWith$Mutation$CreateOrder$createOrder$order.stub(_res);
}

class Mutation$CreateOrder$createOrder$order {
  Mutation$CreateOrder$createOrder$order({
    required this.id,
    required this.status,
    required this.total,
    this.paymentIntentId,
    this.deliveryFirstName,
    this.deliveryLastName,
    this.deliveryPhoneNumber,
    this.deliveryStreet,
    this.deliveryApartment,
    this.deliveryCity,
    this.deliveryZipCode,
    this.customer,
    this.restaurant,
    this.orderItems,
    this.deliveries,
    this.$__typename = 'Order',
  });

  factory Mutation$CreateOrder$createOrder$order.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$total = json['total'];
    final l$paymentIntentId = json['paymentIntentId'];
    final l$deliveryFirstName = json['deliveryFirstName'];
    final l$deliveryLastName = json['deliveryLastName'];
    final l$deliveryPhoneNumber = json['deliveryPhoneNumber'];
    final l$deliveryStreet = json['deliveryStreet'];
    final l$deliveryApartment = json['deliveryApartment'];
    final l$deliveryCity = json['deliveryCity'];
    final l$deliveryZipCode = json['deliveryZipCode'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$orderItems = json['orderItems'];
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order(
      id: (l$id as String),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      total: (l$total as int),
      paymentIntentId: (l$paymentIntentId as String?),
      deliveryFirstName: (l$deliveryFirstName as String?),
      deliveryLastName: (l$deliveryLastName as String?),
      deliveryPhoneNumber: (l$deliveryPhoneNumber as String?),
      deliveryStreet: (l$deliveryStreet as String?),
      deliveryApartment: (l$deliveryApartment as String?),
      deliveryCity: (l$deliveryCity as String?),
      deliveryZipCode: (l$deliveryZipCode as String?),
      customer: l$customer == null
          ? null
          : Mutation$CreateOrder$createOrder$order$customer.fromJson(
              (l$customer as Map<String, dynamic>),
            ),
      restaurant: l$restaurant == null
          ? null
          : Mutation$CreateOrder$createOrder$order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      orderItems: l$orderItems == null
          ? null
          : Mutation$CreateOrder$createOrder$order$orderItems.fromJson(
              (l$orderItems as Map<String, dynamic>),
            ),
      deliveries: l$deliveries == null
          ? null
          : Mutation$CreateOrder$createOrder$order$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$OrderStatus status;

  final int total;

  final String? paymentIntentId;

  final String? deliveryFirstName;

  final String? deliveryLastName;

  final String? deliveryPhoneNumber;

  final String? deliveryStreet;

  final String? deliveryApartment;

  final String? deliveryCity;

  final String? deliveryZipCode;

  final Mutation$CreateOrder$createOrder$order$customer? customer;

  final Mutation$CreateOrder$createOrder$order$restaurant? restaurant;

  final Mutation$CreateOrder$createOrder$order$orderItems? orderItems;

  final Mutation$CreateOrder$createOrder$order$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$total = total;
    _resultData['total'] = l$total;
    final l$paymentIntentId = paymentIntentId;
    _resultData['paymentIntentId'] = l$paymentIntentId;
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
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$orderItems = orderItems;
    _resultData['orderItems'] = l$orderItems?.toJson();
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$total = total;
    final l$paymentIntentId = paymentIntentId;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$orderItems = orderItems;
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$total,
      l$paymentIntentId,
      l$deliveryFirstName,
      l$deliveryLastName,
      l$deliveryPhoneNumber,
      l$deliveryStreet,
      l$deliveryApartment,
      l$deliveryCity,
      l$deliveryZipCode,
      l$customer,
      l$restaurant,
      l$orderItems,
      l$deliveries,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateOrder$createOrder$order ||
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
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$paymentIntentId = paymentIntentId;
    final lOther$paymentIntentId = other.paymentIntentId;
    if (l$paymentIntentId != lOther$paymentIntentId) {
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
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (l$orderItems != lOther$orderItems) {
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order
    on Mutation$CreateOrder$createOrder$order {
  CopyWith$Mutation$CreateOrder$createOrder$order<
    Mutation$CreateOrder$createOrder$order
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order<TRes> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order(
    Mutation$CreateOrder$createOrder$order instance,
    TRes Function(Mutation$CreateOrder$createOrder$order) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order;

  factory CopyWith$Mutation$CreateOrder$createOrder$order.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order;

  TRes call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Mutation$CreateOrder$createOrder$order$customer? customer,
    Mutation$CreateOrder$createOrder$order$restaurant? restaurant,
    Mutation$CreateOrder$createOrder$order$orderItems? orderItems,
    Mutation$CreateOrder$createOrder$order$deliveries? deliveries,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder$order$customer<TRes> get customer;
  CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<TRes>
  get restaurant;
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<TRes>
  get orderItems;
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<TRes>
  get deliveries;
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder$order<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? total = _undefined,
    Object? paymentIntentId = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? orderItems = _undefined,
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      paymentIntentId: paymentIntentId == _undefined
          ? _instance.paymentIntentId
          : (paymentIntentId as String?),
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
      customer: customer == _undefined
          ? _instance.customer
          : (customer as Mutation$CreateOrder$createOrder$order$customer?),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Mutation$CreateOrder$createOrder$order$restaurant?),
      orderItems: orderItems == _undefined
          ? _instance.orderItems
          : (orderItems as Mutation$CreateOrder$createOrder$order$orderItems?),
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Mutation$CreateOrder$createOrder$order$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder$order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$customer.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$customer(
            local$customer,
            (e) => call(customer: e),
          );
  }

  CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<TRes>
  get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<TRes>
  get orderItems {
    final local$orderItems = _instance.orderItems;
    return local$orderItems == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$orderItems.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$orderItems(
            local$orderItems,
            (e) => call(orderItems: e),
          );
  }

  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<TRes>
  get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$deliveries.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder$order<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order(this._res);

  TRes _res;

  call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Mutation$CreateOrder$createOrder$order$customer? customer,
    Mutation$CreateOrder$createOrder$order$restaurant? restaurant,
    Mutation$CreateOrder$createOrder$order$orderItems? orderItems,
    Mutation$CreateOrder$createOrder$order$deliveries? deliveries,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateOrder$createOrder$order$customer<TRes> get customer =>
      CopyWith$Mutation$CreateOrder$createOrder$order$customer.stub(_res);

  CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<TRes>
  get restaurant =>
      CopyWith$Mutation$CreateOrder$createOrder$order$restaurant.stub(_res);

  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<TRes>
  get orderItems =>
      CopyWith$Mutation$CreateOrder$createOrder$order$orderItems.stub(_res);

  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<TRes>
  get deliveries =>
      CopyWith$Mutation$CreateOrder$createOrder$order$deliveries.stub(_res);
}

class Mutation$CreateOrder$createOrder$order$customer {
  Mutation$CreateOrder$createOrder$order$customer({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Mutation$CreateOrder$createOrder$order$customer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$customer(
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
    if (other is! Mutation$CreateOrder$createOrder$order$customer ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$customer
    on Mutation$CreateOrder$createOrder$order$customer {
  CopyWith$Mutation$CreateOrder$createOrder$order$customer<
    Mutation$CreateOrder$createOrder$order$customer
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$customer(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$customer<TRes> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$customer(
    Mutation$CreateOrder$createOrder$order$customer instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$customer) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$customer;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$customer.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$customer;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$customer<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder$order$customer<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$customer(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$customer _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$customer(
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

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$customer<TRes>
    implements CopyWith$Mutation$CreateOrder$createOrder$order$customer<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$customer(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Mutation$CreateOrder$createOrder$order$restaurant {
  Mutation$CreateOrder$createOrder$order$restaurant({
    required this.id,
    required this.name,
    this.$__typename = 'Restaurant',
  });

  factory Mutation$CreateOrder$createOrder$order$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$restaurant(
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
    if (other is! Mutation$CreateOrder$createOrder$order$restaurant ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$restaurant
    on Mutation$CreateOrder$createOrder$order$restaurant {
  CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<
    Mutation$CreateOrder$createOrder$order$restaurant
  >
  get copyWith => CopyWith$Mutation$CreateOrder$createOrder$order$restaurant(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$restaurant(
    Mutation$CreateOrder$createOrder$order$restaurant instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$restaurant) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$restaurant;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$restaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$restaurant;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$restaurant<TRes>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$restaurant(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$restaurant _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$restaurant(
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

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$restaurant<TRes>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$restaurant<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$restaurant(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Mutation$CreateOrder$createOrder$order$orderItems {
  Mutation$CreateOrder$createOrder$order$orderItems({
    this.edges,
    this.$__typename = 'OrderItemCursorConnection',
  });

  factory Mutation$CreateOrder$createOrder$order$orderItems.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$orderItems(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Mutation$CreateOrder$createOrder$order$orderItems$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$CreateOrder$createOrder$order$orderItems$edges?>? edges;

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
    if (other is! Mutation$CreateOrder$createOrder$order$orderItems ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$orderItems
    on Mutation$CreateOrder$createOrder$order$orderItems {
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<
    Mutation$CreateOrder$createOrder$order$orderItems
  >
  get copyWith => CopyWith$Mutation$CreateOrder$createOrder$order$orderItems(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems(
    Mutation$CreateOrder$createOrder$order$orderItems instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$orderItems) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems;

  TRes call({
    List<Mutation$CreateOrder$createOrder$order$orderItems$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Mutation$CreateOrder$createOrder$order$orderItems$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges<
          Mutation$CreateOrder$createOrder$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems<TRes>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$orderItems _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order$orderItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CreateOrder$createOrder$order$orderItems(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Mutation$CreateOrder$createOrder$order$orderItems$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Mutation$CreateOrder$createOrder$order$orderItems$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges<
          Mutation$CreateOrder$createOrder$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems<TRes>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems(
    this._res,
  );

  TRes _res;

  call({
    List<Mutation$CreateOrder$createOrder$order$orderItems$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Mutation$CreateOrder$createOrder$order$orderItems$edges {
  Mutation$CreateOrder$createOrder$order$orderItems$edges({
    this.node,
    this.$__typename = 'OrderItemEdge',
  });

  factory Mutation$CreateOrder$createOrder$order$orderItems$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$orderItems$edges(
      node: l$node == null
          ? null
          : Mutation$CreateOrder$createOrder$order$orderItems$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateOrder$createOrder$order$orderItems$edges$node? node;

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
    if (other is! Mutation$CreateOrder$createOrder$order$orderItems$edges ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$orderItems$edges
    on Mutation$CreateOrder$createOrder$order$orderItems$edges {
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges<
    Mutation$CreateOrder$createOrder$order$orderItems$edges
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges(
    Mutation$CreateOrder$createOrder$order$orderItems$edges instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$orderItems$edges) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges;

  TRes call({
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node? node,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$orderItems$edges _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order$orderItems$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$orderItems$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Mutation$CreateOrder$createOrder$order$orderItems$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges(
    this._res,
  );

  TRes _res;

  call({
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<TRes>
  get node =>
      CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node.stub(
        _res,
      );
}

class Mutation$CreateOrder$createOrder$order$orderItems$edges$node {
  Mutation$CreateOrder$createOrder$order$orderItems$edges$node({
    required this.id,
    required this.quantity,
    required this.mealPlan,
    this.$__typename = 'OrderItem',
  });

  factory Mutation$CreateOrder$createOrder$order$orderItems$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
      id: (l$id as String),
      quantity: (l$quantity as int),
      mealPlan:
          Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan.fromJson(
            (l$mealPlan as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int quantity;

  final Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan
  mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan.toJson();
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
            is! Mutation$CreateOrder$createOrder$order$orderItems$edges$node ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$orderItems$edges$node
    on Mutation$CreateOrder$createOrder$order$orderItems$edges$node {
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$orderItems$edges$node)
    then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node;

  TRes call({
    String? id,
    int? quantity,
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan?
    mealPlan,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan;
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$orderItems$edges$node _instance;

  final TRes Function(
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      quantity: quantity == _undefined || quantity == null
          ? _instance.quantity
          : (quantity as int),
      mealPlan: mealPlan == _undefined || mealPlan == null
          ? _instance.mealPlan
          : (mealPlan
                as Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
      local$mealPlan,
      (e) => call(mealPlan: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    int? quantity,
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan?
    mealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan =>
      CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan.stub(
        _res,
      );
}

class Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan {
  Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan({
    required this.id,
    required this.name,
    this.price,
    this.$__typename = 'MealPlan',
  });

  factory Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int? price;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$price, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan ||
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
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan
    on Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan {
  CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan
    instance,
    TRes Function(
      Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan,
    )
    then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan;

  TRes call({String? id, String? name, int? price, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan
  _instance;

  final TRes Function(
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      price: price == _undefined ? _instance.price : (price as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$orderItems$edges$node$mealPlan(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, int? price, String? $__typename}) => _res;
}

class Mutation$CreateOrder$createOrder$order$deliveries {
  Mutation$CreateOrder$createOrder$order$deliveries({
    this.edges,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Mutation$CreateOrder$createOrder$order$deliveries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Mutation$CreateOrder$createOrder$order$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$CreateOrder$createOrder$order$deliveries$edges?>? edges;

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
    if (other is! Mutation$CreateOrder$createOrder$order$deliveries ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$deliveries
    on Mutation$CreateOrder$createOrder$order$deliveries {
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<
    Mutation$CreateOrder$createOrder$order$deliveries
  >
  get copyWith => CopyWith$Mutation$CreateOrder$createOrder$order$deliveries(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries(
    Mutation$CreateOrder$createOrder$order$deliveries instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$deliveries) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries;

  TRes call({
    List<Mutation$CreateOrder$createOrder$order$deliveries$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Mutation$CreateOrder$createOrder$order$deliveries$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges<
          Mutation$CreateOrder$createOrder$order$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries<TRes>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$deliveries _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CreateOrder$createOrder$order$deliveries(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Mutation$CreateOrder$createOrder$order$deliveries$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Mutation$CreateOrder$createOrder$order$deliveries$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges<
          Mutation$CreateOrder$createOrder$order$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries<TRes>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries(
    this._res,
  );

  TRes _res;

  call({
    List<Mutation$CreateOrder$createOrder$order$deliveries$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Mutation$CreateOrder$createOrder$order$deliveries$edges {
  Mutation$CreateOrder$createOrder$order$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Mutation$CreateOrder$createOrder$order$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$deliveries$edges(
      node: l$node == null
          ? null
          : Mutation$CreateOrder$createOrder$order$deliveries$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateOrder$createOrder$order$deliveries$edges$node? node;

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
    if (other is! Mutation$CreateOrder$createOrder$order$deliveries$edges ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$deliveries$edges
    on Mutation$CreateOrder$createOrder$order$deliveries$edges {
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges<
    Mutation$CreateOrder$createOrder$order$deliveries$edges
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges(
    Mutation$CreateOrder$createOrder$order$deliveries$edges instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$deliveries$edges) then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges;

  TRes call({
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node? node,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges<TRes> {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$deliveries$edges _instance;

  final TRes Function(Mutation$CreateOrder$createOrder$order$deliveries$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$deliveries$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Mutation$CreateOrder$createOrder$order$deliveries$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges<TRes> {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges(
    this._res,
  );

  TRes _res;

  call({
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<TRes>
  get node =>
      CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node.stub(
        _res,
      );
}

class Mutation$CreateOrder$createOrder$order$deliveries$edges$node {
  Mutation$CreateOrder$createOrder$order$deliveries$edges$node({
    required this.id,
    required this.status,
    required this.deliveryDate,
    this.driver,
    this.$__typename = 'Delivery',
  });

  factory Mutation$CreateOrder$createOrder$order$deliveries$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$deliveryDate = json['deliveryDate'];
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
      id: (l$id as String),
      status: fromJson$Enum$DeliveryStatus((l$status as String)),
      deliveryDate: (l$deliveryDate as String),
      driver: l$driver == null
          ? null
          : Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver.fromJson(
              (l$driver as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$DeliveryStatus status;

  final String deliveryDate;

  final Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver?
  driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    _resultData['deliveryDate'] = l$deliveryDate;
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$deliveryDate,
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$CreateOrder$createOrder$order$deliveries$edges$node ||
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
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$deliveries$edges$node
    on Mutation$CreateOrder$createOrder$order$deliveries$edges$node {
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node instance,
    TRes Function(Mutation$CreateOrder$createOrder$order$deliveries$edges$node)
    then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node;

  TRes call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver? driver,
    String? $__typename,
  });
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
    TRes
  >
  get driver;
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$deliveries$edges$node _instance;

  final TRes Function(
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$DeliveryStatus),
      deliveryDate: deliveryDate == _undefined || deliveryDate == null
          ? _instance.deliveryDate
          : (deliveryDate as String),
      driver: driver == _undefined
          ? _instance.driver
          : (driver
                as Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
    TRes
  >
  get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
            local$driver,
            (e) => call(driver: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver? driver,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
    TRes
  >
  get driver =>
      CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver.stub(
        _res,
      );
}

class Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver {
  Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
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
    if (other
            is! Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver ||
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

extension UtilityExtension$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver
    on Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver {
  CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver
  >
  get copyWith =>
      CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
  TRes
> {
  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver
    instance,
    TRes Function(
      Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver,
    )
    then,
  ) = _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver;

  factory CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
    this._instance,
    this._then,
  );

  final Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver
  _instance;

  final TRes Function(
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
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

class _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
  TRes
>
    implements
        CopyWith$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateOrder$createOrder$order$deliveries$edges$node$driver(
    this._res,
  );

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Variables$Mutation$UpdateOrder {
  factory Variables$Mutation$UpdateOrder({
    required Input$updateOrderInput input,
  }) => Variables$Mutation$UpdateOrder._({r'input': input});

  Variables$Mutation$UpdateOrder._(this._$data);

  factory Variables$Mutation$UpdateOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateOrderInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateOrderInput get input =>
      (_$data['input'] as Input$updateOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateOrder<Variables$Mutation$UpdateOrder>
  get copyWith => CopyWith$Variables$Mutation$UpdateOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateOrder ||
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

abstract class CopyWith$Variables$Mutation$UpdateOrder<TRes> {
  factory CopyWith$Variables$Mutation$UpdateOrder(
    Variables$Mutation$UpdateOrder instance,
    TRes Function(Variables$Mutation$UpdateOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateOrder;

  factory CopyWith$Variables$Mutation$UpdateOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateOrder;

  TRes call({Input$updateOrderInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateOrder<TRes>
    implements CopyWith$Variables$Mutation$UpdateOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateOrder(this._instance, this._then);

  final Variables$Mutation$UpdateOrder _instance;

  final TRes Function(Variables$Mutation$UpdateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateOrder._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateOrderInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateOrder<TRes>
    implements CopyWith$Variables$Mutation$UpdateOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateOrder(this._res);

  TRes _res;

  call({Input$updateOrderInput? input}) => _res;
}

class Mutation$UpdateOrder {
  Mutation$UpdateOrder({this.updateOrder, this.$__typename = 'Mutation'});

  factory Mutation$UpdateOrder.fromJson(Map<String, dynamic> json) {
    final l$updateOrder = json['updateOrder'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder(
      updateOrder: l$updateOrder == null
          ? null
          : Mutation$UpdateOrder$updateOrder.fromJson(
              (l$updateOrder as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateOrder$updateOrder? updateOrder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateOrder = updateOrder;
    _resultData['updateOrder'] = l$updateOrder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateOrder = updateOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateOrder = updateOrder;
    final lOther$updateOrder = other.updateOrder;
    if (l$updateOrder != lOther$updateOrder) {
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

extension UtilityExtension$Mutation$UpdateOrder on Mutation$UpdateOrder {
  CopyWith$Mutation$UpdateOrder<Mutation$UpdateOrder> get copyWith =>
      CopyWith$Mutation$UpdateOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateOrder<TRes> {
  factory CopyWith$Mutation$UpdateOrder(
    Mutation$UpdateOrder instance,
    TRes Function(Mutation$UpdateOrder) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder;

  factory CopyWith$Mutation$UpdateOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateOrder;

  TRes call({
    Mutation$UpdateOrder$updateOrder? updateOrder,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder<TRes> get updateOrder;
}

class _CopyWithImpl$Mutation$UpdateOrder<TRes>
    implements CopyWith$Mutation$UpdateOrder<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder(this._instance, this._then);

  final Mutation$UpdateOrder _instance;

  final TRes Function(Mutation$UpdateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateOrder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder(
      updateOrder: updateOrder == _undefined
          ? _instance.updateOrder
          : (updateOrder as Mutation$UpdateOrder$updateOrder?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateOrder$updateOrder<TRes> get updateOrder {
    final local$updateOrder = _instance.updateOrder;
    return local$updateOrder == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder.stub(_then(_instance))
        : CopyWith$Mutation$UpdateOrder$updateOrder(
            local$updateOrder,
            (e) => call(updateOrder: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder<TRes>
    implements CopyWith$Mutation$UpdateOrder<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder(this._res);

  TRes _res;

  call({Mutation$UpdateOrder$updateOrder? updateOrder, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UpdateOrder$updateOrder<TRes> get updateOrder =>
      CopyWith$Mutation$UpdateOrder$updateOrder.stub(_res);
}

const documentNodeMutationUpdateOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateOrderInput'),
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
            name: NameNode(value: 'updateOrder'),
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
                        name: NameNode(value: 'status'),
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
                        name: NameNode(value: 'paymentIntentId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
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
                                                name: NameNode(value: 'price'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null,
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
                        name: NameNode(value: 'deliveries'),
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
                                          name: NameNode(value: 'driver'),
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
  ],
);
Mutation$UpdateOrder _parserFn$Mutation$UpdateOrder(
  Map<String, dynamic> data,
) => Mutation$UpdateOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateOrder =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateOrder?);

class Options$Mutation$UpdateOrder
    extends graphql.MutationOptions<Mutation$UpdateOrder> {
  Options$Mutation$UpdateOrder({
    String? operationName,
    required Variables$Mutation$UpdateOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateOrder>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateOrder,
         parserFn: _parserFn$Mutation$UpdateOrder,
       );

  final OnMutationCompleted$Mutation$UpdateOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateOrder
    extends graphql.WatchQueryOptions<Mutation$UpdateOrder> {
  WatchOptions$Mutation$UpdateOrder({
    String? operationName,
    required Variables$Mutation$UpdateOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateOrder? typedOptimisticResult,
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
         document: documentNodeMutationUpdateOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateOrder,
       );
}

extension ClientExtension$Mutation$UpdateOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateOrder>> mutate$UpdateOrder(
    Options$Mutation$UpdateOrder options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateOrder> watchMutation$UpdateOrder(
    WatchOptions$Mutation$UpdateOrder options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateOrder$HookResult {
  Mutation$UpdateOrder$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateOrder runMutation;

  final graphql.QueryResult<Mutation$UpdateOrder> result;
}

Mutation$UpdateOrder$HookResult useMutation$UpdateOrder([
  WidgetOptions$Mutation$UpdateOrder? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateOrder(),
  );
  return Mutation$UpdateOrder$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateOrder> useWatchMutation$UpdateOrder(
  WatchOptions$Mutation$UpdateOrder options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateOrder
    extends graphql.MutationOptions<Mutation$UpdateOrder> {
  WidgetOptions$Mutation$UpdateOrder({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateOrder>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateOrder,
         parserFn: _parserFn$Mutation$UpdateOrder,
       );

  final OnMutationCompleted$Mutation$UpdateOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateOrder =
    graphql.MultiSourceResult<Mutation$UpdateOrder> Function(
      Variables$Mutation$UpdateOrder, {
      Object? optimisticResult,
      Mutation$UpdateOrder? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateOrder =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateOrder,
      graphql.QueryResult<Mutation$UpdateOrder>?,
    );

class Mutation$UpdateOrder$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateOrder> {
  Mutation$UpdateOrder$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateOrder? options,
    required Builder$Mutation$UpdateOrder builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateOrder(),
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

class Mutation$UpdateOrder$updateOrder {
  Mutation$UpdateOrder$updateOrder({
    this.order,
    this.$__typename = 'updateOrderPayload',
  });

  factory Mutation$UpdateOrder$updateOrder.fromJson(Map<String, dynamic> json) {
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder(
      order: l$order == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order.fromJson(
              (l$order as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateOrder$updateOrder$order? order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([l$order, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateOrder$updateOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder
    on Mutation$UpdateOrder$updateOrder {
  CopyWith$Mutation$UpdateOrder$updateOrder<Mutation$UpdateOrder$updateOrder>
  get copyWith => CopyWith$Mutation$UpdateOrder$updateOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder<TRes> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder(
    Mutation$UpdateOrder$updateOrder instance,
    TRes Function(Mutation$UpdateOrder$updateOrder) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder;

  factory CopyWith$Mutation$UpdateOrder$updateOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder;

  TRes call({
    Mutation$UpdateOrder$updateOrder$order? order,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder$order<TRes> get order;
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder<TRes>
    implements CopyWith$Mutation$UpdateOrder$updateOrder<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder(this._instance, this._then);

  final Mutation$UpdateOrder$updateOrder _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$UpdateOrder$updateOrder(
          order: order == _undefined
              ? _instance.order
              : (order as Mutation$UpdateOrder$updateOrder$order?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$UpdateOrder$updateOrder$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order.stub(_then(_instance))
        : CopyWith$Mutation$UpdateOrder$updateOrder$order(
            local$order,
            (e) => call(order: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder<TRes>
    implements CopyWith$Mutation$UpdateOrder$updateOrder<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder(this._res);

  TRes _res;

  call({Mutation$UpdateOrder$updateOrder$order? order, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UpdateOrder$updateOrder$order<TRes> get order =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order.stub(_res);
}

class Mutation$UpdateOrder$updateOrder$order {
  Mutation$UpdateOrder$updateOrder$order({
    required this.id,
    required this.status,
    required this.total,
    this.paymentIntentId,
    this.deliveryFirstName,
    this.deliveryLastName,
    this.deliveryPhoneNumber,
    this.deliveryStreet,
    this.deliveryApartment,
    this.deliveryCity,
    this.deliveryZipCode,
    this.customer,
    this.restaurant,
    this.orderItems,
    this.deliveries,
    this.$__typename = 'Order',
  });

  factory Mutation$UpdateOrder$updateOrder$order.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$total = json['total'];
    final l$paymentIntentId = json['paymentIntentId'];
    final l$deliveryFirstName = json['deliveryFirstName'];
    final l$deliveryLastName = json['deliveryLastName'];
    final l$deliveryPhoneNumber = json['deliveryPhoneNumber'];
    final l$deliveryStreet = json['deliveryStreet'];
    final l$deliveryApartment = json['deliveryApartment'];
    final l$deliveryCity = json['deliveryCity'];
    final l$deliveryZipCode = json['deliveryZipCode'];
    final l$customer = json['customer'];
    final l$restaurant = json['restaurant'];
    final l$orderItems = json['orderItems'];
    final l$deliveries = json['deliveries'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order(
      id: (l$id as String),
      status: fromJson$Enum$OrderStatus((l$status as String)),
      total: (l$total as int),
      paymentIntentId: (l$paymentIntentId as String?),
      deliveryFirstName: (l$deliveryFirstName as String?),
      deliveryLastName: (l$deliveryLastName as String?),
      deliveryPhoneNumber: (l$deliveryPhoneNumber as String?),
      deliveryStreet: (l$deliveryStreet as String?),
      deliveryApartment: (l$deliveryApartment as String?),
      deliveryCity: (l$deliveryCity as String?),
      deliveryZipCode: (l$deliveryZipCode as String?),
      customer: l$customer == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$customer.fromJson(
              (l$customer as Map<String, dynamic>),
            ),
      restaurant: l$restaurant == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      orderItems: l$orderItems == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$orderItems.fromJson(
              (l$orderItems as Map<String, dynamic>),
            ),
      deliveries: l$deliveries == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$deliveries.fromJson(
              (l$deliveries as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$OrderStatus status;

  final int total;

  final String? paymentIntentId;

  final String? deliveryFirstName;

  final String? deliveryLastName;

  final String? deliveryPhoneNumber;

  final String? deliveryStreet;

  final String? deliveryApartment;

  final String? deliveryCity;

  final String? deliveryZipCode;

  final Mutation$UpdateOrder$updateOrder$order$customer? customer;

  final Mutation$UpdateOrder$updateOrder$order$restaurant? restaurant;

  final Mutation$UpdateOrder$updateOrder$order$orderItems? orderItems;

  final Mutation$UpdateOrder$updateOrder$order$deliveries? deliveries;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$OrderStatus(l$status);
    final l$total = total;
    _resultData['total'] = l$total;
    final l$paymentIntentId = paymentIntentId;
    _resultData['paymentIntentId'] = l$paymentIntentId;
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
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$orderItems = orderItems;
    _resultData['orderItems'] = l$orderItems?.toJson();
    final l$deliveries = deliveries;
    _resultData['deliveries'] = l$deliveries?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$total = total;
    final l$paymentIntentId = paymentIntentId;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$customer = customer;
    final l$restaurant = restaurant;
    final l$orderItems = orderItems;
    final l$deliveries = deliveries;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$total,
      l$paymentIntentId,
      l$deliveryFirstName,
      l$deliveryLastName,
      l$deliveryPhoneNumber,
      l$deliveryStreet,
      l$deliveryApartment,
      l$deliveryCity,
      l$deliveryZipCode,
      l$customer,
      l$restaurant,
      l$orderItems,
      l$deliveries,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateOrder$updateOrder$order ||
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
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$paymentIntentId = paymentIntentId;
    final lOther$paymentIntentId = other.paymentIntentId;
    if (l$paymentIntentId != lOther$paymentIntentId) {
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
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (l$orderItems != lOther$orderItems) {
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order
    on Mutation$UpdateOrder$updateOrder$order {
  CopyWith$Mutation$UpdateOrder$updateOrder$order<
    Mutation$UpdateOrder$updateOrder$order
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order<TRes> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order(
    Mutation$UpdateOrder$updateOrder$order instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order;

  TRes call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Mutation$UpdateOrder$updateOrder$order$customer? customer,
    Mutation$UpdateOrder$updateOrder$order$restaurant? restaurant,
    Mutation$UpdateOrder$updateOrder$order$orderItems? orderItems,
    Mutation$UpdateOrder$updateOrder$order$deliveries? deliveries,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<TRes> get customer;
  CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes>
  get restaurant;
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes>
  get orderItems;
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes>
  get deliveries;
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order<TRes>
    implements CopyWith$Mutation$UpdateOrder$updateOrder$order<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? total = _undefined,
    Object? paymentIntentId = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? customer = _undefined,
    Object? restaurant = _undefined,
    Object? orderItems = _undefined,
    Object? deliveries = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$OrderStatus),
      total: total == _undefined || total == null
          ? _instance.total
          : (total as int),
      paymentIntentId: paymentIntentId == _undefined
          ? _instance.paymentIntentId
          : (paymentIntentId as String?),
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
      customer: customer == _undefined
          ? _instance.customer
          : (customer as Mutation$UpdateOrder$updateOrder$order$customer?),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Mutation$UpdateOrder$updateOrder$order$restaurant?),
      orderItems: orderItems == _undefined
          ? _instance.orderItems
          : (orderItems as Mutation$UpdateOrder$updateOrder$order$orderItems?),
      deliveries: deliveries == _undefined
          ? _instance.deliveries
          : (deliveries as Mutation$UpdateOrder$updateOrder$order$deliveries?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$customer.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$customer(
            local$customer,
            (e) => call(customer: e),
          );
  }

  CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes>
  get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes>
  get orderItems {
    final local$orderItems = _instance.orderItems;
    return local$orderItems == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems(
            local$orderItems,
            (e) => call(orderItems: e),
          );
  }

  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes>
  get deliveries {
    final local$deliveries = _instance.deliveries;
    return local$deliveries == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries(
            local$deliveries,
            (e) => call(deliveries: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order<TRes>
    implements CopyWith$Mutation$UpdateOrder$updateOrder$order<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order(this._res);

  TRes _res;

  call({
    String? id,
    Enum$OrderStatus? status,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    Mutation$UpdateOrder$updateOrder$order$customer? customer,
    Mutation$UpdateOrder$updateOrder$order$restaurant? restaurant,
    Mutation$UpdateOrder$updateOrder$order$orderItems? orderItems,
    Mutation$UpdateOrder$updateOrder$order$deliveries? deliveries,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<TRes> get customer =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$customer.stub(_res);

  CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes>
  get restaurant =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant.stub(_res);

  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes>
  get orderItems =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems.stub(_res);

  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes>
  get deliveries =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries.stub(_res);
}

class Mutation$UpdateOrder$updateOrder$order$customer {
  Mutation$UpdateOrder$updateOrder$order$customer({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Mutation$UpdateOrder$updateOrder$order$customer.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$customer(
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
    if (other is! Mutation$UpdateOrder$updateOrder$order$customer ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$customer
    on Mutation$UpdateOrder$updateOrder$order$customer {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<
    Mutation$UpdateOrder$updateOrder$order$customer
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$customer(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<TRes> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$customer(
    Mutation$UpdateOrder$updateOrder$order$customer instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$customer) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$customer;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$customer.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$customer;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$customer<TRes>
    implements CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$customer(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$customer _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$customer(
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

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$customer<TRes>
    implements CopyWith$Mutation$UpdateOrder$updateOrder$order$customer<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$customer(this._res);

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Mutation$UpdateOrder$updateOrder$order$restaurant {
  Mutation$UpdateOrder$updateOrder$order$restaurant({
    required this.id,
    required this.name,
    this.$__typename = 'Restaurant',
  });

  factory Mutation$UpdateOrder$updateOrder$order$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$restaurant(
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
    if (other is! Mutation$UpdateOrder$updateOrder$order$restaurant ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$restaurant
    on Mutation$UpdateOrder$updateOrder$order$restaurant {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<
    Mutation$UpdateOrder$updateOrder$order$restaurant
  >
  get copyWith => CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant(
    Mutation$UpdateOrder$updateOrder$order$restaurant instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$restaurant) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$restaurant;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$restaurant;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$restaurant(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$restaurant _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$restaurant(
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

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$restaurant<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$restaurant(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Mutation$UpdateOrder$updateOrder$order$orderItems {
  Mutation$UpdateOrder$updateOrder$order$orderItems({
    this.edges,
    this.$__typename = 'OrderItemCursorConnection',
  });

  factory Mutation$UpdateOrder$updateOrder$order$orderItems.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$orderItems(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Mutation$UpdateOrder$updateOrder$order$orderItems$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$UpdateOrder$updateOrder$order$orderItems$edges?>? edges;

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
    if (other is! Mutation$UpdateOrder$updateOrder$order$orderItems ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$orderItems
    on Mutation$UpdateOrder$updateOrder$order$orderItems {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<
    Mutation$UpdateOrder$updateOrder$order$orderItems
  >
  get copyWith => CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems(
    Mutation$UpdateOrder$updateOrder$order$orderItems instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$orderItems) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems;

  TRes call({
    List<Mutation$UpdateOrder$updateOrder$order$orderItems$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Mutation$UpdateOrder$updateOrder$order$orderItems$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<
          Mutation$UpdateOrder$updateOrder$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$orderItems _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order$orderItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$UpdateOrder$updateOrder$order$orderItems(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Mutation$UpdateOrder$updateOrder$order$orderItems$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Mutation$UpdateOrder$updateOrder$order$orderItems$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<
          Mutation$UpdateOrder$updateOrder$order$orderItems$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems(
    this._res,
  );

  TRes _res;

  call({
    List<Mutation$UpdateOrder$updateOrder$order$orderItems$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Mutation$UpdateOrder$updateOrder$order$orderItems$edges {
  Mutation$UpdateOrder$updateOrder$order$orderItems$edges({
    this.node,
    this.$__typename = 'OrderItemEdge',
  });

  factory Mutation$UpdateOrder$updateOrder$order$orderItems$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
      node: l$node == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node? node;

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
    if (other is! Mutation$UpdateOrder$updateOrder$order$orderItems$edges ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$orderItems$edges
    on Mutation$UpdateOrder$updateOrder$order$orderItems$edges {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$orderItems$edges) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges;

  TRes call({
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node? node,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$orderItems$edges _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order$orderItems$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges(
    this._res,
  );

  TRes _res;

  call({
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<TRes>
  get node =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node.stub(
        _res,
      );
}

class Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node {
  Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node({
    required this.id,
    required this.quantity,
    required this.mealPlan,
    this.$__typename = 'OrderItem',
  });

  factory Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$quantity = json['quantity'];
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
      id: (l$id as String),
      quantity: (l$quantity as int),
      mealPlan:
          Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan.fromJson(
            (l$mealPlan as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int quantity;

  final Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan
  mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan.toJson();
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
            is! Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node
    on Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node)
    then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node;

  TRes call({
    String? id,
    int? quantity,
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan?
    mealPlan,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan;
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node _instance;

  final TRes Function(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? quantity = _undefined,
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      quantity: quantity == _undefined || quantity == null
          ? _instance.quantity
          : (quantity as int),
      mealPlan: mealPlan == _undefined || mealPlan == null
          ? _instance.mealPlan
          : (mealPlan
                as Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
      local$mealPlan,
      (e) => call(mealPlan: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    int? quantity,
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan?
    mealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
    TRes
  >
  get mealPlan =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan.stub(
        _res,
      );
}

class Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan {
  Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan({
    required this.id,
    required this.name,
    this.price,
    this.$__typename = 'MealPlan',
  });

  factory Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int? price;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$price, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan ||
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
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan
    on Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan
    instance,
    TRes Function(
      Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan,
    )
    then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan;

  TRes call({String? id, String? name, int? price, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan
  _instance;

  final TRes Function(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      price: price == _undefined ? _instance.price : (price as int?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$orderItems$edges$node$mealPlan(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, int? price, String? $__typename}) => _res;
}

class Mutation$UpdateOrder$updateOrder$order$deliveries {
  Mutation$UpdateOrder$updateOrder$order$deliveries({
    this.edges,
    this.$__typename = 'DeliveryCursorConnection',
  });

  factory Mutation$UpdateOrder$updateOrder$order$deliveries.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$deliveries(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Mutation$UpdateOrder$updateOrder$order$deliveries$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Mutation$UpdateOrder$updateOrder$order$deliveries$edges?>? edges;

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
    if (other is! Mutation$UpdateOrder$updateOrder$order$deliveries ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$deliveries
    on Mutation$UpdateOrder$updateOrder$order$deliveries {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<
    Mutation$UpdateOrder$updateOrder$order$deliveries
  >
  get copyWith => CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries(
    Mutation$UpdateOrder$updateOrder$order$deliveries instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$deliveries) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries;

  TRes call({
    List<Mutation$UpdateOrder$updateOrder$order$deliveries$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Mutation$UpdateOrder$updateOrder$order$deliveries$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<
          Mutation$UpdateOrder$updateOrder$order$deliveries$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$deliveries _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order$deliveries) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$UpdateOrder$updateOrder$order$deliveries(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Mutation$UpdateOrder$updateOrder$order$deliveries$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Mutation$UpdateOrder$updateOrder$order$deliveries$edges?>?
    Function(
      Iterable<
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<
          Mutation$UpdateOrder$updateOrder$order$deliveries$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries(
    this._res,
  );

  TRes _res;

  call({
    List<Mutation$UpdateOrder$updateOrder$order$deliveries$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Mutation$UpdateOrder$updateOrder$order$deliveries$edges {
  Mutation$UpdateOrder$updateOrder$order$deliveries$edges({
    this.node,
    this.$__typename = 'DeliveryEdge',
  });

  factory Mutation$UpdateOrder$updateOrder$order$deliveries$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
      node: l$node == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node? node;

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
    if (other is! Mutation$UpdateOrder$updateOrder$order$deliveries$edges ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$deliveries$edges
    on Mutation$UpdateOrder$updateOrder$order$deliveries$edges {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$deliveries$edges) then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges;

  TRes call({
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node? node,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<TRes> {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$deliveries$edges _instance;

  final TRes Function(Mutation$UpdateOrder$updateOrder$order$deliveries$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges<TRes> {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges(
    this._res,
  );

  TRes _res;

  call({
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<TRes>
  get node =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node.stub(
        _res,
      );
}

class Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node {
  Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node({
    required this.id,
    required this.status,
    required this.deliveryDate,
    this.driver,
    this.$__typename = 'Delivery',
  });

  factory Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$status = json['status'];
    final l$deliveryDate = json['deliveryDate'];
    final l$driver = json['driver'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
      id: (l$id as String),
      status: fromJson$Enum$DeliveryStatus((l$status as String)),
      deliveryDate: (l$deliveryDate as String),
      driver: l$driver == null
          ? null
          : Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver.fromJson(
              (l$driver as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$DeliveryStatus status;

  final String deliveryDate;

  final Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver?
  driver;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$status = status;
    _resultData['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    _resultData['deliveryDate'] = l$deliveryDate;
    final l$driver = driver;
    _resultData['driver'] = l$driver?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$driver = driver;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$status,
      l$deliveryDate,
      l$driver,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node ||
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
    final l$driver = driver;
    final lOther$driver = other.driver;
    if (l$driver != lOther$driver) {
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node
    on Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node instance,
    TRes Function(Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node)
    then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node;

  TRes call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver? driver,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
    TRes
  >
  get driver;
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node _instance;

  final TRes Function(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? driver = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      status: status == _undefined || status == null
          ? _instance.status
          : (status as Enum$DeliveryStatus),
      deliveryDate: deliveryDate == _undefined || deliveryDate == null
          ? _instance.deliveryDate
          : (deliveryDate as String),
      driver: driver == _undefined
          ? _instance.driver
          : (driver
                as Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
    TRes
  >
  get driver {
    final local$driver = _instance.driver;
    return local$driver == null
        ? CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
            local$driver,
            (e) => call(driver: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver? driver,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
    TRes
  >
  get driver =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver.stub(
        _res,
      );
}

class Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver {
  Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver({
    required this.id,
    required this.email,
    this.$__typename = 'User',
  });

  factory Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
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
    if (other
            is! Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver ||
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

extension UtilityExtension$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver
    on Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver {
  CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver
  >
  get copyWith =>
      CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
  TRes
> {
  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver
    instance,
    TRes Function(
      Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver,
    )
    then,
  ) = _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver;

  factory CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver;

  TRes call({String? id, String? email, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
    this._instance,
    this._then,
  );

  final Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver
  _instance;

  final TRes Function(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
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

class _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
  TRes
>
    implements
        CopyWith$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateOrder$updateOrder$order$deliveries$edges$node$driver(
    this._res,
  );

  TRes _res;

  call({String? id, String? email, String? $__typename}) => _res;
}

class Variables$Mutation$DeleteOrder {
  factory Variables$Mutation$DeleteOrder({
    required Input$deleteOrderInput input,
  }) => Variables$Mutation$DeleteOrder._({r'input': input});

  Variables$Mutation$DeleteOrder._(this._$data);

  factory Variables$Mutation$DeleteOrder.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteOrderInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteOrder._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteOrderInput get input =>
      (_$data['input'] as Input$deleteOrderInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteOrder<Variables$Mutation$DeleteOrder>
  get copyWith => CopyWith$Variables$Mutation$DeleteOrder(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteOrder ||
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

abstract class CopyWith$Variables$Mutation$DeleteOrder<TRes> {
  factory CopyWith$Variables$Mutation$DeleteOrder(
    Variables$Mutation$DeleteOrder instance,
    TRes Function(Variables$Mutation$DeleteOrder) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteOrder;

  factory CopyWith$Variables$Mutation$DeleteOrder.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteOrder;

  TRes call({Input$deleteOrderInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteOrder<TRes>
    implements CopyWith$Variables$Mutation$DeleteOrder<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteOrder(this._instance, this._then);

  final Variables$Mutation$DeleteOrder _instance;

  final TRes Function(Variables$Mutation$DeleteOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteOrder._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteOrderInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteOrder<TRes>
    implements CopyWith$Variables$Mutation$DeleteOrder<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteOrder(this._res);

  TRes _res;

  call({Input$deleteOrderInput? input}) => _res;
}

class Mutation$DeleteOrder {
  Mutation$DeleteOrder({this.deleteOrder, this.$__typename = 'Mutation'});

  factory Mutation$DeleteOrder.fromJson(Map<String, dynamic> json) {
    final l$deleteOrder = json['deleteOrder'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteOrder(
      deleteOrder: l$deleteOrder == null
          ? null
          : Mutation$DeleteOrder$deleteOrder.fromJson(
              (l$deleteOrder as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteOrder$deleteOrder? deleteOrder;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteOrder = deleteOrder;
    _resultData['deleteOrder'] = l$deleteOrder?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteOrder = deleteOrder;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteOrder, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteOrder || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteOrder = deleteOrder;
    final lOther$deleteOrder = other.deleteOrder;
    if (l$deleteOrder != lOther$deleteOrder) {
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

extension UtilityExtension$Mutation$DeleteOrder on Mutation$DeleteOrder {
  CopyWith$Mutation$DeleteOrder<Mutation$DeleteOrder> get copyWith =>
      CopyWith$Mutation$DeleteOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteOrder<TRes> {
  factory CopyWith$Mutation$DeleteOrder(
    Mutation$DeleteOrder instance,
    TRes Function(Mutation$DeleteOrder) then,
  ) = _CopyWithImpl$Mutation$DeleteOrder;

  factory CopyWith$Mutation$DeleteOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteOrder;

  TRes call({
    Mutation$DeleteOrder$deleteOrder? deleteOrder,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteOrder$deleteOrder<TRes> get deleteOrder;
}

class _CopyWithImpl$Mutation$DeleteOrder<TRes>
    implements CopyWith$Mutation$DeleteOrder<TRes> {
  _CopyWithImpl$Mutation$DeleteOrder(this._instance, this._then);

  final Mutation$DeleteOrder _instance;

  final TRes Function(Mutation$DeleteOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteOrder = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteOrder(
      deleteOrder: deleteOrder == _undefined
          ? _instance.deleteOrder
          : (deleteOrder as Mutation$DeleteOrder$deleteOrder?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteOrder$deleteOrder<TRes> get deleteOrder {
    final local$deleteOrder = _instance.deleteOrder;
    return local$deleteOrder == null
        ? CopyWith$Mutation$DeleteOrder$deleteOrder.stub(_then(_instance))
        : CopyWith$Mutation$DeleteOrder$deleteOrder(
            local$deleteOrder,
            (e) => call(deleteOrder: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteOrder<TRes>
    implements CopyWith$Mutation$DeleteOrder<TRes> {
  _CopyWithStubImpl$Mutation$DeleteOrder(this._res);

  TRes _res;

  call({Mutation$DeleteOrder$deleteOrder? deleteOrder, String? $__typename}) =>
      _res;

  CopyWith$Mutation$DeleteOrder$deleteOrder<TRes> get deleteOrder =>
      CopyWith$Mutation$DeleteOrder$deleteOrder.stub(_res);
}

const documentNodeMutationDeleteOrder = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteOrder'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteOrderInput'),
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
            name: NameNode(value: 'deleteOrder'),
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
Mutation$DeleteOrder _parserFn$Mutation$DeleteOrder(
  Map<String, dynamic> data,
) => Mutation$DeleteOrder.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteOrder =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteOrder?);

class Options$Mutation$DeleteOrder
    extends graphql.MutationOptions<Mutation$DeleteOrder> {
  Options$Mutation$DeleteOrder({
    String? operationName,
    required Variables$Mutation$DeleteOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteOrder>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteOrder,
         parserFn: _parserFn$Mutation$DeleteOrder,
       );

  final OnMutationCompleted$Mutation$DeleteOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteOrder
    extends graphql.WatchQueryOptions<Mutation$DeleteOrder> {
  WatchOptions$Mutation$DeleteOrder({
    String? operationName,
    required Variables$Mutation$DeleteOrder variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteOrder? typedOptimisticResult,
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
         document: documentNodeMutationDeleteOrder,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteOrder,
       );
}

extension ClientExtension$Mutation$DeleteOrder on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteOrder>> mutate$DeleteOrder(
    Options$Mutation$DeleteOrder options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteOrder> watchMutation$DeleteOrder(
    WatchOptions$Mutation$DeleteOrder options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteOrder$HookResult {
  Mutation$DeleteOrder$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteOrder runMutation;

  final graphql.QueryResult<Mutation$DeleteOrder> result;
}

Mutation$DeleteOrder$HookResult useMutation$DeleteOrder([
  WidgetOptions$Mutation$DeleteOrder? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteOrder(),
  );
  return Mutation$DeleteOrder$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteOrder> useWatchMutation$DeleteOrder(
  WatchOptions$Mutation$DeleteOrder options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteOrder
    extends graphql.MutationOptions<Mutation$DeleteOrder> {
  WidgetOptions$Mutation$DeleteOrder({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteOrder? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteOrder? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteOrder>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteOrder(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteOrder,
         parserFn: _parserFn$Mutation$DeleteOrder,
       );

  final OnMutationCompleted$Mutation$DeleteOrder? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteOrder =
    graphql.MultiSourceResult<Mutation$DeleteOrder> Function(
      Variables$Mutation$DeleteOrder, {
      Object? optimisticResult,
      Mutation$DeleteOrder? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteOrder =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteOrder,
      graphql.QueryResult<Mutation$DeleteOrder>?,
    );

class Mutation$DeleteOrder$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteOrder> {
  Mutation$DeleteOrder$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteOrder? options,
    required Builder$Mutation$DeleteOrder builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteOrder(),
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

class Mutation$DeleteOrder$deleteOrder {
  Mutation$DeleteOrder$deleteOrder({
    this.order,
    this.$__typename = 'deleteOrderPayload',
  });

  factory Mutation$DeleteOrder$deleteOrder.fromJson(Map<String, dynamic> json) {
    final l$order = json['order'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteOrder$deleteOrder(
      order: l$order == null
          ? null
          : Mutation$DeleteOrder$deleteOrder$order.fromJson(
              (l$order as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteOrder$deleteOrder$order? order;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$order = order;
    _resultData['order'] = l$order?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$order = order;
    final l$$__typename = $__typename;
    return Object.hashAll([l$order, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteOrder$deleteOrder ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (l$order != lOther$order) {
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

extension UtilityExtension$Mutation$DeleteOrder$deleteOrder
    on Mutation$DeleteOrder$deleteOrder {
  CopyWith$Mutation$DeleteOrder$deleteOrder<Mutation$DeleteOrder$deleteOrder>
  get copyWith => CopyWith$Mutation$DeleteOrder$deleteOrder(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteOrder$deleteOrder<TRes> {
  factory CopyWith$Mutation$DeleteOrder$deleteOrder(
    Mutation$DeleteOrder$deleteOrder instance,
    TRes Function(Mutation$DeleteOrder$deleteOrder) then,
  ) = _CopyWithImpl$Mutation$DeleteOrder$deleteOrder;

  factory CopyWith$Mutation$DeleteOrder$deleteOrder.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteOrder$deleteOrder;

  TRes call({
    Mutation$DeleteOrder$deleteOrder$order? order,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteOrder$deleteOrder$order<TRes> get order;
}

class _CopyWithImpl$Mutation$DeleteOrder$deleteOrder<TRes>
    implements CopyWith$Mutation$DeleteOrder$deleteOrder<TRes> {
  _CopyWithImpl$Mutation$DeleteOrder$deleteOrder(this._instance, this._then);

  final Mutation$DeleteOrder$deleteOrder _instance;

  final TRes Function(Mutation$DeleteOrder$deleteOrder) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? order = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteOrder$deleteOrder(
          order: order == _undefined
              ? _instance.order
              : (order as Mutation$DeleteOrder$deleteOrder$order?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$DeleteOrder$deleteOrder$order<TRes> get order {
    final local$order = _instance.order;
    return local$order == null
        ? CopyWith$Mutation$DeleteOrder$deleteOrder$order.stub(_then(_instance))
        : CopyWith$Mutation$DeleteOrder$deleteOrder$order(
            local$order,
            (e) => call(order: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteOrder$deleteOrder<TRes>
    implements CopyWith$Mutation$DeleteOrder$deleteOrder<TRes> {
  _CopyWithStubImpl$Mutation$DeleteOrder$deleteOrder(this._res);

  TRes _res;

  call({Mutation$DeleteOrder$deleteOrder$order? order, String? $__typename}) =>
      _res;

  CopyWith$Mutation$DeleteOrder$deleteOrder$order<TRes> get order =>
      CopyWith$Mutation$DeleteOrder$deleteOrder$order.stub(_res);
}

class Mutation$DeleteOrder$deleteOrder$order {
  Mutation$DeleteOrder$deleteOrder$order({
    required this.id,
    this.$__typename = 'Order',
  });

  factory Mutation$DeleteOrder$deleteOrder$order.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteOrder$deleteOrder$order(
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
    if (other is! Mutation$DeleteOrder$deleteOrder$order ||
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

extension UtilityExtension$Mutation$DeleteOrder$deleteOrder$order
    on Mutation$DeleteOrder$deleteOrder$order {
  CopyWith$Mutation$DeleteOrder$deleteOrder$order<
    Mutation$DeleteOrder$deleteOrder$order
  >
  get copyWith =>
      CopyWith$Mutation$DeleteOrder$deleteOrder$order(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteOrder$deleteOrder$order<TRes> {
  factory CopyWith$Mutation$DeleteOrder$deleteOrder$order(
    Mutation$DeleteOrder$deleteOrder$order instance,
    TRes Function(Mutation$DeleteOrder$deleteOrder$order) then,
  ) = _CopyWithImpl$Mutation$DeleteOrder$deleteOrder$order;

  factory CopyWith$Mutation$DeleteOrder$deleteOrder$order.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteOrder$deleteOrder$order;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteOrder$deleteOrder$order<TRes>
    implements CopyWith$Mutation$DeleteOrder$deleteOrder$order<TRes> {
  _CopyWithImpl$Mutation$DeleteOrder$deleteOrder$order(
    this._instance,
    this._then,
  );

  final Mutation$DeleteOrder$deleteOrder$order _instance;

  final TRes Function(Mutation$DeleteOrder$deleteOrder$order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteOrder$deleteOrder$order(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteOrder$deleteOrder$order<TRes>
    implements CopyWith$Mutation$DeleteOrder$deleteOrder$order<TRes> {
  _CopyWithStubImpl$Mutation$DeleteOrder$deleteOrder$order(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
