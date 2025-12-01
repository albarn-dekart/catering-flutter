import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetRestaurantCategories {
  factory Variables$Query$GetRestaurantCategories({
    int? first,
    String? after,
  }) => Variables$Query$GetRestaurantCategories._({
    if (first != null) r'first': first,
    if (after != null) r'after': after,
  });

  Variables$Query$GetRestaurantCategories._(this._$data);

  factory Variables$Query$GetRestaurantCategories.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$GetRestaurantCategories._(result$data);
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

  CopyWith$Variables$Query$GetRestaurantCategories<
    Variables$Query$GetRestaurantCategories
  >
  get copyWith =>
      CopyWith$Variables$Query$GetRestaurantCategories(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetRestaurantCategories ||
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

abstract class CopyWith$Variables$Query$GetRestaurantCategories<TRes> {
  factory CopyWith$Variables$Query$GetRestaurantCategories(
    Variables$Query$GetRestaurantCategories instance,
    TRes Function(Variables$Query$GetRestaurantCategories) then,
  ) = _CopyWithImpl$Variables$Query$GetRestaurantCategories;

  factory CopyWith$Variables$Query$GetRestaurantCategories.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRestaurantCategories;

  TRes call({int? first, String? after});
}

class _CopyWithImpl$Variables$Query$GetRestaurantCategories<TRes>
    implements CopyWith$Variables$Query$GetRestaurantCategories<TRes> {
  _CopyWithImpl$Variables$Query$GetRestaurantCategories(
    this._instance,
    this._then,
  );

  final Variables$Query$GetRestaurantCategories _instance;

  final TRes Function(Variables$Query$GetRestaurantCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? first = _undefined, Object? after = _undefined}) => _then(
    Variables$Query$GetRestaurantCategories._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetRestaurantCategories<TRes>
    implements CopyWith$Variables$Query$GetRestaurantCategories<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRestaurantCategories(this._res);

  TRes _res;

  call({int? first, String? after}) => _res;
}

class Query$GetRestaurantCategories {
  Query$GetRestaurantCategories({
    this.restaurantCategories,
    this.$__typename = 'Query',
  });

  factory Query$GetRestaurantCategories.fromJson(Map<String, dynamic> json) {
    final l$restaurantCategories = json['restaurantCategories'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategories(
      restaurantCategories: l$restaurantCategories == null
          ? null
          : Query$GetRestaurantCategories$restaurantCategories.fromJson(
              (l$restaurantCategories as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurantCategories$restaurantCategories?
  restaurantCategories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurantCategories = restaurantCategories;
    _resultData['restaurantCategories'] = l$restaurantCategories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurantCategories = restaurantCategories;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurantCategories, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurantCategories ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetRestaurantCategories
    on Query$GetRestaurantCategories {
  CopyWith$Query$GetRestaurantCategories<Query$GetRestaurantCategories>
  get copyWith => CopyWith$Query$GetRestaurantCategories(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurantCategories<TRes> {
  factory CopyWith$Query$GetRestaurantCategories(
    Query$GetRestaurantCategories instance,
    TRes Function(Query$GetRestaurantCategories) then,
  ) = _CopyWithImpl$Query$GetRestaurantCategories;

  factory CopyWith$Query$GetRestaurantCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurantCategories;

  TRes call({
    Query$GetRestaurantCategories$restaurantCategories? restaurantCategories,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurantCategories$restaurantCategories<TRes>
  get restaurantCategories;
}

class _CopyWithImpl$Query$GetRestaurantCategories<TRes>
    implements CopyWith$Query$GetRestaurantCategories<TRes> {
  _CopyWithImpl$Query$GetRestaurantCategories(this._instance, this._then);

  final Query$GetRestaurantCategories _instance;

  final TRes Function(Query$GetRestaurantCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantCategories = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategories(
      restaurantCategories: restaurantCategories == _undefined
          ? _instance.restaurantCategories
          : (restaurantCategories
                as Query$GetRestaurantCategories$restaurantCategories?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurantCategories$restaurantCategories<TRes>
  get restaurantCategories {
    final local$restaurantCategories = _instance.restaurantCategories;
    return local$restaurantCategories == null
        ? CopyWith$Query$GetRestaurantCategories$restaurantCategories.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurantCategories$restaurantCategories(
            local$restaurantCategories,
            (e) => call(restaurantCategories: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurantCategories<TRes>
    implements CopyWith$Query$GetRestaurantCategories<TRes> {
  _CopyWithStubImpl$Query$GetRestaurantCategories(this._res);

  TRes _res;

  call({
    Query$GetRestaurantCategories$restaurantCategories? restaurantCategories,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurantCategories$restaurantCategories<TRes>
  get restaurantCategories =>
      CopyWith$Query$GetRestaurantCategories$restaurantCategories.stub(_res);
}

const documentNodeQueryGetRestaurantCategories = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetRestaurantCategories'),
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
            name: NameNode(value: 'restaurantCategories'),
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
Query$GetRestaurantCategories _parserFn$Query$GetRestaurantCategories(
  Map<String, dynamic> data,
) => Query$GetRestaurantCategories.fromJson(data);
typedef OnQueryComplete$Query$GetRestaurantCategories =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$GetRestaurantCategories?,
    );

class Options$Query$GetRestaurantCategories
    extends graphql.QueryOptions<Query$GetRestaurantCategories> {
  Options$Query$GetRestaurantCategories({
    String? operationName,
    Variables$Query$GetRestaurantCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurantCategories? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRestaurantCategories? onComplete,
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
                 data == null
                     ? null
                     : _parserFn$Query$GetRestaurantCategories(data),
               ),
         onError: onError,
         document: documentNodeQueryGetRestaurantCategories,
         parserFn: _parserFn$Query$GetRestaurantCategories,
       );

  final OnQueryComplete$Query$GetRestaurantCategories? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetRestaurantCategories
    extends graphql.WatchQueryOptions<Query$GetRestaurantCategories> {
  WatchOptions$Query$GetRestaurantCategories({
    String? operationName,
    Variables$Query$GetRestaurantCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurantCategories? typedOptimisticResult,
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
         document: documentNodeQueryGetRestaurantCategories,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetRestaurantCategories,
       );
}

class FetchMoreOptions$Query$GetRestaurantCategories
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRestaurantCategories({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetRestaurantCategories? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetRestaurantCategories,
       );
}

extension ClientExtension$Query$GetRestaurantCategories
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRestaurantCategories>>
  query$GetRestaurantCategories([
    Options$Query$GetRestaurantCategories? options,
  ]) async =>
      await this.query(options ?? Options$Query$GetRestaurantCategories());

  graphql.ObservableQuery<Query$GetRestaurantCategories>
  watchQuery$GetRestaurantCategories([
    WatchOptions$Query$GetRestaurantCategories? options,
  ]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetRestaurantCategories());

  void writeQuery$GetRestaurantCategories({
    required Query$GetRestaurantCategories data,
    Variables$Query$GetRestaurantCategories? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetRestaurantCategories,
      ),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetRestaurantCategories? readQuery$GetRestaurantCategories({
    Variables$Query$GetRestaurantCategories? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetRestaurantCategories,
        ),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetRestaurantCategories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRestaurantCategories>
useQuery$GetRestaurantCategories([
  Options$Query$GetRestaurantCategories? options,
]) => graphql_flutter.useQuery(
  options ?? Options$Query$GetRestaurantCategories(),
);
graphql.ObservableQuery<Query$GetRestaurantCategories>
useWatchQuery$GetRestaurantCategories([
  WatchOptions$Query$GetRestaurantCategories? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetRestaurantCategories(),
);

class Query$GetRestaurantCategories$Widget
    extends graphql_flutter.Query<Query$GetRestaurantCategories> {
  Query$GetRestaurantCategories$Widget({
    widgets.Key? key,
    Options$Query$GetRestaurantCategories? options,
    required graphql_flutter.QueryBuilder<Query$GetRestaurantCategories>
    builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetRestaurantCategories(),
         builder: builder,
       );
}

class Query$GetRestaurantCategories$restaurantCategories {
  Query$GetRestaurantCategories$restaurantCategories({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'RestaurantCategoryCursorConnection',
  });

  factory Query$GetRestaurantCategories$restaurantCategories.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategories$restaurantCategories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetRestaurantCategories$restaurantCategories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo:
          Query$GetRestaurantCategories$restaurantCategories$pageInfo.fromJson(
            (l$pageInfo as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetRestaurantCategories$restaurantCategories$edges?>? edges;

  final Query$GetRestaurantCategories$restaurantCategories$pageInfo pageInfo;

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
    if (other is! Query$GetRestaurantCategories$restaurantCategories ||
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

extension UtilityExtension$Query$GetRestaurantCategories$restaurantCategories
    on Query$GetRestaurantCategories$restaurantCategories {
  CopyWith$Query$GetRestaurantCategories$restaurantCategories<
    Query$GetRestaurantCategories$restaurantCategories
  >
  get copyWith => CopyWith$Query$GetRestaurantCategories$restaurantCategories(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetRestaurantCategories$restaurantCategories<
  TRes
> {
  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories(
    Query$GetRestaurantCategories$restaurantCategories instance,
    TRes Function(Query$GetRestaurantCategories$restaurantCategories) then,
  ) = _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories;

  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories;

  TRes call({
    List<Query$GetRestaurantCategories$restaurantCategories$edges?>? edges,
    Query$GetRestaurantCategories$restaurantCategories$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetRestaurantCategories$restaurantCategories$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges<
          Query$GetRestaurantCategories$restaurantCategories$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<TRes>
  get pageInfo;
}

class _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories<TRes>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories<TRes> {
  _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories(
    this._instance,
    this._then,
  );

  final Query$GetRestaurantCategories$restaurantCategories _instance;

  final TRes Function(Query$GetRestaurantCategories$restaurantCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategories$restaurantCategories(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<
                  Query$GetRestaurantCategories$restaurantCategories$edges?
                >?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo
                as Query$GetRestaurantCategories$restaurantCategories$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetRestaurantCategories$restaurantCategories$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges<
          Query$GetRestaurantCategories$restaurantCategories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<TRes>
  get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories<TRes>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories<TRes> {
  _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GetRestaurantCategories$restaurantCategories$edges?>? edges,
    Query$GetRestaurantCategories$restaurantCategories$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo.stub(
        _res,
      );
}

class Query$GetRestaurantCategories$restaurantCategories$edges {
  Query$GetRestaurantCategories$restaurantCategories$edges({
    this.node,
    this.$__typename = 'RestaurantCategoryEdge',
  });

  factory Query$GetRestaurantCategories$restaurantCategories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategories$restaurantCategories$edges(
      node: l$node == null
          ? null
          : Query$GetRestaurantCategories$restaurantCategories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurantCategories$restaurantCategories$edges$node? node;

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
    if (other is! Query$GetRestaurantCategories$restaurantCategories$edges ||
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

extension UtilityExtension$Query$GetRestaurantCategories$restaurantCategories$edges
    on Query$GetRestaurantCategories$restaurantCategories$edges {
  CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges<
    Query$GetRestaurantCategories$restaurantCategories$edges
  >
  get copyWith =>
      CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges<
  TRes
> {
  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges(
    Query$GetRestaurantCategories$restaurantCategories$edges instance,
    TRes Function(Query$GetRestaurantCategories$restaurantCategories$edges)
    then,
  ) = _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$edges;

  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$edges;

  TRes call({
    Query$GetRestaurantCategories$restaurantCategories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$edges<
  TRes
>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$edges(
    this._instance,
    this._then,
  );

  final Query$GetRestaurantCategories$restaurantCategories$edges _instance;

  final TRes Function(Query$GetRestaurantCategories$restaurantCategories$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategories$restaurantCategories$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Query$GetRestaurantCategories$restaurantCategories$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$edges<
  TRes
>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$edges(
    this._res,
  );

  TRes _res;

  call({
    Query$GetRestaurantCategories$restaurantCategories$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<TRes>
  get node =>
      CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node.stub(
        _res,
      );
}

class Query$GetRestaurantCategories$restaurantCategories$edges$node {
  Query$GetRestaurantCategories$restaurantCategories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'RestaurantCategory',
  });

  factory Query$GetRestaurantCategories$restaurantCategories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategories$restaurantCategories$edges$node(
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
            is! Query$GetRestaurantCategories$restaurantCategories$edges$node ||
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

extension UtilityExtension$Query$GetRestaurantCategories$restaurantCategories$edges$node
    on Query$GetRestaurantCategories$restaurantCategories$edges$node {
  CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<
    Query$GetRestaurantCategories$restaurantCategories$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<
  TRes
> {
  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node(
    Query$GetRestaurantCategories$restaurantCategories$edges$node instance,
    TRes Function(Query$GetRestaurantCategories$restaurantCategories$edges$node)
    then,
  ) = _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$edges$node;

  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetRestaurantCategories$restaurantCategories$edges$node _instance;

  final TRes Function(
    Query$GetRestaurantCategories$restaurantCategories$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategories$restaurantCategories$edges$node(
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

class _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$edges$node<
  TRes
>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$edges$node(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetRestaurantCategories$restaurantCategories$pageInfo {
  Query$GetRestaurantCategories$restaurantCategories$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'RestaurantCategoryPageInfo',
  });

  factory Query$GetRestaurantCategories$restaurantCategories$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategories$restaurantCategories$pageInfo(
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
    if (other is! Query$GetRestaurantCategories$restaurantCategories$pageInfo ||
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

extension UtilityExtension$Query$GetRestaurantCategories$restaurantCategories$pageInfo
    on Query$GetRestaurantCategories$restaurantCategories$pageInfo {
  CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<
    Query$GetRestaurantCategories$restaurantCategories$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<
  TRes
> {
  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo(
    Query$GetRestaurantCategories$restaurantCategories$pageInfo instance,
    TRes Function(Query$GetRestaurantCategories$restaurantCategories$pageInfo)
    then,
  ) = _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$pageInfo;

  factory CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$pageInfo<
  TRes
>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<
          TRes
        > {
  _CopyWithImpl$Query$GetRestaurantCategories$restaurantCategories$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetRestaurantCategories$restaurantCategories$pageInfo _instance;

  final TRes Function(
    Query$GetRestaurantCategories$restaurantCategories$pageInfo,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategories$restaurantCategories$pageInfo(
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

class _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$pageInfo<
  TRes
>
    implements
        CopyWith$Query$GetRestaurantCategories$restaurantCategories$pageInfo<
          TRes
        > {
  _CopyWithStubImpl$Query$GetRestaurantCategories$restaurantCategories$pageInfo(
    this._res,
  );

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetRestaurantCategory {
  factory Variables$Query$GetRestaurantCategory({required String id}) =>
      Variables$Query$GetRestaurantCategory._({r'id': id});

  Variables$Query$GetRestaurantCategory._(this._$data);

  factory Variables$Query$GetRestaurantCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetRestaurantCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetRestaurantCategory<
    Variables$Query$GetRestaurantCategory
  >
  get copyWith =>
      CopyWith$Variables$Query$GetRestaurantCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetRestaurantCategory ||
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

abstract class CopyWith$Variables$Query$GetRestaurantCategory<TRes> {
  factory CopyWith$Variables$Query$GetRestaurantCategory(
    Variables$Query$GetRestaurantCategory instance,
    TRes Function(Variables$Query$GetRestaurantCategory) then,
  ) = _CopyWithImpl$Variables$Query$GetRestaurantCategory;

  factory CopyWith$Variables$Query$GetRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetRestaurantCategory;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetRestaurantCategory<TRes>
    implements CopyWith$Variables$Query$GetRestaurantCategory<TRes> {
  _CopyWithImpl$Variables$Query$GetRestaurantCategory(
    this._instance,
    this._then,
  );

  final Variables$Query$GetRestaurantCategory _instance;

  final TRes Function(Variables$Query$GetRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetRestaurantCategory._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetRestaurantCategory<TRes>
    implements CopyWith$Variables$Query$GetRestaurantCategory<TRes> {
  _CopyWithStubImpl$Variables$Query$GetRestaurantCategory(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetRestaurantCategory {
  Query$GetRestaurantCategory({
    this.restaurantCategory,
    this.$__typename = 'Query',
  });

  factory Query$GetRestaurantCategory.fromJson(Map<String, dynamic> json) {
    final l$restaurantCategory = json['restaurantCategory'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategory(
      restaurantCategory: l$restaurantCategory == null
          ? null
          : Query$GetRestaurantCategory$restaurantCategory.fromJson(
              (l$restaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetRestaurantCategory$restaurantCategory? restaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurantCategory = restaurantCategory;
    _resultData['restaurantCategory'] = l$restaurantCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurantCategory = restaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantCategory = restaurantCategory;
    final lOther$restaurantCategory = other.restaurantCategory;
    if (l$restaurantCategory != lOther$restaurantCategory) {
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

extension UtilityExtension$Query$GetRestaurantCategory
    on Query$GetRestaurantCategory {
  CopyWith$Query$GetRestaurantCategory<Query$GetRestaurantCategory>
  get copyWith => CopyWith$Query$GetRestaurantCategory(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurantCategory<TRes> {
  factory CopyWith$Query$GetRestaurantCategory(
    Query$GetRestaurantCategory instance,
    TRes Function(Query$GetRestaurantCategory) then,
  ) = _CopyWithImpl$Query$GetRestaurantCategory;

  factory CopyWith$Query$GetRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Query$GetRestaurantCategory;

  TRes call({
    Query$GetRestaurantCategory$restaurantCategory? restaurantCategory,
    String? $__typename,
  });
  CopyWith$Query$GetRestaurantCategory$restaurantCategory<TRes>
  get restaurantCategory;
}

class _CopyWithImpl$Query$GetRestaurantCategory<TRes>
    implements CopyWith$Query$GetRestaurantCategory<TRes> {
  _CopyWithImpl$Query$GetRestaurantCategory(this._instance, this._then);

  final Query$GetRestaurantCategory _instance;

  final TRes Function(Query$GetRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategory(
      restaurantCategory: restaurantCategory == _undefined
          ? _instance.restaurantCategory
          : (restaurantCategory
                as Query$GetRestaurantCategory$restaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetRestaurantCategory$restaurantCategory<TRes>
  get restaurantCategory {
    final local$restaurantCategory = _instance.restaurantCategory;
    return local$restaurantCategory == null
        ? CopyWith$Query$GetRestaurantCategory$restaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetRestaurantCategory$restaurantCategory(
            local$restaurantCategory,
            (e) => call(restaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetRestaurantCategory<TRes>
    implements CopyWith$Query$GetRestaurantCategory<TRes> {
  _CopyWithStubImpl$Query$GetRestaurantCategory(this._res);

  TRes _res;

  call({
    Query$GetRestaurantCategory$restaurantCategory? restaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetRestaurantCategory$restaurantCategory<TRes>
  get restaurantCategory =>
      CopyWith$Query$GetRestaurantCategory$restaurantCategory.stub(_res);
}

const documentNodeQueryGetRestaurantCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetRestaurantCategory'),
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
            name: NameNode(value: 'restaurantCategory'),
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
Query$GetRestaurantCategory _parserFn$Query$GetRestaurantCategory(
  Map<String, dynamic> data,
) => Query$GetRestaurantCategory.fromJson(data);
typedef OnQueryComplete$Query$GetRestaurantCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$GetRestaurantCategory?,
    );

class Options$Query$GetRestaurantCategory
    extends graphql.QueryOptions<Query$GetRestaurantCategory> {
  Options$Query$GetRestaurantCategory({
    String? operationName,
    required Variables$Query$GetRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurantCategory? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetRestaurantCategory? onComplete,
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
                     : _parserFn$Query$GetRestaurantCategory(data),
               ),
         onError: onError,
         document: documentNodeQueryGetRestaurantCategory,
         parserFn: _parserFn$Query$GetRestaurantCategory,
       );

  final OnQueryComplete$Query$GetRestaurantCategory? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetRestaurantCategory
    extends graphql.WatchQueryOptions<Query$GetRestaurantCategory> {
  WatchOptions$Query$GetRestaurantCategory({
    String? operationName,
    required Variables$Query$GetRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetRestaurantCategory? typedOptimisticResult,
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
         document: documentNodeQueryGetRestaurantCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetRestaurantCategory,
       );
}

class FetchMoreOptions$Query$GetRestaurantCategory
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetRestaurantCategory({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetRestaurantCategory variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetRestaurantCategory,
       );
}

extension ClientExtension$Query$GetRestaurantCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetRestaurantCategory>>
  query$GetRestaurantCategory(
    Options$Query$GetRestaurantCategory options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetRestaurantCategory>
  watchQuery$GetRestaurantCategory(
    WatchOptions$Query$GetRestaurantCategory options,
  ) => this.watchQuery(options);

  void writeQuery$GetRestaurantCategory({
    required Query$GetRestaurantCategory data,
    required Variables$Query$GetRestaurantCategory variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetRestaurantCategory,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetRestaurantCategory? readQuery$GetRestaurantCategory({
    required Variables$Query$GetRestaurantCategory variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetRestaurantCategory,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetRestaurantCategory.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetRestaurantCategory>
useQuery$GetRestaurantCategory(Options$Query$GetRestaurantCategory options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetRestaurantCategory>
useWatchQuery$GetRestaurantCategory(
  WatchOptions$Query$GetRestaurantCategory options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetRestaurantCategory$Widget
    extends graphql_flutter.Query<Query$GetRestaurantCategory> {
  Query$GetRestaurantCategory$Widget({
    widgets.Key? key,
    required Options$Query$GetRestaurantCategory options,
    required graphql_flutter.QueryBuilder<Query$GetRestaurantCategory> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetRestaurantCategory$restaurantCategory {
  Query$GetRestaurantCategory$restaurantCategory({
    required this.id,
    required this.name,
    this.$__typename = 'RestaurantCategory',
  });

  factory Query$GetRestaurantCategory$restaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetRestaurantCategory$restaurantCategory(
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
    if (other is! Query$GetRestaurantCategory$restaurantCategory ||
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

extension UtilityExtension$Query$GetRestaurantCategory$restaurantCategory
    on Query$GetRestaurantCategory$restaurantCategory {
  CopyWith$Query$GetRestaurantCategory$restaurantCategory<
    Query$GetRestaurantCategory$restaurantCategory
  >
  get copyWith =>
      CopyWith$Query$GetRestaurantCategory$restaurantCategory(this, (i) => i);
}

abstract class CopyWith$Query$GetRestaurantCategory$restaurantCategory<TRes> {
  factory CopyWith$Query$GetRestaurantCategory$restaurantCategory(
    Query$GetRestaurantCategory$restaurantCategory instance,
    TRes Function(Query$GetRestaurantCategory$restaurantCategory) then,
  ) = _CopyWithImpl$Query$GetRestaurantCategory$restaurantCategory;

  factory CopyWith$Query$GetRestaurantCategory$restaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetRestaurantCategory$restaurantCategory;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetRestaurantCategory$restaurantCategory<TRes>
    implements CopyWith$Query$GetRestaurantCategory$restaurantCategory<TRes> {
  _CopyWithImpl$Query$GetRestaurantCategory$restaurantCategory(
    this._instance,
    this._then,
  );

  final Query$GetRestaurantCategory$restaurantCategory _instance;

  final TRes Function(Query$GetRestaurantCategory$restaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetRestaurantCategory$restaurantCategory(
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

class _CopyWithStubImpl$Query$GetRestaurantCategory$restaurantCategory<TRes>
    implements CopyWith$Query$GetRestaurantCategory$restaurantCategory<TRes> {
  _CopyWithStubImpl$Query$GetRestaurantCategory$restaurantCategory(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$CreateRestaurantCategory {
  factory Variables$Mutation$CreateRestaurantCategory({
    required Input$createRestaurantCategoryInput input,
  }) => Variables$Mutation$CreateRestaurantCategory._({r'input': input});

  Variables$Mutation$CreateRestaurantCategory._(this._$data);

  factory Variables$Mutation$CreateRestaurantCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createRestaurantCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateRestaurantCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createRestaurantCategoryInput get input =>
      (_$data['input'] as Input$createRestaurantCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateRestaurantCategory<
    Variables$Mutation$CreateRestaurantCategory
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CreateRestaurantCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateRestaurantCategory ||
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

abstract class CopyWith$Variables$Mutation$CreateRestaurantCategory<TRes> {
  factory CopyWith$Variables$Mutation$CreateRestaurantCategory(
    Variables$Mutation$CreateRestaurantCategory instance,
    TRes Function(Variables$Mutation$CreateRestaurantCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateRestaurantCategory;

  factory CopyWith$Variables$Mutation$CreateRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateRestaurantCategory;

  TRes call({Input$createRestaurantCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateRestaurantCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateRestaurantCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateRestaurantCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateRestaurantCategory _instance;

  final TRes Function(Variables$Mutation$CreateRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateRestaurantCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createRestaurantCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateRestaurantCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateRestaurantCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateRestaurantCategory(this._res);

  TRes _res;

  call({Input$createRestaurantCategoryInput? input}) => _res;
}

class Mutation$CreateRestaurantCategory {
  Mutation$CreateRestaurantCategory({
    this.createRestaurantCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateRestaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$createRestaurantCategory = json['createRestaurantCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateRestaurantCategory(
      createRestaurantCategory: l$createRestaurantCategory == null
          ? null
          : Mutation$CreateRestaurantCategory$createRestaurantCategory.fromJson(
              (l$createRestaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateRestaurantCategory$createRestaurantCategory?
  createRestaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createRestaurantCategory = createRestaurantCategory;
    _resultData['createRestaurantCategory'] = l$createRestaurantCategory
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createRestaurantCategory = createRestaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createRestaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createRestaurantCategory = createRestaurantCategory;
    final lOther$createRestaurantCategory = other.createRestaurantCategory;
    if (l$createRestaurantCategory != lOther$createRestaurantCategory) {
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

extension UtilityExtension$Mutation$CreateRestaurantCategory
    on Mutation$CreateRestaurantCategory {
  CopyWith$Mutation$CreateRestaurantCategory<Mutation$CreateRestaurantCategory>
  get copyWith => CopyWith$Mutation$CreateRestaurantCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateRestaurantCategory<TRes> {
  factory CopyWith$Mutation$CreateRestaurantCategory(
    Mutation$CreateRestaurantCategory instance,
    TRes Function(Mutation$CreateRestaurantCategory) then,
  ) = _CopyWithImpl$Mutation$CreateRestaurantCategory;

  factory CopyWith$Mutation$CreateRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateRestaurantCategory;

  TRes call({
    Mutation$CreateRestaurantCategory$createRestaurantCategory?
    createRestaurantCategory,
    String? $__typename,
  });
  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<TRes>
  get createRestaurantCategory;
}

class _CopyWithImpl$Mutation$CreateRestaurantCategory<TRes>
    implements CopyWith$Mutation$CreateRestaurantCategory<TRes> {
  _CopyWithImpl$Mutation$CreateRestaurantCategory(this._instance, this._then);

  final Mutation$CreateRestaurantCategory _instance;

  final TRes Function(Mutation$CreateRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createRestaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateRestaurantCategory(
      createRestaurantCategory: createRestaurantCategory == _undefined
          ? _instance.createRestaurantCategory
          : (createRestaurantCategory
                as Mutation$CreateRestaurantCategory$createRestaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<TRes>
  get createRestaurantCategory {
    final local$createRestaurantCategory = _instance.createRestaurantCategory;
    return local$createRestaurantCategory == null
        ? CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory(
            local$createRestaurantCategory,
            (e) => call(createRestaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateRestaurantCategory<TRes>
    implements CopyWith$Mutation$CreateRestaurantCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateRestaurantCategory(this._res);

  TRes _res;

  call({
    Mutation$CreateRestaurantCategory$createRestaurantCategory?
    createRestaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<TRes>
  get createRestaurantCategory =>
      CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory.stub(
        _res,
      );
}

const documentNodeMutationCreateRestaurantCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateRestaurantCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createRestaurantCategoryInput'),
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
            name: NameNode(value: 'createRestaurantCategory'),
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
                  name: NameNode(value: 'restaurantCategory'),
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
Mutation$CreateRestaurantCategory _parserFn$Mutation$CreateRestaurantCategory(
  Map<String, dynamic> data,
) => Mutation$CreateRestaurantCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateRestaurantCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CreateRestaurantCategory?,
    );

class Options$Mutation$CreateRestaurantCategory
    extends graphql.MutationOptions<Mutation$CreateRestaurantCategory> {
  Options$Mutation$CreateRestaurantCategory({
    String? operationName,
    required Variables$Mutation$CreateRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateRestaurantCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateRestaurantCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateRestaurantCategory>? update,
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
                     : _parserFn$Mutation$CreateRestaurantCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateRestaurantCategory,
         parserFn: _parserFn$Mutation$CreateRestaurantCategory,
       );

  final OnMutationCompleted$Mutation$CreateRestaurantCategory?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateRestaurantCategory
    extends graphql.WatchQueryOptions<Mutation$CreateRestaurantCategory> {
  WatchOptions$Mutation$CreateRestaurantCategory({
    String? operationName,
    required Variables$Mutation$CreateRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateRestaurantCategory? typedOptimisticResult,
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
         document: documentNodeMutationCreateRestaurantCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateRestaurantCategory,
       );
}

extension ClientExtension$Mutation$CreateRestaurantCategory
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateRestaurantCategory>>
  mutate$CreateRestaurantCategory(
    Options$Mutation$CreateRestaurantCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateRestaurantCategory>
  watchMutation$CreateRestaurantCategory(
    WatchOptions$Mutation$CreateRestaurantCategory options,
  ) => this.watchMutation(options);
}

class Mutation$CreateRestaurantCategory$HookResult {
  Mutation$CreateRestaurantCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateRestaurantCategory runMutation;

  final graphql.QueryResult<Mutation$CreateRestaurantCategory> result;
}

Mutation$CreateRestaurantCategory$HookResult
useMutation$CreateRestaurantCategory([
  WidgetOptions$Mutation$CreateRestaurantCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateRestaurantCategory(),
  );
  return Mutation$CreateRestaurantCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateRestaurantCategory>
useWatchMutation$CreateRestaurantCategory(
  WatchOptions$Mutation$CreateRestaurantCategory options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateRestaurantCategory
    extends graphql.MutationOptions<Mutation$CreateRestaurantCategory> {
  WidgetOptions$Mutation$CreateRestaurantCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateRestaurantCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateRestaurantCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateRestaurantCategory>? update,
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
                     : _parserFn$Mutation$CreateRestaurantCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateRestaurantCategory,
         parserFn: _parserFn$Mutation$CreateRestaurantCategory,
       );

  final OnMutationCompleted$Mutation$CreateRestaurantCategory?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateRestaurantCategory =
    graphql.MultiSourceResult<Mutation$CreateRestaurantCategory> Function(
      Variables$Mutation$CreateRestaurantCategory, {
      Object? optimisticResult,
      Mutation$CreateRestaurantCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateRestaurantCategory =
    widgets.Widget Function(
      RunMutation$Mutation$CreateRestaurantCategory,
      graphql.QueryResult<Mutation$CreateRestaurantCategory>?,
    );

class Mutation$CreateRestaurantCategory$Widget
    extends graphql_flutter.Mutation<Mutation$CreateRestaurantCategory> {
  Mutation$CreateRestaurantCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateRestaurantCategory? options,
    required Builder$Mutation$CreateRestaurantCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateRestaurantCategory(),
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

class Mutation$CreateRestaurantCategory$createRestaurantCategory {
  Mutation$CreateRestaurantCategory$createRestaurantCategory({
    this.restaurantCategory,
    this.$__typename = 'createRestaurantCategoryPayload',
  });

  factory Mutation$CreateRestaurantCategory$createRestaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$restaurantCategory = json['restaurantCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateRestaurantCategory$createRestaurantCategory(
      restaurantCategory: l$restaurantCategory == null
          ? null
          : Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory.fromJson(
              (l$restaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory?
  restaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurantCategory = restaurantCategory;
    _resultData['restaurantCategory'] = l$restaurantCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurantCategory = restaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateRestaurantCategory$createRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantCategory = restaurantCategory;
    final lOther$restaurantCategory = other.restaurantCategory;
    if (l$restaurantCategory != lOther$restaurantCategory) {
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

extension UtilityExtension$Mutation$CreateRestaurantCategory$createRestaurantCategory
    on Mutation$CreateRestaurantCategory$createRestaurantCategory {
  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<
    Mutation$CreateRestaurantCategory$createRestaurantCategory
  >
  get copyWith =>
      CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<
  TRes
> {
  factory CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory(
    Mutation$CreateRestaurantCategory$createRestaurantCategory instance,
    TRes Function(Mutation$CreateRestaurantCategory$createRestaurantCategory)
    then,
  ) = _CopyWithImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory;

  factory CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory;

  TRes call({
    Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory?
    restaurantCategory,
    String? $__typename,
  });
  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory;
}

class _CopyWithImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateRestaurantCategory$createRestaurantCategory _instance;

  final TRes Function(
    Mutation$CreateRestaurantCategory$createRestaurantCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateRestaurantCategory$createRestaurantCategory(
      restaurantCategory: restaurantCategory == _undefined
          ? _instance.restaurantCategory
          : (restaurantCategory
                as Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory {
    final local$restaurantCategory = _instance.restaurantCategory;
    return local$restaurantCategory == null
        ? CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
            local$restaurantCategory,
            (e) => call(restaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory(
    this._res,
  );

  TRes _res;

  call({
    Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory?
    restaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory =>
      CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory.stub(
        _res,
      );
}

class Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory {
  Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory({
    required this.id,
    required this.name,
    this.$__typename = 'RestaurantCategory',
  });

  factory Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
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
            is! Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory ||
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

extension UtilityExtension$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory
    on Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory {
  CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
    Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory
  >
  get copyWith =>
      CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
  TRes
> {
  factory CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
    Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory
    instance,
    TRes Function(
      Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory,
    )
    then,
  ) = _CopyWithImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory;

  factory CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory
  _instance;

  final TRes Function(
    Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
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

class _CopyWithStubImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateRestaurantCategory$createRestaurantCategory$restaurantCategory(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$UpdateRestaurantCategory {
  factory Variables$Mutation$UpdateRestaurantCategory({
    required Input$updateRestaurantCategoryInput input,
  }) => Variables$Mutation$UpdateRestaurantCategory._({r'input': input});

  Variables$Mutation$UpdateRestaurantCategory._(this._$data);

  factory Variables$Mutation$UpdateRestaurantCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateRestaurantCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateRestaurantCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateRestaurantCategoryInput get input =>
      (_$data['input'] as Input$updateRestaurantCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateRestaurantCategory<
    Variables$Mutation$UpdateRestaurantCategory
  >
  get copyWith =>
      CopyWith$Variables$Mutation$UpdateRestaurantCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateRestaurantCategory ||
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

abstract class CopyWith$Variables$Mutation$UpdateRestaurantCategory<TRes> {
  factory CopyWith$Variables$Mutation$UpdateRestaurantCategory(
    Variables$Mutation$UpdateRestaurantCategory instance,
    TRes Function(Variables$Mutation$UpdateRestaurantCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateRestaurantCategory;

  factory CopyWith$Variables$Mutation$UpdateRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateRestaurantCategory;

  TRes call({Input$updateRestaurantCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateRestaurantCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateRestaurantCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateRestaurantCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateRestaurantCategory _instance;

  final TRes Function(Variables$Mutation$UpdateRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateRestaurantCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateRestaurantCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateRestaurantCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateRestaurantCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateRestaurantCategory(this._res);

  TRes _res;

  call({Input$updateRestaurantCategoryInput? input}) => _res;
}

class Mutation$UpdateRestaurantCategory {
  Mutation$UpdateRestaurantCategory({
    this.updateRestaurantCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateRestaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$updateRestaurantCategory = json['updateRestaurantCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRestaurantCategory(
      updateRestaurantCategory: l$updateRestaurantCategory == null
          ? null
          : Mutation$UpdateRestaurantCategory$updateRestaurantCategory.fromJson(
              (l$updateRestaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRestaurantCategory$updateRestaurantCategory?
  updateRestaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateRestaurantCategory = updateRestaurantCategory;
    _resultData['updateRestaurantCategory'] = l$updateRestaurantCategory
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateRestaurantCategory = updateRestaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateRestaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateRestaurantCategory = updateRestaurantCategory;
    final lOther$updateRestaurantCategory = other.updateRestaurantCategory;
    if (l$updateRestaurantCategory != lOther$updateRestaurantCategory) {
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

extension UtilityExtension$Mutation$UpdateRestaurantCategory
    on Mutation$UpdateRestaurantCategory {
  CopyWith$Mutation$UpdateRestaurantCategory<Mutation$UpdateRestaurantCategory>
  get copyWith => CopyWith$Mutation$UpdateRestaurantCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateRestaurantCategory<TRes> {
  factory CopyWith$Mutation$UpdateRestaurantCategory(
    Mutation$UpdateRestaurantCategory instance,
    TRes Function(Mutation$UpdateRestaurantCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateRestaurantCategory;

  factory CopyWith$Mutation$UpdateRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateRestaurantCategory;

  TRes call({
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory?
    updateRestaurantCategory,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<TRes>
  get updateRestaurantCategory;
}

class _CopyWithImpl$Mutation$UpdateRestaurantCategory<TRes>
    implements CopyWith$Mutation$UpdateRestaurantCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateRestaurantCategory(this._instance, this._then);

  final Mutation$UpdateRestaurantCategory _instance;

  final TRes Function(Mutation$UpdateRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateRestaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRestaurantCategory(
      updateRestaurantCategory: updateRestaurantCategory == _undefined
          ? _instance.updateRestaurantCategory
          : (updateRestaurantCategory
                as Mutation$UpdateRestaurantCategory$updateRestaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<TRes>
  get updateRestaurantCategory {
    final local$updateRestaurantCategory = _instance.updateRestaurantCategory;
    return local$updateRestaurantCategory == null
        ? CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
            local$updateRestaurantCategory,
            (e) => call(updateRestaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateRestaurantCategory<TRes>
    implements CopyWith$Mutation$UpdateRestaurantCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateRestaurantCategory(this._res);

  TRes _res;

  call({
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory?
    updateRestaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<TRes>
  get updateRestaurantCategory =>
      CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory.stub(
        _res,
      );
}

const documentNodeMutationUpdateRestaurantCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateRestaurantCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateRestaurantCategoryInput'),
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
            name: NameNode(value: 'updateRestaurantCategory'),
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
                  name: NameNode(value: 'restaurantCategory'),
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
Mutation$UpdateRestaurantCategory _parserFn$Mutation$UpdateRestaurantCategory(
  Map<String, dynamic> data,
) => Mutation$UpdateRestaurantCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateRestaurantCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$UpdateRestaurantCategory?,
    );

class Options$Mutation$UpdateRestaurantCategory
    extends graphql.MutationOptions<Mutation$UpdateRestaurantCategory> {
  Options$Mutation$UpdateRestaurantCategory({
    String? operationName,
    required Variables$Mutation$UpdateRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRestaurantCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRestaurantCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRestaurantCategory>? update,
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
                     : _parserFn$Mutation$UpdateRestaurantCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateRestaurantCategory,
         parserFn: _parserFn$Mutation$UpdateRestaurantCategory,
       );

  final OnMutationCompleted$Mutation$UpdateRestaurantCategory?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateRestaurantCategory
    extends graphql.WatchQueryOptions<Mutation$UpdateRestaurantCategory> {
  WatchOptions$Mutation$UpdateRestaurantCategory({
    String? operationName,
    required Variables$Mutation$UpdateRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRestaurantCategory? typedOptimisticResult,
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
         document: documentNodeMutationUpdateRestaurantCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateRestaurantCategory,
       );
}

extension ClientExtension$Mutation$UpdateRestaurantCategory
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateRestaurantCategory>>
  mutate$UpdateRestaurantCategory(
    Options$Mutation$UpdateRestaurantCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateRestaurantCategory>
  watchMutation$UpdateRestaurantCategory(
    WatchOptions$Mutation$UpdateRestaurantCategory options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateRestaurantCategory$HookResult {
  Mutation$UpdateRestaurantCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateRestaurantCategory runMutation;

  final graphql.QueryResult<Mutation$UpdateRestaurantCategory> result;
}

Mutation$UpdateRestaurantCategory$HookResult
useMutation$UpdateRestaurantCategory([
  WidgetOptions$Mutation$UpdateRestaurantCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateRestaurantCategory(),
  );
  return Mutation$UpdateRestaurantCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateRestaurantCategory>
useWatchMutation$UpdateRestaurantCategory(
  WatchOptions$Mutation$UpdateRestaurantCategory options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateRestaurantCategory
    extends graphql.MutationOptions<Mutation$UpdateRestaurantCategory> {
  WidgetOptions$Mutation$UpdateRestaurantCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateRestaurantCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateRestaurantCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateRestaurantCategory>? update,
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
                     : _parserFn$Mutation$UpdateRestaurantCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateRestaurantCategory,
         parserFn: _parserFn$Mutation$UpdateRestaurantCategory,
       );

  final OnMutationCompleted$Mutation$UpdateRestaurantCategory?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateRestaurantCategory =
    graphql.MultiSourceResult<Mutation$UpdateRestaurantCategory> Function(
      Variables$Mutation$UpdateRestaurantCategory, {
      Object? optimisticResult,
      Mutation$UpdateRestaurantCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateRestaurantCategory =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateRestaurantCategory,
      graphql.QueryResult<Mutation$UpdateRestaurantCategory>?,
    );

class Mutation$UpdateRestaurantCategory$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateRestaurantCategory> {
  Mutation$UpdateRestaurantCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateRestaurantCategory? options,
    required Builder$Mutation$UpdateRestaurantCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateRestaurantCategory(),
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

class Mutation$UpdateRestaurantCategory$updateRestaurantCategory {
  Mutation$UpdateRestaurantCategory$updateRestaurantCategory({
    this.restaurantCategory,
    this.$__typename = 'updateRestaurantCategoryPayload',
  });

  factory Mutation$UpdateRestaurantCategory$updateRestaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$restaurantCategory = json['restaurantCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
      restaurantCategory: l$restaurantCategory == null
          ? null
          : Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory.fromJson(
              (l$restaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory?
  restaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurantCategory = restaurantCategory;
    _resultData['restaurantCategory'] = l$restaurantCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurantCategory = restaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateRestaurantCategory$updateRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantCategory = restaurantCategory;
    final lOther$restaurantCategory = other.restaurantCategory;
    if (l$restaurantCategory != lOther$restaurantCategory) {
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

extension UtilityExtension$Mutation$UpdateRestaurantCategory$updateRestaurantCategory
    on Mutation$UpdateRestaurantCategory$updateRestaurantCategory {
  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory
  >
  get copyWith =>
      CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<
  TRes
> {
  factory CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory instance,
    TRes Function(Mutation$UpdateRestaurantCategory$updateRestaurantCategory)
    then,
  ) = _CopyWithImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory;

  factory CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory;

  TRes call({
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory?
    restaurantCategory,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory;
}

class _CopyWithImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRestaurantCategory$updateRestaurantCategory _instance;

  final TRes Function(
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
      restaurantCategory: restaurantCategory == _undefined
          ? _instance.restaurantCategory
          : (restaurantCategory
                as Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory {
    final local$restaurantCategory = _instance.restaurantCategory;
    return local$restaurantCategory == null
        ? CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
            local$restaurantCategory,
            (e) => call(restaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory(
    this._res,
  );

  TRes _res;

  call({
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory?
    restaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory =>
      CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory.stub(
        _res,
      );
}

class Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory {
  Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory({
    required this.id,
    required this.name,
    this.$__typename = 'RestaurantCategory',
  });

  factory Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
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
            is! Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory ||
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

extension UtilityExtension$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory
    on Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory {
  CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory
  >
  get copyWith =>
      CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
  TRes
> {
  factory CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory
    instance,
    TRes Function(
      Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory,
    )
    then,
  ) = _CopyWithImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory;

  factory CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory
  _instance;

  final TRes Function(
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
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

class _CopyWithStubImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateRestaurantCategory$updateRestaurantCategory$restaurantCategory(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$DeleteRestaurantCategory {
  factory Variables$Mutation$DeleteRestaurantCategory({
    required Input$deleteRestaurantCategoryInput input,
  }) => Variables$Mutation$DeleteRestaurantCategory._({r'input': input});

  Variables$Mutation$DeleteRestaurantCategory._(this._$data);

  factory Variables$Mutation$DeleteRestaurantCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteRestaurantCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteRestaurantCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteRestaurantCategoryInput get input =>
      (_$data['input'] as Input$deleteRestaurantCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteRestaurantCategory<
    Variables$Mutation$DeleteRestaurantCategory
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DeleteRestaurantCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteRestaurantCategory ||
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

abstract class CopyWith$Variables$Mutation$DeleteRestaurantCategory<TRes> {
  factory CopyWith$Variables$Mutation$DeleteRestaurantCategory(
    Variables$Mutation$DeleteRestaurantCategory instance,
    TRes Function(Variables$Mutation$DeleteRestaurantCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteRestaurantCategory;

  factory CopyWith$Variables$Mutation$DeleteRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteRestaurantCategory;

  TRes call({Input$deleteRestaurantCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteRestaurantCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteRestaurantCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteRestaurantCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteRestaurantCategory _instance;

  final TRes Function(Variables$Mutation$DeleteRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteRestaurantCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteRestaurantCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteRestaurantCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteRestaurantCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteRestaurantCategory(this._res);

  TRes _res;

  call({Input$deleteRestaurantCategoryInput? input}) => _res;
}

class Mutation$DeleteRestaurantCategory {
  Mutation$DeleteRestaurantCategory({
    this.deleteRestaurantCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteRestaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$deleteRestaurantCategory = json['deleteRestaurantCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteRestaurantCategory(
      deleteRestaurantCategory: l$deleteRestaurantCategory == null
          ? null
          : Mutation$DeleteRestaurantCategory$deleteRestaurantCategory.fromJson(
              (l$deleteRestaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteRestaurantCategory$deleteRestaurantCategory?
  deleteRestaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteRestaurantCategory = deleteRestaurantCategory;
    _resultData['deleteRestaurantCategory'] = l$deleteRestaurantCategory
        ?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteRestaurantCategory = deleteRestaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteRestaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteRestaurantCategory = deleteRestaurantCategory;
    final lOther$deleteRestaurantCategory = other.deleteRestaurantCategory;
    if (l$deleteRestaurantCategory != lOther$deleteRestaurantCategory) {
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

extension UtilityExtension$Mutation$DeleteRestaurantCategory
    on Mutation$DeleteRestaurantCategory {
  CopyWith$Mutation$DeleteRestaurantCategory<Mutation$DeleteRestaurantCategory>
  get copyWith => CopyWith$Mutation$DeleteRestaurantCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteRestaurantCategory<TRes> {
  factory CopyWith$Mutation$DeleteRestaurantCategory(
    Mutation$DeleteRestaurantCategory instance,
    TRes Function(Mutation$DeleteRestaurantCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteRestaurantCategory;

  factory CopyWith$Mutation$DeleteRestaurantCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteRestaurantCategory;

  TRes call({
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory?
    deleteRestaurantCategory,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<TRes>
  get deleteRestaurantCategory;
}

class _CopyWithImpl$Mutation$DeleteRestaurantCategory<TRes>
    implements CopyWith$Mutation$DeleteRestaurantCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteRestaurantCategory(this._instance, this._then);

  final Mutation$DeleteRestaurantCategory _instance;

  final TRes Function(Mutation$DeleteRestaurantCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteRestaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteRestaurantCategory(
      deleteRestaurantCategory: deleteRestaurantCategory == _undefined
          ? _instance.deleteRestaurantCategory
          : (deleteRestaurantCategory
                as Mutation$DeleteRestaurantCategory$deleteRestaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<TRes>
  get deleteRestaurantCategory {
    final local$deleteRestaurantCategory = _instance.deleteRestaurantCategory;
    return local$deleteRestaurantCategory == null
        ? CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
            local$deleteRestaurantCategory,
            (e) => call(deleteRestaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteRestaurantCategory<TRes>
    implements CopyWith$Mutation$DeleteRestaurantCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteRestaurantCategory(this._res);

  TRes _res;

  call({
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory?
    deleteRestaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<TRes>
  get deleteRestaurantCategory =>
      CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory.stub(
        _res,
      );
}

const documentNodeMutationDeleteRestaurantCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteRestaurantCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteRestaurantCategoryInput'),
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
            name: NameNode(value: 'deleteRestaurantCategory'),
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
                  name: NameNode(value: 'restaurantCategory'),
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
Mutation$DeleteRestaurantCategory _parserFn$Mutation$DeleteRestaurantCategory(
  Map<String, dynamic> data,
) => Mutation$DeleteRestaurantCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteRestaurantCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$DeleteRestaurantCategory?,
    );

class Options$Mutation$DeleteRestaurantCategory
    extends graphql.MutationOptions<Mutation$DeleteRestaurantCategory> {
  Options$Mutation$DeleteRestaurantCategory({
    String? operationName,
    required Variables$Mutation$DeleteRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteRestaurantCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteRestaurantCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteRestaurantCategory>? update,
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
                     : _parserFn$Mutation$DeleteRestaurantCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteRestaurantCategory,
         parserFn: _parserFn$Mutation$DeleteRestaurantCategory,
       );

  final OnMutationCompleted$Mutation$DeleteRestaurantCategory?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteRestaurantCategory
    extends graphql.WatchQueryOptions<Mutation$DeleteRestaurantCategory> {
  WatchOptions$Mutation$DeleteRestaurantCategory({
    String? operationName,
    required Variables$Mutation$DeleteRestaurantCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteRestaurantCategory? typedOptimisticResult,
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
         document: documentNodeMutationDeleteRestaurantCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteRestaurantCategory,
       );
}

extension ClientExtension$Mutation$DeleteRestaurantCategory
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteRestaurantCategory>>
  mutate$DeleteRestaurantCategory(
    Options$Mutation$DeleteRestaurantCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteRestaurantCategory>
  watchMutation$DeleteRestaurantCategory(
    WatchOptions$Mutation$DeleteRestaurantCategory options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteRestaurantCategory$HookResult {
  Mutation$DeleteRestaurantCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteRestaurantCategory runMutation;

  final graphql.QueryResult<Mutation$DeleteRestaurantCategory> result;
}

Mutation$DeleteRestaurantCategory$HookResult
useMutation$DeleteRestaurantCategory([
  WidgetOptions$Mutation$DeleteRestaurantCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteRestaurantCategory(),
  );
  return Mutation$DeleteRestaurantCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteRestaurantCategory>
useWatchMutation$DeleteRestaurantCategory(
  WatchOptions$Mutation$DeleteRestaurantCategory options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteRestaurantCategory
    extends graphql.MutationOptions<Mutation$DeleteRestaurantCategory> {
  WidgetOptions$Mutation$DeleteRestaurantCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteRestaurantCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteRestaurantCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteRestaurantCategory>? update,
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
                     : _parserFn$Mutation$DeleteRestaurantCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteRestaurantCategory,
         parserFn: _parserFn$Mutation$DeleteRestaurantCategory,
       );

  final OnMutationCompleted$Mutation$DeleteRestaurantCategory?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteRestaurantCategory =
    graphql.MultiSourceResult<Mutation$DeleteRestaurantCategory> Function(
      Variables$Mutation$DeleteRestaurantCategory, {
      Object? optimisticResult,
      Mutation$DeleteRestaurantCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteRestaurantCategory =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteRestaurantCategory,
      graphql.QueryResult<Mutation$DeleteRestaurantCategory>?,
    );

class Mutation$DeleteRestaurantCategory$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteRestaurantCategory> {
  Mutation$DeleteRestaurantCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteRestaurantCategory? options,
    required Builder$Mutation$DeleteRestaurantCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteRestaurantCategory(),
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

class Mutation$DeleteRestaurantCategory$deleteRestaurantCategory {
  Mutation$DeleteRestaurantCategory$deleteRestaurantCategory({
    this.restaurantCategory,
    this.$__typename = 'deleteRestaurantCategoryPayload',
  });

  factory Mutation$DeleteRestaurantCategory$deleteRestaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$restaurantCategory = json['restaurantCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
      restaurantCategory: l$restaurantCategory == null
          ? null
          : Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory.fromJson(
              (l$restaurantCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory?
  restaurantCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$restaurantCategory = restaurantCategory;
    _resultData['restaurantCategory'] = l$restaurantCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$restaurantCategory = restaurantCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$restaurantCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteRestaurantCategory$deleteRestaurantCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$restaurantCategory = restaurantCategory;
    final lOther$restaurantCategory = other.restaurantCategory;
    if (l$restaurantCategory != lOther$restaurantCategory) {
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

extension UtilityExtension$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory
    on Mutation$DeleteRestaurantCategory$deleteRestaurantCategory {
  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory
  >
  get copyWith =>
      CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<
  TRes
> {
  factory CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory instance,
    TRes Function(Mutation$DeleteRestaurantCategory$deleteRestaurantCategory)
    then,
  ) = _CopyWithImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory;

  factory CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory;

  TRes call({
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory?
    restaurantCategory,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory;
}

class _CopyWithImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteRestaurantCategory$deleteRestaurantCategory _instance;

  final TRes Function(
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
      restaurantCategory: restaurantCategory == _undefined
          ? _instance.restaurantCategory
          : (restaurantCategory
                as Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory {
    final local$restaurantCategory = _instance.restaurantCategory;
    return local$restaurantCategory == null
        ? CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
            local$restaurantCategory,
            (e) => call(restaurantCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory(
    this._res,
  );

  TRes _res;

  call({
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory?
    restaurantCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
    TRes
  >
  get restaurantCategory =>
      CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory.stub(
        _res,
      );
}

class Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory {
  Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory({
    required this.id,
    this.$__typename = 'RestaurantCategory',
  });

  factory Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
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
    if (other
            is! Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory ||
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

extension UtilityExtension$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory
    on Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory {
  CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory
  >
  get copyWith =>
      CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
  TRes
> {
  factory CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory
    instance,
    TRes Function(
      Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory,
    )
    then,
  ) = _CopyWithImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory;

  factory CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory
  _instance;

  final TRes Function(
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
  TRes
>
    implements
        CopyWith$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$DeleteRestaurantCategory$deleteRestaurantCategory$restaurantCategory(
    this._res,
  );

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
