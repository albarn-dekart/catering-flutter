import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetDietCategories {
  factory Variables$Query$GetDietCategories({int? first, String? after}) =>
      Variables$Query$GetDietCategories._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$GetDietCategories._(this._$data);

  factory Variables$Query$GetDietCategories.fromJson(
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
    return Variables$Query$GetDietCategories._(result$data);
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

  CopyWith$Variables$Query$GetDietCategories<Variables$Query$GetDietCategories>
  get copyWith => CopyWith$Variables$Query$GetDietCategories(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDietCategories ||
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

abstract class CopyWith$Variables$Query$GetDietCategories<TRes> {
  factory CopyWith$Variables$Query$GetDietCategories(
    Variables$Query$GetDietCategories instance,
    TRes Function(Variables$Query$GetDietCategories) then,
  ) = _CopyWithImpl$Variables$Query$GetDietCategories;

  factory CopyWith$Variables$Query$GetDietCategories.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDietCategories;

  TRes call({int? first, String? after});
}

class _CopyWithImpl$Variables$Query$GetDietCategories<TRes>
    implements CopyWith$Variables$Query$GetDietCategories<TRes> {
  _CopyWithImpl$Variables$Query$GetDietCategories(this._instance, this._then);

  final Variables$Query$GetDietCategories _instance;

  final TRes Function(Variables$Query$GetDietCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? first = _undefined, Object? after = _undefined}) => _then(
    Variables$Query$GetDietCategories._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetDietCategories<TRes>
    implements CopyWith$Variables$Query$GetDietCategories<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDietCategories(this._res);

  TRes _res;

  call({int? first, String? after}) => _res;
}

class Query$GetDietCategories {
  Query$GetDietCategories({this.dietCategories, this.$__typename = 'Query'});

  factory Query$GetDietCategories.fromJson(Map<String, dynamic> json) {
    final l$dietCategories = json['dietCategories'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategories(
      dietCategories: l$dietCategories == null
          ? null
          : Query$GetDietCategories$dietCategories.fromJson(
              (l$dietCategories as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDietCategories$dietCategories? dietCategories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$dietCategories = dietCategories;
    _resultData['dietCategories'] = l$dietCategories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$dietCategories = dietCategories;
    final l$$__typename = $__typename;
    return Object.hashAll([l$dietCategories, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDietCategories || runtimeType != other.runtimeType) {
      return false;
    }
    final l$dietCategories = dietCategories;
    final lOther$dietCategories = other.dietCategories;
    if (l$dietCategories != lOther$dietCategories) {
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

extension UtilityExtension$Query$GetDietCategories on Query$GetDietCategories {
  CopyWith$Query$GetDietCategories<Query$GetDietCategories> get copyWith =>
      CopyWith$Query$GetDietCategories(this, (i) => i);
}

abstract class CopyWith$Query$GetDietCategories<TRes> {
  factory CopyWith$Query$GetDietCategories(
    Query$GetDietCategories instance,
    TRes Function(Query$GetDietCategories) then,
  ) = _CopyWithImpl$Query$GetDietCategories;

  factory CopyWith$Query$GetDietCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDietCategories;

  TRes call({
    Query$GetDietCategories$dietCategories? dietCategories,
    String? $__typename,
  });
  CopyWith$Query$GetDietCategories$dietCategories<TRes> get dietCategories;
}

class _CopyWithImpl$Query$GetDietCategories<TRes>
    implements CopyWith$Query$GetDietCategories<TRes> {
  _CopyWithImpl$Query$GetDietCategories(this._instance, this._then);

  final Query$GetDietCategories _instance;

  final TRes Function(Query$GetDietCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? dietCategories = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDietCategories(
      dietCategories: dietCategories == _undefined
          ? _instance.dietCategories
          : (dietCategories as Query$GetDietCategories$dietCategories?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetDietCategories$dietCategories<TRes> get dietCategories {
    final local$dietCategories = _instance.dietCategories;
    return local$dietCategories == null
        ? CopyWith$Query$GetDietCategories$dietCategories.stub(_then(_instance))
        : CopyWith$Query$GetDietCategories$dietCategories(
            local$dietCategories,
            (e) => call(dietCategories: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDietCategories<TRes>
    implements CopyWith$Query$GetDietCategories<TRes> {
  _CopyWithStubImpl$Query$GetDietCategories(this._res);

  TRes _res;

  call({
    Query$GetDietCategories$dietCategories? dietCategories,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetDietCategories$dietCategories<TRes> get dietCategories =>
      CopyWith$Query$GetDietCategories$dietCategories.stub(_res);
}

const documentNodeQueryGetDietCategories = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetDietCategories'),
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
            name: NameNode(value: 'dietCategories'),
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
Query$GetDietCategories _parserFn$Query$GetDietCategories(
  Map<String, dynamic> data,
) => Query$GetDietCategories.fromJson(data);
typedef OnQueryComplete$Query$GetDietCategories =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetDietCategories?);

class Options$Query$GetDietCategories
    extends graphql.QueryOptions<Query$GetDietCategories> {
  Options$Query$GetDietCategories({
    String? operationName,
    Variables$Query$GetDietCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDietCategories? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDietCategories? onComplete,
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
                 data == null ? null : _parserFn$Query$GetDietCategories(data),
               ),
         onError: onError,
         document: documentNodeQueryGetDietCategories,
         parserFn: _parserFn$Query$GetDietCategories,
       );

  final OnQueryComplete$Query$GetDietCategories? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetDietCategories
    extends graphql.WatchQueryOptions<Query$GetDietCategories> {
  WatchOptions$Query$GetDietCategories({
    String? operationName,
    Variables$Query$GetDietCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDietCategories? typedOptimisticResult,
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
         document: documentNodeQueryGetDietCategories,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetDietCategories,
       );
}

class FetchMoreOptions$Query$GetDietCategories
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDietCategories({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetDietCategories? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetDietCategories,
       );
}

extension ClientExtension$Query$GetDietCategories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDietCategories>> query$GetDietCategories([
    Options$Query$GetDietCategories? options,
  ]) async => await this.query(options ?? Options$Query$GetDietCategories());

  graphql.ObservableQuery<Query$GetDietCategories>
  watchQuery$GetDietCategories([
    WatchOptions$Query$GetDietCategories? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetDietCategories());

  void writeQuery$GetDietCategories({
    required Query$GetDietCategories data,
    Variables$Query$GetDietCategories? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetDietCategories,
      ),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetDietCategories? readQuery$GetDietCategories({
    Variables$Query$GetDietCategories? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetDietCategories,
        ),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDietCategories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDietCategories>
useQuery$GetDietCategories([Options$Query$GetDietCategories? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetDietCategories());
graphql.ObservableQuery<Query$GetDietCategories>
useWatchQuery$GetDietCategories([
  WatchOptions$Query$GetDietCategories? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetDietCategories(),
);

class Query$GetDietCategories$Widget
    extends graphql_flutter.Query<Query$GetDietCategories> {
  Query$GetDietCategories$Widget({
    widgets.Key? key,
    Options$Query$GetDietCategories? options,
    required graphql_flutter.QueryBuilder<Query$GetDietCategories> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetDietCategories(),
         builder: builder,
       );
}

class Query$GetDietCategories$dietCategories {
  Query$GetDietCategories$dietCategories({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'DietCategoryCursorConnection',
  });

  factory Query$GetDietCategories$dietCategories.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategories$dietCategories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetDietCategories$dietCategories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetDietCategories$dietCategories$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetDietCategories$dietCategories$edges?>? edges;

  final Query$GetDietCategories$dietCategories$pageInfo pageInfo;

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
    if (other is! Query$GetDietCategories$dietCategories ||
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

extension UtilityExtension$Query$GetDietCategories$dietCategories
    on Query$GetDietCategories$dietCategories {
  CopyWith$Query$GetDietCategories$dietCategories<
    Query$GetDietCategories$dietCategories
  >
  get copyWith =>
      CopyWith$Query$GetDietCategories$dietCategories(this, (i) => i);
}

abstract class CopyWith$Query$GetDietCategories$dietCategories<TRes> {
  factory CopyWith$Query$GetDietCategories$dietCategories(
    Query$GetDietCategories$dietCategories instance,
    TRes Function(Query$GetDietCategories$dietCategories) then,
  ) = _CopyWithImpl$Query$GetDietCategories$dietCategories;

  factory CopyWith$Query$GetDietCategories$dietCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDietCategories$dietCategories;

  TRes call({
    List<Query$GetDietCategories$dietCategories$edges?>? edges,
    Query$GetDietCategories$dietCategories$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetDietCategories$dietCategories$edges?>? Function(
      Iterable<
        CopyWith$Query$GetDietCategories$dietCategories$edges<
          Query$GetDietCategories$dietCategories$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetDietCategories$dietCategories$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetDietCategories$dietCategories<TRes>
    implements CopyWith$Query$GetDietCategories$dietCategories<TRes> {
  _CopyWithImpl$Query$GetDietCategories$dietCategories(
    this._instance,
    this._then,
  );

  final Query$GetDietCategories$dietCategories _instance;

  final TRes Function(Query$GetDietCategories$dietCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDietCategories$dietCategories(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetDietCategories$dietCategories$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetDietCategories$dietCategories$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetDietCategories$dietCategories$edges?>? Function(
      Iterable<
        CopyWith$Query$GetDietCategories$dietCategories$edges<
          Query$GetDietCategories$dietCategories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetDietCategories$dietCategories$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetDietCategories$dietCategories$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetDietCategories$dietCategories$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetDietCategories$dietCategories<TRes>
    implements CopyWith$Query$GetDietCategories$dietCategories<TRes> {
  _CopyWithStubImpl$Query$GetDietCategories$dietCategories(this._res);

  TRes _res;

  call({
    List<Query$GetDietCategories$dietCategories$edges?>? edges,
    Query$GetDietCategories$dietCategories$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetDietCategories$dietCategories$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetDietCategories$dietCategories$pageInfo.stub(_res);
}

class Query$GetDietCategories$dietCategories$edges {
  Query$GetDietCategories$dietCategories$edges({
    this.node,
    this.$__typename = 'DietCategoryEdge',
  });

  factory Query$GetDietCategories$dietCategories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategories$dietCategories$edges(
      node: l$node == null
          ? null
          : Query$GetDietCategories$dietCategories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDietCategories$dietCategories$edges$node? node;

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
    if (other is! Query$GetDietCategories$dietCategories$edges ||
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

extension UtilityExtension$Query$GetDietCategories$dietCategories$edges
    on Query$GetDietCategories$dietCategories$edges {
  CopyWith$Query$GetDietCategories$dietCategories$edges<
    Query$GetDietCategories$dietCategories$edges
  >
  get copyWith =>
      CopyWith$Query$GetDietCategories$dietCategories$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetDietCategories$dietCategories$edges<TRes> {
  factory CopyWith$Query$GetDietCategories$dietCategories$edges(
    Query$GetDietCategories$dietCategories$edges instance,
    TRes Function(Query$GetDietCategories$dietCategories$edges) then,
  ) = _CopyWithImpl$Query$GetDietCategories$dietCategories$edges;

  factory CopyWith$Query$GetDietCategories$dietCategories$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDietCategories$dietCategories$edges;

  TRes call({
    Query$GetDietCategories$dietCategories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetDietCategories$dietCategories$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetDietCategories$dietCategories$edges<TRes>
    implements CopyWith$Query$GetDietCategories$dietCategories$edges<TRes> {
  _CopyWithImpl$Query$GetDietCategories$dietCategories$edges(
    this._instance,
    this._then,
  );

  final Query$GetDietCategories$dietCategories$edges _instance;

  final TRes Function(Query$GetDietCategories$dietCategories$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetDietCategories$dietCategories$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetDietCategories$dietCategories$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetDietCategories$dietCategories$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetDietCategories$dietCategories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetDietCategories$dietCategories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDietCategories$dietCategories$edges<TRes>
    implements CopyWith$Query$GetDietCategories$dietCategories$edges<TRes> {
  _CopyWithStubImpl$Query$GetDietCategories$dietCategories$edges(this._res);

  TRes _res;

  call({
    Query$GetDietCategories$dietCategories$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetDietCategories$dietCategories$edges$node<TRes> get node =>
      CopyWith$Query$GetDietCategories$dietCategories$edges$node.stub(_res);
}

class Query$GetDietCategories$dietCategories$edges$node {
  Query$GetDietCategories$dietCategories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'DietCategory',
  });

  factory Query$GetDietCategories$dietCategories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategories$dietCategories$edges$node(
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
    if (other is! Query$GetDietCategories$dietCategories$edges$node ||
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

extension UtilityExtension$Query$GetDietCategories$dietCategories$edges$node
    on Query$GetDietCategories$dietCategories$edges$node {
  CopyWith$Query$GetDietCategories$dietCategories$edges$node<
    Query$GetDietCategories$dietCategories$edges$node
  >
  get copyWith => CopyWith$Query$GetDietCategories$dietCategories$edges$node(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetDietCategories$dietCategories$edges$node<
  TRes
> {
  factory CopyWith$Query$GetDietCategories$dietCategories$edges$node(
    Query$GetDietCategories$dietCategories$edges$node instance,
    TRes Function(Query$GetDietCategories$dietCategories$edges$node) then,
  ) = _CopyWithImpl$Query$GetDietCategories$dietCategories$edges$node;

  factory CopyWith$Query$GetDietCategories$dietCategories$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetDietCategories$dietCategories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetDietCategories$dietCategories$edges$node<TRes>
    implements
        CopyWith$Query$GetDietCategories$dietCategories$edges$node<TRes> {
  _CopyWithImpl$Query$GetDietCategories$dietCategories$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetDietCategories$dietCategories$edges$node _instance;

  final TRes Function(Query$GetDietCategories$dietCategories$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDietCategories$dietCategories$edges$node(
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

class _CopyWithStubImpl$Query$GetDietCategories$dietCategories$edges$node<TRes>
    implements
        CopyWith$Query$GetDietCategories$dietCategories$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetDietCategories$dietCategories$edges$node(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetDietCategories$dietCategories$pageInfo {
  Query$GetDietCategories$dietCategories$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'DietCategoryPageInfo',
  });

  factory Query$GetDietCategories$dietCategories$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategories$dietCategories$pageInfo(
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
    if (other is! Query$GetDietCategories$dietCategories$pageInfo ||
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

extension UtilityExtension$Query$GetDietCategories$dietCategories$pageInfo
    on Query$GetDietCategories$dietCategories$pageInfo {
  CopyWith$Query$GetDietCategories$dietCategories$pageInfo<
    Query$GetDietCategories$dietCategories$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetDietCategories$dietCategories$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetDietCategories$dietCategories$pageInfo<TRes> {
  factory CopyWith$Query$GetDietCategories$dietCategories$pageInfo(
    Query$GetDietCategories$dietCategories$pageInfo instance,
    TRes Function(Query$GetDietCategories$dietCategories$pageInfo) then,
  ) = _CopyWithImpl$Query$GetDietCategories$dietCategories$pageInfo;

  factory CopyWith$Query$GetDietCategories$dietCategories$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetDietCategories$dietCategories$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetDietCategories$dietCategories$pageInfo<TRes>
    implements CopyWith$Query$GetDietCategories$dietCategories$pageInfo<TRes> {
  _CopyWithImpl$Query$GetDietCategories$dietCategories$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetDietCategories$dietCategories$pageInfo _instance;

  final TRes Function(Query$GetDietCategories$dietCategories$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDietCategories$dietCategories$pageInfo(
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

class _CopyWithStubImpl$Query$GetDietCategories$dietCategories$pageInfo<TRes>
    implements CopyWith$Query$GetDietCategories$dietCategories$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetDietCategories$dietCategories$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetDietCategory {
  factory Variables$Query$GetDietCategory({required String id}) =>
      Variables$Query$GetDietCategory._({r'id': id});

  Variables$Query$GetDietCategory._(this._$data);

  factory Variables$Query$GetDietCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetDietCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetDietCategory<Variables$Query$GetDietCategory>
  get copyWith => CopyWith$Variables$Query$GetDietCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetDietCategory ||
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

abstract class CopyWith$Variables$Query$GetDietCategory<TRes> {
  factory CopyWith$Variables$Query$GetDietCategory(
    Variables$Query$GetDietCategory instance,
    TRes Function(Variables$Query$GetDietCategory) then,
  ) = _CopyWithImpl$Variables$Query$GetDietCategory;

  factory CopyWith$Variables$Query$GetDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetDietCategory;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetDietCategory<TRes>
    implements CopyWith$Variables$Query$GetDietCategory<TRes> {
  _CopyWithImpl$Variables$Query$GetDietCategory(this._instance, this._then);

  final Variables$Query$GetDietCategory _instance;

  final TRes Function(Variables$Query$GetDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetDietCategory._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetDietCategory<TRes>
    implements CopyWith$Variables$Query$GetDietCategory<TRes> {
  _CopyWithStubImpl$Variables$Query$GetDietCategory(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetDietCategory {
  Query$GetDietCategory({this.dietCategory, this.$__typename = 'Query'});

  factory Query$GetDietCategory.fromJson(Map<String, dynamic> json) {
    final l$dietCategory = json['dietCategory'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategory(
      dietCategory: l$dietCategory == null
          ? null
          : Query$GetDietCategory$dietCategory.fromJson(
              (l$dietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetDietCategory$dietCategory? dietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$dietCategory = dietCategory;
    _resultData['dietCategory'] = l$dietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$dietCategory = dietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$dietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetDietCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$dietCategory = dietCategory;
    final lOther$dietCategory = other.dietCategory;
    if (l$dietCategory != lOther$dietCategory) {
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

extension UtilityExtension$Query$GetDietCategory on Query$GetDietCategory {
  CopyWith$Query$GetDietCategory<Query$GetDietCategory> get copyWith =>
      CopyWith$Query$GetDietCategory(this, (i) => i);
}

abstract class CopyWith$Query$GetDietCategory<TRes> {
  factory CopyWith$Query$GetDietCategory(
    Query$GetDietCategory instance,
    TRes Function(Query$GetDietCategory) then,
  ) = _CopyWithImpl$Query$GetDietCategory;

  factory CopyWith$Query$GetDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDietCategory;

  TRes call({
    Query$GetDietCategory$dietCategory? dietCategory,
    String? $__typename,
  });
  CopyWith$Query$GetDietCategory$dietCategory<TRes> get dietCategory;
}

class _CopyWithImpl$Query$GetDietCategory<TRes>
    implements CopyWith$Query$GetDietCategory<TRes> {
  _CopyWithImpl$Query$GetDietCategory(this._instance, this._then);

  final Query$GetDietCategory _instance;

  final TRes Function(Query$GetDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? dietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDietCategory(
      dietCategory: dietCategory == _undefined
          ? _instance.dietCategory
          : (dietCategory as Query$GetDietCategory$dietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetDietCategory$dietCategory<TRes> get dietCategory {
    final local$dietCategory = _instance.dietCategory;
    return local$dietCategory == null
        ? CopyWith$Query$GetDietCategory$dietCategory.stub(_then(_instance))
        : CopyWith$Query$GetDietCategory$dietCategory(
            local$dietCategory,
            (e) => call(dietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetDietCategory<TRes>
    implements CopyWith$Query$GetDietCategory<TRes> {
  _CopyWithStubImpl$Query$GetDietCategory(this._res);

  TRes _res;

  call({
    Query$GetDietCategory$dietCategory? dietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetDietCategory$dietCategory<TRes> get dietCategory =>
      CopyWith$Query$GetDietCategory$dietCategory.stub(_res);
}

const documentNodeQueryGetDietCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetDietCategory'),
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
            name: NameNode(value: 'dietCategory'),
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
Query$GetDietCategory _parserFn$Query$GetDietCategory(
  Map<String, dynamic> data,
) => Query$GetDietCategory.fromJson(data);
typedef OnQueryComplete$Query$GetDietCategory =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetDietCategory?);

class Options$Query$GetDietCategory
    extends graphql.QueryOptions<Query$GetDietCategory> {
  Options$Query$GetDietCategory({
    String? operationName,
    required Variables$Query$GetDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDietCategory? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetDietCategory? onComplete,
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
                 data == null ? null : _parserFn$Query$GetDietCategory(data),
               ),
         onError: onError,
         document: documentNodeQueryGetDietCategory,
         parserFn: _parserFn$Query$GetDietCategory,
       );

  final OnQueryComplete$Query$GetDietCategory? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetDietCategory
    extends graphql.WatchQueryOptions<Query$GetDietCategory> {
  WatchOptions$Query$GetDietCategory({
    String? operationName,
    required Variables$Query$GetDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetDietCategory? typedOptimisticResult,
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
         document: documentNodeQueryGetDietCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetDietCategory,
       );
}

class FetchMoreOptions$Query$GetDietCategory extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetDietCategory({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetDietCategory variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetDietCategory,
       );
}

extension ClientExtension$Query$GetDietCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetDietCategory>> query$GetDietCategory(
    Options$Query$GetDietCategory options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetDietCategory> watchQuery$GetDietCategory(
    WatchOptions$Query$GetDietCategory options,
  ) => this.watchQuery(options);

  void writeQuery$GetDietCategory({
    required Query$GetDietCategory data,
    required Variables$Query$GetDietCategory variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetDietCategory),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetDietCategory? readQuery$GetDietCategory({
    required Variables$Query$GetDietCategory variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetDietCategory,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetDietCategory.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetDietCategory> useQuery$GetDietCategory(
  Options$Query$GetDietCategory options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetDietCategory> useWatchQuery$GetDietCategory(
  WatchOptions$Query$GetDietCategory options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetDietCategory$Widget
    extends graphql_flutter.Query<Query$GetDietCategory> {
  Query$GetDietCategory$Widget({
    widgets.Key? key,
    required Options$Query$GetDietCategory options,
    required graphql_flutter.QueryBuilder<Query$GetDietCategory> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetDietCategory$dietCategory {
  Query$GetDietCategory$dietCategory({
    required this.id,
    required this.name,
    this.$__typename = 'DietCategory',
  });

  factory Query$GetDietCategory$dietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetDietCategory$dietCategory(
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
    if (other is! Query$GetDietCategory$dietCategory ||
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

extension UtilityExtension$Query$GetDietCategory$dietCategory
    on Query$GetDietCategory$dietCategory {
  CopyWith$Query$GetDietCategory$dietCategory<
    Query$GetDietCategory$dietCategory
  >
  get copyWith => CopyWith$Query$GetDietCategory$dietCategory(this, (i) => i);
}

abstract class CopyWith$Query$GetDietCategory$dietCategory<TRes> {
  factory CopyWith$Query$GetDietCategory$dietCategory(
    Query$GetDietCategory$dietCategory instance,
    TRes Function(Query$GetDietCategory$dietCategory) then,
  ) = _CopyWithImpl$Query$GetDietCategory$dietCategory;

  factory CopyWith$Query$GetDietCategory$dietCategory.stub(TRes res) =
      _CopyWithStubImpl$Query$GetDietCategory$dietCategory;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetDietCategory$dietCategory<TRes>
    implements CopyWith$Query$GetDietCategory$dietCategory<TRes> {
  _CopyWithImpl$Query$GetDietCategory$dietCategory(this._instance, this._then);

  final Query$GetDietCategory$dietCategory _instance;

  final TRes Function(Query$GetDietCategory$dietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetDietCategory$dietCategory(
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

class _CopyWithStubImpl$Query$GetDietCategory$dietCategory<TRes>
    implements CopyWith$Query$GetDietCategory$dietCategory<TRes> {
  _CopyWithStubImpl$Query$GetDietCategory$dietCategory(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$CreateDietCategory {
  factory Variables$Mutation$CreateDietCategory({
    required Input$createDietCategoryInput input,
  }) => Variables$Mutation$CreateDietCategory._({r'input': input});

  Variables$Mutation$CreateDietCategory._(this._$data);

  factory Variables$Mutation$CreateDietCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createDietCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateDietCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createDietCategoryInput get input =>
      (_$data['input'] as Input$createDietCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateDietCategory<
    Variables$Mutation$CreateDietCategory
  >
  get copyWith =>
      CopyWith$Variables$Mutation$CreateDietCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateDietCategory ||
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

abstract class CopyWith$Variables$Mutation$CreateDietCategory<TRes> {
  factory CopyWith$Variables$Mutation$CreateDietCategory(
    Variables$Mutation$CreateDietCategory instance,
    TRes Function(Variables$Mutation$CreateDietCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateDietCategory;

  factory CopyWith$Variables$Mutation$CreateDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateDietCategory;

  TRes call({Input$createDietCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateDietCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateDietCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateDietCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateDietCategory _instance;

  final TRes Function(Variables$Mutation$CreateDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateDietCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createDietCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateDietCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateDietCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateDietCategory(this._res);

  TRes _res;

  call({Input$createDietCategoryInput? input}) => _res;
}

class Mutation$CreateDietCategory {
  Mutation$CreateDietCategory({
    this.createDietCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateDietCategory.fromJson(Map<String, dynamic> json) {
    final l$createDietCategory = json['createDietCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateDietCategory(
      createDietCategory: l$createDietCategory == null
          ? null
          : Mutation$CreateDietCategory$createDietCategory.fromJson(
              (l$createDietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateDietCategory$createDietCategory? createDietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createDietCategory = createDietCategory;
    _resultData['createDietCategory'] = l$createDietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createDietCategory = createDietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createDietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateDietCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createDietCategory = createDietCategory;
    final lOther$createDietCategory = other.createDietCategory;
    if (l$createDietCategory != lOther$createDietCategory) {
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

extension UtilityExtension$Mutation$CreateDietCategory
    on Mutation$CreateDietCategory {
  CopyWith$Mutation$CreateDietCategory<Mutation$CreateDietCategory>
  get copyWith => CopyWith$Mutation$CreateDietCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateDietCategory<TRes> {
  factory CopyWith$Mutation$CreateDietCategory(
    Mutation$CreateDietCategory instance,
    TRes Function(Mutation$CreateDietCategory) then,
  ) = _CopyWithImpl$Mutation$CreateDietCategory;

  factory CopyWith$Mutation$CreateDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateDietCategory;

  TRes call({
    Mutation$CreateDietCategory$createDietCategory? createDietCategory,
    String? $__typename,
  });
  CopyWith$Mutation$CreateDietCategory$createDietCategory<TRes>
  get createDietCategory;
}

class _CopyWithImpl$Mutation$CreateDietCategory<TRes>
    implements CopyWith$Mutation$CreateDietCategory<TRes> {
  _CopyWithImpl$Mutation$CreateDietCategory(this._instance, this._then);

  final Mutation$CreateDietCategory _instance;

  final TRes Function(Mutation$CreateDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createDietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateDietCategory(
      createDietCategory: createDietCategory == _undefined
          ? _instance.createDietCategory
          : (createDietCategory
                as Mutation$CreateDietCategory$createDietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateDietCategory$createDietCategory<TRes>
  get createDietCategory {
    final local$createDietCategory = _instance.createDietCategory;
    return local$createDietCategory == null
        ? CopyWith$Mutation$CreateDietCategory$createDietCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateDietCategory$createDietCategory(
            local$createDietCategory,
            (e) => call(createDietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateDietCategory<TRes>
    implements CopyWith$Mutation$CreateDietCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateDietCategory(this._res);

  TRes _res;

  call({
    Mutation$CreateDietCategory$createDietCategory? createDietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateDietCategory$createDietCategory<TRes>
  get createDietCategory =>
      CopyWith$Mutation$CreateDietCategory$createDietCategory.stub(_res);
}

const documentNodeMutationCreateDietCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateDietCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createDietCategoryInput'),
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
            name: NameNode(value: 'createDietCategory'),
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
                  name: NameNode(value: 'dietCategory'),
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
Mutation$CreateDietCategory _parserFn$Mutation$CreateDietCategory(
  Map<String, dynamic> data,
) => Mutation$CreateDietCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateDietCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$CreateDietCategory?,
    );

class Options$Mutation$CreateDietCategory
    extends graphql.MutationOptions<Mutation$CreateDietCategory> {
  Options$Mutation$CreateDietCategory({
    String? operationName,
    required Variables$Mutation$CreateDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateDietCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateDietCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateDietCategory>? update,
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
                     : _parserFn$Mutation$CreateDietCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateDietCategory,
         parserFn: _parserFn$Mutation$CreateDietCategory,
       );

  final OnMutationCompleted$Mutation$CreateDietCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateDietCategory
    extends graphql.WatchQueryOptions<Mutation$CreateDietCategory> {
  WatchOptions$Mutation$CreateDietCategory({
    String? operationName,
    required Variables$Mutation$CreateDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateDietCategory? typedOptimisticResult,
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
         document: documentNodeMutationCreateDietCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateDietCategory,
       );
}

extension ClientExtension$Mutation$CreateDietCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateDietCategory>>
  mutate$CreateDietCategory(
    Options$Mutation$CreateDietCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateDietCategory>
  watchMutation$CreateDietCategory(
    WatchOptions$Mutation$CreateDietCategory options,
  ) => this.watchMutation(options);
}

class Mutation$CreateDietCategory$HookResult {
  Mutation$CreateDietCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateDietCategory runMutation;

  final graphql.QueryResult<Mutation$CreateDietCategory> result;
}

Mutation$CreateDietCategory$HookResult useMutation$CreateDietCategory([
  WidgetOptions$Mutation$CreateDietCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateDietCategory(),
  );
  return Mutation$CreateDietCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateDietCategory>
useWatchMutation$CreateDietCategory(
  WatchOptions$Mutation$CreateDietCategory options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateDietCategory
    extends graphql.MutationOptions<Mutation$CreateDietCategory> {
  WidgetOptions$Mutation$CreateDietCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateDietCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateDietCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateDietCategory>? update,
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
                     : _parserFn$Mutation$CreateDietCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateDietCategory,
         parserFn: _parserFn$Mutation$CreateDietCategory,
       );

  final OnMutationCompleted$Mutation$CreateDietCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateDietCategory =
    graphql.MultiSourceResult<Mutation$CreateDietCategory> Function(
      Variables$Mutation$CreateDietCategory, {
      Object? optimisticResult,
      Mutation$CreateDietCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateDietCategory =
    widgets.Widget Function(
      RunMutation$Mutation$CreateDietCategory,
      graphql.QueryResult<Mutation$CreateDietCategory>?,
    );

class Mutation$CreateDietCategory$Widget
    extends graphql_flutter.Mutation<Mutation$CreateDietCategory> {
  Mutation$CreateDietCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateDietCategory? options,
    required Builder$Mutation$CreateDietCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateDietCategory(),
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

class Mutation$CreateDietCategory$createDietCategory {
  Mutation$CreateDietCategory$createDietCategory({
    this.dietCategory,
    this.$__typename = 'createDietCategoryPayload',
  });

  factory Mutation$CreateDietCategory$createDietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$dietCategory = json['dietCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateDietCategory$createDietCategory(
      dietCategory: l$dietCategory == null
          ? null
          : Mutation$CreateDietCategory$createDietCategory$dietCategory.fromJson(
              (l$dietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateDietCategory$createDietCategory$dietCategory?
  dietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$dietCategory = dietCategory;
    _resultData['dietCategory'] = l$dietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$dietCategory = dietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$dietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateDietCategory$createDietCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$dietCategory = dietCategory;
    final lOther$dietCategory = other.dietCategory;
    if (l$dietCategory != lOther$dietCategory) {
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

extension UtilityExtension$Mutation$CreateDietCategory$createDietCategory
    on Mutation$CreateDietCategory$createDietCategory {
  CopyWith$Mutation$CreateDietCategory$createDietCategory<
    Mutation$CreateDietCategory$createDietCategory
  >
  get copyWith =>
      CopyWith$Mutation$CreateDietCategory$createDietCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateDietCategory$createDietCategory<TRes> {
  factory CopyWith$Mutation$CreateDietCategory$createDietCategory(
    Mutation$CreateDietCategory$createDietCategory instance,
    TRes Function(Mutation$CreateDietCategory$createDietCategory) then,
  ) = _CopyWithImpl$Mutation$CreateDietCategory$createDietCategory;

  factory CopyWith$Mutation$CreateDietCategory$createDietCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateDietCategory$createDietCategory;

  TRes call({
    Mutation$CreateDietCategory$createDietCategory$dietCategory? dietCategory,
    String? $__typename,
  });
  CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<TRes>
  get dietCategory;
}

class _CopyWithImpl$Mutation$CreateDietCategory$createDietCategory<TRes>
    implements CopyWith$Mutation$CreateDietCategory$createDietCategory<TRes> {
  _CopyWithImpl$Mutation$CreateDietCategory$createDietCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateDietCategory$createDietCategory _instance;

  final TRes Function(Mutation$CreateDietCategory$createDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? dietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateDietCategory$createDietCategory(
      dietCategory: dietCategory == _undefined
          ? _instance.dietCategory
          : (dietCategory
                as Mutation$CreateDietCategory$createDietCategory$dietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<TRes>
  get dietCategory {
    final local$dietCategory = _instance.dietCategory;
    return local$dietCategory == null
        ? CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory(
            local$dietCategory,
            (e) => call(dietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateDietCategory$createDietCategory<TRes>
    implements CopyWith$Mutation$CreateDietCategory$createDietCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateDietCategory$createDietCategory(this._res);

  TRes _res;

  call({
    Mutation$CreateDietCategory$createDietCategory$dietCategory? dietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<TRes>
  get dietCategory =>
      CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory.stub(
        _res,
      );
}

class Mutation$CreateDietCategory$createDietCategory$dietCategory {
  Mutation$CreateDietCategory$createDietCategory$dietCategory({
    required this.id,
    required this.name,
    this.$__typename = 'DietCategory',
  });

  factory Mutation$CreateDietCategory$createDietCategory$dietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateDietCategory$createDietCategory$dietCategory(
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
    if (other is! Mutation$CreateDietCategory$createDietCategory$dietCategory ||
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

extension UtilityExtension$Mutation$CreateDietCategory$createDietCategory$dietCategory
    on Mutation$CreateDietCategory$createDietCategory$dietCategory {
  CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<
    Mutation$CreateDietCategory$createDietCategory$dietCategory
  >
  get copyWith =>
      CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<
  TRes
> {
  factory CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory(
    Mutation$CreateDietCategory$createDietCategory$dietCategory instance,
    TRes Function(Mutation$CreateDietCategory$createDietCategory$dietCategory)
    then,
  ) = _CopyWithImpl$Mutation$CreateDietCategory$createDietCategory$dietCategory;

  factory CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateDietCategory$createDietCategory$dietCategory;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateDietCategory$createDietCategory$dietCategory<
  TRes
>
    implements
        CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$CreateDietCategory$createDietCategory$dietCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateDietCategory$createDietCategory$dietCategory _instance;

  final TRes Function(
    Mutation$CreateDietCategory$createDietCategory$dietCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateDietCategory$createDietCategory$dietCategory(
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

class _CopyWithStubImpl$Mutation$CreateDietCategory$createDietCategory$dietCategory<
  TRes
>
    implements
        CopyWith$Mutation$CreateDietCategory$createDietCategory$dietCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$CreateDietCategory$createDietCategory$dietCategory(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$UpdateDietCategory {
  factory Variables$Mutation$UpdateDietCategory({
    required Input$updateDietCategoryInput input,
  }) => Variables$Mutation$UpdateDietCategory._({r'input': input});

  Variables$Mutation$UpdateDietCategory._(this._$data);

  factory Variables$Mutation$UpdateDietCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateDietCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateDietCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateDietCategoryInput get input =>
      (_$data['input'] as Input$updateDietCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateDietCategory<
    Variables$Mutation$UpdateDietCategory
  >
  get copyWith =>
      CopyWith$Variables$Mutation$UpdateDietCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateDietCategory ||
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

abstract class CopyWith$Variables$Mutation$UpdateDietCategory<TRes> {
  factory CopyWith$Variables$Mutation$UpdateDietCategory(
    Variables$Mutation$UpdateDietCategory instance,
    TRes Function(Variables$Mutation$UpdateDietCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateDietCategory;

  factory CopyWith$Variables$Mutation$UpdateDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateDietCategory;

  TRes call({Input$updateDietCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateDietCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateDietCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateDietCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateDietCategory _instance;

  final TRes Function(Variables$Mutation$UpdateDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateDietCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateDietCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateDietCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateDietCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateDietCategory(this._res);

  TRes _res;

  call({Input$updateDietCategoryInput? input}) => _res;
}

class Mutation$UpdateDietCategory {
  Mutation$UpdateDietCategory({
    this.updateDietCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateDietCategory.fromJson(Map<String, dynamic> json) {
    final l$updateDietCategory = json['updateDietCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateDietCategory(
      updateDietCategory: l$updateDietCategory == null
          ? null
          : Mutation$UpdateDietCategory$updateDietCategory.fromJson(
              (l$updateDietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateDietCategory$updateDietCategory? updateDietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateDietCategory = updateDietCategory;
    _resultData['updateDietCategory'] = l$updateDietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateDietCategory = updateDietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateDietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateDietCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateDietCategory = updateDietCategory;
    final lOther$updateDietCategory = other.updateDietCategory;
    if (l$updateDietCategory != lOther$updateDietCategory) {
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

extension UtilityExtension$Mutation$UpdateDietCategory
    on Mutation$UpdateDietCategory {
  CopyWith$Mutation$UpdateDietCategory<Mutation$UpdateDietCategory>
  get copyWith => CopyWith$Mutation$UpdateDietCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateDietCategory<TRes> {
  factory CopyWith$Mutation$UpdateDietCategory(
    Mutation$UpdateDietCategory instance,
    TRes Function(Mutation$UpdateDietCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateDietCategory;

  factory CopyWith$Mutation$UpdateDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateDietCategory;

  TRes call({
    Mutation$UpdateDietCategory$updateDietCategory? updateDietCategory,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateDietCategory$updateDietCategory<TRes>
  get updateDietCategory;
}

class _CopyWithImpl$Mutation$UpdateDietCategory<TRes>
    implements CopyWith$Mutation$UpdateDietCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateDietCategory(this._instance, this._then);

  final Mutation$UpdateDietCategory _instance;

  final TRes Function(Mutation$UpdateDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateDietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateDietCategory(
      updateDietCategory: updateDietCategory == _undefined
          ? _instance.updateDietCategory
          : (updateDietCategory
                as Mutation$UpdateDietCategory$updateDietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateDietCategory$updateDietCategory<TRes>
  get updateDietCategory {
    final local$updateDietCategory = _instance.updateDietCategory;
    return local$updateDietCategory == null
        ? CopyWith$Mutation$UpdateDietCategory$updateDietCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateDietCategory$updateDietCategory(
            local$updateDietCategory,
            (e) => call(updateDietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateDietCategory<TRes>
    implements CopyWith$Mutation$UpdateDietCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateDietCategory(this._res);

  TRes _res;

  call({
    Mutation$UpdateDietCategory$updateDietCategory? updateDietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateDietCategory$updateDietCategory<TRes>
  get updateDietCategory =>
      CopyWith$Mutation$UpdateDietCategory$updateDietCategory.stub(_res);
}

const documentNodeMutationUpdateDietCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateDietCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateDietCategoryInput'),
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
            name: NameNode(value: 'updateDietCategory'),
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
                  name: NameNode(value: 'dietCategory'),
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
Mutation$UpdateDietCategory _parserFn$Mutation$UpdateDietCategory(
  Map<String, dynamic> data,
) => Mutation$UpdateDietCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateDietCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$UpdateDietCategory?,
    );

class Options$Mutation$UpdateDietCategory
    extends graphql.MutationOptions<Mutation$UpdateDietCategory> {
  Options$Mutation$UpdateDietCategory({
    String? operationName,
    required Variables$Mutation$UpdateDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateDietCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateDietCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateDietCategory>? update,
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
                     : _parserFn$Mutation$UpdateDietCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateDietCategory,
         parserFn: _parserFn$Mutation$UpdateDietCategory,
       );

  final OnMutationCompleted$Mutation$UpdateDietCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateDietCategory
    extends graphql.WatchQueryOptions<Mutation$UpdateDietCategory> {
  WatchOptions$Mutation$UpdateDietCategory({
    String? operationName,
    required Variables$Mutation$UpdateDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateDietCategory? typedOptimisticResult,
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
         document: documentNodeMutationUpdateDietCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateDietCategory,
       );
}

extension ClientExtension$Mutation$UpdateDietCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateDietCategory>>
  mutate$UpdateDietCategory(
    Options$Mutation$UpdateDietCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateDietCategory>
  watchMutation$UpdateDietCategory(
    WatchOptions$Mutation$UpdateDietCategory options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateDietCategory$HookResult {
  Mutation$UpdateDietCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateDietCategory runMutation;

  final graphql.QueryResult<Mutation$UpdateDietCategory> result;
}

Mutation$UpdateDietCategory$HookResult useMutation$UpdateDietCategory([
  WidgetOptions$Mutation$UpdateDietCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateDietCategory(),
  );
  return Mutation$UpdateDietCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateDietCategory>
useWatchMutation$UpdateDietCategory(
  WatchOptions$Mutation$UpdateDietCategory options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateDietCategory
    extends graphql.MutationOptions<Mutation$UpdateDietCategory> {
  WidgetOptions$Mutation$UpdateDietCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateDietCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateDietCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateDietCategory>? update,
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
                     : _parserFn$Mutation$UpdateDietCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateDietCategory,
         parserFn: _parserFn$Mutation$UpdateDietCategory,
       );

  final OnMutationCompleted$Mutation$UpdateDietCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateDietCategory =
    graphql.MultiSourceResult<Mutation$UpdateDietCategory> Function(
      Variables$Mutation$UpdateDietCategory, {
      Object? optimisticResult,
      Mutation$UpdateDietCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateDietCategory =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateDietCategory,
      graphql.QueryResult<Mutation$UpdateDietCategory>?,
    );

class Mutation$UpdateDietCategory$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateDietCategory> {
  Mutation$UpdateDietCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateDietCategory? options,
    required Builder$Mutation$UpdateDietCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateDietCategory(),
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

class Mutation$UpdateDietCategory$updateDietCategory {
  Mutation$UpdateDietCategory$updateDietCategory({
    this.dietCategory,
    this.$__typename = 'updateDietCategoryPayload',
  });

  factory Mutation$UpdateDietCategory$updateDietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$dietCategory = json['dietCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateDietCategory$updateDietCategory(
      dietCategory: l$dietCategory == null
          ? null
          : Mutation$UpdateDietCategory$updateDietCategory$dietCategory.fromJson(
              (l$dietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateDietCategory$updateDietCategory$dietCategory?
  dietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$dietCategory = dietCategory;
    _resultData['dietCategory'] = l$dietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$dietCategory = dietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$dietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateDietCategory$updateDietCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$dietCategory = dietCategory;
    final lOther$dietCategory = other.dietCategory;
    if (l$dietCategory != lOther$dietCategory) {
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

extension UtilityExtension$Mutation$UpdateDietCategory$updateDietCategory
    on Mutation$UpdateDietCategory$updateDietCategory {
  CopyWith$Mutation$UpdateDietCategory$updateDietCategory<
    Mutation$UpdateDietCategory$updateDietCategory
  >
  get copyWith =>
      CopyWith$Mutation$UpdateDietCategory$updateDietCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateDietCategory$updateDietCategory<TRes> {
  factory CopyWith$Mutation$UpdateDietCategory$updateDietCategory(
    Mutation$UpdateDietCategory$updateDietCategory instance,
    TRes Function(Mutation$UpdateDietCategory$updateDietCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateDietCategory$updateDietCategory;

  factory CopyWith$Mutation$UpdateDietCategory$updateDietCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateDietCategory$updateDietCategory;

  TRes call({
    Mutation$UpdateDietCategory$updateDietCategory$dietCategory? dietCategory,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<TRes>
  get dietCategory;
}

class _CopyWithImpl$Mutation$UpdateDietCategory$updateDietCategory<TRes>
    implements CopyWith$Mutation$UpdateDietCategory$updateDietCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateDietCategory$updateDietCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateDietCategory$updateDietCategory _instance;

  final TRes Function(Mutation$UpdateDietCategory$updateDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? dietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateDietCategory$updateDietCategory(
      dietCategory: dietCategory == _undefined
          ? _instance.dietCategory
          : (dietCategory
                as Mutation$UpdateDietCategory$updateDietCategory$dietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<TRes>
  get dietCategory {
    final local$dietCategory = _instance.dietCategory;
    return local$dietCategory == null
        ? CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
            local$dietCategory,
            (e) => call(dietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateDietCategory$updateDietCategory<TRes>
    implements CopyWith$Mutation$UpdateDietCategory$updateDietCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateDietCategory$updateDietCategory(this._res);

  TRes _res;

  call({
    Mutation$UpdateDietCategory$updateDietCategory$dietCategory? dietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<TRes>
  get dietCategory =>
      CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory.stub(
        _res,
      );
}

class Mutation$UpdateDietCategory$updateDietCategory$dietCategory {
  Mutation$UpdateDietCategory$updateDietCategory$dietCategory({
    required this.id,
    required this.name,
    this.$__typename = 'DietCategory',
  });

  factory Mutation$UpdateDietCategory$updateDietCategory$dietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
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
    if (other is! Mutation$UpdateDietCategory$updateDietCategory$dietCategory ||
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

extension UtilityExtension$Mutation$UpdateDietCategory$updateDietCategory$dietCategory
    on Mutation$UpdateDietCategory$updateDietCategory$dietCategory {
  CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<
    Mutation$UpdateDietCategory$updateDietCategory$dietCategory
  >
  get copyWith =>
      CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<
  TRes
> {
  factory CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
    Mutation$UpdateDietCategory$updateDietCategory$dietCategory instance,
    TRes Function(Mutation$UpdateDietCategory$updateDietCategory$dietCategory)
    then,
  ) = _CopyWithImpl$Mutation$UpdateDietCategory$updateDietCategory$dietCategory;

  factory CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateDietCategory$updateDietCategory$dietCategory;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<
  TRes
>
    implements
        CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateDietCategory$updateDietCategory$dietCategory _instance;

  final TRes Function(
    Mutation$UpdateDietCategory$updateDietCategory$dietCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
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

class _CopyWithStubImpl$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<
  TRes
>
    implements
        CopyWith$Mutation$UpdateDietCategory$updateDietCategory$dietCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$UpdateDietCategory$updateDietCategory$dietCategory(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$DeleteDietCategory {
  factory Variables$Mutation$DeleteDietCategory({
    required Input$deleteDietCategoryInput input,
  }) => Variables$Mutation$DeleteDietCategory._({r'input': input});

  Variables$Mutation$DeleteDietCategory._(this._$data);

  factory Variables$Mutation$DeleteDietCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteDietCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteDietCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteDietCategoryInput get input =>
      (_$data['input'] as Input$deleteDietCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteDietCategory<
    Variables$Mutation$DeleteDietCategory
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DeleteDietCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteDietCategory ||
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

abstract class CopyWith$Variables$Mutation$DeleteDietCategory<TRes> {
  factory CopyWith$Variables$Mutation$DeleteDietCategory(
    Variables$Mutation$DeleteDietCategory instance,
    TRes Function(Variables$Mutation$DeleteDietCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteDietCategory;

  factory CopyWith$Variables$Mutation$DeleteDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteDietCategory;

  TRes call({Input$deleteDietCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteDietCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteDietCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteDietCategory(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteDietCategory _instance;

  final TRes Function(Variables$Mutation$DeleteDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteDietCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteDietCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteDietCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteDietCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteDietCategory(this._res);

  TRes _res;

  call({Input$deleteDietCategoryInput? input}) => _res;
}

class Mutation$DeleteDietCategory {
  Mutation$DeleteDietCategory({
    this.deleteDietCategory,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteDietCategory.fromJson(Map<String, dynamic> json) {
    final l$deleteDietCategory = json['deleteDietCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteDietCategory(
      deleteDietCategory: l$deleteDietCategory == null
          ? null
          : Mutation$DeleteDietCategory$deleteDietCategory.fromJson(
              (l$deleteDietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteDietCategory$deleteDietCategory? deleteDietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteDietCategory = deleteDietCategory;
    _resultData['deleteDietCategory'] = l$deleteDietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteDietCategory = deleteDietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteDietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteDietCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteDietCategory = deleteDietCategory;
    final lOther$deleteDietCategory = other.deleteDietCategory;
    if (l$deleteDietCategory != lOther$deleteDietCategory) {
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

extension UtilityExtension$Mutation$DeleteDietCategory
    on Mutation$DeleteDietCategory {
  CopyWith$Mutation$DeleteDietCategory<Mutation$DeleteDietCategory>
  get copyWith => CopyWith$Mutation$DeleteDietCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteDietCategory<TRes> {
  factory CopyWith$Mutation$DeleteDietCategory(
    Mutation$DeleteDietCategory instance,
    TRes Function(Mutation$DeleteDietCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteDietCategory;

  factory CopyWith$Mutation$DeleteDietCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteDietCategory;

  TRes call({
    Mutation$DeleteDietCategory$deleteDietCategory? deleteDietCategory,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<TRes>
  get deleteDietCategory;
}

class _CopyWithImpl$Mutation$DeleteDietCategory<TRes>
    implements CopyWith$Mutation$DeleteDietCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteDietCategory(this._instance, this._then);

  final Mutation$DeleteDietCategory _instance;

  final TRes Function(Mutation$DeleteDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteDietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteDietCategory(
      deleteDietCategory: deleteDietCategory == _undefined
          ? _instance.deleteDietCategory
          : (deleteDietCategory
                as Mutation$DeleteDietCategory$deleteDietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<TRes>
  get deleteDietCategory {
    final local$deleteDietCategory = _instance.deleteDietCategory;
    return local$deleteDietCategory == null
        ? CopyWith$Mutation$DeleteDietCategory$deleteDietCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteDietCategory$deleteDietCategory(
            local$deleteDietCategory,
            (e) => call(deleteDietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteDietCategory<TRes>
    implements CopyWith$Mutation$DeleteDietCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteDietCategory(this._res);

  TRes _res;

  call({
    Mutation$DeleteDietCategory$deleteDietCategory? deleteDietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<TRes>
  get deleteDietCategory =>
      CopyWith$Mutation$DeleteDietCategory$deleteDietCategory.stub(_res);
}

const documentNodeMutationDeleteDietCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteDietCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteDietCategoryInput'),
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
            name: NameNode(value: 'deleteDietCategory'),
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
                  name: NameNode(value: 'dietCategory'),
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
Mutation$DeleteDietCategory _parserFn$Mutation$DeleteDietCategory(
  Map<String, dynamic> data,
) => Mutation$DeleteDietCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteDietCategory =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$DeleteDietCategory?,
    );

class Options$Mutation$DeleteDietCategory
    extends graphql.MutationOptions<Mutation$DeleteDietCategory> {
  Options$Mutation$DeleteDietCategory({
    String? operationName,
    required Variables$Mutation$DeleteDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteDietCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteDietCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteDietCategory>? update,
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
                     : _parserFn$Mutation$DeleteDietCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteDietCategory,
         parserFn: _parserFn$Mutation$DeleteDietCategory,
       );

  final OnMutationCompleted$Mutation$DeleteDietCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteDietCategory
    extends graphql.WatchQueryOptions<Mutation$DeleteDietCategory> {
  WatchOptions$Mutation$DeleteDietCategory({
    String? operationName,
    required Variables$Mutation$DeleteDietCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteDietCategory? typedOptimisticResult,
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
         document: documentNodeMutationDeleteDietCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteDietCategory,
       );
}

extension ClientExtension$Mutation$DeleteDietCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteDietCategory>>
  mutate$DeleteDietCategory(
    Options$Mutation$DeleteDietCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteDietCategory>
  watchMutation$DeleteDietCategory(
    WatchOptions$Mutation$DeleteDietCategory options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteDietCategory$HookResult {
  Mutation$DeleteDietCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteDietCategory runMutation;

  final graphql.QueryResult<Mutation$DeleteDietCategory> result;
}

Mutation$DeleteDietCategory$HookResult useMutation$DeleteDietCategory([
  WidgetOptions$Mutation$DeleteDietCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteDietCategory(),
  );
  return Mutation$DeleteDietCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteDietCategory>
useWatchMutation$DeleteDietCategory(
  WatchOptions$Mutation$DeleteDietCategory options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteDietCategory
    extends graphql.MutationOptions<Mutation$DeleteDietCategory> {
  WidgetOptions$Mutation$DeleteDietCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteDietCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteDietCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteDietCategory>? update,
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
                     : _parserFn$Mutation$DeleteDietCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteDietCategory,
         parserFn: _parserFn$Mutation$DeleteDietCategory,
       );

  final OnMutationCompleted$Mutation$DeleteDietCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteDietCategory =
    graphql.MultiSourceResult<Mutation$DeleteDietCategory> Function(
      Variables$Mutation$DeleteDietCategory, {
      Object? optimisticResult,
      Mutation$DeleteDietCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteDietCategory =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteDietCategory,
      graphql.QueryResult<Mutation$DeleteDietCategory>?,
    );

class Mutation$DeleteDietCategory$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteDietCategory> {
  Mutation$DeleteDietCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteDietCategory? options,
    required Builder$Mutation$DeleteDietCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteDietCategory(),
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

class Mutation$DeleteDietCategory$deleteDietCategory {
  Mutation$DeleteDietCategory$deleteDietCategory({
    this.dietCategory,
    this.$__typename = 'deleteDietCategoryPayload',
  });

  factory Mutation$DeleteDietCategory$deleteDietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$dietCategory = json['dietCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteDietCategory$deleteDietCategory(
      dietCategory: l$dietCategory == null
          ? null
          : Mutation$DeleteDietCategory$deleteDietCategory$dietCategory.fromJson(
              (l$dietCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteDietCategory$deleteDietCategory$dietCategory?
  dietCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$dietCategory = dietCategory;
    _resultData['dietCategory'] = l$dietCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$dietCategory = dietCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$dietCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteDietCategory$deleteDietCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$dietCategory = dietCategory;
    final lOther$dietCategory = other.dietCategory;
    if (l$dietCategory != lOther$dietCategory) {
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

extension UtilityExtension$Mutation$DeleteDietCategory$deleteDietCategory
    on Mutation$DeleteDietCategory$deleteDietCategory {
  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<
    Mutation$DeleteDietCategory$deleteDietCategory
  >
  get copyWith =>
      CopyWith$Mutation$DeleteDietCategory$deleteDietCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<TRes> {
  factory CopyWith$Mutation$DeleteDietCategory$deleteDietCategory(
    Mutation$DeleteDietCategory$deleteDietCategory instance,
    TRes Function(Mutation$DeleteDietCategory$deleteDietCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteDietCategory$deleteDietCategory;

  factory CopyWith$Mutation$DeleteDietCategory$deleteDietCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteDietCategory$deleteDietCategory;

  TRes call({
    Mutation$DeleteDietCategory$deleteDietCategory$dietCategory? dietCategory,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<TRes>
  get dietCategory;
}

class _CopyWithImpl$Mutation$DeleteDietCategory$deleteDietCategory<TRes>
    implements CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteDietCategory$deleteDietCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteDietCategory$deleteDietCategory _instance;

  final TRes Function(Mutation$DeleteDietCategory$deleteDietCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? dietCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteDietCategory$deleteDietCategory(
      dietCategory: dietCategory == _undefined
          ? _instance.dietCategory
          : (dietCategory
                as Mutation$DeleteDietCategory$deleteDietCategory$dietCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<TRes>
  get dietCategory {
    final local$dietCategory = _instance.dietCategory;
    return local$dietCategory == null
        ? CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
            local$dietCategory,
            (e) => call(dietCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteDietCategory$deleteDietCategory<TRes>
    implements CopyWith$Mutation$DeleteDietCategory$deleteDietCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteDietCategory$deleteDietCategory(this._res);

  TRes _res;

  call({
    Mutation$DeleteDietCategory$deleteDietCategory$dietCategory? dietCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<TRes>
  get dietCategory =>
      CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory.stub(
        _res,
      );
}

class Mutation$DeleteDietCategory$deleteDietCategory$dietCategory {
  Mutation$DeleteDietCategory$deleteDietCategory$dietCategory({
    required this.id,
    this.$__typename = 'DietCategory',
  });

  factory Mutation$DeleteDietCategory$deleteDietCategory$dietCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
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
    if (other is! Mutation$DeleteDietCategory$deleteDietCategory$dietCategory ||
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

extension UtilityExtension$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory
    on Mutation$DeleteDietCategory$deleteDietCategory$dietCategory {
  CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<
    Mutation$DeleteDietCategory$deleteDietCategory$dietCategory
  >
  get copyWith =>
      CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<
  TRes
> {
  factory CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
    Mutation$DeleteDietCategory$deleteDietCategory$dietCategory instance,
    TRes Function(Mutation$DeleteDietCategory$deleteDietCategory$dietCategory)
    then,
  ) = _CopyWithImpl$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory;

  factory CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<
  TRes
>
    implements
        CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<
          TRes
        > {
  _CopyWithImpl$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteDietCategory$deleteDietCategory$dietCategory _instance;

  final TRes Function(
    Mutation$DeleteDietCategory$deleteDietCategory$dietCategory,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<
  TRes
>
    implements
        CopyWith$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory<
          TRes
        > {
  _CopyWithStubImpl$Mutation$DeleteDietCategory$deleteDietCategory$dietCategory(
    this._res,
  );

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
