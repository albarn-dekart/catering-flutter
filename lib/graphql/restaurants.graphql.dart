import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetRestaurants {
  factory Variables$Query$GetRestaurants({int? first, String? after}) =>
      Variables$Query$GetRestaurants._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$GetRestaurants._(this._$data);

  factory Variables$Query$GetRestaurants.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$GetRestaurants._(result$data);
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

  CopyWith$Variables$Query$GetRestaurants<Variables$Query$GetRestaurants>
  get copyWith => CopyWith$Variables$Query$GetRestaurants(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetRestaurants ||
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

abstract class CopyWith$Variables$Query$GetRestaurants<TRes> {
  factory CopyWith$Variables$Query$GetRestaurants(
    Variables$Query$GetRestaurants instance,
    TRes Function(Variables$Query$GetRestaurants) then,
  ) = _CopyWithImpl$Variables$Query$GetRestaurants;

  factory CopyWith$Variables$Query$GetRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRestaurants;

  TRes call({int? first, String? after});
}

class _CopyWithImpl$Variables$Query$GetRestaurants<TRes>
    implements CopyWith$Variables$Query$GetRestaurants<TRes> {
  _CopyWithImpl$Variables$Query$GetRestaurants(this._instance, this._then);

  final Variables$Query$GetRestaurants _instance;

  final TRes Function(Variables$Query$GetRestaurants) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? first = _undefined, Object? after = _undefined}) => _then(
    Variables$Query$GetRestaurants._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetRestaurants<TRes>
    implements CopyWith$Variables$Query$GetRestaurants<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRestaurants(this._res);

  TRes _res;

  call({int? first, String? after}) => _res;
}

class Query$GetRestaurants {
  Query$GetRestaurants({this.restaurants, this.$__typename = 'Query'});

  factory Query$GetRestaurants.fromJson(Map<String, dynamic> json) {
    final l$restaurants = json['restaurants'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants(
      restaurants: l$restaurants == null
          ? null
          : Query$GetRestaurants$restaurants.fromJson(
              (l$restaurants as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurants$restaurants? restaurants;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurants = restaurants;
    _resultData['restaurants'] = l$restaurants?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurants = restaurants;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurants, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurants || runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurants = restaurants;
    final lOther$restaurants = other.restaurants;
    if (l$restaurants != lOther$restaurants) {
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

extension UtilityExtension$Query$GetRestaurants on Query$GetRestaurants {
  CopyWith$Query$GetRestaurants<Query$GetRestaurants> get copyWith =>
      CopyWith$Query$GetRestaurants(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurants<TRes> {
  factory CopyWith$Query$GetRestaurants(
    Query$GetRestaurants instance,
    TRes Function(Query$GetRestaurants) then,
  ) = _CopyWithImpl$Query$GetRestaurants;

  factory CopyWith$Query$GetRestaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants;

  TRes call({
    Query$GetRestaurants$restaurants? restaurants,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurants$restaurants<TRes> get restaurants;
}

class _CopyWithImpl$Query$GetRestaurants<TRes>
    implements CopyWith$Query$GetRestaurants<TRes> {
  _CopyWithImpl$Query$GetRestaurants(this._instance, this._then);

  final Query$GetRestaurants _instance;

  final TRes Function(Query$GetRestaurants) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurants = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants(
      restaurants: restaurants == _undefined
          ? _instance.restaurants
          : (restaurants as Query$GetRestaurants$restaurants?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurants$restaurants<TRes> get restaurants {
    final local$restaurants = _instance.restaurants;
    return local$restaurants == null
        ? CopyWith$Query$GetRestaurants$restaurants.stub(_then(_instance))
        : CopyWith$Query$GetRestaurants$restaurants(
            local$restaurants,
            (e) => call(restaurants: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurants<TRes>
    implements CopyWith$Query$GetRestaurants<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants(this._res);

  TRes _res;

  call({Query$GetRestaurants$restaurants? restaurants, String? $__typename}) =>
      _res;

  CopyWith$Query$GetRestaurants$restaurants<TRes> get restaurants =>
      CopyWith$Query$GetRestaurants$restaurants.stub(_res);
}

const documentNodeQueryGetRestaurants = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetRestaurants'),
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
            name: NameNode(value: 'restaurants'),
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
                              name: NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'description'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'imageUrl'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'restaurantCategories'),
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
                                                name: NameNode(value: 'name'),
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
Query$GetRestaurants _parserFn$Query$GetRestaurants(
  Map<String, dynamic> data,
) => Query$GetRestaurants.fromJson(data);
typedef OnQueryComplete$Query$GetRestaurants =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetRestaurants?);

class Options$Query$GetRestaurants
    extends graphql.QueryOptions<Query$GetRestaurants> {
  Options$Query$GetRestaurants({
    String? operationName,
    Variables$Query$GetRestaurants? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurants? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRestaurants? onComplete,
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
                 data == null ? null : _parserFn$Query$GetRestaurants(data),
               ),
         onError: onError,
         document: documentNodeQueryGetRestaurants,
         parserFn: _parserFn$Query$GetRestaurants,
       );

  final OnQueryComplete$Query$GetRestaurants? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetRestaurants
    extends graphql.WatchQueryOptions<Query$GetRestaurants> {
  WatchOptions$Query$GetRestaurants({
    String? operationName,
    Variables$Query$GetRestaurants? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurants? typedOptimisticResult,
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
         document: documentNodeQueryGetRestaurants,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetRestaurants,
       );
}

class FetchMoreOptions$Query$GetRestaurants extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRestaurants({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetRestaurants? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetRestaurants,
       );
}

extension ClientExtension$Query$GetRestaurants on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRestaurants>> query$GetRestaurants([
    Options$Query$GetRestaurants? options,
  ]) async => await this.query(options ?? Options$Query$GetRestaurants());

  graphql.ObservableQuery<Query$GetRestaurants> watchQuery$GetRestaurants([
    WatchOptions$Query$GetRestaurants? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetRestaurants());

  void writeQuery$GetRestaurants({
    required Query$GetRestaurants data,
    Variables$Query$GetRestaurants? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetRestaurants),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetRestaurants? readQuery$GetRestaurants({
    Variables$Query$GetRestaurants? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetRestaurants),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRestaurants.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRestaurants> useQuery$GetRestaurants([
  Options$Query$GetRestaurants? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetRestaurants());
graphql.ObservableQuery<Query$GetRestaurants> useWatchQuery$GetRestaurants([
  WatchOptions$Query$GetRestaurants? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetRestaurants(),
);

class Query$GetRestaurants$Widget
    extends graphql_flutter.Query<Query$GetRestaurants> {
  Query$GetRestaurants$Widget({
    widgets.Key? key,
    Options$Query$GetRestaurants? options,
    required graphql_flutter.QueryBuilder<Query$GetRestaurants> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetRestaurants(),
         builder: builder,
       );
}

class Query$GetRestaurants$restaurants {
  Query$GetRestaurants$restaurants({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'RestaurantCursorConnection',
  });

  factory Query$GetRestaurants$restaurants.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurants$restaurants$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetRestaurants$restaurants$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRestaurants$restaurants$edges?>? edges;

  final Query$GetRestaurants$restaurants$pageInfo pageInfo;

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
    if (other is! Query$GetRestaurants$restaurants ||
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

extension UtilityExtension$Query$GetRestaurants$restaurants
    on Query$GetRestaurants$restaurants {
  CopyWith$Query$GetRestaurants$restaurants<Query$GetRestaurants$restaurants>
  get copyWith => CopyWith$Query$GetRestaurants$restaurants(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurants$restaurants<TRes> {
  factory CopyWith$Query$GetRestaurants$restaurants(
    Query$GetRestaurants$restaurants instance,
    TRes Function(Query$GetRestaurants$restaurants) then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants;

  factory CopyWith$Query$GetRestaurants$restaurants.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants$restaurants;

  TRes call({
    List<Query$GetRestaurants$restaurants$edges?>? edges,
    Query$GetRestaurants$restaurants$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetRestaurants$restaurants$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurants$restaurants$edges<
          Query$GetRestaurants$restaurants$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetRestaurants$restaurants$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetRestaurants$restaurants<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants<TRes> {
  _CopyWithImpl$Query$GetRestaurants$restaurants(this._instance, this._then);

  final Query$GetRestaurants$restaurants _instance;

  final TRes Function(Query$GetRestaurants$restaurants) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants$restaurants(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetRestaurants$restaurants$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetRestaurants$restaurants$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetRestaurants$restaurants$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurants$restaurants$edges<
          Query$GetRestaurants$restaurants$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurants$restaurants$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetRestaurants$restaurants$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetRestaurants$restaurants$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetRestaurants$restaurants<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants(this._res);

  TRes _res;

  call({
    List<Query$GetRestaurants$restaurants$edges?>? edges,
    Query$GetRestaurants$restaurants$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetRestaurants$restaurants$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetRestaurants$restaurants$pageInfo.stub(_res);
}

class Query$GetRestaurants$restaurants$edges {
  Query$GetRestaurants$restaurants$edges({
    this.node,
    this.$__typename = 'RestaurantEdge',
  });

  factory Query$GetRestaurants$restaurants$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurants$restaurants$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurants$restaurants$edges$node? node;

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
    if (other is! Query$GetRestaurants$restaurants$edges ||
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

extension UtilityExtension$Query$GetRestaurants$restaurants$edges
    on Query$GetRestaurants$restaurants$edges {
  CopyWith$Query$GetRestaurants$restaurants$edges<
    Query$GetRestaurants$restaurants$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurants$restaurants$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurants$restaurants$edges<TRes> {
  factory CopyWith$Query$GetRestaurants$restaurants$edges(
    Query$GetRestaurants$restaurants$edges instance,
    TRes Function(Query$GetRestaurants$restaurants$edges) then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants$edges;

  factory CopyWith$Query$GetRestaurants$restaurants$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges;

  TRes call({
    Query$GetRestaurants$restaurants$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurants$restaurants$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetRestaurants$restaurants$edges<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants$edges<TRes> {
  _CopyWithImpl$Query$GetRestaurants$restaurants$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurants$edges _instance;

  final TRes Function(Query$GetRestaurants$restaurants$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurants$restaurants$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetRestaurants$restaurants$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetRestaurants$restaurants$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurants$restaurants$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurants$restaurants$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants$edges<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges(this._res);

  TRes _res;

  call({
    Query$GetRestaurants$restaurants$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurants$restaurants$edges$node<TRes> get node =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node.stub(_res);
}

class Query$GetRestaurants$restaurants$edges$node {
  Query$GetRestaurants$restaurants$edges$node({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.restaurantCategories,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetRestaurants$restaurants$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$imageUrl = json['imageUrl'];
    final l$restaurantCategories = json['restaurantCategories'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      imageUrl: (l$imageUrl as String?),
      restaurantCategories: l$restaurantCategories == null
          ? null
          : Query$GetRestaurants$restaurants$edges$node$restaurantCategories.fromJson(
              (l$restaurantCategories as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String? imageUrl;

  final Query$GetRestaurants$restaurants$edges$node$restaurantCategories?
  restaurantCategories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$restaurantCategories = restaurantCategories;
    _resultData['restaurantCategories'] = l$restaurantCategories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$imageUrl = imageUrl;
    final l$restaurantCategories = restaurantCategories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$imageUrl,
      l$restaurantCategories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurants$restaurants$edges$node ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
      return false;
    }
    final l$restaurantCategories = restaurantCategories;
    final lOther$restaurantCategories = other.restaurantCategories;
    if (l$restaurantCategories != lOther$restaurantCategories) {
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

extension UtilityExtension$Query$GetRestaurants$restaurants$edges$node
    on Query$GetRestaurants$restaurants$edges$node {
  CopyWith$Query$GetRestaurants$restaurants$edges$node<
    Query$GetRestaurants$restaurants$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurants$restaurants$edges$node<TRes> {
  factory CopyWith$Query$GetRestaurants$restaurants$edges$node(
    Query$GetRestaurants$restaurants$edges$node instance,
    TRes Function(Query$GetRestaurants$restaurants$edges$node) then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node;

  factory CopyWith$Query$GetRestaurants$restaurants$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories?
    restaurantCategories,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
    TRes
  >
  get restaurantCategories;
}

class _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants$edges$node<TRes> {
  _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurants$edges$node _instance;

  final TRes Function(Query$GetRestaurants$restaurants$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? imageUrl = _undefined,
    Object? restaurantCategories = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants$restaurants$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      restaurantCategories: restaurantCategories == _undefined
          ? _instance.restaurantCategories
          : (restaurantCategories
                as Query$GetRestaurants$restaurants$edges$node$restaurantCategories?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
    TRes
  >
  get restaurantCategories {
    final local$restaurantCategories = _instance.restaurantCategories;
    return local$restaurantCategories == null
        ? CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
            local$restaurantCategories,
            (e) => call(restaurantCategories: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories?
    restaurantCategories,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
    TRes
  >
  get restaurantCategories =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories.stub(
        _res,
      );
}

class Query$GetRestaurants$restaurants$edges$node$restaurantCategories {
  Query$GetRestaurants$restaurants$edges$node$restaurantCategories({
    this.edges,
    this.$__typename = 'RestaurantCategoryCursorConnection',
  });

  factory Query$GetRestaurants$restaurants$edges$node$restaurantCategories.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges?
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
            is! Query$GetRestaurants$restaurants$edges$node$restaurantCategories ||
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

extension UtilityExtension$Query$GetRestaurants$restaurants$edges$node$restaurantCategories
    on Query$GetRestaurants$restaurants$edges$node$restaurantCategories {
  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories
  >
  get copyWith =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
  TRes
> {
  factory CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories instance,
    TRes Function(
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories,
    )
    then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories;

  factory CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories;

  TRes call({
    List<
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges?
    >?
    edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges?
    >?
    Function(
      Iterable<
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
          Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
  TRes
>
    implements
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurants$edges$node$restaurantCategories
  _instance;

  final TRes Function(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<
                  Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges?
                >?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges?
    >?
    Function(
      Iterable<
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
          Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
  TRes
>
    implements
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories(
    this._res,
  );

  TRes _res;

  call({
    List<
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges?
    >?
    edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges {
  Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges({
    this.node,
    this.$__typename = 'RestaurantCategoryEdge',
  });

  factory Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node?
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
            is! Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges ||
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

extension UtilityExtension$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges
    on Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges {
  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
  TRes
> {
  factory CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges
    instance,
    TRes Function(
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges,
    )
    then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges;

  factory CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges;

  TRes call({
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node?
    node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
    TRes
  >
  get node;
}

class _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
  TRes
>
    implements
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges
  _instance;

  final TRes Function(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
    TRes
  >
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
  TRes
>
    implements
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges(
    this._res,
  );

  TRes _res;

  call({
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node?
    node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
    TRes
  >
  get node =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node.stub(
        _res,
      );
}

class Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node {
  Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'RestaurantCategory',
  });

  factory Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
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
    if (other
            is! Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node ||
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

extension UtilityExtension$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node
    on Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node {
  CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
  TRes
> {
  factory CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node
    instance,
    TRes Function(
      Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node,
    )
    then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node;

  factory CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node
  _instance;

  final TRes Function(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
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

class _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants$edges$node$restaurantCategories$edges$node(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetRestaurants$restaurants$pageInfo {
  Query$GetRestaurants$restaurants$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'RestaurantPageInfo',
  });

  factory Query$GetRestaurants$restaurants$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurants$restaurants$pageInfo(
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
    if (other is! Query$GetRestaurants$restaurants$pageInfo ||
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

extension UtilityExtension$Query$GetRestaurants$restaurants$pageInfo
    on Query$GetRestaurants$restaurants$pageInfo {
  CopyWith$Query$GetRestaurants$restaurants$pageInfo<
    Query$GetRestaurants$restaurants$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetRestaurants$restaurants$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurants$restaurants$pageInfo<TRes> {
  factory CopyWith$Query$GetRestaurants$restaurants$pageInfo(
    Query$GetRestaurants$restaurants$pageInfo instance,
    TRes Function(Query$GetRestaurants$restaurants$pageInfo) then,
  ) = _CopyWithImpl$Query$GetRestaurants$restaurants$pageInfo;

  factory CopyWith$Query$GetRestaurants$restaurants$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurants$restaurants$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetRestaurants$restaurants$pageInfo<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants$pageInfo<TRes> {
  _CopyWithImpl$Query$GetRestaurants$restaurants$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetRestaurants$restaurants$pageInfo _instance;

  final TRes Function(Query$GetRestaurants$restaurants$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurants$restaurants$pageInfo(
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

class _CopyWithStubImpl$Query$GetRestaurants$restaurants$pageInfo<TRes>
    implements CopyWith$Query$GetRestaurants$restaurants$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetRestaurants$restaurants$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetUserRestaurant {
  factory Variables$Query$GetUserRestaurant({required String id}) =>
      Variables$Query$GetUserRestaurant._({r'id': id});

  Variables$Query$GetUserRestaurant._(this._$data);

  factory Variables$Query$GetUserRestaurant.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetUserRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetUserRestaurant<Variables$Query$GetUserRestaurant>
  get copyWith => CopyWith$Variables$Query$GetUserRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetUserRestaurant ||
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

abstract class CopyWith$Variables$Query$GetUserRestaurant<TRes> {
  factory CopyWith$Variables$Query$GetUserRestaurant(
    Variables$Query$GetUserRestaurant instance,
    TRes Function(Variables$Query$GetUserRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$GetUserRestaurant;

  factory CopyWith$Variables$Query$GetUserRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetUserRestaurant;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetUserRestaurant<TRes>
    implements CopyWith$Variables$Query$GetUserRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$GetUserRestaurant(this._instance, this._then);

  final Variables$Query$GetUserRestaurant _instance;

  final TRes Function(Variables$Query$GetUserRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetUserRestaurant._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetUserRestaurant<TRes>
    implements CopyWith$Variables$Query$GetUserRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$GetUserRestaurant(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetUserRestaurant {
  Query$GetUserRestaurant({this.user, this.$__typename = 'Query'});

  factory Query$GetUserRestaurant.fromJson(Map<String, dynamic> json) {
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetUserRestaurant(
      user: l$user == null
          ? null
          : Query$GetUserRestaurant$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetUserRestaurant$user? user;

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
    if (other is! Query$GetUserRestaurant || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetUserRestaurant on Query$GetUserRestaurant {
  CopyWith$Query$GetUserRestaurant<Query$GetUserRestaurant> get copyWith =>
      CopyWith$Query$GetUserRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetUserRestaurant<TRes> {
  factory CopyWith$Query$GetUserRestaurant(
    Query$GetUserRestaurant instance,
    TRes Function(Query$GetUserRestaurant) then,
  ) = _CopyWithImpl$Query$GetUserRestaurant;

  factory CopyWith$Query$GetUserRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserRestaurant;

  TRes call({Query$GetUserRestaurant$user? user, String? $__typename});
  CopyWith$Query$GetUserRestaurant$user<TRes> get user;
}

class _CopyWithImpl$Query$GetUserRestaurant<TRes>
    implements CopyWith$Query$GetUserRestaurant<TRes> {
  _CopyWithImpl$Query$GetUserRestaurant(this._instance, this._then);

  final Query$GetUserRestaurant _instance;

  final TRes Function(Query$GetUserRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetUserRestaurant(
          user: user == _undefined
              ? _instance.user
              : (user as Query$GetUserRestaurant$user?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetUserRestaurant$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetUserRestaurant$user.stub(_then(_instance))
        : CopyWith$Query$GetUserRestaurant$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserRestaurant<TRes>
    implements CopyWith$Query$GetUserRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetUserRestaurant(this._res);

  TRes _res;

  call({Query$GetUserRestaurant$user? user, String? $__typename}) => _res;

  CopyWith$Query$GetUserRestaurant$user<TRes> get user =>
      CopyWith$Query$GetUserRestaurant$user.stub(_res);
}

const documentNodeQueryGetUserRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUserRestaurant'),
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
                        name: NameNode(value: 'description'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'imageUrl'),
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
Query$GetUserRestaurant _parserFn$Query$GetUserRestaurant(
  Map<String, dynamic> data,
) => Query$GetUserRestaurant.fromJson(data);
typedef OnQueryComplete$Query$GetUserRestaurant =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetUserRestaurant?);

class Options$Query$GetUserRestaurant
    extends graphql.QueryOptions<Query$GetUserRestaurant> {
  Options$Query$GetUserRestaurant({
    String? operationName,
    required Variables$Query$GetUserRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserRestaurant? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUserRestaurant? onComplete,
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
                 data == null ? null : _parserFn$Query$GetUserRestaurant(data),
               ),
         onError: onError,
         document: documentNodeQueryGetUserRestaurant,
         parserFn: _parserFn$Query$GetUserRestaurant,
       );

  final OnQueryComplete$Query$GetUserRestaurant? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetUserRestaurant
    extends graphql.WatchQueryOptions<Query$GetUserRestaurant> {
  WatchOptions$Query$GetUserRestaurant({
    String? operationName,
    required Variables$Query$GetUserRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUserRestaurant? typedOptimisticResult,
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
         document: documentNodeQueryGetUserRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetUserRestaurant,
       );
}

class FetchMoreOptions$Query$GetUserRestaurant
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUserRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetUserRestaurant variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetUserRestaurant,
       );
}

extension ClientExtension$Query$GetUserRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUserRestaurant>> query$GetUserRestaurant(
    Options$Query$GetUserRestaurant options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetUserRestaurant> watchQuery$GetUserRestaurant(
    WatchOptions$Query$GetUserRestaurant options,
  ) => this.watchQuery(options);

  void writeQuery$GetUserRestaurant({
    required Query$GetUserRestaurant data,
    required Variables$Query$GetUserRestaurant variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetUserRestaurant,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetUserRestaurant? readQuery$GetUserRestaurant({
    required Variables$Query$GetUserRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetUserRestaurant,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUserRestaurant.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUserRestaurant>
useQuery$GetUserRestaurant(Options$Query$GetUserRestaurant options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetUserRestaurant>
useWatchQuery$GetUserRestaurant(WatchOptions$Query$GetUserRestaurant options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetUserRestaurant$Widget
    extends graphql_flutter.Query<Query$GetUserRestaurant> {
  Query$GetUserRestaurant$Widget({
    widgets.Key? key,
    required Options$Query$GetUserRestaurant options,
    required graphql_flutter.QueryBuilder<Query$GetUserRestaurant> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetUserRestaurant$user {
  Query$GetUserRestaurant$user({
    required this.id,
    this.restaurant,
    this.$__typename = 'User',
  });

  factory Query$GetUserRestaurant$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetUserRestaurant$user(
      id: (l$id as String),
      restaurant: l$restaurant == null
          ? null
          : Query$GetUserRestaurant$user$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetUserRestaurant$user$restaurant? restaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$restaurant = restaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$restaurant, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserRestaurant$user ||
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
    return true;
  }
}

extension UtilityExtension$Query$GetUserRestaurant$user
    on Query$GetUserRestaurant$user {
  CopyWith$Query$GetUserRestaurant$user<Query$GetUserRestaurant$user>
  get copyWith => CopyWith$Query$GetUserRestaurant$user(this, (i) => i);
}

abstract class CopyWith$Query$GetUserRestaurant$user<TRes> {
  factory CopyWith$Query$GetUserRestaurant$user(
    Query$GetUserRestaurant$user instance,
    TRes Function(Query$GetUserRestaurant$user) then,
  ) = _CopyWithImpl$Query$GetUserRestaurant$user;

  factory CopyWith$Query$GetUserRestaurant$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserRestaurant$user;

  TRes call({
    String? id,
    Query$GetUserRestaurant$user$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetUserRestaurant$user$restaurant<TRes> get restaurant;
}

class _CopyWithImpl$Query$GetUserRestaurant$user<TRes>
    implements CopyWith$Query$GetUserRestaurant$user<TRes> {
  _CopyWithImpl$Query$GetUserRestaurant$user(this._instance, this._then);

  final Query$GetUserRestaurant$user _instance;

  final TRes Function(Query$GetUserRestaurant$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserRestaurant$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetUserRestaurant$user$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetUserRestaurant$user$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetUserRestaurant$user$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetUserRestaurant$user$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUserRestaurant$user<TRes>
    implements CopyWith$Query$GetUserRestaurant$user<TRes> {
  _CopyWithStubImpl$Query$GetUserRestaurant$user(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetUserRestaurant$user$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUserRestaurant$user$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetUserRestaurant$user$restaurant.stub(_res);
}

class Query$GetUserRestaurant$user$restaurant {
  Query$GetUserRestaurant$user$restaurant({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetUserRestaurant$user$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$imageUrl = json['imageUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetUserRestaurant$user$restaurant(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      imageUrl: (l$imageUrl as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String? imageUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$imageUrl = imageUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$imageUrl,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUserRestaurant$user$restaurant ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
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

extension UtilityExtension$Query$GetUserRestaurant$user$restaurant
    on Query$GetUserRestaurant$user$restaurant {
  CopyWith$Query$GetUserRestaurant$user$restaurant<
    Query$GetUserRestaurant$user$restaurant
  >
  get copyWith =>
      CopyWith$Query$GetUserRestaurant$user$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetUserRestaurant$user$restaurant<TRes> {
  factory CopyWith$Query$GetUserRestaurant$user$restaurant(
    Query$GetUserRestaurant$user$restaurant instance,
    TRes Function(Query$GetUserRestaurant$user$restaurant) then,
  ) = _CopyWithImpl$Query$GetUserRestaurant$user$restaurant;

  factory CopyWith$Query$GetUserRestaurant$user$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUserRestaurant$user$restaurant;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUserRestaurant$user$restaurant<TRes>
    implements CopyWith$Query$GetUserRestaurant$user$restaurant<TRes> {
  _CopyWithImpl$Query$GetUserRestaurant$user$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetUserRestaurant$user$restaurant _instance;

  final TRes Function(Query$GetUserRestaurant$user$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? imageUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUserRestaurant$user$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetUserRestaurant$user$restaurant<TRes>
    implements CopyWith$Query$GetUserRestaurant$user$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetUserRestaurant$user$restaurant(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? $__typename,
  }) => _res;
}

class Variables$Query$GetRestaurant {
  factory Variables$Query$GetRestaurant({required String id}) =>
      Variables$Query$GetRestaurant._({r'id': id});

  Variables$Query$GetRestaurant._(this._$data);

  factory Variables$Query$GetRestaurant.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetRestaurant<Variables$Query$GetRestaurant>
  get copyWith => CopyWith$Variables$Query$GetRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetRestaurant ||
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

abstract class CopyWith$Variables$Query$GetRestaurant<TRes> {
  factory CopyWith$Variables$Query$GetRestaurant(
    Variables$Query$GetRestaurant instance,
    TRes Function(Variables$Query$GetRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$GetRestaurant;

  factory CopyWith$Variables$Query$GetRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRestaurant;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetRestaurant<TRes>
    implements CopyWith$Variables$Query$GetRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$GetRestaurant(this._instance, this._then);

  final Variables$Query$GetRestaurant _instance;

  final TRes Function(Variables$Query$GetRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetRestaurant._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetRestaurant<TRes>
    implements CopyWith$Variables$Query$GetRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRestaurant(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetRestaurant {
  Query$GetRestaurant({this.restaurant, this.$__typename = 'Query'});

  factory Query$GetRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Query$GetRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurant$restaurant? restaurant;

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
    if (other is! Query$GetRestaurant || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetRestaurant on Query$GetRestaurant {
  CopyWith$Query$GetRestaurant<Query$GetRestaurant> get copyWith =>
      CopyWith$Query$GetRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant<TRes> {
  factory CopyWith$Query$GetRestaurant(
    Query$GetRestaurant instance,
    TRes Function(Query$GetRestaurant) then,
  ) = _CopyWithImpl$Query$GetRestaurant;

  factory CopyWith$Query$GetRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant;

  TRes call({Query$GetRestaurant$restaurant? restaurant, String? $__typename});
  CopyWith$Query$GetRestaurant$restaurant<TRes> get restaurant;
}

class _CopyWithImpl$Query$GetRestaurant<TRes>
    implements CopyWith$Query$GetRestaurant<TRes> {
  _CopyWithImpl$Query$GetRestaurant(this._instance, this._then);

  final Query$GetRestaurant _instance;

  final TRes Function(Query$GetRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurant$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetRestaurant$restaurant.stub(_then(_instance))
        : CopyWith$Query$GetRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurant<TRes>
    implements CopyWith$Query$GetRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant(this._res);

  TRes _res;

  call({Query$GetRestaurant$restaurant? restaurant, String? $__typename}) =>
      _res;

  CopyWith$Query$GetRestaurant$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetRestaurant$restaurant.stub(_res);
}

const documentNodeQueryGetRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetRestaurant'),
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'description'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'imageUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'restaurantCategories'),
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
                  name: NameNode(value: 'users'),
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
                  name: NameNode(value: 'meals'),
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
                                    name: NameNode(value: 'imageUrl'),
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
                  name: NameNode(value: 'mealPlans'),
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
                                    name: NameNode(value: 'imageUrl'),
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
Query$GetRestaurant _parserFn$Query$GetRestaurant(Map<String, dynamic> data) =>
    Query$GetRestaurant.fromJson(data);
typedef OnQueryComplete$Query$GetRestaurant =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetRestaurant?);

class Options$Query$GetRestaurant
    extends graphql.QueryOptions<Query$GetRestaurant> {
  Options$Query$GetRestaurant({
    String? operationName,
    required Variables$Query$GetRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurant? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRestaurant? onComplete,
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
                 data == null ? null : _parserFn$Query$GetRestaurant(data),
               ),
         onError: onError,
         document: documentNodeQueryGetRestaurant,
         parserFn: _parserFn$Query$GetRestaurant,
       );

  final OnQueryComplete$Query$GetRestaurant? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetRestaurant
    extends graphql.WatchQueryOptions<Query$GetRestaurant> {
  WatchOptions$Query$GetRestaurant({
    String? operationName,
    required Variables$Query$GetRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurant? typedOptimisticResult,
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
         document: documentNodeQueryGetRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetRestaurant,
       );
}

class FetchMoreOptions$Query$GetRestaurant extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetRestaurant variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetRestaurant,
       );
}

extension ClientExtension$Query$GetRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRestaurant>> query$GetRestaurant(
    Options$Query$GetRestaurant options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetRestaurant> watchQuery$GetRestaurant(
    WatchOptions$Query$GetRestaurant options,
  ) => this.watchQuery(options);

  void writeQuery$GetRestaurant({
    required Query$GetRestaurant data,
    required Variables$Query$GetRestaurant variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetRestaurant),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetRestaurant? readQuery$GetRestaurant({
    required Variables$Query$GetRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetRestaurant),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRestaurant.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRestaurant> useQuery$GetRestaurant(
  Options$Query$GetRestaurant options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetRestaurant> useWatchQuery$GetRestaurant(
  WatchOptions$Query$GetRestaurant options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetRestaurant$Widget
    extends graphql_flutter.Query<Query$GetRestaurant> {
  Query$GetRestaurant$Widget({
    widgets.Key? key,
    required Options$Query$GetRestaurant options,
    required graphql_flutter.QueryBuilder<Query$GetRestaurant> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetRestaurant$restaurant {
  Query$GetRestaurant$restaurant({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.restaurantCategories,
    this.users,
    this.meals,
    this.mealPlans,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetRestaurant$restaurant.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$imageUrl = json['imageUrl'];
    final l$restaurantCategories = json['restaurantCategories'];
    final l$users = json['users'];
    final l$meals = json['meals'];
    final l$mealPlans = json['mealPlans'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      imageUrl: (l$imageUrl as String?),
      restaurantCategories: l$restaurantCategories == null
          ? null
          : Query$GetRestaurant$restaurant$restaurantCategories.fromJson(
              (l$restaurantCategories as Map<String, dynamic>),
            ),
      users: l$users == null
          ? null
          : Query$GetRestaurant$restaurant$users.fromJson(
              (l$users as Map<String, dynamic>),
            ),
      meals: l$meals == null
          ? null
          : Query$GetRestaurant$restaurant$meals.fromJson(
              (l$meals as Map<String, dynamic>),
            ),
      mealPlans: l$mealPlans == null
          ? null
          : Query$GetRestaurant$restaurant$mealPlans.fromJson(
              (l$mealPlans as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String? imageUrl;

  final Query$GetRestaurant$restaurant$restaurantCategories?
  restaurantCategories;

  final Query$GetRestaurant$restaurant$users? users;

  final Query$GetRestaurant$restaurant$meals? meals;

  final Query$GetRestaurant$restaurant$mealPlans? mealPlans;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$restaurantCategories = restaurantCategories;
    _resultData['restaurantCategories'] = l$restaurantCategories?.toJson();
    final l$users = users;
    _resultData['users'] = l$users?.toJson();
    final l$meals = meals;
    _resultData['meals'] = l$meals?.toJson();
    final l$mealPlans = mealPlans;
    _resultData['mealPlans'] = l$mealPlans?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$imageUrl = imageUrl;
    final l$restaurantCategories = restaurantCategories;
    final l$users = users;
    final l$meals = meals;
    final l$mealPlans = mealPlans;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$imageUrl,
      l$restaurantCategories,
      l$users,
      l$meals,
      l$mealPlans,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurant$restaurant ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
      return false;
    }
    final l$restaurantCategories = restaurantCategories;
    final lOther$restaurantCategories = other.restaurantCategories;
    if (l$restaurantCategories != lOther$restaurantCategories) {
      return false;
    }
    final l$users = users;
    final lOther$users = other.users;
    if (l$users != lOther$users) {
      return false;
    }
    final l$meals = meals;
    final lOther$meals = other.meals;
    if (l$meals != lOther$meals) {
      return false;
    }
    final l$mealPlans = mealPlans;
    final lOther$mealPlans = other.mealPlans;
    if (l$mealPlans != lOther$mealPlans) {
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

extension UtilityExtension$Query$GetRestaurant$restaurant
    on Query$GetRestaurant$restaurant {
  CopyWith$Query$GetRestaurant$restaurant<Query$GetRestaurant$restaurant>
  get copyWith => CopyWith$Query$GetRestaurant$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant(
    Query$GetRestaurant$restaurant instance,
    TRes Function(Query$GetRestaurant$restaurant) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant;

  factory CopyWith$Query$GetRestaurant$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant$restaurant;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    Query$GetRestaurant$restaurant$restaurantCategories? restaurantCategories,
    Query$GetRestaurant$restaurant$users? users,
    Query$GetRestaurant$restaurant$meals? meals,
    Query$GetRestaurant$restaurant$mealPlans? mealPlans,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<TRes>
  get restaurantCategories;
  CopyWith$Query$GetRestaurant$restaurant$users<TRes> get users;
  CopyWith$Query$GetRestaurant$restaurant$meals<TRes> get meals;
  CopyWith$Query$GetRestaurant$restaurant$mealPlans<TRes> get mealPlans;
}

class _CopyWithImpl$Query$GetRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant(this._instance, this._then);

  final Query$GetRestaurant$restaurant _instance;

  final TRes Function(Query$GetRestaurant$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? imageUrl = _undefined,
    Object? restaurantCategories = _undefined,
    Object? users = _undefined,
    Object? meals = _undefined,
    Object? mealPlans = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      restaurantCategories: restaurantCategories == _undefined
          ? _instance.restaurantCategories
          : (restaurantCategories
                as Query$GetRestaurant$restaurant$restaurantCategories?),
      users: users == _undefined
          ? _instance.users
          : (users as Query$GetRestaurant$restaurant$users?),
      meals: meals == _undefined
          ? _instance.meals
          : (meals as Query$GetRestaurant$restaurant$meals?),
      mealPlans: mealPlans == _undefined
          ? _instance.mealPlans
          : (mealPlans as Query$GetRestaurant$restaurant$mealPlans?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<TRes>
  get restaurantCategories {
    final local$restaurantCategories = _instance.restaurantCategories;
    return local$restaurantCategories == null
        ? CopyWith$Query$GetRestaurant$restaurant$restaurantCategories.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurant$restaurant$restaurantCategories(
            local$restaurantCategories,
            (e) => call(restaurantCategories: e),
          );
  }

  CopyWith$Query$GetRestaurant$restaurant$users<TRes> get users {
    final local$users = _instance.users;
    return local$users == null
        ? CopyWith$Query$GetRestaurant$restaurant$users.stub(_then(_instance))
        : CopyWith$Query$GetRestaurant$restaurant$users(
            local$users,
            (e) => call(users: e),
          );
  }

  CopyWith$Query$GetRestaurant$restaurant$meals<TRes> get meals {
    final local$meals = _instance.meals;
    return local$meals == null
        ? CopyWith$Query$GetRestaurant$restaurant$meals.stub(_then(_instance))
        : CopyWith$Query$GetRestaurant$restaurant$meals(
            local$meals,
            (e) => call(meals: e),
          );
  }

  CopyWith$Query$GetRestaurant$restaurant$mealPlans<TRes> get mealPlans {
    final local$mealPlans = _instance.mealPlans;
    return local$mealPlans == null
        ? CopyWith$Query$GetRestaurant$restaurant$mealPlans.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurant$restaurant$mealPlans(
            local$mealPlans,
            (e) => call(mealPlans: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    Query$GetRestaurant$restaurant$restaurantCategories? restaurantCategories,
    Query$GetRestaurant$restaurant$users? users,
    Query$GetRestaurant$restaurant$meals? meals,
    Query$GetRestaurant$restaurant$mealPlans? mealPlans,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<TRes>
  get restaurantCategories =>
      CopyWith$Query$GetRestaurant$restaurant$restaurantCategories.stub(_res);

  CopyWith$Query$GetRestaurant$restaurant$users<TRes> get users =>
      CopyWith$Query$GetRestaurant$restaurant$users.stub(_res);

  CopyWith$Query$GetRestaurant$restaurant$meals<TRes> get meals =>
      CopyWith$Query$GetRestaurant$restaurant$meals.stub(_res);

  CopyWith$Query$GetRestaurant$restaurant$mealPlans<TRes> get mealPlans =>
      CopyWith$Query$GetRestaurant$restaurant$mealPlans.stub(_res);
}

class Query$GetRestaurant$restaurant$restaurantCategories {
  Query$GetRestaurant$restaurant$restaurantCategories({
    this.edges,
    this.$__typename = 'RestaurantCategoryCursorConnection',
  });

  factory Query$GetRestaurant$restaurant$restaurantCategories.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$restaurantCategories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurant$restaurant$restaurantCategories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRestaurant$restaurant$restaurantCategories$edges?>? edges;

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
    if (other is! Query$GetRestaurant$restaurant$restaurantCategories ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$restaurantCategories
    on Query$GetRestaurant$restaurant$restaurantCategories {
  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<
    Query$GetRestaurant$restaurant$restaurantCategories
  >
  get copyWith => CopyWith$Query$GetRestaurant$restaurant$restaurantCategories(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<
  TRes
> {
  factory CopyWith$Query$GetRestaurant$restaurant$restaurantCategories(
    Query$GetRestaurant$restaurant$restaurantCategories instance,
    TRes Function(Query$GetRestaurant$restaurant$restaurantCategories) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories;

  factory CopyWith$Query$GetRestaurant$restaurant$restaurantCategories.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories;

  TRes call({
    List<Query$GetRestaurant$restaurant$restaurantCategories$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$restaurantCategories$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges<
          Query$GetRestaurant$restaurant$restaurantCategories$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories<TRes>
    implements
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$restaurantCategories _instance;

  final TRes Function(Query$GetRestaurant$restaurant$restaurantCategories)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$restaurantCategories(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Query$GetRestaurant$restaurant$restaurantCategories$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$restaurantCategories$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges<
          Query$GetRestaurant$restaurant$restaurantCategories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories<
  TRes
>
    implements
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GetRestaurant$restaurant$restaurantCategories$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetRestaurant$restaurant$restaurantCategories$edges {
  Query$GetRestaurant$restaurant$restaurantCategories$edges({
    this.node,
    this.$__typename = 'RestaurantCategoryEdge',
  });

  factory Query$GetRestaurant$restaurant$restaurantCategories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$restaurantCategories$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurant$restaurant$restaurantCategories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurant$restaurant$restaurantCategories$edges$node? node;

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
    if (other is! Query$GetRestaurant$restaurant$restaurantCategories$edges ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$restaurantCategories$edges
    on Query$GetRestaurant$restaurant$restaurantCategories$edges {
  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges<
    Query$GetRestaurant$restaurant$restaurantCategories$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges<
  TRes
> {
  factory CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges(
    Query$GetRestaurant$restaurant$restaurantCategories$edges instance,
    TRes Function(Query$GetRestaurant$restaurant$restaurantCategories$edges)
    then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges;

  factory CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges;

  TRes call({
    Query$GetRestaurant$restaurant$restaurantCategories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges<
  TRes
>
    implements
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$restaurantCategories$edges _instance;

  final TRes Function(Query$GetRestaurant$restaurant$restaurantCategories$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant$restaurant$restaurantCategories$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Query$GetRestaurant$restaurant$restaurantCategories$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges<
  TRes
>
    implements
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges(
    this._res,
  );

  TRes _res;

  call({
    Query$GetRestaurant$restaurant$restaurantCategories$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<TRes>
  get node =>
      CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node.stub(
        _res,
      );
}

class Query$GetRestaurant$restaurant$restaurantCategories$edges$node {
  Query$GetRestaurant$restaurant$restaurantCategories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'RestaurantCategory',
  });

  factory Query$GetRestaurant$restaurant$restaurantCategories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
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
    if (other
            is! Query$GetRestaurant$restaurant$restaurantCategories$edges$node ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$restaurantCategories$edges$node
    on Query$GetRestaurant$restaurant$restaurantCategories$edges$node {
  CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<
    Query$GetRestaurant$restaurant$restaurantCategories$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<
  TRes
> {
  factory CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
    Query$GetRestaurant$restaurant$restaurantCategories$edges$node instance,
    TRes Function(
      Query$GetRestaurant$restaurant$restaurantCategories$edges$node,
    )
    then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges$node;

  factory CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$restaurantCategories$edges$node
  _instance;

  final TRes Function(
    Query$GetRestaurant$restaurant$restaurantCategories$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
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

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurant$restaurant$restaurantCategories$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$restaurantCategories$edges$node(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetRestaurant$restaurant$users {
  Query$GetRestaurant$restaurant$users({
    this.edges,
    this.$__typename = 'UserCursorConnection',
  });

  factory Query$GetRestaurant$restaurant$users.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$users(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurant$restaurant$users$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRestaurant$restaurant$users$edges?>? edges;

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
    if (other is! Query$GetRestaurant$restaurant$users ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$users
    on Query$GetRestaurant$restaurant$users {
  CopyWith$Query$GetRestaurant$restaurant$users<
    Query$GetRestaurant$restaurant$users
  >
  get copyWith => CopyWith$Query$GetRestaurant$restaurant$users(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$users<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$users(
    Query$GetRestaurant$restaurant$users instance,
    TRes Function(Query$GetRestaurant$restaurant$users) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$users;

  factory CopyWith$Query$GetRestaurant$restaurant$users.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant$restaurant$users;

  TRes call({
    List<Query$GetRestaurant$restaurant$users$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$users$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$users$edges<
          Query$GetRestaurant$restaurant$users$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$users<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$users<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$users(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$users _instance;

  final TRes Function(Query$GetRestaurant$restaurant$users) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$users(
          edges: edges == _undefined
              ? _instance.edges
              : (edges as List<Query$GetRestaurant$restaurant$users$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$users$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$users$edges<
          Query$GetRestaurant$restaurant$users$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurant$restaurant$users$edges(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$users<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$users<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$users(this._res);

  TRes _res;

  call({
    List<Query$GetRestaurant$restaurant$users$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetRestaurant$restaurant$users$edges {
  Query$GetRestaurant$restaurant$users$edges({
    this.node,
    this.$__typename = 'UserEdge',
  });

  factory Query$GetRestaurant$restaurant$users$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$users$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurant$restaurant$users$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurant$restaurant$users$edges$node? node;

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
    if (other is! Query$GetRestaurant$restaurant$users$edges ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$users$edges
    on Query$GetRestaurant$restaurant$users$edges {
  CopyWith$Query$GetRestaurant$restaurant$users$edges<
    Query$GetRestaurant$restaurant$users$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$users$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$users$edges<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$users$edges(
    Query$GetRestaurant$restaurant$users$edges instance,
    TRes Function(Query$GetRestaurant$restaurant$users$edges) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$users$edges;

  factory CopyWith$Query$GetRestaurant$restaurant$users$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant$restaurant$users$edges;

  TRes call({
    Query$GetRestaurant$restaurant$users$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurant$restaurant$users$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$users$edges<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$users$edges<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$users$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$users$edges _instance;

  final TRes Function(Query$GetRestaurant$restaurant$users$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$users$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetRestaurant$restaurant$users$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetRestaurant$restaurant$users$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurant$restaurant$users$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurant$restaurant$users$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$users$edges<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$users$edges<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$users$edges(this._res);

  TRes _res;

  call({
    Query$GetRestaurant$restaurant$users$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurant$restaurant$users$edges$node<TRes> get node =>
      CopyWith$Query$GetRestaurant$restaurant$users$edges$node.stub(_res);
}

class Query$GetRestaurant$restaurant$users$edges$node {
  Query$GetRestaurant$restaurant$users$edges$node({
    required this.id,
    required this.email,
    required this.roles,
    this.$__typename = 'User',
  });

  factory Query$GetRestaurant$restaurant$users$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$roles = json['roles'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$users$edges$node(
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
    if (other is! Query$GetRestaurant$restaurant$users$edges$node ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$users$edges$node
    on Query$GetRestaurant$restaurant$users$edges$node {
  CopyWith$Query$GetRestaurant$restaurant$users$edges$node<
    Query$GetRestaurant$restaurant$users$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$users$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$users$edges$node<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$users$edges$node(
    Query$GetRestaurant$restaurant$users$edges$node instance,
    TRes Function(Query$GetRestaurant$restaurant$users$edges$node) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$users$edges$node;

  factory CopyWith$Query$GetRestaurant$restaurant$users$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$users$edges$node;

  TRes call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$users$edges$node<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$users$edges$node<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$users$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$users$edges$node _instance;

  final TRes Function(Query$GetRestaurant$restaurant$users$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? roles = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant$restaurant$users$edges$node(
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

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$users$edges$node<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$users$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$users$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? $__typename,
  }) => _res;
}

class Query$GetRestaurant$restaurant$meals {
  Query$GetRestaurant$restaurant$meals({
    this.edges,
    this.$__typename = 'MealCursorConnection',
  });

  factory Query$GetRestaurant$restaurant$meals.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$meals(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurant$restaurant$meals$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRestaurant$restaurant$meals$edges?>? edges;

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
    if (other is! Query$GetRestaurant$restaurant$meals ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$meals
    on Query$GetRestaurant$restaurant$meals {
  CopyWith$Query$GetRestaurant$restaurant$meals<
    Query$GetRestaurant$restaurant$meals
  >
  get copyWith => CopyWith$Query$GetRestaurant$restaurant$meals(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$meals<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$meals(
    Query$GetRestaurant$restaurant$meals instance,
    TRes Function(Query$GetRestaurant$restaurant$meals) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$meals;

  factory CopyWith$Query$GetRestaurant$restaurant$meals.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals;

  TRes call({
    List<Query$GetRestaurant$restaurant$meals$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$meals$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$meals$edges<
          Query$GetRestaurant$restaurant$meals$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$meals<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$meals<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$meals(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$meals _instance;

  final TRes Function(Query$GetRestaurant$restaurant$meals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$meals(
          edges: edges == _undefined
              ? _instance.edges
              : (edges as List<Query$GetRestaurant$restaurant$meals$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$meals$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$meals$edges<
          Query$GetRestaurant$restaurant$meals$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurant$restaurant$meals$edges(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$meals<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals(this._res);

  TRes _res;

  call({
    List<Query$GetRestaurant$restaurant$meals$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetRestaurant$restaurant$meals$edges {
  Query$GetRestaurant$restaurant$meals$edges({
    this.node,
    this.$__typename = 'MealEdge',
  });

  factory Query$GetRestaurant$restaurant$meals$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$meals$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurant$restaurant$meals$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurant$restaurant$meals$edges$node? node;

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
    if (other is! Query$GetRestaurant$restaurant$meals$edges ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$meals$edges
    on Query$GetRestaurant$restaurant$meals$edges {
  CopyWith$Query$GetRestaurant$restaurant$meals$edges<
    Query$GetRestaurant$restaurant$meals$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$meals$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$meals$edges<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$meals$edges(
    Query$GetRestaurant$restaurant$meals$edges instance,
    TRes Function(Query$GetRestaurant$restaurant$meals$edges) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$meals$edges;

  factory CopyWith$Query$GetRestaurant$restaurant$meals$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals$edges;

  TRes call({
    Query$GetRestaurant$restaurant$meals$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$meals$edges<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$meals$edges<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$meals$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$meals$edges _instance;

  final TRes Function(Query$GetRestaurant$restaurant$meals$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$meals$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetRestaurant$restaurant$meals$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurant$restaurant$meals$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurant$restaurant$meals$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals$edges<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$meals$edges<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals$edges(this._res);

  TRes _res;

  call({
    Query$GetRestaurant$restaurant$meals$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<TRes> get node =>
      CopyWith$Query$GetRestaurant$restaurant$meals$edges$node.stub(_res);
}

class Query$GetRestaurant$restaurant$meals$edges$node {
  Query$GetRestaurant$restaurant$meals$edges$node({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.$__typename = 'Meal',
  });

  factory Query$GetRestaurant$restaurant$meals$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$imageUrl = json['imageUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$meals$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as int),
      imageUrl: (l$imageUrl as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int price;

  final String? imageUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$imageUrl = imageUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$price, l$imageUrl, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurant$restaurant$meals$edges$node ||
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
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
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

extension UtilityExtension$Query$GetRestaurant$restaurant$meals$edges$node
    on Query$GetRestaurant$restaurant$meals$edges$node {
  CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<
    Query$GetRestaurant$restaurant$meals$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$meals$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$meals$edges$node(
    Query$GetRestaurant$restaurant$meals$edges$node instance,
    TRes Function(Query$GetRestaurant$restaurant$meals$edges$node) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$meals$edges$node;

  factory CopyWith$Query$GetRestaurant$restaurant$meals$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals$edges$node;

  TRes call({
    String? id,
    String? name,
    int? price,
    String? imageUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$meals$edges$node<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$meals$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$meals$edges$node _instance;

  final TRes Function(Query$GetRestaurant$restaurant$meals$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? imageUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant$restaurant$meals$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as int),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals$edges$node<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$meals$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$meals$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    int? price,
    String? imageUrl,
    String? $__typename,
  }) => _res;
}

class Query$GetRestaurant$restaurant$mealPlans {
  Query$GetRestaurant$restaurant$mealPlans({
    this.edges,
    this.$__typename = 'MealPlanCursorConnection',
  });

  factory Query$GetRestaurant$restaurant$mealPlans.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$mealPlans(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurant$restaurant$mealPlans$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRestaurant$restaurant$mealPlans$edges?>? edges;

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
    if (other is! Query$GetRestaurant$restaurant$mealPlans ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$mealPlans
    on Query$GetRestaurant$restaurant$mealPlans {
  CopyWith$Query$GetRestaurant$restaurant$mealPlans<
    Query$GetRestaurant$restaurant$mealPlans
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$mealPlans(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$mealPlans<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$mealPlans(
    Query$GetRestaurant$restaurant$mealPlans instance,
    TRes Function(Query$GetRestaurant$restaurant$mealPlans) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans;

  factory CopyWith$Query$GetRestaurant$restaurant$mealPlans.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans;

  TRes call({
    List<Query$GetRestaurant$restaurant$mealPlans$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$mealPlans$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges<
          Query$GetRestaurant$restaurant$mealPlans$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$mealPlans<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$mealPlans _instance;

  final TRes Function(Query$GetRestaurant$restaurant$mealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$mealPlans(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<Query$GetRestaurant$restaurant$mealPlans$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Query$GetRestaurant$restaurant$mealPlans$edges?>? Function(
      Iterable<
        CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges<
          Query$GetRestaurant$restaurant$mealPlans$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$mealPlans<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans(this._res);

  TRes _res;

  call({
    List<Query$GetRestaurant$restaurant$mealPlans$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Query$GetRestaurant$restaurant$mealPlans$edges {
  Query$GetRestaurant$restaurant$mealPlans$edges({
    this.node,
    this.$__typename = 'MealPlanEdge',
  });

  factory Query$GetRestaurant$restaurant$mealPlans$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$mealPlans$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurant$restaurant$mealPlans$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurant$restaurant$mealPlans$edges$node? node;

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
    if (other is! Query$GetRestaurant$restaurant$mealPlans$edges ||
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

extension UtilityExtension$Query$GetRestaurant$restaurant$mealPlans$edges
    on Query$GetRestaurant$restaurant$mealPlans$edges {
  CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges<
    Query$GetRestaurant$restaurant$mealPlans$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges<TRes> {
  factory CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges(
    Query$GetRestaurant$restaurant$mealPlans$edges instance,
    TRes Function(Query$GetRestaurant$restaurant$mealPlans$edges) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans$edges;

  factory CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans$edges;

  TRes call({
    Query$GetRestaurant$restaurant$mealPlans$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans$edges<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$mealPlans$edges _instance;

  final TRes Function(Query$GetRestaurant$restaurant$mealPlans$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetRestaurant$restaurant$mealPlans$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetRestaurant$restaurant$mealPlans$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans$edges<TRes>
    implements CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans$edges(this._res);

  TRes _res;

  call({
    Query$GetRestaurant$restaurant$mealPlans$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<TRes> get node =>
      CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node.stub(_res);
}

class Query$GetRestaurant$restaurant$mealPlans$edges$node {
  Query$GetRestaurant$restaurant$mealPlans$edges$node({
    required this.id,
    required this.name,
    this.price,
    this.imageUrl,
    this.$__typename = 'MealPlan',
  });

  factory Query$GetRestaurant$restaurant$mealPlans$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$price = json['price'];
    final l$imageUrl = json['imageUrl'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurant$restaurant$mealPlans$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      price: (l$price as int?),
      imageUrl: (l$imageUrl as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int? price;

  final String? imageUrl;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$price = price;
    final l$imageUrl = imageUrl;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$price, l$imageUrl, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurant$restaurant$mealPlans$edges$node ||
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
    final l$imageUrl = imageUrl;
    final lOther$imageUrl = other.imageUrl;
    if (l$imageUrl != lOther$imageUrl) {
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

extension UtilityExtension$Query$GetRestaurant$restaurant$mealPlans$edges$node
    on Query$GetRestaurant$restaurant$mealPlans$edges$node {
  CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<
    Query$GetRestaurant$restaurant$mealPlans$edges$node
  >
  get copyWith => CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<
  TRes
> {
  factory CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node(
    Query$GetRestaurant$restaurant$mealPlans$edges$node instance,
    TRes Function(Query$GetRestaurant$restaurant$mealPlans$edges$node) then,
  ) = _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans$edges$node;

  factory CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans$edges$node;

  TRes call({
    String? id,
    String? name,
    int? price,
    String? imageUrl,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans$edges$node<TRes>
    implements
        CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<TRes> {
  _CopyWithImpl$Query$GetRestaurant$restaurant$mealPlans$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurant$restaurant$mealPlans$edges$node _instance;

  final TRes Function(Query$GetRestaurant$restaurant$mealPlans$edges$node)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? price = _undefined,
    Object? imageUrl = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurant$restaurant$mealPlans$edges$node(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      price: price == _undefined ? _instance.price : (price as int?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurant$restaurant$mealPlans$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetRestaurant$restaurant$mealPlans$edges$node(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? name,
    int? price,
    String? imageUrl,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$CreateRestaurant {
  factory Variables$Mutation$CreateRestaurant({
    required Input$createRestaurantInput input,
  }) => Variables$Mutation$CreateRestaurant._({r'input': input});

  Variables$Mutation$CreateRestaurant._(this._$data);

  factory Variables$Mutation$CreateRestaurant.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createRestaurantInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createRestaurantInput get input =>
      (_$data['input'] as Input$createRestaurantInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateRestaurant<
    Variables$Mutation$CreateRestaurant
  >
  get copyWith => CopyWith$Variables$Mutation$CreateRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateRestaurant ||
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

abstract class CopyWith$Variables$Mutation$CreateRestaurant<TRes> {
  factory CopyWith$Variables$Mutation$CreateRestaurant(
    Variables$Mutation$CreateRestaurant instance,
    TRes Function(Variables$Mutation$CreateRestaurant) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateRestaurant;

  factory CopyWith$Variables$Mutation$CreateRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateRestaurant;

  TRes call({Input$createRestaurantInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateRestaurant<TRes>
    implements CopyWith$Variables$Mutation$CreateRestaurant<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateRestaurant(this._instance, this._then);

  final Variables$Mutation$CreateRestaurant _instance;

  final TRes Function(Variables$Mutation$CreateRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateRestaurant._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createRestaurantInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateRestaurant<TRes>
    implements CopyWith$Variables$Mutation$CreateRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateRestaurant(this._res);

  TRes _res;

  call({Input$createRestaurantInput? input}) => _res;
}

class Mutation$CreateRestaurant {
  Mutation$CreateRestaurant({
    this.createRestaurant,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateRestaurant.fromJson(Map<String, dynamic> json) {
    final l$createRestaurant = json['createRestaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateRestaurant(
      createRestaurant: l$createRestaurant == null
          ? null
          : Mutation$CreateRestaurant$createRestaurant.fromJson(
              (l$createRestaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateRestaurant$createRestaurant? createRestaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createRestaurant = createRestaurant;
    _resultData['createRestaurant'] = l$createRestaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createRestaurant = createRestaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createRestaurant, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateRestaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createRestaurant = createRestaurant;
    final lOther$createRestaurant = other.createRestaurant;
    if (l$createRestaurant != lOther$createRestaurant) {
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

extension UtilityExtension$Mutation$CreateRestaurant
    on Mutation$CreateRestaurant {
  CopyWith$Mutation$CreateRestaurant<Mutation$CreateRestaurant> get copyWith =>
      CopyWith$Mutation$CreateRestaurant(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateRestaurant<TRes> {
  factory CopyWith$Mutation$CreateRestaurant(
    Mutation$CreateRestaurant instance,
    TRes Function(Mutation$CreateRestaurant) then,
  ) = _CopyWithImpl$Mutation$CreateRestaurant;

  factory CopyWith$Mutation$CreateRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateRestaurant;

  TRes call({
    Mutation$CreateRestaurant$createRestaurant? createRestaurant,
    String? $__typename,
  });
  CopyWith$Mutation$CreateRestaurant$createRestaurant<TRes>
  get createRestaurant;
}

class _CopyWithImpl$Mutation$CreateRestaurant<TRes>
    implements CopyWith$Mutation$CreateRestaurant<TRes> {
  _CopyWithImpl$Mutation$CreateRestaurant(this._instance, this._then);

  final Mutation$CreateRestaurant _instance;

  final TRes Function(Mutation$CreateRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createRestaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateRestaurant(
      createRestaurant: createRestaurant == _undefined
          ? _instance.createRestaurant
          : (createRestaurant as Mutation$CreateRestaurant$createRestaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateRestaurant$createRestaurant<TRes>
  get createRestaurant {
    final local$createRestaurant = _instance.createRestaurant;
    return local$createRestaurant == null
        ? CopyWith$Mutation$CreateRestaurant$createRestaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateRestaurant$createRestaurant(
            local$createRestaurant,
            (e) => call(createRestaurant: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateRestaurant<TRes>
    implements CopyWith$Mutation$CreateRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$CreateRestaurant(this._res);

  TRes _res;

  call({
    Mutation$CreateRestaurant$createRestaurant? createRestaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateRestaurant$createRestaurant<TRes>
  get createRestaurant =>
      CopyWith$Mutation$CreateRestaurant$createRestaurant.stub(_res);
}

const documentNodeMutationCreateRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createRestaurantInput'),
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
            name: NameNode(value: 'createRestaurant'),
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
Mutation$CreateRestaurant _parserFn$Mutation$CreateRestaurant(
  Map<String, dynamic> data,
) => Mutation$CreateRestaurant.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateRestaurant =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateRestaurant?);

class Options$Mutation$CreateRestaurant
    extends graphql.MutationOptions<Mutation$CreateRestaurant> {
  Options$Mutation$CreateRestaurant({
    String? operationName,
    required Variables$Mutation$CreateRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateRestaurant? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateRestaurant>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$CreateRestaurant(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateRestaurant,
         parserFn: _parserFn$Mutation$CreateRestaurant,
       );

  final OnMutationCompleted$Mutation$CreateRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateRestaurant
    extends graphql.WatchQueryOptions<Mutation$CreateRestaurant> {
  WatchOptions$Mutation$CreateRestaurant({
    String? operationName,
    required Variables$Mutation$CreateRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateRestaurant? typedOptimisticResult,
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
         document: documentNodeMutationCreateRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateRestaurant,
       );
}

extension ClientExtension$Mutation$CreateRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateRestaurant>>
  mutate$CreateRestaurant(Options$Mutation$CreateRestaurant options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateRestaurant>
  watchMutation$CreateRestaurant(
    WatchOptions$Mutation$CreateRestaurant options,
  ) => this.watchMutation(options);
}

class Mutation$CreateRestaurant$HookResult {
  Mutation$CreateRestaurant$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateRestaurant runMutation;

  final graphql.QueryResult<Mutation$CreateRestaurant> result;
}

Mutation$CreateRestaurant$HookResult useMutation$CreateRestaurant([
  WidgetOptions$Mutation$CreateRestaurant? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateRestaurant(),
  );
  return Mutation$CreateRestaurant$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateRestaurant>
useWatchMutation$CreateRestaurant(
  WatchOptions$Mutation$CreateRestaurant options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateRestaurant
    extends graphql.MutationOptions<Mutation$CreateRestaurant> {
  WidgetOptions$Mutation$CreateRestaurant({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateRestaurant? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateRestaurant>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$CreateRestaurant(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateRestaurant,
         parserFn: _parserFn$Mutation$CreateRestaurant,
       );

  final OnMutationCompleted$Mutation$CreateRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateRestaurant =
    graphql.MultiSourceResult<Mutation$CreateRestaurant> Function(
      Variables$Mutation$CreateRestaurant, {
      Object? optimisticResult,
      Mutation$CreateRestaurant? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateRestaurant =
    widgets.Widget Function(
      RunMutation$Mutation$CreateRestaurant,
      graphql.QueryResult<Mutation$CreateRestaurant>?,
    );

class Mutation$CreateRestaurant$Widget
    extends graphql_flutter.Mutation<Mutation$CreateRestaurant> {
  Mutation$CreateRestaurant$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateRestaurant? options,
    required Builder$Mutation$CreateRestaurant builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateRestaurant(),
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

class Mutation$CreateRestaurant$createRestaurant {
  Mutation$CreateRestaurant$createRestaurant({
    this.restaurant,
    this.$__typename = 'createRestaurantPayload',
  });

  factory Mutation$CreateRestaurant$createRestaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateRestaurant$createRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Mutation$CreateRestaurant$createRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateRestaurant$createRestaurant$restaurant? restaurant;

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
    if (other is! Mutation$CreateRestaurant$createRestaurant ||
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

extension UtilityExtension$Mutation$CreateRestaurant$createRestaurant
    on Mutation$CreateRestaurant$createRestaurant {
  CopyWith$Mutation$CreateRestaurant$createRestaurant<
    Mutation$CreateRestaurant$createRestaurant
  >
  get copyWith =>
      CopyWith$Mutation$CreateRestaurant$createRestaurant(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateRestaurant$createRestaurant<TRes> {
  factory CopyWith$Mutation$CreateRestaurant$createRestaurant(
    Mutation$CreateRestaurant$createRestaurant instance,
    TRes Function(Mutation$CreateRestaurant$createRestaurant) then,
  ) = _CopyWithImpl$Mutation$CreateRestaurant$createRestaurant;

  factory CopyWith$Mutation$CreateRestaurant$createRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateRestaurant$createRestaurant;

  TRes call({
    Mutation$CreateRestaurant$createRestaurant$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<TRes>
  get restaurant;
}

class _CopyWithImpl$Mutation$CreateRestaurant$createRestaurant<TRes>
    implements CopyWith$Mutation$CreateRestaurant$createRestaurant<TRes> {
  _CopyWithImpl$Mutation$CreateRestaurant$createRestaurant(
    this._instance,
    this._then,
  );

  final Mutation$CreateRestaurant$createRestaurant _instance;

  final TRes Function(Mutation$CreateRestaurant$createRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateRestaurant$createRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant
                as Mutation$CreateRestaurant$createRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<TRes>
  get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateRestaurant$createRestaurant<TRes>
    implements CopyWith$Mutation$CreateRestaurant$createRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$CreateRestaurant$createRestaurant(this._res);

  TRes _res;

  call({
    Mutation$CreateRestaurant$createRestaurant$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<TRes>
  get restaurant =>
      CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant.stub(_res);
}

class Mutation$CreateRestaurant$createRestaurant$restaurant {
  Mutation$CreateRestaurant$createRestaurant$restaurant({
    required this.id,
    required this.name,
    this.$__typename = 'Restaurant',
  });

  factory Mutation$CreateRestaurant$createRestaurant$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateRestaurant$createRestaurant$restaurant(
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
    if (other is! Mutation$CreateRestaurant$createRestaurant$restaurant ||
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

extension UtilityExtension$Mutation$CreateRestaurant$createRestaurant$restaurant
    on Mutation$CreateRestaurant$createRestaurant$restaurant {
  CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<
    Mutation$CreateRestaurant$createRestaurant$restaurant
  >
  get copyWith =>
      CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<
  TRes
> {
  factory CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant(
    Mutation$CreateRestaurant$createRestaurant$restaurant instance,
    TRes Function(Mutation$CreateRestaurant$createRestaurant$restaurant) then,
  ) = _CopyWithImpl$Mutation$CreateRestaurant$createRestaurant$restaurant;

  factory CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateRestaurant$createRestaurant$restaurant;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateRestaurant$createRestaurant$restaurant<TRes>
    implements
        CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<TRes> {
  _CopyWithImpl$Mutation$CreateRestaurant$createRestaurant$restaurant(
    this._instance,
    this._then,
  );

  final Mutation$CreateRestaurant$createRestaurant$restaurant _instance;

  final TRes Function(Mutation$CreateRestaurant$createRestaurant$restaurant)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateRestaurant$createRestaurant$restaurant(
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

class _CopyWithStubImpl$Mutation$CreateRestaurant$createRestaurant$restaurant<
  TRes
>
    implements
        CopyWith$Mutation$CreateRestaurant$createRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Mutation$CreateRestaurant$createRestaurant$restaurant(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$UpdateRestaurant {
  factory Variables$Mutation$UpdateRestaurant({
    required Input$updateRestaurantInput input,
  }) => Variables$Mutation$UpdateRestaurant._({r'input': input});

  Variables$Mutation$UpdateRestaurant._(this._$data);

  factory Variables$Mutation$UpdateRestaurant.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateRestaurantInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateRestaurantInput get input =>
      (_$data['input'] as Input$updateRestaurantInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateRestaurant<
    Variables$Mutation$UpdateRestaurant
  >
  get copyWith => CopyWith$Variables$Mutation$UpdateRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateRestaurant ||
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

abstract class CopyWith$Variables$Mutation$UpdateRestaurant<TRes> {
  factory CopyWith$Variables$Mutation$UpdateRestaurant(
    Variables$Mutation$UpdateRestaurant instance,
    TRes Function(Variables$Mutation$UpdateRestaurant) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateRestaurant;

  factory CopyWith$Variables$Mutation$UpdateRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateRestaurant;

  TRes call({Input$updateRestaurantInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateRestaurant<TRes>
    implements CopyWith$Variables$Mutation$UpdateRestaurant<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateRestaurant(this._instance, this._then);

  final Variables$Mutation$UpdateRestaurant _instance;

  final TRes Function(Variables$Mutation$UpdateRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateRestaurant._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateRestaurantInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateRestaurant<TRes>
    implements CopyWith$Variables$Mutation$UpdateRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateRestaurant(this._res);

  TRes _res;

  call({Input$updateRestaurantInput? input}) => _res;
}

class Mutation$UpdateRestaurant {
  Mutation$UpdateRestaurant({
    this.updateRestaurant,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateRestaurant.fromJson(Map<String, dynamic> json) {
    final l$updateRestaurant = json['updateRestaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRestaurant(
      updateRestaurant: l$updateRestaurant == null
          ? null
          : Mutation$UpdateRestaurant$updateRestaurant.fromJson(
              (l$updateRestaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRestaurant$updateRestaurant? updateRestaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRestaurant = updateRestaurant;
    _resultData['updateRestaurant'] = l$updateRestaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRestaurant = updateRestaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRestaurant, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateRestaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRestaurant = updateRestaurant;
    final lOther$updateRestaurant = other.updateRestaurant;
    if (l$updateRestaurant != lOther$updateRestaurant) {
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

extension UtilityExtension$Mutation$UpdateRestaurant
    on Mutation$UpdateRestaurant {
  CopyWith$Mutation$UpdateRestaurant<Mutation$UpdateRestaurant> get copyWith =>
      CopyWith$Mutation$UpdateRestaurant(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateRestaurant<TRes> {
  factory CopyWith$Mutation$UpdateRestaurant(
    Mutation$UpdateRestaurant instance,
    TRes Function(Mutation$UpdateRestaurant) then,
  ) = _CopyWithImpl$Mutation$UpdateRestaurant;

  factory CopyWith$Mutation$UpdateRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRestaurant;

  TRes call({
    Mutation$UpdateRestaurant$updateRestaurant? updateRestaurant,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateRestaurant$updateRestaurant<TRes>
  get updateRestaurant;
}

class _CopyWithImpl$Mutation$UpdateRestaurant<TRes>
    implements CopyWith$Mutation$UpdateRestaurant<TRes> {
  _CopyWithImpl$Mutation$UpdateRestaurant(this._instance, this._then);

  final Mutation$UpdateRestaurant _instance;

  final TRes Function(Mutation$UpdateRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateRestaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRestaurant(
      updateRestaurant: updateRestaurant == _undefined
          ? _instance.updateRestaurant
          : (updateRestaurant as Mutation$UpdateRestaurant$updateRestaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateRestaurant$updateRestaurant<TRes>
  get updateRestaurant {
    final local$updateRestaurant = _instance.updateRestaurant;
    return local$updateRestaurant == null
        ? CopyWith$Mutation$UpdateRestaurant$updateRestaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateRestaurant$updateRestaurant(
            local$updateRestaurant,
            (e) => call(updateRestaurant: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateRestaurant<TRes>
    implements CopyWith$Mutation$UpdateRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRestaurant(this._res);

  TRes _res;

  call({
    Mutation$UpdateRestaurant$updateRestaurant? updateRestaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateRestaurant$updateRestaurant<TRes>
  get updateRestaurant =>
      CopyWith$Mutation$UpdateRestaurant$updateRestaurant.stub(_res);
}

const documentNodeMutationUpdateRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateRestaurantInput'),
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
            name: NameNode(value: 'updateRestaurant'),
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
                        name: NameNode(value: 'description'),
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
Mutation$UpdateRestaurant _parserFn$Mutation$UpdateRestaurant(
  Map<String, dynamic> data,
) => Mutation$UpdateRestaurant.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateRestaurant =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateRestaurant?);

class Options$Mutation$UpdateRestaurant
    extends graphql.MutationOptions<Mutation$UpdateRestaurant> {
  Options$Mutation$UpdateRestaurant({
    String? operationName,
    required Variables$Mutation$UpdateRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRestaurant? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRestaurant>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$UpdateRestaurant(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateRestaurant,
         parserFn: _parserFn$Mutation$UpdateRestaurant,
       );

  final OnMutationCompleted$Mutation$UpdateRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateRestaurant
    extends graphql.WatchQueryOptions<Mutation$UpdateRestaurant> {
  WatchOptions$Mutation$UpdateRestaurant({
    String? operationName,
    required Variables$Mutation$UpdateRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRestaurant? typedOptimisticResult,
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
         document: documentNodeMutationUpdateRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateRestaurant,
       );
}

extension ClientExtension$Mutation$UpdateRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateRestaurant>>
  mutate$UpdateRestaurant(Options$Mutation$UpdateRestaurant options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateRestaurant>
  watchMutation$UpdateRestaurant(
    WatchOptions$Mutation$UpdateRestaurant options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateRestaurant$HookResult {
  Mutation$UpdateRestaurant$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateRestaurant runMutation;

  final graphql.QueryResult<Mutation$UpdateRestaurant> result;
}

Mutation$UpdateRestaurant$HookResult useMutation$UpdateRestaurant([
  WidgetOptions$Mutation$UpdateRestaurant? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateRestaurant(),
  );
  return Mutation$UpdateRestaurant$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateRestaurant>
useWatchMutation$UpdateRestaurant(
  WatchOptions$Mutation$UpdateRestaurant options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateRestaurant
    extends graphql.MutationOptions<Mutation$UpdateRestaurant> {
  WidgetOptions$Mutation$UpdateRestaurant({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRestaurant? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRestaurant>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$UpdateRestaurant(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateRestaurant,
         parserFn: _parserFn$Mutation$UpdateRestaurant,
       );

  final OnMutationCompleted$Mutation$UpdateRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateRestaurant =
    graphql.MultiSourceResult<Mutation$UpdateRestaurant> Function(
      Variables$Mutation$UpdateRestaurant, {
      Object? optimisticResult,
      Mutation$UpdateRestaurant? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateRestaurant =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateRestaurant,
      graphql.QueryResult<Mutation$UpdateRestaurant>?,
    );

class Mutation$UpdateRestaurant$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateRestaurant> {
  Mutation$UpdateRestaurant$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateRestaurant? options,
    required Builder$Mutation$UpdateRestaurant builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateRestaurant(),
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

class Mutation$UpdateRestaurant$updateRestaurant {
  Mutation$UpdateRestaurant$updateRestaurant({
    this.restaurant,
    this.$__typename = 'updateRestaurantPayload',
  });

  factory Mutation$UpdateRestaurant$updateRestaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRestaurant$updateRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Mutation$UpdateRestaurant$updateRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRestaurant$updateRestaurant$restaurant? restaurant;

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
    if (other is! Mutation$UpdateRestaurant$updateRestaurant ||
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

extension UtilityExtension$Mutation$UpdateRestaurant$updateRestaurant
    on Mutation$UpdateRestaurant$updateRestaurant {
  CopyWith$Mutation$UpdateRestaurant$updateRestaurant<
    Mutation$UpdateRestaurant$updateRestaurant
  >
  get copyWith =>
      CopyWith$Mutation$UpdateRestaurant$updateRestaurant(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateRestaurant$updateRestaurant<TRes> {
  factory CopyWith$Mutation$UpdateRestaurant$updateRestaurant(
    Mutation$UpdateRestaurant$updateRestaurant instance,
    TRes Function(Mutation$UpdateRestaurant$updateRestaurant) then,
  ) = _CopyWithImpl$Mutation$UpdateRestaurant$updateRestaurant;

  factory CopyWith$Mutation$UpdateRestaurant$updateRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRestaurant$updateRestaurant;

  TRes call({
    Mutation$UpdateRestaurant$updateRestaurant$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<TRes>
  get restaurant;
}

class _CopyWithImpl$Mutation$UpdateRestaurant$updateRestaurant<TRes>
    implements CopyWith$Mutation$UpdateRestaurant$updateRestaurant<TRes> {
  _CopyWithImpl$Mutation$UpdateRestaurant$updateRestaurant(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRestaurant$updateRestaurant _instance;

  final TRes Function(Mutation$UpdateRestaurant$updateRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRestaurant$updateRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant
                as Mutation$UpdateRestaurant$updateRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<TRes>
  get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateRestaurant$updateRestaurant<TRes>
    implements CopyWith$Mutation$UpdateRestaurant$updateRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRestaurant$updateRestaurant(this._res);

  TRes _res;

  call({
    Mutation$UpdateRestaurant$updateRestaurant$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<TRes>
  get restaurant =>
      CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant.stub(_res);
}

class Mutation$UpdateRestaurant$updateRestaurant$restaurant {
  Mutation$UpdateRestaurant$updateRestaurant$restaurant({
    required this.id,
    required this.name,
    this.description,
    this.$__typename = 'Restaurant',
  });

  factory Mutation$UpdateRestaurant$updateRestaurant$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRestaurant$updateRestaurant$restaurant(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$description, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateRestaurant$updateRestaurant$restaurant ||
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
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
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

extension UtilityExtension$Mutation$UpdateRestaurant$updateRestaurant$restaurant
    on Mutation$UpdateRestaurant$updateRestaurant$restaurant {
  CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<
    Mutation$UpdateRestaurant$updateRestaurant$restaurant
  >
  get copyWith =>
      CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<
  TRes
> {
  factory CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant(
    Mutation$UpdateRestaurant$updateRestaurant$restaurant instance,
    TRes Function(Mutation$UpdateRestaurant$updateRestaurant$restaurant) then,
  ) = _CopyWithImpl$Mutation$UpdateRestaurant$updateRestaurant$restaurant;

  factory CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateRestaurant$updateRestaurant$restaurant;

  TRes call({
    String? id,
    String? name,
    String? description,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateRestaurant$updateRestaurant$restaurant<TRes>
    implements
        CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<TRes> {
  _CopyWithImpl$Mutation$UpdateRestaurant$updateRestaurant$restaurant(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRestaurant$updateRestaurant$restaurant _instance;

  final TRes Function(Mutation$UpdateRestaurant$updateRestaurant$restaurant)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRestaurant$updateRestaurant$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$UpdateRestaurant$updateRestaurant$restaurant<
  TRes
>
    implements
        CopyWith$Mutation$UpdateRestaurant$updateRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRestaurant$updateRestaurant$restaurant(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? description, String? $__typename}) =>
      _res;
}

class Variables$Mutation$DeleteRestaurant {
  factory Variables$Mutation$DeleteRestaurant({
    required Input$deleteRestaurantInput input,
  }) => Variables$Mutation$DeleteRestaurant._({r'input': input});

  Variables$Mutation$DeleteRestaurant._(this._$data);

  factory Variables$Mutation$DeleteRestaurant.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteRestaurantInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteRestaurantInput get input =>
      (_$data['input'] as Input$deleteRestaurantInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteRestaurant<
    Variables$Mutation$DeleteRestaurant
  >
  get copyWith => CopyWith$Variables$Mutation$DeleteRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteRestaurant ||
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

abstract class CopyWith$Variables$Mutation$DeleteRestaurant<TRes> {
  factory CopyWith$Variables$Mutation$DeleteRestaurant(
    Variables$Mutation$DeleteRestaurant instance,
    TRes Function(Variables$Mutation$DeleteRestaurant) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteRestaurant;

  factory CopyWith$Variables$Mutation$DeleteRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteRestaurant;

  TRes call({Input$deleteRestaurantInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteRestaurant<TRes>
    implements CopyWith$Variables$Mutation$DeleteRestaurant<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteRestaurant(this._instance, this._then);

  final Variables$Mutation$DeleteRestaurant _instance;

  final TRes Function(Variables$Mutation$DeleteRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteRestaurant._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteRestaurantInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteRestaurant<TRes>
    implements CopyWith$Variables$Mutation$DeleteRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteRestaurant(this._res);

  TRes _res;

  call({Input$deleteRestaurantInput? input}) => _res;
}

class Mutation$DeleteRestaurant {
  Mutation$DeleteRestaurant({
    this.deleteRestaurant,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteRestaurant.fromJson(Map<String, dynamic> json) {
    final l$deleteRestaurant = json['deleteRestaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteRestaurant(
      deleteRestaurant: l$deleteRestaurant == null
          ? null
          : Mutation$DeleteRestaurant$deleteRestaurant.fromJson(
              (l$deleteRestaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteRestaurant$deleteRestaurant? deleteRestaurant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteRestaurant = deleteRestaurant;
    _resultData['deleteRestaurant'] = l$deleteRestaurant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteRestaurant = deleteRestaurant;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteRestaurant, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteRestaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteRestaurant = deleteRestaurant;
    final lOther$deleteRestaurant = other.deleteRestaurant;
    if (l$deleteRestaurant != lOther$deleteRestaurant) {
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

extension UtilityExtension$Mutation$DeleteRestaurant
    on Mutation$DeleteRestaurant {
  CopyWith$Mutation$DeleteRestaurant<Mutation$DeleteRestaurant> get copyWith =>
      CopyWith$Mutation$DeleteRestaurant(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteRestaurant<TRes> {
  factory CopyWith$Mutation$DeleteRestaurant(
    Mutation$DeleteRestaurant instance,
    TRes Function(Mutation$DeleteRestaurant) then,
  ) = _CopyWithImpl$Mutation$DeleteRestaurant;

  factory CopyWith$Mutation$DeleteRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteRestaurant;

  TRes call({
    Mutation$DeleteRestaurant$deleteRestaurant? deleteRestaurant,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<TRes>
  get deleteRestaurant;
}

class _CopyWithImpl$Mutation$DeleteRestaurant<TRes>
    implements CopyWith$Mutation$DeleteRestaurant<TRes> {
  _CopyWithImpl$Mutation$DeleteRestaurant(this._instance, this._then);

  final Mutation$DeleteRestaurant _instance;

  final TRes Function(Mutation$DeleteRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteRestaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteRestaurant(
      deleteRestaurant: deleteRestaurant == _undefined
          ? _instance.deleteRestaurant
          : (deleteRestaurant as Mutation$DeleteRestaurant$deleteRestaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<TRes>
  get deleteRestaurant {
    final local$deleteRestaurant = _instance.deleteRestaurant;
    return local$deleteRestaurant == null
        ? CopyWith$Mutation$DeleteRestaurant$deleteRestaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteRestaurant$deleteRestaurant(
            local$deleteRestaurant,
            (e) => call(deleteRestaurant: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteRestaurant<TRes>
    implements CopyWith$Mutation$DeleteRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$DeleteRestaurant(this._res);

  TRes _res;

  call({
    Mutation$DeleteRestaurant$deleteRestaurant? deleteRestaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<TRes>
  get deleteRestaurant =>
      CopyWith$Mutation$DeleteRestaurant$deleteRestaurant.stub(_res);
}

const documentNodeMutationDeleteRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteRestaurantInput'),
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
            name: NameNode(value: 'deleteRestaurant'),
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
Mutation$DeleteRestaurant _parserFn$Mutation$DeleteRestaurant(
  Map<String, dynamic> data,
) => Mutation$DeleteRestaurant.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteRestaurant =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteRestaurant?);

class Options$Mutation$DeleteRestaurant
    extends graphql.MutationOptions<Mutation$DeleteRestaurant> {
  Options$Mutation$DeleteRestaurant({
    String? operationName,
    required Variables$Mutation$DeleteRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteRestaurant? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteRestaurant>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$DeleteRestaurant(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteRestaurant,
         parserFn: _parserFn$Mutation$DeleteRestaurant,
       );

  final OnMutationCompleted$Mutation$DeleteRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteRestaurant
    extends graphql.WatchQueryOptions<Mutation$DeleteRestaurant> {
  WatchOptions$Mutation$DeleteRestaurant({
    String? operationName,
    required Variables$Mutation$DeleteRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteRestaurant? typedOptimisticResult,
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
         document: documentNodeMutationDeleteRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteRestaurant,
       );
}

extension ClientExtension$Mutation$DeleteRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteRestaurant>>
  mutate$DeleteRestaurant(Options$Mutation$DeleteRestaurant options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteRestaurant>
  watchMutation$DeleteRestaurant(
    WatchOptions$Mutation$DeleteRestaurant options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteRestaurant$HookResult {
  Mutation$DeleteRestaurant$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteRestaurant runMutation;

  final graphql.QueryResult<Mutation$DeleteRestaurant> result;
}

Mutation$DeleteRestaurant$HookResult useMutation$DeleteRestaurant([
  WidgetOptions$Mutation$DeleteRestaurant? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteRestaurant(),
  );
  return Mutation$DeleteRestaurant$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteRestaurant>
useWatchMutation$DeleteRestaurant(
  WatchOptions$Mutation$DeleteRestaurant options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteRestaurant
    extends graphql.MutationOptions<Mutation$DeleteRestaurant> {
  WidgetOptions$Mutation$DeleteRestaurant({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteRestaurant? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteRestaurant? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteRestaurant>? update,
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
                 data == null
                     ? null
                     : _parserFn$Mutation$DeleteRestaurant(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteRestaurant,
         parserFn: _parserFn$Mutation$DeleteRestaurant,
       );

  final OnMutationCompleted$Mutation$DeleteRestaurant? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteRestaurant =
    graphql.MultiSourceResult<Mutation$DeleteRestaurant> Function(
      Variables$Mutation$DeleteRestaurant, {
      Object? optimisticResult,
      Mutation$DeleteRestaurant? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteRestaurant =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteRestaurant,
      graphql.QueryResult<Mutation$DeleteRestaurant>?,
    );

class Mutation$DeleteRestaurant$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteRestaurant> {
  Mutation$DeleteRestaurant$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteRestaurant? options,
    required Builder$Mutation$DeleteRestaurant builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteRestaurant(),
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

class Mutation$DeleteRestaurant$deleteRestaurant {
  Mutation$DeleteRestaurant$deleteRestaurant({
    this.restaurant,
    this.$__typename = 'deleteRestaurantPayload',
  });

  factory Mutation$DeleteRestaurant$deleteRestaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteRestaurant$deleteRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Mutation$DeleteRestaurant$deleteRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteRestaurant$deleteRestaurant$restaurant? restaurant;

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
    if (other is! Mutation$DeleteRestaurant$deleteRestaurant ||
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

extension UtilityExtension$Mutation$DeleteRestaurant$deleteRestaurant
    on Mutation$DeleteRestaurant$deleteRestaurant {
  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<
    Mutation$DeleteRestaurant$deleteRestaurant
  >
  get copyWith =>
      CopyWith$Mutation$DeleteRestaurant$deleteRestaurant(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<TRes> {
  factory CopyWith$Mutation$DeleteRestaurant$deleteRestaurant(
    Mutation$DeleteRestaurant$deleteRestaurant instance,
    TRes Function(Mutation$DeleteRestaurant$deleteRestaurant) then,
  ) = _CopyWithImpl$Mutation$DeleteRestaurant$deleteRestaurant;

  factory CopyWith$Mutation$DeleteRestaurant$deleteRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteRestaurant$deleteRestaurant;

  TRes call({
    Mutation$DeleteRestaurant$deleteRestaurant$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<TRes>
  get restaurant;
}

class _CopyWithImpl$Mutation$DeleteRestaurant$deleteRestaurant<TRes>
    implements CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<TRes> {
  _CopyWithImpl$Mutation$DeleteRestaurant$deleteRestaurant(
    this._instance,
    this._then,
  );

  final Mutation$DeleteRestaurant$deleteRestaurant _instance;

  final TRes Function(Mutation$DeleteRestaurant$deleteRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteRestaurant$deleteRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant
                as Mutation$DeleteRestaurant$deleteRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<TRes>
  get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteRestaurant$deleteRestaurant<TRes>
    implements CopyWith$Mutation$DeleteRestaurant$deleteRestaurant<TRes> {
  _CopyWithStubImpl$Mutation$DeleteRestaurant$deleteRestaurant(this._res);

  TRes _res;

  call({
    Mutation$DeleteRestaurant$deleteRestaurant$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<TRes>
  get restaurant =>
      CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant.stub(_res);
}

class Mutation$DeleteRestaurant$deleteRestaurant$restaurant {
  Mutation$DeleteRestaurant$deleteRestaurant$restaurant({
    required this.id,
    this.$__typename = 'Restaurant',
  });

  factory Mutation$DeleteRestaurant$deleteRestaurant$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
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
    if (other is! Mutation$DeleteRestaurant$deleteRestaurant$restaurant ||
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

extension UtilityExtension$Mutation$DeleteRestaurant$deleteRestaurant$restaurant
    on Mutation$DeleteRestaurant$deleteRestaurant$restaurant {
  CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<
    Mutation$DeleteRestaurant$deleteRestaurant$restaurant
  >
  get copyWith =>
      CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<
  TRes
> {
  factory CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
    Mutation$DeleteRestaurant$deleteRestaurant$restaurant instance,
    TRes Function(Mutation$DeleteRestaurant$deleteRestaurant$restaurant) then,
  ) = _CopyWithImpl$Mutation$DeleteRestaurant$deleteRestaurant$restaurant;

  factory CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteRestaurant$deleteRestaurant$restaurant;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<TRes>
    implements
        CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<TRes> {
  _CopyWithImpl$Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
    this._instance,
    this._then,
  );

  final Mutation$DeleteRestaurant$deleteRestaurant$restaurant _instance;

  final TRes Function(Mutation$DeleteRestaurant$deleteRestaurant$restaurant)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<
  TRes
>
    implements
        CopyWith$Mutation$DeleteRestaurant$deleteRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Mutation$DeleteRestaurant$deleteRestaurant$restaurant(
    this._res,
  );

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
