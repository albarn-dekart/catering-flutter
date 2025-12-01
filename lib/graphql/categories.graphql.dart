import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$GetCategories {
  factory Variables$Query$GetCategories({int? first, String? after}) =>
      Variables$Query$GetCategories._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
      });

  Variables$Query$GetCategories._(this._$data);

  factory Variables$Query$GetCategories.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    return Variables$Query$GetCategories._(result$data);
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

  CopyWith$Variables$Query$GetCategories<Variables$Query$GetCategories>
  get copyWith => CopyWith$Variables$Query$GetCategories(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetCategories ||
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

abstract class CopyWith$Variables$Query$GetCategories<TRes> {
  factory CopyWith$Variables$Query$GetCategories(
    Variables$Query$GetCategories instance,
    TRes Function(Variables$Query$GetCategories) then,
  ) = _CopyWithImpl$Variables$Query$GetCategories;

  factory CopyWith$Variables$Query$GetCategories.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCategories;

  TRes call({int? first, String? after});
}

class _CopyWithImpl$Variables$Query$GetCategories<TRes>
    implements CopyWith$Variables$Query$GetCategories<TRes> {
  _CopyWithImpl$Variables$Query$GetCategories(this._instance, this._then);

  final Variables$Query$GetCategories _instance;

  final TRes Function(Variables$Query$GetCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? first = _undefined, Object? after = _undefined}) => _then(
    Variables$Query$GetCategories._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetCategories<TRes>
    implements CopyWith$Variables$Query$GetCategories<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCategories(this._res);

  TRes _res;

  call({int? first, String? after}) => _res;
}

class Query$GetCategories {
  Query$GetCategories({this.categories, this.$__typename = 'Query'});

  factory Query$GetCategories.fromJson(Map<String, dynamic> json) {
    final l$categories = json['categories'];
    final l$$__typename = json['__typename'];
    return Query$GetCategories(
      categories: l$categories == null
          ? null
          : Query$GetCategories$categories.fromJson(
              (l$categories as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCategories$categories? categories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$categories = categories;
    _resultData['categories'] = l$categories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$categories = categories;
    final l$$__typename = $__typename;
    return Object.hashAll([l$categories, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCategories || runtimeType != other.runtimeType) {
      return false;
    }
    final l$categories = categories;
    final lOther$categories = other.categories;
    if (l$categories != lOther$categories) {
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

extension UtilityExtension$Query$GetCategories on Query$GetCategories {
  CopyWith$Query$GetCategories<Query$GetCategories> get copyWith =>
      CopyWith$Query$GetCategories(this, (i) => i);
}

abstract class CopyWith$Query$GetCategories<TRes> {
  factory CopyWith$Query$GetCategories(
    Query$GetCategories instance,
    TRes Function(Query$GetCategories) then,
  ) = _CopyWithImpl$Query$GetCategories;

  factory CopyWith$Query$GetCategories.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategories;

  TRes call({Query$GetCategories$categories? categories, String? $__typename});
  CopyWith$Query$GetCategories$categories<TRes> get categories;
}

class _CopyWithImpl$Query$GetCategories<TRes>
    implements CopyWith$Query$GetCategories<TRes> {
  _CopyWithImpl$Query$GetCategories(this._instance, this._then);

  final Query$GetCategories _instance;

  final TRes Function(Query$GetCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? categories = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCategories(
      categories: categories == _undefined
          ? _instance.categories
          : (categories as Query$GetCategories$categories?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCategories$categories<TRes> get categories {
    final local$categories = _instance.categories;
    return local$categories == null
        ? CopyWith$Query$GetCategories$categories.stub(_then(_instance))
        : CopyWith$Query$GetCategories$categories(
            local$categories,
            (e) => call(categories: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCategories<TRes>
    implements CopyWith$Query$GetCategories<TRes> {
  _CopyWithStubImpl$Query$GetCategories(this._res);

  TRes _res;

  call({Query$GetCategories$categories? categories, String? $__typename}) =>
      _res;

  CopyWith$Query$GetCategories$categories<TRes> get categories =>
      CopyWith$Query$GetCategories$categories.stub(_res);
}

const documentNodeQueryGetCategories = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCategories'),
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
            name: NameNode(value: 'categories'),
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
Query$GetCategories _parserFn$Query$GetCategories(Map<String, dynamic> data) =>
    Query$GetCategories.fromJson(data);
typedef OnQueryComplete$Query$GetCategories =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetCategories?);

class Options$Query$GetCategories
    extends graphql.QueryOptions<Query$GetCategories> {
  Options$Query$GetCategories({
    String? operationName,
    Variables$Query$GetCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCategories? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetCategories? onComplete,
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
                 data == null ? null : _parserFn$Query$GetCategories(data),
               ),
         onError: onError,
         document: documentNodeQueryGetCategories,
         parserFn: _parserFn$Query$GetCategories,
       );

  final OnQueryComplete$Query$GetCategories? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetCategories
    extends graphql.WatchQueryOptions<Query$GetCategories> {
  WatchOptions$Query$GetCategories({
    String? operationName,
    Variables$Query$GetCategories? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCategories? typedOptimisticResult,
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
         document: documentNodeQueryGetCategories,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetCategories,
       );
}

class FetchMoreOptions$Query$GetCategories extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetCategories({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetCategories? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetCategories,
       );
}

extension ClientExtension$Query$GetCategories on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetCategories>> query$GetCategories([
    Options$Query$GetCategories? options,
  ]) async => await this.query(options ?? Options$Query$GetCategories());

  graphql.ObservableQuery<Query$GetCategories> watchQuery$GetCategories([
    WatchOptions$Query$GetCategories? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetCategories());

  void writeQuery$GetCategories({
    required Query$GetCategories data,
    Variables$Query$GetCategories? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetCategories),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetCategories? readQuery$GetCategories({
    Variables$Query$GetCategories? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetCategories),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetCategories.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetCategories> useQuery$GetCategories([
  Options$Query$GetCategories? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetCategories());
graphql.ObservableQuery<Query$GetCategories> useWatchQuery$GetCategories([
  WatchOptions$Query$GetCategories? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetCategories(),
);

class Query$GetCategories$Widget
    extends graphql_flutter.Query<Query$GetCategories> {
  Query$GetCategories$Widget({
    widgets.Key? key,
    Options$Query$GetCategories? options,
    required graphql_flutter.QueryBuilder<Query$GetCategories> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetCategories(),
         builder: builder,
       );
}

class Query$GetCategories$categories {
  Query$GetCategories$categories({
    this.edges,
    required this.pageInfo,
    this.$__typename = 'CategoryCursorConnection',
  });

  factory Query$GetCategories$categories.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetCategories$categories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetCategories$categories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetCategories$categories$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCategories$categories$edges?>? edges;

  final Query$GetCategories$categories$pageInfo pageInfo;

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
    if (other is! Query$GetCategories$categories ||
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

extension UtilityExtension$Query$GetCategories$categories
    on Query$GetCategories$categories {
  CopyWith$Query$GetCategories$categories<Query$GetCategories$categories>
  get copyWith => CopyWith$Query$GetCategories$categories(this, (i) => i);
}

abstract class CopyWith$Query$GetCategories$categories<TRes> {
  factory CopyWith$Query$GetCategories$categories(
    Query$GetCategories$categories instance,
    TRes Function(Query$GetCategories$categories) then,
  ) = _CopyWithImpl$Query$GetCategories$categories;

  factory CopyWith$Query$GetCategories$categories.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategories$categories;

  TRes call({
    List<Query$GetCategories$categories$edges?>? edges,
    Query$GetCategories$categories$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetCategories$categories$edges?>? Function(
      Iterable<
        CopyWith$Query$GetCategories$categories$edges<
          Query$GetCategories$categories$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetCategories$categories$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetCategories$categories<TRes>
    implements CopyWith$Query$GetCategories$categories<TRes> {
  _CopyWithImpl$Query$GetCategories$categories(this._instance, this._then);

  final Query$GetCategories$categories _instance;

  final TRes Function(Query$GetCategories$categories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCategories$categories(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetCategories$categories$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetCategories$categories$pageInfo),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetCategories$categories$edges?>? Function(
      Iterable<
        CopyWith$Query$GetCategories$categories$edges<
          Query$GetCategories$categories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetCategories$categories$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetCategories$categories$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetCategories$categories$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetCategories$categories<TRes>
    implements CopyWith$Query$GetCategories$categories<TRes> {
  _CopyWithStubImpl$Query$GetCategories$categories(this._res);

  TRes _res;

  call({
    List<Query$GetCategories$categories$edges?>? edges,
    Query$GetCategories$categories$pageInfo? pageInfo,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetCategories$categories$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetCategories$categories$pageInfo.stub(_res);
}

class Query$GetCategories$categories$edges {
  Query$GetCategories$categories$edges({
    this.node,
    this.$__typename = 'CategoryEdge',
  });

  factory Query$GetCategories$categories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetCategories$categories$edges(
      node: l$node == null
          ? null
          : Query$GetCategories$categories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCategories$categories$edges$node? node;

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
    if (other is! Query$GetCategories$categories$edges ||
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

extension UtilityExtension$Query$GetCategories$categories$edges
    on Query$GetCategories$categories$edges {
  CopyWith$Query$GetCategories$categories$edges<
    Query$GetCategories$categories$edges
  >
  get copyWith => CopyWith$Query$GetCategories$categories$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetCategories$categories$edges<TRes> {
  factory CopyWith$Query$GetCategories$categories$edges(
    Query$GetCategories$categories$edges instance,
    TRes Function(Query$GetCategories$categories$edges) then,
  ) = _CopyWithImpl$Query$GetCategories$categories$edges;

  factory CopyWith$Query$GetCategories$categories$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategories$categories$edges;

  TRes call({
    Query$GetCategories$categories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetCategories$categories$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetCategories$categories$edges<TRes>
    implements CopyWith$Query$GetCategories$categories$edges<TRes> {
  _CopyWithImpl$Query$GetCategories$categories$edges(
    this._instance,
    this._then,
  );

  final Query$GetCategories$categories$edges _instance;

  final TRes Function(Query$GetCategories$categories$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetCategories$categories$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Query$GetCategories$categories$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetCategories$categories$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetCategories$categories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetCategories$categories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCategories$categories$edges<TRes>
    implements CopyWith$Query$GetCategories$categories$edges<TRes> {
  _CopyWithStubImpl$Query$GetCategories$categories$edges(this._res);

  TRes _res;

  call({
    Query$GetCategories$categories$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetCategories$categories$edges$node<TRes> get node =>
      CopyWith$Query$GetCategories$categories$edges$node.stub(_res);
}

class Query$GetCategories$categories$edges$node {
  Query$GetCategories$categories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Query$GetCategories$categories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetCategories$categories$edges$node(
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
    if (other is! Query$GetCategories$categories$edges$node ||
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

extension UtilityExtension$Query$GetCategories$categories$edges$node
    on Query$GetCategories$categories$edges$node {
  CopyWith$Query$GetCategories$categories$edges$node<
    Query$GetCategories$categories$edges$node
  >
  get copyWith =>
      CopyWith$Query$GetCategories$categories$edges$node(this, (i) => i);
}

abstract class CopyWith$Query$GetCategories$categories$edges$node<TRes> {
  factory CopyWith$Query$GetCategories$categories$edges$node(
    Query$GetCategories$categories$edges$node instance,
    TRes Function(Query$GetCategories$categories$edges$node) then,
  ) = _CopyWithImpl$Query$GetCategories$categories$edges$node;

  factory CopyWith$Query$GetCategories$categories$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategories$categories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetCategories$categories$edges$node<TRes>
    implements CopyWith$Query$GetCategories$categories$edges$node<TRes> {
  _CopyWithImpl$Query$GetCategories$categories$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetCategories$categories$edges$node _instance;

  final TRes Function(Query$GetCategories$categories$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCategories$categories$edges$node(
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

class _CopyWithStubImpl$Query$GetCategories$categories$edges$node<TRes>
    implements CopyWith$Query$GetCategories$categories$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetCategories$categories$edges$node(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Query$GetCategories$categories$pageInfo {
  Query$GetCategories$categories$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'CategoryPageInfo',
  });

  factory Query$GetCategories$categories$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetCategories$categories$pageInfo(
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
    if (other is! Query$GetCategories$categories$pageInfo ||
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

extension UtilityExtension$Query$GetCategories$categories$pageInfo
    on Query$GetCategories$categories$pageInfo {
  CopyWith$Query$GetCategories$categories$pageInfo<
    Query$GetCategories$categories$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetCategories$categories$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetCategories$categories$pageInfo<TRes> {
  factory CopyWith$Query$GetCategories$categories$pageInfo(
    Query$GetCategories$categories$pageInfo instance,
    TRes Function(Query$GetCategories$categories$pageInfo) then,
  ) = _CopyWithImpl$Query$GetCategories$categories$pageInfo;

  factory CopyWith$Query$GetCategories$categories$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategories$categories$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetCategories$categories$pageInfo<TRes>
    implements CopyWith$Query$GetCategories$categories$pageInfo<TRes> {
  _CopyWithImpl$Query$GetCategories$categories$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetCategories$categories$pageInfo _instance;

  final TRes Function(Query$GetCategories$categories$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCategories$categories$pageInfo(
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

class _CopyWithStubImpl$Query$GetCategories$categories$pageInfo<TRes>
    implements CopyWith$Query$GetCategories$categories$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetCategories$categories$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetCategory {
  factory Variables$Query$GetCategory({required String id}) =>
      Variables$Query$GetCategory._({r'id': id});

  Variables$Query$GetCategory._(this._$data);

  factory Variables$Query$GetCategory.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetCategory<Variables$Query$GetCategory>
  get copyWith => CopyWith$Variables$Query$GetCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetCategory ||
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

abstract class CopyWith$Variables$Query$GetCategory<TRes> {
  factory CopyWith$Variables$Query$GetCategory(
    Variables$Query$GetCategory instance,
    TRes Function(Variables$Query$GetCategory) then,
  ) = _CopyWithImpl$Variables$Query$GetCategory;

  factory CopyWith$Variables$Query$GetCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCategory;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetCategory<TRes>
    implements CopyWith$Variables$Query$GetCategory<TRes> {
  _CopyWithImpl$Variables$Query$GetCategory(this._instance, this._then);

  final Variables$Query$GetCategory _instance;

  final TRes Function(Variables$Query$GetCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetCategory._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetCategory<TRes>
    implements CopyWith$Variables$Query$GetCategory<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCategory(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetCategory {
  Query$GetCategory({this.category, this.$__typename = 'Query'});

  factory Query$GetCategory.fromJson(Map<String, dynamic> json) {
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Query$GetCategory(
      category: l$category == null
          ? null
          : Query$GetCategory$category.fromJson(
              (l$category as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCategory$category? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category = category;
    _resultData['category'] = l$category?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Query$GetCategory on Query$GetCategory {
  CopyWith$Query$GetCategory<Query$GetCategory> get copyWith =>
      CopyWith$Query$GetCategory(this, (i) => i);
}

abstract class CopyWith$Query$GetCategory<TRes> {
  factory CopyWith$Query$GetCategory(
    Query$GetCategory instance,
    TRes Function(Query$GetCategory) then,
  ) = _CopyWithImpl$Query$GetCategory;

  factory CopyWith$Query$GetCategory.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategory;

  TRes call({Query$GetCategory$category? category, String? $__typename});
  CopyWith$Query$GetCategory$category<TRes> get category;
}

class _CopyWithImpl$Query$GetCategory<TRes>
    implements CopyWith$Query$GetCategory<TRes> {
  _CopyWithImpl$Query$GetCategory(this._instance, this._then);

  final Query$GetCategory _instance;

  final TRes Function(Query$GetCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCategory(
      category: category == _undefined
          ? _instance.category
          : (category as Query$GetCategory$category?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetCategory$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Query$GetCategory$category.stub(_then(_instance))
        : CopyWith$Query$GetCategory$category(
            local$category,
            (e) => call(category: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetCategory<TRes>
    implements CopyWith$Query$GetCategory<TRes> {
  _CopyWithStubImpl$Query$GetCategory(this._res);

  TRes _res;

  call({Query$GetCategory$category? category, String? $__typename}) => _res;

  CopyWith$Query$GetCategory$category<TRes> get category =>
      CopyWith$Query$GetCategory$category.stub(_res);
}

const documentNodeQueryGetCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetCategory'),
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
            name: NameNode(value: 'category'),
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
Query$GetCategory _parserFn$Query$GetCategory(Map<String, dynamic> data) =>
    Query$GetCategory.fromJson(data);
typedef OnQueryComplete$Query$GetCategory =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetCategory?);

class Options$Query$GetCategory
    extends graphql.QueryOptions<Query$GetCategory> {
  Options$Query$GetCategory({
    String? operationName,
    required Variables$Query$GetCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCategory? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetCategory? onComplete,
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
                 data == null ? null : _parserFn$Query$GetCategory(data),
               ),
         onError: onError,
         document: documentNodeQueryGetCategory,
         parserFn: _parserFn$Query$GetCategory,
       );

  final OnQueryComplete$Query$GetCategory? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetCategory
    extends graphql.WatchQueryOptions<Query$GetCategory> {
  WatchOptions$Query$GetCategory({
    String? operationName,
    required Variables$Query$GetCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetCategory? typedOptimisticResult,
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
         document: documentNodeQueryGetCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetCategory,
       );
}

class FetchMoreOptions$Query$GetCategory extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetCategory({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetCategory variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetCategory,
       );
}

extension ClientExtension$Query$GetCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetCategory>> query$GetCategory(
    Options$Query$GetCategory options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetCategory> watchQuery$GetCategory(
    WatchOptions$Query$GetCategory options,
  ) => this.watchQuery(options);

  void writeQuery$GetCategory({
    required Query$GetCategory data,
    required Variables$Query$GetCategory variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetCategory),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetCategory? readQuery$GetCategory({
    required Variables$Query$GetCategory variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetCategory),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetCategory.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetCategory> useQuery$GetCategory(
  Options$Query$GetCategory options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetCategory> useWatchQuery$GetCategory(
  WatchOptions$Query$GetCategory options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetCategory$Widget
    extends graphql_flutter.Query<Query$GetCategory> {
  Query$GetCategory$Widget({
    widgets.Key? key,
    required Options$Query$GetCategory options,
    required graphql_flutter.QueryBuilder<Query$GetCategory> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetCategory$category {
  Query$GetCategory$category({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Query$GetCategory$category.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Query$GetCategory$category(
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
    if (other is! Query$GetCategory$category ||
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

extension UtilityExtension$Query$GetCategory$category
    on Query$GetCategory$category {
  CopyWith$Query$GetCategory$category<Query$GetCategory$category>
  get copyWith => CopyWith$Query$GetCategory$category(this, (i) => i);
}

abstract class CopyWith$Query$GetCategory$category<TRes> {
  factory CopyWith$Query$GetCategory$category(
    Query$GetCategory$category instance,
    TRes Function(Query$GetCategory$category) then,
  ) = _CopyWithImpl$Query$GetCategory$category;

  factory CopyWith$Query$GetCategory$category.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCategory$category;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Query$GetCategory$category<TRes>
    implements CopyWith$Query$GetCategory$category<TRes> {
  _CopyWithImpl$Query$GetCategory$category(this._instance, this._then);

  final Query$GetCategory$category _instance;

  final TRes Function(Query$GetCategory$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetCategory$category(
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

class _CopyWithStubImpl$Query$GetCategory$category<TRes>
    implements CopyWith$Query$GetCategory$category<TRes> {
  _CopyWithStubImpl$Query$GetCategory$category(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$CreateCategory {
  factory Variables$Mutation$CreateCategory({
    required Input$createCategoryInput input,
  }) => Variables$Mutation$CreateCategory._({r'input': input});

  Variables$Mutation$CreateCategory._(this._$data);

  factory Variables$Mutation$CreateCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createCategoryInput get input =>
      (_$data['input'] as Input$createCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateCategory<Variables$Mutation$CreateCategory>
  get copyWith => CopyWith$Variables$Mutation$CreateCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateCategory ||
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

abstract class CopyWith$Variables$Mutation$CreateCategory<TRes> {
  factory CopyWith$Variables$Mutation$CreateCategory(
    Variables$Mutation$CreateCategory instance,
    TRes Function(Variables$Mutation$CreateCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateCategory;

  factory CopyWith$Variables$Mutation$CreateCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateCategory;

  TRes call({Input$createCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateCategory(this._instance, this._then);

  final Variables$Mutation$CreateCategory _instance;

  final TRes Function(Variables$Mutation$CreateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateCategory<TRes>
    implements CopyWith$Variables$Mutation$CreateCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateCategory(this._res);

  TRes _res;

  call({Input$createCategoryInput? input}) => _res;
}

class Mutation$CreateCategory {
  Mutation$CreateCategory({this.createCategory, this.$__typename = 'Mutation'});

  factory Mutation$CreateCategory.fromJson(Map<String, dynamic> json) {
    final l$createCategory = json['createCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCategory(
      createCategory: l$createCategory == null
          ? null
          : Mutation$CreateCategory$createCategory.fromJson(
              (l$createCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateCategory$createCategory? createCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createCategory = createCategory;
    _resultData['createCategory'] = l$createCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createCategory = createCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createCategory = createCategory;
    final lOther$createCategory = other.createCategory;
    if (l$createCategory != lOther$createCategory) {
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

extension UtilityExtension$Mutation$CreateCategory on Mutation$CreateCategory {
  CopyWith$Mutation$CreateCategory<Mutation$CreateCategory> get copyWith =>
      CopyWith$Mutation$CreateCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateCategory<TRes> {
  factory CopyWith$Mutation$CreateCategory(
    Mutation$CreateCategory instance,
    TRes Function(Mutation$CreateCategory) then,
  ) = _CopyWithImpl$Mutation$CreateCategory;

  factory CopyWith$Mutation$CreateCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCategory;

  TRes call({
    Mutation$CreateCategory$createCategory? createCategory,
    String? $__typename,
  });
  CopyWith$Mutation$CreateCategory$createCategory<TRes> get createCategory;
}

class _CopyWithImpl$Mutation$CreateCategory<TRes>
    implements CopyWith$Mutation$CreateCategory<TRes> {
  _CopyWithImpl$Mutation$CreateCategory(this._instance, this._then);

  final Mutation$CreateCategory _instance;

  final TRes Function(Mutation$CreateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateCategory(
      createCategory: createCategory == _undefined
          ? _instance.createCategory
          : (createCategory as Mutation$CreateCategory$createCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateCategory$createCategory<TRes> get createCategory {
    final local$createCategory = _instance.createCategory;
    return local$createCategory == null
        ? CopyWith$Mutation$CreateCategory$createCategory.stub(_then(_instance))
        : CopyWith$Mutation$CreateCategory$createCategory(
            local$createCategory,
            (e) => call(createCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateCategory<TRes>
    implements CopyWith$Mutation$CreateCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateCategory(this._res);

  TRes _res;

  call({
    Mutation$CreateCategory$createCategory? createCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateCategory$createCategory<TRes> get createCategory =>
      CopyWith$Mutation$CreateCategory$createCategory.stub(_res);
}

const documentNodeMutationCreateCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createCategoryInput'),
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
            name: NameNode(value: 'createCategory'),
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
                  name: NameNode(value: 'category'),
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
Mutation$CreateCategory _parserFn$Mutation$CreateCategory(
  Map<String, dynamic> data,
) => Mutation$CreateCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateCategory =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateCategory?);

class Options$Mutation$CreateCategory
    extends graphql.MutationOptions<Mutation$CreateCategory> {
  Options$Mutation$CreateCategory({
    String? operationName,
    required Variables$Mutation$CreateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateCategory>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateCategory,
         parserFn: _parserFn$Mutation$CreateCategory,
       );

  final OnMutationCompleted$Mutation$CreateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateCategory
    extends graphql.WatchQueryOptions<Mutation$CreateCategory> {
  WatchOptions$Mutation$CreateCategory({
    String? operationName,
    required Variables$Mutation$CreateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCategory? typedOptimisticResult,
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
         document: documentNodeMutationCreateCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateCategory,
       );
}

extension ClientExtension$Mutation$CreateCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateCategory>> mutate$CreateCategory(
    Options$Mutation$CreateCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateCategory> watchMutation$CreateCategory(
    WatchOptions$Mutation$CreateCategory options,
  ) => this.watchMutation(options);
}

class Mutation$CreateCategory$HookResult {
  Mutation$CreateCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateCategory runMutation;

  final graphql.QueryResult<Mutation$CreateCategory> result;
}

Mutation$CreateCategory$HookResult useMutation$CreateCategory([
  WidgetOptions$Mutation$CreateCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateCategory(),
  );
  return Mutation$CreateCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateCategory>
useWatchMutation$CreateCategory(WatchOptions$Mutation$CreateCategory options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateCategory
    extends graphql.MutationOptions<Mutation$CreateCategory> {
  WidgetOptions$Mutation$CreateCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateCategory>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateCategory,
         parserFn: _parserFn$Mutation$CreateCategory,
       );

  final OnMutationCompleted$Mutation$CreateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateCategory =
    graphql.MultiSourceResult<Mutation$CreateCategory> Function(
      Variables$Mutation$CreateCategory, {
      Object? optimisticResult,
      Mutation$CreateCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateCategory =
    widgets.Widget Function(
      RunMutation$Mutation$CreateCategory,
      graphql.QueryResult<Mutation$CreateCategory>?,
    );

class Mutation$CreateCategory$Widget
    extends graphql_flutter.Mutation<Mutation$CreateCategory> {
  Mutation$CreateCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateCategory? options,
    required Builder$Mutation$CreateCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateCategory(),
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

class Mutation$CreateCategory$createCategory {
  Mutation$CreateCategory$createCategory({
    this.category,
    this.$__typename = 'createCategoryPayload',
  });

  factory Mutation$CreateCategory$createCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCategory$createCategory(
      category: l$category == null
          ? null
          : Mutation$CreateCategory$createCategory$category.fromJson(
              (l$category as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateCategory$createCategory$category? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category = category;
    _resultData['category'] = l$category?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCategory$createCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Mutation$CreateCategory$createCategory
    on Mutation$CreateCategory$createCategory {
  CopyWith$Mutation$CreateCategory$createCategory<
    Mutation$CreateCategory$createCategory
  >
  get copyWith =>
      CopyWith$Mutation$CreateCategory$createCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateCategory$createCategory<TRes> {
  factory CopyWith$Mutation$CreateCategory$createCategory(
    Mutation$CreateCategory$createCategory instance,
    TRes Function(Mutation$CreateCategory$createCategory) then,
  ) = _CopyWithImpl$Mutation$CreateCategory$createCategory;

  factory CopyWith$Mutation$CreateCategory$createCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCategory$createCategory;

  TRes call({
    Mutation$CreateCategory$createCategory$category? category,
    String? $__typename,
  });
  CopyWith$Mutation$CreateCategory$createCategory$category<TRes> get category;
}

class _CopyWithImpl$Mutation$CreateCategory$createCategory<TRes>
    implements CopyWith$Mutation$CreateCategory$createCategory<TRes> {
  _CopyWithImpl$Mutation$CreateCategory$createCategory(
    this._instance,
    this._then,
  );

  final Mutation$CreateCategory$createCategory _instance;

  final TRes Function(Mutation$CreateCategory$createCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateCategory$createCategory(
      category: category == _undefined
          ? _instance.category
          : (category as Mutation$CreateCategory$createCategory$category?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateCategory$createCategory$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Mutation$CreateCategory$createCategory$category.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreateCategory$createCategory$category(
            local$category,
            (e) => call(category: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateCategory$createCategory<TRes>
    implements CopyWith$Mutation$CreateCategory$createCategory<TRes> {
  _CopyWithStubImpl$Mutation$CreateCategory$createCategory(this._res);

  TRes _res;

  call({
    Mutation$CreateCategory$createCategory$category? category,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateCategory$createCategory$category<TRes> get category =>
      CopyWith$Mutation$CreateCategory$createCategory$category.stub(_res);
}

class Mutation$CreateCategory$createCategory$category {
  Mutation$CreateCategory$createCategory$category({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Mutation$CreateCategory$createCategory$category.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCategory$createCategory$category(
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
    if (other is! Mutation$CreateCategory$createCategory$category ||
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

extension UtilityExtension$Mutation$CreateCategory$createCategory$category
    on Mutation$CreateCategory$createCategory$category {
  CopyWith$Mutation$CreateCategory$createCategory$category<
    Mutation$CreateCategory$createCategory$category
  >
  get copyWith =>
      CopyWith$Mutation$CreateCategory$createCategory$category(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateCategory$createCategory$category<TRes> {
  factory CopyWith$Mutation$CreateCategory$createCategory$category(
    Mutation$CreateCategory$createCategory$category instance,
    TRes Function(Mutation$CreateCategory$createCategory$category) then,
  ) = _CopyWithImpl$Mutation$CreateCategory$createCategory$category;

  factory CopyWith$Mutation$CreateCategory$createCategory$category.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$CreateCategory$createCategory$category;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$CreateCategory$createCategory$category<TRes>
    implements CopyWith$Mutation$CreateCategory$createCategory$category<TRes> {
  _CopyWithImpl$Mutation$CreateCategory$createCategory$category(
    this._instance,
    this._then,
  );

  final Mutation$CreateCategory$createCategory$category _instance;

  final TRes Function(Mutation$CreateCategory$createCategory$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateCategory$createCategory$category(
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

class _CopyWithStubImpl$Mutation$CreateCategory$createCategory$category<TRes>
    implements CopyWith$Mutation$CreateCategory$createCategory$category<TRes> {
  _CopyWithStubImpl$Mutation$CreateCategory$createCategory$category(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$UpdateCategory {
  factory Variables$Mutation$UpdateCategory({
    required Input$updateCategoryInput input,
  }) => Variables$Mutation$UpdateCategory._({r'input': input});

  Variables$Mutation$UpdateCategory._(this._$data);

  factory Variables$Mutation$UpdateCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateCategoryInput get input =>
      (_$data['input'] as Input$updateCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateCategory<Variables$Mutation$UpdateCategory>
  get copyWith => CopyWith$Variables$Mutation$UpdateCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateCategory ||
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

abstract class CopyWith$Variables$Mutation$UpdateCategory<TRes> {
  factory CopyWith$Variables$Mutation$UpdateCategory(
    Variables$Mutation$UpdateCategory instance,
    TRes Function(Variables$Mutation$UpdateCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateCategory;

  factory CopyWith$Variables$Mutation$UpdateCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateCategory;

  TRes call({Input$updateCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateCategory(this._instance, this._then);

  final Variables$Mutation$UpdateCategory _instance;

  final TRes Function(Variables$Mutation$UpdateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateCategory<TRes>
    implements CopyWith$Variables$Mutation$UpdateCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateCategory(this._res);

  TRes _res;

  call({Input$updateCategoryInput? input}) => _res;
}

class Mutation$UpdateCategory {
  Mutation$UpdateCategory({this.updateCategory, this.$__typename = 'Mutation'});

  factory Mutation$UpdateCategory.fromJson(Map<String, dynamic> json) {
    final l$updateCategory = json['updateCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCategory(
      updateCategory: l$updateCategory == null
          ? null
          : Mutation$UpdateCategory$updateCategory.fromJson(
              (l$updateCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateCategory$updateCategory? updateCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateCategory = updateCategory;
    _resultData['updateCategory'] = l$updateCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateCategory = updateCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateCategory = updateCategory;
    final lOther$updateCategory = other.updateCategory;
    if (l$updateCategory != lOther$updateCategory) {
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

extension UtilityExtension$Mutation$UpdateCategory on Mutation$UpdateCategory {
  CopyWith$Mutation$UpdateCategory<Mutation$UpdateCategory> get copyWith =>
      CopyWith$Mutation$UpdateCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateCategory<TRes> {
  factory CopyWith$Mutation$UpdateCategory(
    Mutation$UpdateCategory instance,
    TRes Function(Mutation$UpdateCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateCategory;

  factory CopyWith$Mutation$UpdateCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCategory;

  TRes call({
    Mutation$UpdateCategory$updateCategory? updateCategory,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateCategory$updateCategory<TRes> get updateCategory;
}

class _CopyWithImpl$Mutation$UpdateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateCategory(this._instance, this._then);

  final Mutation$UpdateCategory _instance;

  final TRes Function(Mutation$UpdateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateCategory(
      updateCategory: updateCategory == _undefined
          ? _instance.updateCategory
          : (updateCategory as Mutation$UpdateCategory$updateCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateCategory$updateCategory<TRes> get updateCategory {
    final local$updateCategory = _instance.updateCategory;
    return local$updateCategory == null
        ? CopyWith$Mutation$UpdateCategory$updateCategory.stub(_then(_instance))
        : CopyWith$Mutation$UpdateCategory$updateCategory(
            local$updateCategory,
            (e) => call(updateCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCategory(this._res);

  TRes _res;

  call({
    Mutation$UpdateCategory$updateCategory? updateCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateCategory$updateCategory<TRes> get updateCategory =>
      CopyWith$Mutation$UpdateCategory$updateCategory.stub(_res);
}

const documentNodeMutationUpdateCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateCategoryInput'),
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
            name: NameNode(value: 'updateCategory'),
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
                  name: NameNode(value: 'category'),
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
Mutation$UpdateCategory _parserFn$Mutation$UpdateCategory(
  Map<String, dynamic> data,
) => Mutation$UpdateCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateCategory =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateCategory?);

class Options$Mutation$UpdateCategory
    extends graphql.MutationOptions<Mutation$UpdateCategory> {
  Options$Mutation$UpdateCategory({
    String? operationName,
    required Variables$Mutation$UpdateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateCategory>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateCategory,
         parserFn: _parserFn$Mutation$UpdateCategory,
       );

  final OnMutationCompleted$Mutation$UpdateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateCategory
    extends graphql.WatchQueryOptions<Mutation$UpdateCategory> {
  WatchOptions$Mutation$UpdateCategory({
    String? operationName,
    required Variables$Mutation$UpdateCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCategory? typedOptimisticResult,
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
         document: documentNodeMutationUpdateCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateCategory,
       );
}

extension ClientExtension$Mutation$UpdateCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateCategory>> mutate$UpdateCategory(
    Options$Mutation$UpdateCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateCategory> watchMutation$UpdateCategory(
    WatchOptions$Mutation$UpdateCategory options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateCategory$HookResult {
  Mutation$UpdateCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateCategory runMutation;

  final graphql.QueryResult<Mutation$UpdateCategory> result;
}

Mutation$UpdateCategory$HookResult useMutation$UpdateCategory([
  WidgetOptions$Mutation$UpdateCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateCategory(),
  );
  return Mutation$UpdateCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateCategory>
useWatchMutation$UpdateCategory(WatchOptions$Mutation$UpdateCategory options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateCategory
    extends graphql.MutationOptions<Mutation$UpdateCategory> {
  WidgetOptions$Mutation$UpdateCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateCategory>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateCategory,
         parserFn: _parserFn$Mutation$UpdateCategory,
       );

  final OnMutationCompleted$Mutation$UpdateCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateCategory =
    graphql.MultiSourceResult<Mutation$UpdateCategory> Function(
      Variables$Mutation$UpdateCategory, {
      Object? optimisticResult,
      Mutation$UpdateCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateCategory =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateCategory,
      graphql.QueryResult<Mutation$UpdateCategory>?,
    );

class Mutation$UpdateCategory$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateCategory> {
  Mutation$UpdateCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateCategory? options,
    required Builder$Mutation$UpdateCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateCategory(),
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

class Mutation$UpdateCategory$updateCategory {
  Mutation$UpdateCategory$updateCategory({
    this.category,
    this.$__typename = 'updateCategoryPayload',
  });

  factory Mutation$UpdateCategory$updateCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCategory$updateCategory(
      category: l$category == null
          ? null
          : Mutation$UpdateCategory$updateCategory$category.fromJson(
              (l$category as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateCategory$updateCategory$category? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category = category;
    _resultData['category'] = l$category?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateCategory$updateCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Mutation$UpdateCategory$updateCategory
    on Mutation$UpdateCategory$updateCategory {
  CopyWith$Mutation$UpdateCategory$updateCategory<
    Mutation$UpdateCategory$updateCategory
  >
  get copyWith =>
      CopyWith$Mutation$UpdateCategory$updateCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateCategory$updateCategory<TRes> {
  factory CopyWith$Mutation$UpdateCategory$updateCategory(
    Mutation$UpdateCategory$updateCategory instance,
    TRes Function(Mutation$UpdateCategory$updateCategory) then,
  ) = _CopyWithImpl$Mutation$UpdateCategory$updateCategory;

  factory CopyWith$Mutation$UpdateCategory$updateCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory;

  TRes call({
    Mutation$UpdateCategory$updateCategory$category? category,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateCategory$updateCategory$category<TRes> get category;
}

class _CopyWithImpl$Mutation$UpdateCategory$updateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory$updateCategory<TRes> {
  _CopyWithImpl$Mutation$UpdateCategory$updateCategory(
    this._instance,
    this._then,
  );

  final Mutation$UpdateCategory$updateCategory _instance;

  final TRes Function(Mutation$UpdateCategory$updateCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateCategory$updateCategory(
      category: category == _undefined
          ? _instance.category
          : (category as Mutation$UpdateCategory$updateCategory$category?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateCategory$updateCategory$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Mutation$UpdateCategory$updateCategory$category.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$UpdateCategory$updateCategory$category(
            local$category,
            (e) => call(category: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory<TRes>
    implements CopyWith$Mutation$UpdateCategory$updateCategory<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory(this._res);

  TRes _res;

  call({
    Mutation$UpdateCategory$updateCategory$category? category,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateCategory$updateCategory$category<TRes> get category =>
      CopyWith$Mutation$UpdateCategory$updateCategory$category.stub(_res);
}

class Mutation$UpdateCategory$updateCategory$category {
  Mutation$UpdateCategory$updateCategory$category({
    required this.id,
    required this.name,
    this.$__typename = 'Category',
  });

  factory Mutation$UpdateCategory$updateCategory$category.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateCategory$updateCategory$category(
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
    if (other is! Mutation$UpdateCategory$updateCategory$category ||
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

extension UtilityExtension$Mutation$UpdateCategory$updateCategory$category
    on Mutation$UpdateCategory$updateCategory$category {
  CopyWith$Mutation$UpdateCategory$updateCategory$category<
    Mutation$UpdateCategory$updateCategory$category
  >
  get copyWith =>
      CopyWith$Mutation$UpdateCategory$updateCategory$category(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateCategory$updateCategory$category<TRes> {
  factory CopyWith$Mutation$UpdateCategory$updateCategory$category(
    Mutation$UpdateCategory$updateCategory$category instance,
    TRes Function(Mutation$UpdateCategory$updateCategory$category) then,
  ) = _CopyWithImpl$Mutation$UpdateCategory$updateCategory$category;

  factory CopyWith$Mutation$UpdateCategory$updateCategory$category.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory$category;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Mutation$UpdateCategory$updateCategory$category<TRes>
    implements CopyWith$Mutation$UpdateCategory$updateCategory$category<TRes> {
  _CopyWithImpl$Mutation$UpdateCategory$updateCategory$category(
    this._instance,
    this._then,
  );

  final Mutation$UpdateCategory$updateCategory$category _instance;

  final TRes Function(Mutation$UpdateCategory$updateCategory$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateCategory$updateCategory$category(
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

class _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory$category<TRes>
    implements CopyWith$Mutation$UpdateCategory$updateCategory$category<TRes> {
  _CopyWithStubImpl$Mutation$UpdateCategory$updateCategory$category(this._res);

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Variables$Mutation$DeleteCategory {
  factory Variables$Mutation$DeleteCategory({
    required Input$deleteCategoryInput input,
  }) => Variables$Mutation$DeleteCategory._({r'input': input});

  Variables$Mutation$DeleteCategory._(this._$data);

  factory Variables$Mutation$DeleteCategory.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteCategoryInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteCategory._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteCategoryInput get input =>
      (_$data['input'] as Input$deleteCategoryInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteCategory<Variables$Mutation$DeleteCategory>
  get copyWith => CopyWith$Variables$Mutation$DeleteCategory(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteCategory ||
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

abstract class CopyWith$Variables$Mutation$DeleteCategory<TRes> {
  factory CopyWith$Variables$Mutation$DeleteCategory(
    Variables$Mutation$DeleteCategory instance,
    TRes Function(Variables$Mutation$DeleteCategory) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteCategory;

  factory CopyWith$Variables$Mutation$DeleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteCategory;

  TRes call({Input$deleteCategoryInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteCategory<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteCategory(this._instance, this._then);

  final Variables$Mutation$DeleteCategory _instance;

  final TRes Function(Variables$Mutation$DeleteCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteCategory._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteCategoryInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteCategory<TRes>
    implements CopyWith$Variables$Mutation$DeleteCategory<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteCategory(this._res);

  TRes _res;

  call({Input$deleteCategoryInput? input}) => _res;
}

class Mutation$DeleteCategory {
  Mutation$DeleteCategory({this.deleteCategory, this.$__typename = 'Mutation'});

  factory Mutation$DeleteCategory.fromJson(Map<String, dynamic> json) {
    final l$deleteCategory = json['deleteCategory'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCategory(
      deleteCategory: l$deleteCategory == null
          ? null
          : Mutation$DeleteCategory$deleteCategory.fromJson(
              (l$deleteCategory as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteCategory$deleteCategory? deleteCategory;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteCategory = deleteCategory;
    _resultData['deleteCategory'] = l$deleteCategory?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteCategory = deleteCategory;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteCategory, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteCategory || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteCategory = deleteCategory;
    final lOther$deleteCategory = other.deleteCategory;
    if (l$deleteCategory != lOther$deleteCategory) {
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

extension UtilityExtension$Mutation$DeleteCategory on Mutation$DeleteCategory {
  CopyWith$Mutation$DeleteCategory<Mutation$DeleteCategory> get copyWith =>
      CopyWith$Mutation$DeleteCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteCategory<TRes> {
  factory CopyWith$Mutation$DeleteCategory(
    Mutation$DeleteCategory instance,
    TRes Function(Mutation$DeleteCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteCategory;

  factory CopyWith$Mutation$DeleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteCategory;

  TRes call({
    Mutation$DeleteCategory$deleteCategory? deleteCategory,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> get deleteCategory;
}

class _CopyWithImpl$Mutation$DeleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteCategory(this._instance, this._then);

  final Mutation$DeleteCategory _instance;

  final TRes Function(Mutation$DeleteCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteCategory = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteCategory(
      deleteCategory: deleteCategory == _undefined
          ? _instance.deleteCategory
          : (deleteCategory as Mutation$DeleteCategory$deleteCategory?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> get deleteCategory {
    final local$deleteCategory = _instance.deleteCategory;
    return local$deleteCategory == null
        ? CopyWith$Mutation$DeleteCategory$deleteCategory.stub(_then(_instance))
        : CopyWith$Mutation$DeleteCategory$deleteCategory(
            local$deleteCategory,
            (e) => call(deleteCategory: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCategory(this._res);

  TRes _res;

  call({
    Mutation$DeleteCategory$deleteCategory? deleteCategory,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> get deleteCategory =>
      CopyWith$Mutation$DeleteCategory$deleteCategory.stub(_res);
}

const documentNodeMutationDeleteCategory = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteCategory'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteCategoryInput'),
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
            name: NameNode(value: 'deleteCategory'),
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
                  name: NameNode(value: 'category'),
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
Mutation$DeleteCategory _parserFn$Mutation$DeleteCategory(
  Map<String, dynamic> data,
) => Mutation$DeleteCategory.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteCategory =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteCategory?);

class Options$Mutation$DeleteCategory
    extends graphql.MutationOptions<Mutation$DeleteCategory> {
  Options$Mutation$DeleteCategory({
    String? operationName,
    required Variables$Mutation$DeleteCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteCategory>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteCategory,
         parserFn: _parserFn$Mutation$DeleteCategory,
       );

  final OnMutationCompleted$Mutation$DeleteCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteCategory
    extends graphql.WatchQueryOptions<Mutation$DeleteCategory> {
  WatchOptions$Mutation$DeleteCategory({
    String? operationName,
    required Variables$Mutation$DeleteCategory variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCategory? typedOptimisticResult,
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
         document: documentNodeMutationDeleteCategory,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteCategory,
       );
}

extension ClientExtension$Mutation$DeleteCategory on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteCategory>> mutate$DeleteCategory(
    Options$Mutation$DeleteCategory options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteCategory> watchMutation$DeleteCategory(
    WatchOptions$Mutation$DeleteCategory options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteCategory$HookResult {
  Mutation$DeleteCategory$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteCategory runMutation;

  final graphql.QueryResult<Mutation$DeleteCategory> result;
}

Mutation$DeleteCategory$HookResult useMutation$DeleteCategory([
  WidgetOptions$Mutation$DeleteCategory? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteCategory(),
  );
  return Mutation$DeleteCategory$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteCategory>
useWatchMutation$DeleteCategory(WatchOptions$Mutation$DeleteCategory options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteCategory
    extends graphql.MutationOptions<Mutation$DeleteCategory> {
  WidgetOptions$Mutation$DeleteCategory({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteCategory? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteCategory? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteCategory>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteCategory(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteCategory,
         parserFn: _parserFn$Mutation$DeleteCategory,
       );

  final OnMutationCompleted$Mutation$DeleteCategory? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteCategory =
    graphql.MultiSourceResult<Mutation$DeleteCategory> Function(
      Variables$Mutation$DeleteCategory, {
      Object? optimisticResult,
      Mutation$DeleteCategory? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteCategory =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteCategory,
      graphql.QueryResult<Mutation$DeleteCategory>?,
    );

class Mutation$DeleteCategory$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteCategory> {
  Mutation$DeleteCategory$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteCategory? options,
    required Builder$Mutation$DeleteCategory builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteCategory(),
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

class Mutation$DeleteCategory$deleteCategory {
  Mutation$DeleteCategory$deleteCategory({
    this.category,
    this.$__typename = 'deleteCategoryPayload',
  });

  factory Mutation$DeleteCategory$deleteCategory.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$category = json['category'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCategory$deleteCategory(
      category: l$category == null
          ? null
          : Mutation$DeleteCategory$deleteCategory$category.fromJson(
              (l$category as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteCategory$deleteCategory$category? category;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$category = category;
    _resultData['category'] = l$category?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$category = category;
    final l$$__typename = $__typename;
    return Object.hashAll([l$category, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteCategory$deleteCategory ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (l$category != lOther$category) {
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

extension UtilityExtension$Mutation$DeleteCategory$deleteCategory
    on Mutation$DeleteCategory$deleteCategory {
  CopyWith$Mutation$DeleteCategory$deleteCategory<
    Mutation$DeleteCategory$deleteCategory
  >
  get copyWith =>
      CopyWith$Mutation$DeleteCategory$deleteCategory(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> {
  factory CopyWith$Mutation$DeleteCategory$deleteCategory(
    Mutation$DeleteCategory$deleteCategory instance,
    TRes Function(Mutation$DeleteCategory$deleteCategory) then,
  ) = _CopyWithImpl$Mutation$DeleteCategory$deleteCategory;

  factory CopyWith$Mutation$DeleteCategory$deleteCategory.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory;

  TRes call({
    Mutation$DeleteCategory$deleteCategory$category? category,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteCategory$deleteCategory$category<TRes> get category;
}

class _CopyWithImpl$Mutation$DeleteCategory$deleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> {
  _CopyWithImpl$Mutation$DeleteCategory$deleteCategory(
    this._instance,
    this._then,
  );

  final Mutation$DeleteCategory$deleteCategory _instance;

  final TRes Function(Mutation$DeleteCategory$deleteCategory) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? category = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteCategory$deleteCategory(
      category: category == _undefined
          ? _instance.category
          : (category as Mutation$DeleteCategory$deleteCategory$category?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteCategory$deleteCategory$category<TRes> get category {
    final local$category = _instance.category;
    return local$category == null
        ? CopyWith$Mutation$DeleteCategory$deleteCategory$category.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteCategory$deleteCategory$category(
            local$category,
            (e) => call(category: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory<TRes>
    implements CopyWith$Mutation$DeleteCategory$deleteCategory<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory(this._res);

  TRes _res;

  call({
    Mutation$DeleteCategory$deleteCategory$category? category,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteCategory$deleteCategory$category<TRes> get category =>
      CopyWith$Mutation$DeleteCategory$deleteCategory$category.stub(_res);
}

class Mutation$DeleteCategory$deleteCategory$category {
  Mutation$DeleteCategory$deleteCategory$category({
    required this.id,
    this.$__typename = 'Category',
  });

  factory Mutation$DeleteCategory$deleteCategory$category.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteCategory$deleteCategory$category(
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
    if (other is! Mutation$DeleteCategory$deleteCategory$category ||
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

extension UtilityExtension$Mutation$DeleteCategory$deleteCategory$category
    on Mutation$DeleteCategory$deleteCategory$category {
  CopyWith$Mutation$DeleteCategory$deleteCategory$category<
    Mutation$DeleteCategory$deleteCategory$category
  >
  get copyWith =>
      CopyWith$Mutation$DeleteCategory$deleteCategory$category(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteCategory$deleteCategory$category<TRes> {
  factory CopyWith$Mutation$DeleteCategory$deleteCategory$category(
    Mutation$DeleteCategory$deleteCategory$category instance,
    TRes Function(Mutation$DeleteCategory$deleteCategory$category) then,
  ) = _CopyWithImpl$Mutation$DeleteCategory$deleteCategory$category;

  factory CopyWith$Mutation$DeleteCategory$deleteCategory$category.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory$category;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteCategory$deleteCategory$category<TRes>
    implements CopyWith$Mutation$DeleteCategory$deleteCategory$category<TRes> {
  _CopyWithImpl$Mutation$DeleteCategory$deleteCategory$category(
    this._instance,
    this._then,
  );

  final Mutation$DeleteCategory$deleteCategory$category _instance;

  final TRes Function(Mutation$DeleteCategory$deleteCategory$category) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteCategory$deleteCategory$category(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory$category<TRes>
    implements CopyWith$Mutation$DeleteCategory$deleteCategory$category<TRes> {
  _CopyWithStubImpl$Mutation$DeleteCategory$deleteCategory$category(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
