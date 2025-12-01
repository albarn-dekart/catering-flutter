import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Mutation$CreatePayment {
  factory Variables$Mutation$CreatePayment({
    required Input$createPaymentInput input,
  }) => Variables$Mutation$CreatePayment._({r'input': input});

  Variables$Mutation$CreatePayment._(this._$data);

  factory Variables$Mutation$CreatePayment.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createPaymentInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreatePayment._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createPaymentInput get input =>
      (_$data['input'] as Input$createPaymentInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreatePayment<Variables$Mutation$CreatePayment>
  get copyWith => CopyWith$Variables$Mutation$CreatePayment(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreatePayment ||
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

abstract class CopyWith$Variables$Mutation$CreatePayment<TRes> {
  factory CopyWith$Variables$Mutation$CreatePayment(
    Variables$Mutation$CreatePayment instance,
    TRes Function(Variables$Mutation$CreatePayment) then,
  ) = _CopyWithImpl$Variables$Mutation$CreatePayment;

  factory CopyWith$Variables$Mutation$CreatePayment.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreatePayment;

  TRes call({Input$createPaymentInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreatePayment<TRes>
    implements CopyWith$Variables$Mutation$CreatePayment<TRes> {
  _CopyWithImpl$Variables$Mutation$CreatePayment(this._instance, this._then);

  final Variables$Mutation$CreatePayment _instance;

  final TRes Function(Variables$Mutation$CreatePayment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreatePayment._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createPaymentInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreatePayment<TRes>
    implements CopyWith$Variables$Mutation$CreatePayment<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreatePayment(this._res);

  TRes _res;

  call({Input$createPaymentInput? input}) => _res;
}

class Mutation$CreatePayment {
  Mutation$CreatePayment({this.createPayment, this.$__typename = 'Mutation'});

  factory Mutation$CreatePayment.fromJson(Map<String, dynamic> json) {
    final l$createPayment = json['createPayment'];
    final l$$__typename = json['__typename'];
    return Mutation$CreatePayment(
      createPayment: l$createPayment == null
          ? null
          : Mutation$CreatePayment$createPayment.fromJson(
              (l$createPayment as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreatePayment$createPayment? createPayment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createPayment = createPayment;
    _resultData['createPayment'] = l$createPayment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createPayment = createPayment;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createPayment, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreatePayment || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createPayment = createPayment;
    final lOther$createPayment = other.createPayment;
    if (l$createPayment != lOther$createPayment) {
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

extension UtilityExtension$Mutation$CreatePayment on Mutation$CreatePayment {
  CopyWith$Mutation$CreatePayment<Mutation$CreatePayment> get copyWith =>
      CopyWith$Mutation$CreatePayment(this, (i) => i);
}

abstract class CopyWith$Mutation$CreatePayment<TRes> {
  factory CopyWith$Mutation$CreatePayment(
    Mutation$CreatePayment instance,
    TRes Function(Mutation$CreatePayment) then,
  ) = _CopyWithImpl$Mutation$CreatePayment;

  factory CopyWith$Mutation$CreatePayment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreatePayment;

  TRes call({
    Mutation$CreatePayment$createPayment? createPayment,
    String? $__typename,
  });
  CopyWith$Mutation$CreatePayment$createPayment<TRes> get createPayment;
}

class _CopyWithImpl$Mutation$CreatePayment<TRes>
    implements CopyWith$Mutation$CreatePayment<TRes> {
  _CopyWithImpl$Mutation$CreatePayment(this._instance, this._then);

  final Mutation$CreatePayment _instance;

  final TRes Function(Mutation$CreatePayment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createPayment = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreatePayment(
      createPayment: createPayment == _undefined
          ? _instance.createPayment
          : (createPayment as Mutation$CreatePayment$createPayment?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreatePayment$createPayment<TRes> get createPayment {
    final local$createPayment = _instance.createPayment;
    return local$createPayment == null
        ? CopyWith$Mutation$CreatePayment$createPayment.stub(_then(_instance))
        : CopyWith$Mutation$CreatePayment$createPayment(
            local$createPayment,
            (e) => call(createPayment: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreatePayment<TRes>
    implements CopyWith$Mutation$CreatePayment<TRes> {
  _CopyWithStubImpl$Mutation$CreatePayment(this._res);

  TRes _res;

  call({
    Mutation$CreatePayment$createPayment? createPayment,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreatePayment$createPayment<TRes> get createPayment =>
      CopyWith$Mutation$CreatePayment$createPayment.stub(_res);
}

const documentNodeMutationCreatePayment = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreatePayment'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createPaymentInput'),
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
            name: NameNode(value: 'createPayment'),
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
                  name: NameNode(value: 'payment'),
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
                        name: NameNode(value: 'sessionId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'url'),
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
Mutation$CreatePayment _parserFn$Mutation$CreatePayment(
  Map<String, dynamic> data,
) => Mutation$CreatePayment.fromJson(data);
typedef OnMutationCompleted$Mutation$CreatePayment =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreatePayment?);

class Options$Mutation$CreatePayment
    extends graphql.MutationOptions<Mutation$CreatePayment> {
  Options$Mutation$CreatePayment({
    String? operationName,
    required Variables$Mutation$CreatePayment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePayment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreatePayment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreatePayment>? update,
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
                 data == null ? null : _parserFn$Mutation$CreatePayment(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreatePayment,
         parserFn: _parserFn$Mutation$CreatePayment,
       );

  final OnMutationCompleted$Mutation$CreatePayment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreatePayment
    extends graphql.WatchQueryOptions<Mutation$CreatePayment> {
  WatchOptions$Mutation$CreatePayment({
    String? operationName,
    required Variables$Mutation$CreatePayment variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePayment? typedOptimisticResult,
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
         document: documentNodeMutationCreatePayment,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreatePayment,
       );
}

extension ClientExtension$Mutation$CreatePayment on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreatePayment>> mutate$CreatePayment(
    Options$Mutation$CreatePayment options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreatePayment> watchMutation$CreatePayment(
    WatchOptions$Mutation$CreatePayment options,
  ) => this.watchMutation(options);
}

class Mutation$CreatePayment$HookResult {
  Mutation$CreatePayment$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreatePayment runMutation;

  final graphql.QueryResult<Mutation$CreatePayment> result;
}

Mutation$CreatePayment$HookResult useMutation$CreatePayment([
  WidgetOptions$Mutation$CreatePayment? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreatePayment(),
  );
  return Mutation$CreatePayment$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreatePayment> useWatchMutation$CreatePayment(
  WatchOptions$Mutation$CreatePayment options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreatePayment
    extends graphql.MutationOptions<Mutation$CreatePayment> {
  WidgetOptions$Mutation$CreatePayment({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreatePayment? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreatePayment? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreatePayment>? update,
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
                 data == null ? null : _parserFn$Mutation$CreatePayment(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreatePayment,
         parserFn: _parserFn$Mutation$CreatePayment,
       );

  final OnMutationCompleted$Mutation$CreatePayment? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreatePayment =
    graphql.MultiSourceResult<Mutation$CreatePayment> Function(
      Variables$Mutation$CreatePayment, {
      Object? optimisticResult,
      Mutation$CreatePayment? typedOptimisticResult,
    });
typedef Builder$Mutation$CreatePayment =
    widgets.Widget Function(
      RunMutation$Mutation$CreatePayment,
      graphql.QueryResult<Mutation$CreatePayment>?,
    );

class Mutation$CreatePayment$Widget
    extends graphql_flutter.Mutation<Mutation$CreatePayment> {
  Mutation$CreatePayment$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreatePayment? options,
    required Builder$Mutation$CreatePayment builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreatePayment(),
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

class Mutation$CreatePayment$createPayment {
  Mutation$CreatePayment$createPayment({
    this.payment,
    this.$__typename = 'createPaymentPayload',
  });

  factory Mutation$CreatePayment$createPayment.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$payment = json['payment'];
    final l$$__typename = json['__typename'];
    return Mutation$CreatePayment$createPayment(
      payment: l$payment == null
          ? null
          : Mutation$CreatePayment$createPayment$payment.fromJson(
              (l$payment as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreatePayment$createPayment$payment? payment;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$payment = payment;
    _resultData['payment'] = l$payment?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$payment = payment;
    final l$$__typename = $__typename;
    return Object.hashAll([l$payment, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreatePayment$createPayment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$payment = payment;
    final lOther$payment = other.payment;
    if (l$payment != lOther$payment) {
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

extension UtilityExtension$Mutation$CreatePayment$createPayment
    on Mutation$CreatePayment$createPayment {
  CopyWith$Mutation$CreatePayment$createPayment<
    Mutation$CreatePayment$createPayment
  >
  get copyWith => CopyWith$Mutation$CreatePayment$createPayment(this, (i) => i);
}

abstract class CopyWith$Mutation$CreatePayment$createPayment<TRes> {
  factory CopyWith$Mutation$CreatePayment$createPayment(
    Mutation$CreatePayment$createPayment instance,
    TRes Function(Mutation$CreatePayment$createPayment) then,
  ) = _CopyWithImpl$Mutation$CreatePayment$createPayment;

  factory CopyWith$Mutation$CreatePayment$createPayment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreatePayment$createPayment;

  TRes call({
    Mutation$CreatePayment$createPayment$payment? payment,
    String? $__typename,
  });
  CopyWith$Mutation$CreatePayment$createPayment$payment<TRes> get payment;
}

class _CopyWithImpl$Mutation$CreatePayment$createPayment<TRes>
    implements CopyWith$Mutation$CreatePayment$createPayment<TRes> {
  _CopyWithImpl$Mutation$CreatePayment$createPayment(
    this._instance,
    this._then,
  );

  final Mutation$CreatePayment$createPayment _instance;

  final TRes Function(Mutation$CreatePayment$createPayment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? payment = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CreatePayment$createPayment(
          payment: payment == _undefined
              ? _instance.payment
              : (payment as Mutation$CreatePayment$createPayment$payment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$CreatePayment$createPayment$payment<TRes> get payment {
    final local$payment = _instance.payment;
    return local$payment == null
        ? CopyWith$Mutation$CreatePayment$createPayment$payment.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$CreatePayment$createPayment$payment(
            local$payment,
            (e) => call(payment: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreatePayment$createPayment<TRes>
    implements CopyWith$Mutation$CreatePayment$createPayment<TRes> {
  _CopyWithStubImpl$Mutation$CreatePayment$createPayment(this._res);

  TRes _res;

  call({
    Mutation$CreatePayment$createPayment$payment? payment,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreatePayment$createPayment$payment<TRes> get payment =>
      CopyWith$Mutation$CreatePayment$createPayment$payment.stub(_res);
}

class Mutation$CreatePayment$createPayment$payment {
  Mutation$CreatePayment$createPayment$payment({
    required this.id,
    this.sessionId,
    this.url,
    this.$__typename = 'Payment',
  });

  factory Mutation$CreatePayment$createPayment$payment.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$sessionId = json['sessionId'];
    final l$url = json['url'];
    final l$$__typename = json['__typename'];
    return Mutation$CreatePayment$createPayment$payment(
      id: (l$id as String),
      sessionId: (l$sessionId as String?),
      url: (l$url as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? sessionId;

  final String? url;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$sessionId = sessionId;
    _resultData['sessionId'] = l$sessionId;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$sessionId = sessionId;
    final l$url = url;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$sessionId, l$url, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreatePayment$createPayment$payment ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
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

extension UtilityExtension$Mutation$CreatePayment$createPayment$payment
    on Mutation$CreatePayment$createPayment$payment {
  CopyWith$Mutation$CreatePayment$createPayment$payment<
    Mutation$CreatePayment$createPayment$payment
  >
  get copyWith =>
      CopyWith$Mutation$CreatePayment$createPayment$payment(this, (i) => i);
}

abstract class CopyWith$Mutation$CreatePayment$createPayment$payment<TRes> {
  factory CopyWith$Mutation$CreatePayment$createPayment$payment(
    Mutation$CreatePayment$createPayment$payment instance,
    TRes Function(Mutation$CreatePayment$createPayment$payment) then,
  ) = _CopyWithImpl$Mutation$CreatePayment$createPayment$payment;

  factory CopyWith$Mutation$CreatePayment$createPayment$payment.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreatePayment$createPayment$payment;

  TRes call({String? id, String? sessionId, String? url, String? $__typename});
}

class _CopyWithImpl$Mutation$CreatePayment$createPayment$payment<TRes>
    implements CopyWith$Mutation$CreatePayment$createPayment$payment<TRes> {
  _CopyWithImpl$Mutation$CreatePayment$createPayment$payment(
    this._instance,
    this._then,
  );

  final Mutation$CreatePayment$createPayment$payment _instance;

  final TRes Function(Mutation$CreatePayment$createPayment$payment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? sessionId = _undefined,
    Object? url = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreatePayment$createPayment$payment(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      sessionId: sessionId == _undefined
          ? _instance.sessionId
          : (sessionId as String?),
      url: url == _undefined ? _instance.url : (url as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreatePayment$createPayment$payment<TRes>
    implements CopyWith$Mutation$CreatePayment$createPayment$payment<TRes> {
  _CopyWithStubImpl$Mutation$CreatePayment$createPayment$payment(this._res);

  TRes _res;

  call({String? id, String? sessionId, String? url, String? $__typename}) =>
      _res;
}
