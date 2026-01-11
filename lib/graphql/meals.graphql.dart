import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Fragment$MealFragment {
  Fragment$MealFragment({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.imageUrl,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.$__typename = 'Meal',
  });

  factory Fragment$MealFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$imageUrl = json['imageUrl'];
    final l$calories = json['calories'];
    final l$protein = json['protein'];
    final l$fat = json['fat'];
    final l$carbs = json['carbs'];
    final l$$__typename = json['__typename'];
    return Fragment$MealFragment(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      price: (l$price as int),
      imageUrl: (l$imageUrl as String?),
      calories: (l$calories as num).toDouble(),
      protein: (l$protein as num).toDouble(),
      fat: (l$fat as num).toDouble(),
      carbs: (l$carbs as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final int price;

  final String? imageUrl;

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
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
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
    final l$description = description;
    final l$price = price;
    final l$imageUrl = imageUrl;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$imageUrl,
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
    if (other is! Fragment$MealFragment || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Fragment$MealFragment on Fragment$MealFragment {
  CopyWith$Fragment$MealFragment<Fragment$MealFragment> get copyWith =>
      CopyWith$Fragment$MealFragment(this, (i) => i);
}

abstract class CopyWith$Fragment$MealFragment<TRes> {
  factory CopyWith$Fragment$MealFragment(
    Fragment$MealFragment instance,
    TRes Function(Fragment$MealFragment) then,
  ) = _CopyWithImpl$Fragment$MealFragment;

  factory CopyWith$Fragment$MealFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealFragment;

  TRes call({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MealFragment<TRes>
    implements CopyWith$Fragment$MealFragment<TRes> {
  _CopyWithImpl$Fragment$MealFragment(this._instance, this._then);

  final Fragment$MealFragment _instance;

  final TRes Function(Fragment$MealFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? imageUrl = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealFragment(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      price: price == _undefined || price == null
          ? _instance.price
          : (price as int),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
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

class _CopyWithStubImpl$Fragment$MealFragment<TRes>
    implements CopyWith$Fragment$MealFragment<TRes> {
  _CopyWithStubImpl$Fragment$MealFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? $__typename,
  }) => _res;
}

const fragmentDefinitionMealFragment = FragmentDefinitionNode(
  name: NameNode(value: 'MealFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'Meal'), isNonNull: false),
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
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentMealFragment = DocumentNode(
  definitions: [fragmentDefinitionMealFragment],
);

extension ClientExtension$Fragment$MealFragment on graphql.GraphQLClient {
  void writeFragment$MealFragment({
    required Fragment$MealFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'MealFragment',
        document: documentNodeFragmentMealFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$MealFragment? readFragment$MealFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MealFragment',
          document: documentNodeFragmentMealFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MealFragment.fromJson(result);
  }
}

class Fragment$MealPlanSummaryFragment {
  Fragment$MealPlanSummaryFragment({
    required this.id,
    required this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.restaurant,
    this.owner,
    this.dietCategories,
    this.$__typename = 'MealPlan',
  });

  factory Fragment$MealPlanSummaryFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$imageUrl = json['imageUrl'];
    final l$calories = json['calories'];
    final l$protein = json['protein'];
    final l$fat = json['fat'];
    final l$carbs = json['carbs'];
    final l$restaurant = json['restaurant'];
    final l$owner = json['owner'];
    final l$dietCategories = json['dietCategories'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanSummaryFragment(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      price: (l$price as int?),
      imageUrl: (l$imageUrl as String?),
      calories: (l$calories as num?)?.toDouble(),
      protein: (l$protein as num?)?.toDouble(),
      fat: (l$fat as num?)?.toDouble(),
      carbs: (l$carbs as num?)?.toDouble(),
      restaurant: l$restaurant == null
          ? null
          : Fragment$MealPlanSummaryFragment$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      owner: l$owner == null
          ? null
          : Fragment$MealPlanSummaryFragment$owner.fromJson(
              (l$owner as Map<String, dynamic>),
            ),
      dietCategories: l$dietCategories == null
          ? null
          : Fragment$MealPlanSummaryFragment$dietCategories.fromJson(
              (l$dietCategories as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? description;

  final int? price;

  final String? imageUrl;

  final double? calories;

  final double? protein;

  final double? fat;

  final double? carbs;

  final Fragment$MealPlanSummaryFragment$restaurant? restaurant;

  final Fragment$MealPlanSummaryFragment$owner? owner;

  final Fragment$MealPlanSummaryFragment$dietCategories? dietCategories;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$calories = calories;
    _resultData['calories'] = l$calories;
    final l$protein = protein;
    _resultData['protein'] = l$protein;
    final l$fat = fat;
    _resultData['fat'] = l$fat;
    final l$carbs = carbs;
    _resultData['carbs'] = l$carbs;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$owner = owner;
    _resultData['owner'] = l$owner?.toJson();
    final l$dietCategories = dietCategories;
    _resultData['dietCategories'] = l$dietCategories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$imageUrl = imageUrl;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$restaurant = restaurant;
    final l$owner = owner;
    final l$dietCategories = dietCategories;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$imageUrl,
      l$calories,
      l$protein,
      l$fat,
      l$carbs,
      l$restaurant,
      l$owner,
      l$dietCategories,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MealPlanSummaryFragment ||
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
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
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

extension UtilityExtension$Fragment$MealPlanSummaryFragment
    on Fragment$MealPlanSummaryFragment {
  CopyWith$Fragment$MealPlanSummaryFragment<Fragment$MealPlanSummaryFragment>
  get copyWith => CopyWith$Fragment$MealPlanSummaryFragment(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanSummaryFragment<TRes> {
  factory CopyWith$Fragment$MealPlanSummaryFragment(
    Fragment$MealPlanSummaryFragment instance,
    TRes Function(Fragment$MealPlanSummaryFragment) then,
  ) = _CopyWithImpl$Fragment$MealPlanSummaryFragment;

  factory CopyWith$Fragment$MealPlanSummaryFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanSummaryFragment;

  TRes call({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    Fragment$MealPlanSummaryFragment$restaurant? restaurant,
    Fragment$MealPlanSummaryFragment$owner? owner,
    Fragment$MealPlanSummaryFragment$dietCategories? dietCategories,
    String? $__typename,
  });
  CopyWith$Fragment$MealPlanSummaryFragment$restaurant<TRes> get restaurant;
  CopyWith$Fragment$MealPlanSummaryFragment$owner<TRes> get owner;
  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<TRes>
  get dietCategories;
}

class _CopyWithImpl$Fragment$MealPlanSummaryFragment<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment<TRes> {
  _CopyWithImpl$Fragment$MealPlanSummaryFragment(this._instance, this._then);

  final Fragment$MealPlanSummaryFragment _instance;

  final TRes Function(Fragment$MealPlanSummaryFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? imageUrl = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? restaurant = _undefined,
    Object? owner = _undefined,
    Object? dietCategories = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanSummaryFragment(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      price: price == _undefined ? _instance.price : (price as int?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      calories: calories == _undefined
          ? _instance.calories
          : (calories as double?),
      protein: protein == _undefined ? _instance.protein : (protein as double?),
      fat: fat == _undefined ? _instance.fat : (fat as double?),
      carbs: carbs == _undefined ? _instance.carbs : (carbs as double?),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Fragment$MealPlanSummaryFragment$restaurant?),
      owner: owner == _undefined
          ? _instance.owner
          : (owner as Fragment$MealPlanSummaryFragment$owner?),
      dietCategories: dietCategories == _undefined
          ? _instance.dietCategories
          : (dietCategories
                as Fragment$MealPlanSummaryFragment$dietCategories?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$MealPlanSummaryFragment$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Fragment$MealPlanSummaryFragment$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$MealPlanSummaryFragment$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Fragment$MealPlanSummaryFragment$owner<TRes> get owner {
    final local$owner = _instance.owner;
    return local$owner == null
        ? CopyWith$Fragment$MealPlanSummaryFragment$owner.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanSummaryFragment$owner(
            local$owner,
            (e) => call(owner: e),
          );
  }

  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<TRes>
  get dietCategories {
    final local$dietCategories = _instance.dietCategories;
    return local$dietCategories == null
        ? CopyWith$Fragment$MealPlanSummaryFragment$dietCategories.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$MealPlanSummaryFragment$dietCategories(
            local$dietCategories,
            (e) => call(dietCategories: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$MealPlanSummaryFragment<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanSummaryFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    Fragment$MealPlanSummaryFragment$restaurant? restaurant,
    Fragment$MealPlanSummaryFragment$owner? owner,
    Fragment$MealPlanSummaryFragment$dietCategories? dietCategories,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$MealPlanSummaryFragment$restaurant<TRes> get restaurant =>
      CopyWith$Fragment$MealPlanSummaryFragment$restaurant.stub(_res);

  CopyWith$Fragment$MealPlanSummaryFragment$owner<TRes> get owner =>
      CopyWith$Fragment$MealPlanSummaryFragment$owner.stub(_res);

  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<TRes>
  get dietCategories =>
      CopyWith$Fragment$MealPlanSummaryFragment$dietCategories.stub(_res);
}

const fragmentDefinitionMealPlanSummaryFragment = FragmentDefinitionNode(
  name: NameNode(value: 'MealPlanSummaryFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'MealPlan'), isNonNull: false),
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
              name: NameNode(value: 'deliveryPrice'),
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
        name: NameNode(value: 'owner'),
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
        name: NameNode(value: 'dietCategories'),
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
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentMealPlanSummaryFragment = DocumentNode(
  definitions: [fragmentDefinitionMealPlanSummaryFragment],
);

extension ClientExtension$Fragment$MealPlanSummaryFragment
    on graphql.GraphQLClient {
  void writeFragment$MealPlanSummaryFragment({
    required Fragment$MealPlanSummaryFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'MealPlanSummaryFragment',
        document: documentNodeFragmentMealPlanSummaryFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$MealPlanSummaryFragment? readFragment$MealPlanSummaryFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MealPlanSummaryFragment',
          document: documentNodeFragmentMealPlanSummaryFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Fragment$MealPlanSummaryFragment.fromJson(result);
  }
}

class Fragment$MealPlanSummaryFragment$restaurant {
  Fragment$MealPlanSummaryFragment$restaurant({
    required this.id,
    required this.name,
    required this.deliveryPrice,
    this.$__typename = 'Restaurant',
  });

  factory Fragment$MealPlanSummaryFragment$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$deliveryPrice = json['deliveryPrice'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanSummaryFragment$restaurant(
      id: (l$id as String),
      name: (l$name as String),
      deliveryPrice: (l$deliveryPrice as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int deliveryPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$deliveryPrice = deliveryPrice;
    _resultData['deliveryPrice'] = l$deliveryPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$deliveryPrice = deliveryPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$deliveryPrice, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MealPlanSummaryFragment$restaurant ||
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
    final l$deliveryPrice = deliveryPrice;
    final lOther$deliveryPrice = other.deliveryPrice;
    if (l$deliveryPrice != lOther$deliveryPrice) {
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

extension UtilityExtension$Fragment$MealPlanSummaryFragment$restaurant
    on Fragment$MealPlanSummaryFragment$restaurant {
  CopyWith$Fragment$MealPlanSummaryFragment$restaurant<
    Fragment$MealPlanSummaryFragment$restaurant
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanSummaryFragment$restaurant(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanSummaryFragment$restaurant<TRes> {
  factory CopyWith$Fragment$MealPlanSummaryFragment$restaurant(
    Fragment$MealPlanSummaryFragment$restaurant instance,
    TRes Function(Fragment$MealPlanSummaryFragment$restaurant) then,
  ) = _CopyWithImpl$Fragment$MealPlanSummaryFragment$restaurant;

  factory CopyWith$Fragment$MealPlanSummaryFragment$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$restaurant;

  TRes call({
    String? id,
    String? name,
    int? deliveryPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MealPlanSummaryFragment$restaurant<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment$restaurant<TRes> {
  _CopyWithImpl$Fragment$MealPlanSummaryFragment$restaurant(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanSummaryFragment$restaurant _instance;

  final TRes Function(Fragment$MealPlanSummaryFragment$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? deliveryPrice = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanSummaryFragment$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      deliveryPrice: deliveryPrice == _undefined || deliveryPrice == null
          ? _instance.deliveryPrice
          : (deliveryPrice as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$restaurant<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment$restaurant<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$restaurant(this._res);

  TRes _res;

  call({String? id, String? name, int? deliveryPrice, String? $__typename}) =>
      _res;
}

class Fragment$MealPlanSummaryFragment$owner {
  Fragment$MealPlanSummaryFragment$owner({
    required this.id,
    required this.roles,
    this.$__typename = 'User',
  });

  factory Fragment$MealPlanSummaryFragment$owner.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$roles = json['roles'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanSummaryFragment$owner(
      id: (l$id as String),
      roles: (l$roles as List<dynamic>),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<dynamic> roles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roles = roles;
    _resultData['roles'] = l$roles;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roles = roles;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$roles, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MealPlanSummaryFragment$owner ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$MealPlanSummaryFragment$owner
    on Fragment$MealPlanSummaryFragment$owner {
  CopyWith$Fragment$MealPlanSummaryFragment$owner<
    Fragment$MealPlanSummaryFragment$owner
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanSummaryFragment$owner(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanSummaryFragment$owner<TRes> {
  factory CopyWith$Fragment$MealPlanSummaryFragment$owner(
    Fragment$MealPlanSummaryFragment$owner instance,
    TRes Function(Fragment$MealPlanSummaryFragment$owner) then,
  ) = _CopyWithImpl$Fragment$MealPlanSummaryFragment$owner;

  factory CopyWith$Fragment$MealPlanSummaryFragment$owner.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$owner;

  TRes call({String? id, List<dynamic>? roles, String? $__typename});
}

class _CopyWithImpl$Fragment$MealPlanSummaryFragment$owner<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment$owner<TRes> {
  _CopyWithImpl$Fragment$MealPlanSummaryFragment$owner(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanSummaryFragment$owner _instance;

  final TRes Function(Fragment$MealPlanSummaryFragment$owner) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roles = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanSummaryFragment$owner(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<dynamic>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$owner<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment$owner<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$owner(this._res);

  TRes _res;

  call({String? id, List<dynamic>? roles, String? $__typename}) => _res;
}

class Fragment$MealPlanSummaryFragment$dietCategories {
  Fragment$MealPlanSummaryFragment$dietCategories({
    this.edges,
    this.$__typename = 'DietCategoryCursorConnection',
  });

  factory Fragment$MealPlanSummaryFragment$dietCategories.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanSummaryFragment$dietCategories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$MealPlanSummaryFragment$dietCategories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$MealPlanSummaryFragment$dietCategories$edges?>? edges;

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
    if (other is! Fragment$MealPlanSummaryFragment$dietCategories ||
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

extension UtilityExtension$Fragment$MealPlanSummaryFragment$dietCategories
    on Fragment$MealPlanSummaryFragment$dietCategories {
  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<
    Fragment$MealPlanSummaryFragment$dietCategories
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanSummaryFragment$dietCategories(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<TRes> {
  factory CopyWith$Fragment$MealPlanSummaryFragment$dietCategories(
    Fragment$MealPlanSummaryFragment$dietCategories instance,
    TRes Function(Fragment$MealPlanSummaryFragment$dietCategories) then,
  ) = _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories;

  factory CopyWith$Fragment$MealPlanSummaryFragment$dietCategories.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories;

  TRes call({
    List<Fragment$MealPlanSummaryFragment$dietCategories$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Fragment$MealPlanSummaryFragment$dietCategories$edges?>? Function(
      Iterable<
        CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges<
          Fragment$MealPlanSummaryFragment$dietCategories$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<TRes> {
  _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanSummaryFragment$dietCategories _instance;

  final TRes Function(Fragment$MealPlanSummaryFragment$dietCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Fragment$MealPlanSummaryFragment$dietCategories(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<
                      Fragment$MealPlanSummaryFragment$dietCategories$edges?
                    >?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Fragment$MealPlanSummaryFragment$dietCategories$edges?>? Function(
      Iterable<
        CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges<
          Fragment$MealPlanSummaryFragment$dietCategories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories<TRes>
    implements CopyWith$Fragment$MealPlanSummaryFragment$dietCategories<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories(this._res);

  TRes _res;

  call({
    List<Fragment$MealPlanSummaryFragment$dietCategories$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Fragment$MealPlanSummaryFragment$dietCategories$edges {
  Fragment$MealPlanSummaryFragment$dietCategories$edges({
    this.node,
    this.$__typename = 'DietCategoryEdge',
  });

  factory Fragment$MealPlanSummaryFragment$dietCategories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanSummaryFragment$dietCategories$edges(
      node: l$node == null
          ? null
          : Fragment$MealPlanSummaryFragment$dietCategories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealPlanSummaryFragment$dietCategories$edges$node? node;

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
    if (other is! Fragment$MealPlanSummaryFragment$dietCategories$edges ||
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

extension UtilityExtension$Fragment$MealPlanSummaryFragment$dietCategories$edges
    on Fragment$MealPlanSummaryFragment$dietCategories$edges {
  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges<
    Fragment$MealPlanSummaryFragment$dietCategories$edges
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges<
  TRes
> {
  factory CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges(
    Fragment$MealPlanSummaryFragment$dietCategories$edges instance,
    TRes Function(Fragment$MealPlanSummaryFragment$dietCategories$edges) then,
  ) = _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges;

  factory CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges;

  TRes call({
    Fragment$MealPlanSummaryFragment$dietCategories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<TRes>
  get node;
}

class _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges<TRes>
    implements
        CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges<TRes> {
  _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanSummaryFragment$dietCategories$edges _instance;

  final TRes Function(Fragment$MealPlanSummaryFragment$dietCategories$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanSummaryFragment$dietCategories$edges(
      node: node == _undefined
          ? _instance.node
          : (node
                as Fragment$MealPlanSummaryFragment$dietCategories$edges$node?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<TRes>
  get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges<
  TRes
>
    implements
        CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges(
    this._res,
  );

  TRes _res;

  call({
    Fragment$MealPlanSummaryFragment$dietCategories$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<TRes>
  get node =>
      CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node.stub(
        _res,
      );
}

class Fragment$MealPlanSummaryFragment$dietCategories$edges$node {
  Fragment$MealPlanSummaryFragment$dietCategories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'DietCategory',
  });

  factory Fragment$MealPlanSummaryFragment$dietCategories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
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
    if (other is! Fragment$MealPlanSummaryFragment$dietCategories$edges$node ||
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

extension UtilityExtension$Fragment$MealPlanSummaryFragment$dietCategories$edges$node
    on Fragment$MealPlanSummaryFragment$dietCategories$edges$node {
  CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<
    Fragment$MealPlanSummaryFragment$dietCategories$edges$node
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<
  TRes
> {
  factory CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
    Fragment$MealPlanSummaryFragment$dietCategories$edges$node instance,
    TRes Function(Fragment$MealPlanSummaryFragment$dietCategories$edges$node)
    then,
  ) = _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges$node;

  factory CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<
          TRes
        > {
  _CopyWithImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanSummaryFragment$dietCategories$edges$node _instance;

  final TRes Function(
    Fragment$MealPlanSummaryFragment$dietCategories$edges$node,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
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

class _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$MealPlanSummaryFragment$dietCategories$edges$node<
          TRes
        > {
  _CopyWithStubImpl$Fragment$MealPlanSummaryFragment$dietCategories$edges$node(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Fragment$MealPlanFragment implements Fragment$MealPlanSummaryFragment {
  Fragment$MealPlanFragment({
    required this.id,
    required this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.restaurant,
    this.owner,
    this.dietCategories,
    this.$__typename = 'MealPlan',
    this.meals,
  });

  factory Fragment$MealPlanFragment.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$description = json['description'];
    final l$price = json['price'];
    final l$imageUrl = json['imageUrl'];
    final l$calories = json['calories'];
    final l$protein = json['protein'];
    final l$fat = json['fat'];
    final l$carbs = json['carbs'];
    final l$restaurant = json['restaurant'];
    final l$owner = json['owner'];
    final l$dietCategories = json['dietCategories'];
    final l$$__typename = json['__typename'];
    final l$meals = json['meals'];
    return Fragment$MealPlanFragment(
      id: (l$id as String),
      name: (l$name as String),
      description: (l$description as String?),
      price: (l$price as int?),
      imageUrl: (l$imageUrl as String?),
      calories: (l$calories as num?)?.toDouble(),
      protein: (l$protein as num?)?.toDouble(),
      fat: (l$fat as num?)?.toDouble(),
      carbs: (l$carbs as num?)?.toDouble(),
      restaurant: l$restaurant == null
          ? null
          : Fragment$MealPlanFragment$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      owner: l$owner == null
          ? null
          : Fragment$MealPlanFragment$owner.fromJson(
              (l$owner as Map<String, dynamic>),
            ),
      dietCategories: l$dietCategories == null
          ? null
          : Fragment$MealPlanFragment$dietCategories.fromJson(
              (l$dietCategories as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
      meals: l$meals == null
          ? null
          : Fragment$MealPlanFragment$meals.fromJson(
              (l$meals as Map<String, dynamic>),
            ),
    );
  }

  final String id;

  final String name;

  final String? description;

  final int? price;

  final String? imageUrl;

  final double? calories;

  final double? protein;

  final double? fat;

  final double? carbs;

  final Fragment$MealPlanFragment$restaurant? restaurant;

  final Fragment$MealPlanFragment$owner? owner;

  final Fragment$MealPlanFragment$dietCategories? dietCategories;

  final String $__typename;

  final Fragment$MealPlanFragment$meals? meals;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$imageUrl = imageUrl;
    _resultData['imageUrl'] = l$imageUrl;
    final l$calories = calories;
    _resultData['calories'] = l$calories;
    final l$protein = protein;
    _resultData['protein'] = l$protein;
    final l$fat = fat;
    _resultData['fat'] = l$fat;
    final l$carbs = carbs;
    _resultData['carbs'] = l$carbs;
    final l$restaurant = restaurant;
    _resultData['restaurant'] = l$restaurant?.toJson();
    final l$owner = owner;
    _resultData['owner'] = l$owner?.toJson();
    final l$dietCategories = dietCategories;
    _resultData['dietCategories'] = l$dietCategories?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$meals = meals;
    _resultData['meals'] = l$meals?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$imageUrl = imageUrl;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$restaurant = restaurant;
    final l$owner = owner;
    final l$dietCategories = dietCategories;
    final l$$__typename = $__typename;
    final l$meals = meals;
    return Object.hashAll([
      l$id,
      l$name,
      l$description,
      l$price,
      l$imageUrl,
      l$calories,
      l$protein,
      l$fat,
      l$carbs,
      l$restaurant,
      l$owner,
      l$dietCategories,
      l$$__typename,
      l$meals,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MealPlanFragment ||
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
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (l$owner != lOther$owner) {
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
    final l$meals = meals;
    final lOther$meals = other.meals;
    if (l$meals != lOther$meals) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$MealPlanFragment
    on Fragment$MealPlanFragment {
  CopyWith$Fragment$MealPlanFragment<Fragment$MealPlanFragment> get copyWith =>
      CopyWith$Fragment$MealPlanFragment(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment<TRes> {
  factory CopyWith$Fragment$MealPlanFragment(
    Fragment$MealPlanFragment instance,
    TRes Function(Fragment$MealPlanFragment) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment;

  factory CopyWith$Fragment$MealPlanFragment.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanFragment;

  TRes call({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    Fragment$MealPlanFragment$restaurant? restaurant,
    Fragment$MealPlanFragment$owner? owner,
    Fragment$MealPlanFragment$dietCategories? dietCategories,
    String? $__typename,
    Fragment$MealPlanFragment$meals? meals,
  });
  CopyWith$Fragment$MealPlanFragment$restaurant<TRes> get restaurant;
  CopyWith$Fragment$MealPlanFragment$owner<TRes> get owner;
  CopyWith$Fragment$MealPlanFragment$dietCategories<TRes> get dietCategories;
  CopyWith$Fragment$MealPlanFragment$meals<TRes> get meals;
}

class _CopyWithImpl$Fragment$MealPlanFragment<TRes>
    implements CopyWith$Fragment$MealPlanFragment<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment(this._instance, this._then);

  final Fragment$MealPlanFragment _instance;

  final TRes Function(Fragment$MealPlanFragment) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? imageUrl = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? restaurant = _undefined,
    Object? owner = _undefined,
    Object? dietCategories = _undefined,
    Object? $__typename = _undefined,
    Object? meals = _undefined,
  }) => _then(
    Fragment$MealPlanFragment(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      price: price == _undefined ? _instance.price : (price as int?),
      imageUrl: imageUrl == _undefined
          ? _instance.imageUrl
          : (imageUrl as String?),
      calories: calories == _undefined
          ? _instance.calories
          : (calories as double?),
      protein: protein == _undefined ? _instance.protein : (protein as double?),
      fat: fat == _undefined ? _instance.fat : (fat as double?),
      carbs: carbs == _undefined ? _instance.carbs : (carbs as double?),
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Fragment$MealPlanFragment$restaurant?),
      owner: owner == _undefined
          ? _instance.owner
          : (owner as Fragment$MealPlanFragment$owner?),
      dietCategories: dietCategories == _undefined
          ? _instance.dietCategories
          : (dietCategories as Fragment$MealPlanFragment$dietCategories?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
      meals: meals == _undefined
          ? _instance.meals
          : (meals as Fragment$MealPlanFragment$meals?),
    ),
  );

  CopyWith$Fragment$MealPlanFragment$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Fragment$MealPlanFragment$restaurant.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanFragment$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }

  CopyWith$Fragment$MealPlanFragment$owner<TRes> get owner {
    final local$owner = _instance.owner;
    return local$owner == null
        ? CopyWith$Fragment$MealPlanFragment$owner.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanFragment$owner(
            local$owner,
            (e) => call(owner: e),
          );
  }

  CopyWith$Fragment$MealPlanFragment$dietCategories<TRes> get dietCategories {
    final local$dietCategories = _instance.dietCategories;
    return local$dietCategories == null
        ? CopyWith$Fragment$MealPlanFragment$dietCategories.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$MealPlanFragment$dietCategories(
            local$dietCategories,
            (e) => call(dietCategories: e),
          );
  }

  CopyWith$Fragment$MealPlanFragment$meals<TRes> get meals {
    final local$meals = _instance.meals;
    return local$meals == null
        ? CopyWith$Fragment$MealPlanFragment$meals.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanFragment$meals(
            local$meals,
            (e) => call(meals: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$MealPlanFragment<TRes>
    implements CopyWith$Fragment$MealPlanFragment<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    Fragment$MealPlanFragment$restaurant? restaurant,
    Fragment$MealPlanFragment$owner? owner,
    Fragment$MealPlanFragment$dietCategories? dietCategories,
    String? $__typename,
    Fragment$MealPlanFragment$meals? meals,
  }) => _res;

  CopyWith$Fragment$MealPlanFragment$restaurant<TRes> get restaurant =>
      CopyWith$Fragment$MealPlanFragment$restaurant.stub(_res);

  CopyWith$Fragment$MealPlanFragment$owner<TRes> get owner =>
      CopyWith$Fragment$MealPlanFragment$owner.stub(_res);

  CopyWith$Fragment$MealPlanFragment$dietCategories<TRes> get dietCategories =>
      CopyWith$Fragment$MealPlanFragment$dietCategories.stub(_res);

  CopyWith$Fragment$MealPlanFragment$meals<TRes> get meals =>
      CopyWith$Fragment$MealPlanFragment$meals.stub(_res);
}

const fragmentDefinitionMealPlanFragment = FragmentDefinitionNode(
  name: NameNode(value: 'MealPlanFragment'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'MealPlan'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FragmentSpreadNode(
        name: NameNode(value: 'MealPlanSummaryFragment'),
        directives: [],
      ),
      FieldNode(
        name: NameNode(value: 'meals'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '50'),
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
                          name: NameNode(value: 'MealFragment'),
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
);
const documentNodeFragmentMealPlanFragment = DocumentNode(
  definitions: [
    fragmentDefinitionMealPlanFragment,
    fragmentDefinitionMealPlanSummaryFragment,
    fragmentDefinitionMealFragment,
  ],
);

extension ClientExtension$Fragment$MealPlanFragment on graphql.GraphQLClient {
  void writeFragment$MealPlanFragment({
    required Fragment$MealPlanFragment data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'MealPlanFragment',
        document: documentNodeFragmentMealPlanFragment,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$MealPlanFragment? readFragment$MealPlanFragment({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'MealPlanFragment',
          document: documentNodeFragmentMealPlanFragment,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$MealPlanFragment.fromJson(result);
  }
}

class Fragment$MealPlanFragment$restaurant
    implements Fragment$MealPlanSummaryFragment$restaurant {
  Fragment$MealPlanFragment$restaurant({
    required this.id,
    required this.name,
    required this.deliveryPrice,
    this.$__typename = 'Restaurant',
  });

  factory Fragment$MealPlanFragment$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$deliveryPrice = json['deliveryPrice'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$restaurant(
      id: (l$id as String),
      name: (l$name as String),
      deliveryPrice: (l$deliveryPrice as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int deliveryPrice;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$deliveryPrice = deliveryPrice;
    _resultData['deliveryPrice'] = l$deliveryPrice;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$deliveryPrice = deliveryPrice;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$name, l$deliveryPrice, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MealPlanFragment$restaurant ||
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
    final l$deliveryPrice = deliveryPrice;
    final lOther$deliveryPrice = other.deliveryPrice;
    if (l$deliveryPrice != lOther$deliveryPrice) {
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

extension UtilityExtension$Fragment$MealPlanFragment$restaurant
    on Fragment$MealPlanFragment$restaurant {
  CopyWith$Fragment$MealPlanFragment$restaurant<
    Fragment$MealPlanFragment$restaurant
  >
  get copyWith => CopyWith$Fragment$MealPlanFragment$restaurant(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment$restaurant<TRes> {
  factory CopyWith$Fragment$MealPlanFragment$restaurant(
    Fragment$MealPlanFragment$restaurant instance,
    TRes Function(Fragment$MealPlanFragment$restaurant) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$restaurant;

  factory CopyWith$Fragment$MealPlanFragment$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanFragment$restaurant;

  TRes call({
    String? id,
    String? name,
    int? deliveryPrice,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$MealPlanFragment$restaurant<TRes>
    implements CopyWith$Fragment$MealPlanFragment$restaurant<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$restaurant(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanFragment$restaurant _instance;

  final TRes Function(Fragment$MealPlanFragment$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? deliveryPrice = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanFragment$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      deliveryPrice: deliveryPrice == _undefined || deliveryPrice == null
          ? _instance.deliveryPrice
          : (deliveryPrice as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanFragment$restaurant<TRes>
    implements CopyWith$Fragment$MealPlanFragment$restaurant<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$restaurant(this._res);

  TRes _res;

  call({String? id, String? name, int? deliveryPrice, String? $__typename}) =>
      _res;
}

class Fragment$MealPlanFragment$owner
    implements Fragment$MealPlanSummaryFragment$owner {
  Fragment$MealPlanFragment$owner({
    required this.id,
    required this.roles,
    this.$__typename = 'User',
  });

  factory Fragment$MealPlanFragment$owner.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$roles = json['roles'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$owner(
      id: (l$id as String),
      roles: (l$roles as List<dynamic>),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final List<dynamic> roles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$roles = roles;
    _resultData['roles'] = l$roles;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$roles = roles;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$roles, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$MealPlanFragment$owner ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Fragment$MealPlanFragment$owner
    on Fragment$MealPlanFragment$owner {
  CopyWith$Fragment$MealPlanFragment$owner<Fragment$MealPlanFragment$owner>
  get copyWith => CopyWith$Fragment$MealPlanFragment$owner(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment$owner<TRes> {
  factory CopyWith$Fragment$MealPlanFragment$owner(
    Fragment$MealPlanFragment$owner instance,
    TRes Function(Fragment$MealPlanFragment$owner) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$owner;

  factory CopyWith$Fragment$MealPlanFragment$owner.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanFragment$owner;

  TRes call({String? id, List<dynamic>? roles, String? $__typename});
}

class _CopyWithImpl$Fragment$MealPlanFragment$owner<TRes>
    implements CopyWith$Fragment$MealPlanFragment$owner<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$owner(this._instance, this._then);

  final Fragment$MealPlanFragment$owner _instance;

  final TRes Function(Fragment$MealPlanFragment$owner) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? roles = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanFragment$owner(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      roles: roles == _undefined || roles == null
          ? _instance.roles
          : (roles as List<dynamic>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanFragment$owner<TRes>
    implements CopyWith$Fragment$MealPlanFragment$owner<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$owner(this._res);

  TRes _res;

  call({String? id, List<dynamic>? roles, String? $__typename}) => _res;
}

class Fragment$MealPlanFragment$dietCategories
    implements Fragment$MealPlanSummaryFragment$dietCategories {
  Fragment$MealPlanFragment$dietCategories({
    this.edges,
    this.$__typename = 'DietCategoryCursorConnection',
  });

  factory Fragment$MealPlanFragment$dietCategories.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$dietCategories(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$MealPlanFragment$dietCategories$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$MealPlanFragment$dietCategories$edges?>? edges;

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
    if (other is! Fragment$MealPlanFragment$dietCategories ||
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

extension UtilityExtension$Fragment$MealPlanFragment$dietCategories
    on Fragment$MealPlanFragment$dietCategories {
  CopyWith$Fragment$MealPlanFragment$dietCategories<
    Fragment$MealPlanFragment$dietCategories
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanFragment$dietCategories(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment$dietCategories<TRes> {
  factory CopyWith$Fragment$MealPlanFragment$dietCategories(
    Fragment$MealPlanFragment$dietCategories instance,
    TRes Function(Fragment$MealPlanFragment$dietCategories) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$dietCategories;

  factory CopyWith$Fragment$MealPlanFragment$dietCategories.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories;

  TRes call({
    List<Fragment$MealPlanFragment$dietCategories$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Fragment$MealPlanFragment$dietCategories$edges?>? Function(
      Iterable<
        CopyWith$Fragment$MealPlanFragment$dietCategories$edges<
          Fragment$MealPlanFragment$dietCategories$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$MealPlanFragment$dietCategories<TRes>
    implements CopyWith$Fragment$MealPlanFragment$dietCategories<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$dietCategories(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanFragment$dietCategories _instance;

  final TRes Function(Fragment$MealPlanFragment$dietCategories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Fragment$MealPlanFragment$dietCategories(
          edges: edges == _undefined
              ? _instance.edges
              : (edges
                    as List<Fragment$MealPlanFragment$dietCategories$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Fragment$MealPlanFragment$dietCategories$edges?>? Function(
      Iterable<
        CopyWith$Fragment$MealPlanFragment$dietCategories$edges<
          Fragment$MealPlanFragment$dietCategories$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Fragment$MealPlanFragment$dietCategories$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories<TRes>
    implements CopyWith$Fragment$MealPlanFragment$dietCategories<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories(this._res);

  TRes _res;

  call({
    List<Fragment$MealPlanFragment$dietCategories$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Fragment$MealPlanFragment$dietCategories$edges
    implements Fragment$MealPlanSummaryFragment$dietCategories$edges {
  Fragment$MealPlanFragment$dietCategories$edges({
    this.node,
    this.$__typename = 'DietCategoryEdge',
  });

  factory Fragment$MealPlanFragment$dietCategories$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$dietCategories$edges(
      node: l$node == null
          ? null
          : Fragment$MealPlanFragment$dietCategories$edges$node.fromJson(
              (l$node as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealPlanFragment$dietCategories$edges$node? node;

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
    if (other is! Fragment$MealPlanFragment$dietCategories$edges ||
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

extension UtilityExtension$Fragment$MealPlanFragment$dietCategories$edges
    on Fragment$MealPlanFragment$dietCategories$edges {
  CopyWith$Fragment$MealPlanFragment$dietCategories$edges<
    Fragment$MealPlanFragment$dietCategories$edges
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanFragment$dietCategories$edges(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment$dietCategories$edges<TRes> {
  factory CopyWith$Fragment$MealPlanFragment$dietCategories$edges(
    Fragment$MealPlanFragment$dietCategories$edges instance,
    TRes Function(Fragment$MealPlanFragment$dietCategories$edges) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$dietCategories$edges;

  factory CopyWith$Fragment$MealPlanFragment$dietCategories$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories$edges;

  TRes call({
    Fragment$MealPlanFragment$dietCategories$edges$node? node,
    String? $__typename,
  });
  CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<TRes> get node;
}

class _CopyWithImpl$Fragment$MealPlanFragment$dietCategories$edges<TRes>
    implements CopyWith$Fragment$MealPlanFragment$dietCategories$edges<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$dietCategories$edges(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanFragment$dietCategories$edges _instance;

  final TRes Function(Fragment$MealPlanFragment$dietCategories$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Fragment$MealPlanFragment$dietCategories$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$MealPlanFragment$dietCategories$edges$node?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node.stub(
            _then(_instance),
          )
        : CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node(
            local$node,
            (e) => call(node: e),
          );
  }
}

class _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories$edges<TRes>
    implements CopyWith$Fragment$MealPlanFragment$dietCategories$edges<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories$edges(this._res);

  TRes _res;

  call({
    Fragment$MealPlanFragment$dietCategories$edges$node? node,
    String? $__typename,
  }) => _res;

  CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<TRes> get node =>
      CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node.stub(_res);
}

class Fragment$MealPlanFragment$dietCategories$edges$node
    implements Fragment$MealPlanSummaryFragment$dietCategories$edges$node {
  Fragment$MealPlanFragment$dietCategories$edges$node({
    required this.id,
    required this.name,
    this.$__typename = 'DietCategory',
  });

  factory Fragment$MealPlanFragment$dietCategories$edges$node.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$dietCategories$edges$node(
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
    if (other is! Fragment$MealPlanFragment$dietCategories$edges$node ||
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

extension UtilityExtension$Fragment$MealPlanFragment$dietCategories$edges$node
    on Fragment$MealPlanFragment$dietCategories$edges$node {
  CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<
    Fragment$MealPlanFragment$dietCategories$edges$node
  >
  get copyWith => CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<
  TRes
> {
  factory CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node(
    Fragment$MealPlanFragment$dietCategories$edges$node instance,
    TRes Function(Fragment$MealPlanFragment$dietCategories$edges$node) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$dietCategories$edges$node;

  factory CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node.stub(
    TRes res,
  ) = _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories$edges$node;

  TRes call({String? id, String? name, String? $__typename});
}

class _CopyWithImpl$Fragment$MealPlanFragment$dietCategories$edges$node<TRes>
    implements
        CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$dietCategories$edges$node(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanFragment$dietCategories$edges$node _instance;

  final TRes Function(Fragment$MealPlanFragment$dietCategories$edges$node)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$MealPlanFragment$dietCategories$edges$node(
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

class _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories$edges$node<
  TRes
>
    implements
        CopyWith$Fragment$MealPlanFragment$dietCategories$edges$node<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$dietCategories$edges$node(
    this._res,
  );

  TRes _res;

  call({String? id, String? name, String? $__typename}) => _res;
}

class Fragment$MealPlanFragment$meals {
  Fragment$MealPlanFragment$meals({
    this.edges,
    this.$__typename = 'MealCursorConnection',
  });

  factory Fragment$MealPlanFragment$meals.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$meals(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Fragment$MealPlanFragment$meals$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$MealPlanFragment$meals$edges?>? edges;

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
    if (other is! Fragment$MealPlanFragment$meals ||
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

extension UtilityExtension$Fragment$MealPlanFragment$meals
    on Fragment$MealPlanFragment$meals {
  CopyWith$Fragment$MealPlanFragment$meals<Fragment$MealPlanFragment$meals>
  get copyWith => CopyWith$Fragment$MealPlanFragment$meals(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment$meals<TRes> {
  factory CopyWith$Fragment$MealPlanFragment$meals(
    Fragment$MealPlanFragment$meals instance,
    TRes Function(Fragment$MealPlanFragment$meals) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$meals;

  factory CopyWith$Fragment$MealPlanFragment$meals.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanFragment$meals;

  TRes call({
    List<Fragment$MealPlanFragment$meals$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
    Iterable<Fragment$MealPlanFragment$meals$edges?>? Function(
      Iterable<
        CopyWith$Fragment$MealPlanFragment$meals$edges<
          Fragment$MealPlanFragment$meals$edges
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$MealPlanFragment$meals<TRes>
    implements CopyWith$Fragment$MealPlanFragment$meals<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$meals(this._instance, this._then);

  final Fragment$MealPlanFragment$meals _instance;

  final TRes Function(Fragment$MealPlanFragment$meals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? edges = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Fragment$MealPlanFragment$meals(
          edges: edges == _undefined
              ? _instance.edges
              : (edges as List<Fragment$MealPlanFragment$meals$edges?>?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes edges(
    Iterable<Fragment$MealPlanFragment$meals$edges?>? Function(
      Iterable<
        CopyWith$Fragment$MealPlanFragment$meals$edges<
          Fragment$MealPlanFragment$meals$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Fragment$MealPlanFragment$meals$edges(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$MealPlanFragment$meals<TRes>
    implements CopyWith$Fragment$MealPlanFragment$meals<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$meals(this._res);

  TRes _res;

  call({
    List<Fragment$MealPlanFragment$meals$edges?>? edges,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;
}

class Fragment$MealPlanFragment$meals$edges {
  Fragment$MealPlanFragment$meals$edges({
    this.node,
    this.$__typename = 'MealEdge',
  });

  factory Fragment$MealPlanFragment$meals$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Fragment$MealPlanFragment$meals$edges(
      node: l$node == null
          ? null
          : Fragment$MealFragment.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealFragment? node;

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
    if (other is! Fragment$MealPlanFragment$meals$edges ||
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

extension UtilityExtension$Fragment$MealPlanFragment$meals$edges
    on Fragment$MealPlanFragment$meals$edges {
  CopyWith$Fragment$MealPlanFragment$meals$edges<
    Fragment$MealPlanFragment$meals$edges
  >
  get copyWith =>
      CopyWith$Fragment$MealPlanFragment$meals$edges(this, (i) => i);
}

abstract class CopyWith$Fragment$MealPlanFragment$meals$edges<TRes> {
  factory CopyWith$Fragment$MealPlanFragment$meals$edges(
    Fragment$MealPlanFragment$meals$edges instance,
    TRes Function(Fragment$MealPlanFragment$meals$edges) then,
  ) = _CopyWithImpl$Fragment$MealPlanFragment$meals$edges;

  factory CopyWith$Fragment$MealPlanFragment$meals$edges.stub(TRes res) =
      _CopyWithStubImpl$Fragment$MealPlanFragment$meals$edges;

  TRes call({Fragment$MealFragment? node, String? $__typename});
  CopyWith$Fragment$MealFragment<TRes> get node;
}

class _CopyWithImpl$Fragment$MealPlanFragment$meals$edges<TRes>
    implements CopyWith$Fragment$MealPlanFragment$meals$edges<TRes> {
  _CopyWithImpl$Fragment$MealPlanFragment$meals$edges(
    this._instance,
    this._then,
  );

  final Fragment$MealPlanFragment$meals$edges _instance;

  final TRes Function(Fragment$MealPlanFragment$meals$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Fragment$MealPlanFragment$meals$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$MealFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$MealFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealFragment(local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Fragment$MealPlanFragment$meals$edges<TRes>
    implements CopyWith$Fragment$MealPlanFragment$meals$edges<TRes> {
  _CopyWithStubImpl$Fragment$MealPlanFragment$meals$edges(this._res);

  TRes _res;

  call({Fragment$MealFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$MealFragment<TRes> get node =>
      CopyWith$Fragment$MealFragment.stub(_res);
}

class Variables$Query$GetMeals {
  factory Variables$Query$GetMeals({
    int? first,
    String? after,
    String? search,
    List<Input$MealFilter_price?>? price,
    List<Input$MealFilter_calories?>? calories,
    List<Input$MealFilter_protein?>? protein,
    List<Input$MealFilter_fat?>? fat,
    List<Input$MealFilter_carbs?>? carbs,
  }) => Variables$Query$GetMeals._({
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (search != null) r'search': search,
    if (price != null) r'price': price,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
  });

  Variables$Query$GetMeals._(this._$data);

  factory Variables$Query$GetMeals.fromJson(Map<String, dynamic> data) {
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
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_price.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_calories.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_protein.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_fat.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_carbs.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    return Variables$Query$GetMeals._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get search => (_$data['search'] as String?);

  List<Input$MealFilter_price?>? get price =>
      (_$data['price'] as List<Input$MealFilter_price?>?);

  List<Input$MealFilter_calories?>? get calories =>
      (_$data['calories'] as List<Input$MealFilter_calories?>?);

  List<Input$MealFilter_protein?>? get protein =>
      (_$data['protein'] as List<Input$MealFilter_protein?>?);

  List<Input$MealFilter_fat?>? get fat =>
      (_$data['fat'] as List<Input$MealFilter_fat?>?);

  List<Input$MealFilter_carbs?>? get carbs =>
      (_$data['carbs'] as List<Input$MealFilter_carbs?>?);

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
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs?.map((e) => e?.toJson()).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMeals<Variables$Query$GetMeals> get copyWith =>
      CopyWith$Variables$Query$GetMeals(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMeals ||
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
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != null && lOther$price != null) {
      if (l$price.length != lOther$price.length) {
        return false;
      }
      for (int i = 0; i < l$price.length; i++) {
        final l$price$entry = l$price[i];
        final lOther$price$entry = lOther$price[i];
        if (l$price$entry != lOther$price$entry) {
          return false;
        }
      }
    } else if (l$price != lOther$price) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != null && lOther$calories != null) {
      if (l$calories.length != lOther$calories.length) {
        return false;
      }
      for (int i = 0; i < l$calories.length; i++) {
        final l$calories$entry = l$calories[i];
        final lOther$calories$entry = lOther$calories[i];
        if (l$calories$entry != lOther$calories$entry) {
          return false;
        }
      }
    } else if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != null && lOther$protein != null) {
      if (l$protein.length != lOther$protein.length) {
        return false;
      }
      for (int i = 0; i < l$protein.length; i++) {
        final l$protein$entry = l$protein[i];
        final lOther$protein$entry = lOther$protein[i];
        if (l$protein$entry != lOther$protein$entry) {
          return false;
        }
      }
    } else if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != null && lOther$fat != null) {
      if (l$fat.length != lOther$fat.length) {
        return false;
      }
      for (int i = 0; i < l$fat.length; i++) {
        final l$fat$entry = l$fat[i];
        final lOther$fat$entry = lOther$fat[i];
        if (l$fat$entry != lOther$fat$entry) {
          return false;
        }
      }
    } else if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != null && lOther$carbs != null) {
      if (l$carbs.length != lOther$carbs.length) {
        return false;
      }
      for (int i = 0; i < l$carbs.length; i++) {
        final l$carbs$entry = l$carbs[i];
        final lOther$carbs$entry = lOther$carbs[i];
        if (l$carbs$entry != lOther$carbs$entry) {
          return false;
        }
      }
    } else if (l$carbs != lOther$carbs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$search = search;
    final l$price = price;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('price')
          ? l$price == null
                ? null
                : Object.hashAll(l$price.map((v) => v))
          : const {},
      _$data.containsKey('calories')
          ? l$calories == null
                ? null
                : Object.hashAll(l$calories.map((v) => v))
          : const {},
      _$data.containsKey('protein')
          ? l$protein == null
                ? null
                : Object.hashAll(l$protein.map((v) => v))
          : const {},
      _$data.containsKey('fat')
          ? l$fat == null
                ? null
                : Object.hashAll(l$fat.map((v) => v))
          : const {},
      _$data.containsKey('carbs')
          ? l$carbs == null
                ? null
                : Object.hashAll(l$carbs.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetMeals<TRes> {
  factory CopyWith$Variables$Query$GetMeals(
    Variables$Query$GetMeals instance,
    TRes Function(Variables$Query$GetMeals) then,
  ) = _CopyWithImpl$Variables$Query$GetMeals;

  factory CopyWith$Variables$Query$GetMeals.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMeals;

  TRes call({
    int? first,
    String? after,
    String? search,
    List<Input$MealFilter_price?>? price,
    List<Input$MealFilter_calories?>? calories,
    List<Input$MealFilter_protein?>? protein,
    List<Input$MealFilter_fat?>? fat,
    List<Input$MealFilter_carbs?>? carbs,
  });
}

class _CopyWithImpl$Variables$Query$GetMeals<TRes>
    implements CopyWith$Variables$Query$GetMeals<TRes> {
  _CopyWithImpl$Variables$Query$GetMeals(this._instance, this._then);

  final Variables$Query$GetMeals _instance;

  final TRes Function(Variables$Query$GetMeals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? search = _undefined,
    Object? price = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
  }) => _then(
    Variables$Query$GetMeals._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (search != _undefined) 'search': (search as String?),
      if (price != _undefined)
        'price': (price as List<Input$MealFilter_price?>?),
      if (calories != _undefined)
        'calories': (calories as List<Input$MealFilter_calories?>?),
      if (protein != _undefined)
        'protein': (protein as List<Input$MealFilter_protein?>?),
      if (fat != _undefined) 'fat': (fat as List<Input$MealFilter_fat?>?),
      if (carbs != _undefined)
        'carbs': (carbs as List<Input$MealFilter_carbs?>?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMeals<TRes>
    implements CopyWith$Variables$Query$GetMeals<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMeals(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? search,
    List<Input$MealFilter_price?>? price,
    List<Input$MealFilter_calories?>? calories,
    List<Input$MealFilter_protein?>? protein,
    List<Input$MealFilter_fat?>? fat,
    List<Input$MealFilter_carbs?>? carbs,
  }) => _res;
}

class Query$GetMeals {
  Query$GetMeals({this.meals, this.$__typename = 'Query'});

  factory Query$GetMeals.fromJson(Map<String, dynamic> json) {
    final l$meals = json['meals'];
    final l$$__typename = json['__typename'];
    return Query$GetMeals(
      meals: l$meals == null
          ? null
          : Query$GetMeals$meals.fromJson((l$meals as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMeals$meals? meals;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$meals = meals;
    _resultData['meals'] = l$meals?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$meals = meals;
    final l$$__typename = $__typename;
    return Object.hashAll([l$meals, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMeals || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetMeals on Query$GetMeals {
  CopyWith$Query$GetMeals<Query$GetMeals> get copyWith =>
      CopyWith$Query$GetMeals(this, (i) => i);
}

abstract class CopyWith$Query$GetMeals<TRes> {
  factory CopyWith$Query$GetMeals(
    Query$GetMeals instance,
    TRes Function(Query$GetMeals) then,
  ) = _CopyWithImpl$Query$GetMeals;

  factory CopyWith$Query$GetMeals.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMeals;

  TRes call({Query$GetMeals$meals? meals, String? $__typename});
  CopyWith$Query$GetMeals$meals<TRes> get meals;
}

class _CopyWithImpl$Query$GetMeals<TRes>
    implements CopyWith$Query$GetMeals<TRes> {
  _CopyWithImpl$Query$GetMeals(this._instance, this._then);

  final Query$GetMeals _instance;

  final TRes Function(Query$GetMeals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? meals = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMeals(
          meals: meals == _undefined
              ? _instance.meals
              : (meals as Query$GetMeals$meals?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Query$GetMeals$meals<TRes> get meals {
    final local$meals = _instance.meals;
    return local$meals == null
        ? CopyWith$Query$GetMeals$meals.stub(_then(_instance))
        : CopyWith$Query$GetMeals$meals(local$meals, (e) => call(meals: e));
  }
}

class _CopyWithStubImpl$Query$GetMeals<TRes>
    implements CopyWith$Query$GetMeals<TRes> {
  _CopyWithStubImpl$Query$GetMeals(this._res);

  TRes _res;

  call({Query$GetMeals$meals? meals, String? $__typename}) => _res;

  CopyWith$Query$GetMeals$meals<TRes> get meals =>
      CopyWith$Query$GetMeals$meals.stub(_res);
}

const documentNodeQueryGetMeals = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMeals'),
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
          variable: VariableNode(name: NameNode(value: 'price')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_price'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'calories')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_calories'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'protein')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_protein'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'fat')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_fat'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'carbs')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_carbs'),
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
            name: NameNode(value: 'meals'),
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
                name: NameNode(value: 'price'),
                value: VariableNode(name: NameNode(value: 'price')),
              ),
              ArgumentNode(
                name: NameNode(value: 'calories'),
                value: VariableNode(name: NameNode(value: 'calories')),
              ),
              ArgumentNode(
                name: NameNode(value: 'protein'),
                value: VariableNode(name: NameNode(value: 'protein')),
              ),
              ArgumentNode(
                name: NameNode(value: 'fat'),
                value: VariableNode(name: NameNode(value: 'fat')),
              ),
              ArgumentNode(
                name: NameNode(value: 'carbs'),
                value: VariableNode(name: NameNode(value: 'carbs')),
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
                              name: NameNode(value: 'MealFragment'),
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
                  name: NameNode(value: 'totalCount'),
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
    fragmentDefinitionMealFragment,
  ],
);
Query$GetMeals _parserFn$Query$GetMeals(Map<String, dynamic> data) =>
    Query$GetMeals.fromJson(data);
typedef OnQueryComplete$Query$GetMeals =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMeals?);

class Options$Query$GetMeals extends graphql.QueryOptions<Query$GetMeals> {
  Options$Query$GetMeals({
    String? operationName,
    Variables$Query$GetMeals? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMeals? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMeals? onComplete,
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
                 data == null ? null : _parserFn$Query$GetMeals(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMeals,
         parserFn: _parserFn$Query$GetMeals,
       );

  final OnQueryComplete$Query$GetMeals? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMeals
    extends graphql.WatchQueryOptions<Query$GetMeals> {
  WatchOptions$Query$GetMeals({
    String? operationName,
    Variables$Query$GetMeals? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMeals? typedOptimisticResult,
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
         document: documentNodeQueryGetMeals,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMeals,
       );
}

class FetchMoreOptions$Query$GetMeals extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMeals({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetMeals? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetMeals,
       );
}

extension ClientExtension$Query$GetMeals on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMeals>> query$GetMeals([
    Options$Query$GetMeals? options,
  ]) async => await this.query(options ?? Options$Query$GetMeals());

  graphql.ObservableQuery<Query$GetMeals> watchQuery$GetMeals([
    WatchOptions$Query$GetMeals? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetMeals());

  void writeQuery$GetMeals({
    required Query$GetMeals data,
    Variables$Query$GetMeals? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetMeals),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMeals? readQuery$GetMeals({
    Variables$Query$GetMeals? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMeals),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMeals.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMeals> useQuery$GetMeals([
  Options$Query$GetMeals? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetMeals());
graphql.ObservableQuery<Query$GetMeals> useWatchQuery$GetMeals([
  WatchOptions$Query$GetMeals? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetMeals());

class Query$GetMeals$Widget extends graphql_flutter.Query<Query$GetMeals> {
  Query$GetMeals$Widget({
    widgets.Key? key,
    Options$Query$GetMeals? options,
    required graphql_flutter.QueryBuilder<Query$GetMeals> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetMeals(),
         builder: builder,
       );
}

class Query$GetMeals$meals {
  Query$GetMeals$meals({
    this.edges,
    required this.pageInfo,
    required this.totalCount,
    this.$__typename = 'MealCursorConnection',
  });

  factory Query$GetMeals$meals.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$GetMeals$meals(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetMeals$meals$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetMeals$meals$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMeals$meals$edges?>? edges;

  final Query$GetMeals$meals$pageInfo pageInfo;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMeals$meals || runtimeType != other.runtimeType) {
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
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$GetMeals$meals on Query$GetMeals$meals {
  CopyWith$Query$GetMeals$meals<Query$GetMeals$meals> get copyWith =>
      CopyWith$Query$GetMeals$meals(this, (i) => i);
}

abstract class CopyWith$Query$GetMeals$meals<TRes> {
  factory CopyWith$Query$GetMeals$meals(
    Query$GetMeals$meals instance,
    TRes Function(Query$GetMeals$meals) then,
  ) = _CopyWithImpl$Query$GetMeals$meals;

  factory CopyWith$Query$GetMeals$meals.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMeals$meals;

  TRes call({
    List<Query$GetMeals$meals$edges?>? edges,
    Query$GetMeals$meals$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetMeals$meals$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMeals$meals$edges<Query$GetMeals$meals$edges>?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetMeals$meals$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetMeals$meals<TRes>
    implements CopyWith$Query$GetMeals$meals<TRes> {
  _CopyWithImpl$Query$GetMeals$meals(this._instance, this._then);

  final Query$GetMeals$meals _instance;

  final TRes Function(Query$GetMeals$meals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMeals$meals(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetMeals$meals$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetMeals$meals$pageInfo),
      totalCount: totalCount == _undefined || totalCount == null
          ? _instance.totalCount
          : (totalCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetMeals$meals$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMeals$meals$edges<Query$GetMeals$meals$edges>?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) =>
            e == null ? null : CopyWith$Query$GetMeals$meals$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetMeals$meals$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetMeals$meals$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetMeals$meals<TRes>
    implements CopyWith$Query$GetMeals$meals<TRes> {
  _CopyWithStubImpl$Query$GetMeals$meals(this._res);

  TRes _res;

  call({
    List<Query$GetMeals$meals$edges?>? edges,
    Query$GetMeals$meals$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetMeals$meals$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetMeals$meals$pageInfo.stub(_res);
}

class Query$GetMeals$meals$edges {
  Query$GetMeals$meals$edges({this.node, this.$__typename = 'MealEdge'});

  factory Query$GetMeals$meals$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetMeals$meals$edges(
      node: l$node == null
          ? null
          : Fragment$MealFragment.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealFragment? node;

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
    if (other is! Query$GetMeals$meals$edges ||
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

extension UtilityExtension$Query$GetMeals$meals$edges
    on Query$GetMeals$meals$edges {
  CopyWith$Query$GetMeals$meals$edges<Query$GetMeals$meals$edges>
  get copyWith => CopyWith$Query$GetMeals$meals$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetMeals$meals$edges<TRes> {
  factory CopyWith$Query$GetMeals$meals$edges(
    Query$GetMeals$meals$edges instance,
    TRes Function(Query$GetMeals$meals$edges) then,
  ) = _CopyWithImpl$Query$GetMeals$meals$edges;

  factory CopyWith$Query$GetMeals$meals$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMeals$meals$edges;

  TRes call({Fragment$MealFragment? node, String? $__typename});
  CopyWith$Fragment$MealFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetMeals$meals$edges<TRes>
    implements CopyWith$Query$GetMeals$meals$edges<TRes> {
  _CopyWithImpl$Query$GetMeals$meals$edges(this._instance, this._then);

  final Query$GetMeals$meals$edges _instance;

  final TRes Function(Query$GetMeals$meals$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMeals$meals$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$MealFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$MealFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealFragment(local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetMeals$meals$edges<TRes>
    implements CopyWith$Query$GetMeals$meals$edges<TRes> {
  _CopyWithStubImpl$Query$GetMeals$meals$edges(this._res);

  TRes _res;

  call({Fragment$MealFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$MealFragment<TRes> get node =>
      CopyWith$Fragment$MealFragment.stub(_res);
}

class Query$GetMeals$meals$pageInfo {
  Query$GetMeals$meals$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'MealPageInfo',
  });

  factory Query$GetMeals$meals$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetMeals$meals$pageInfo(
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
    if (other is! Query$GetMeals$meals$pageInfo ||
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

extension UtilityExtension$Query$GetMeals$meals$pageInfo
    on Query$GetMeals$meals$pageInfo {
  CopyWith$Query$GetMeals$meals$pageInfo<Query$GetMeals$meals$pageInfo>
  get copyWith => CopyWith$Query$GetMeals$meals$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetMeals$meals$pageInfo<TRes> {
  factory CopyWith$Query$GetMeals$meals$pageInfo(
    Query$GetMeals$meals$pageInfo instance,
    TRes Function(Query$GetMeals$meals$pageInfo) then,
  ) = _CopyWithImpl$Query$GetMeals$meals$pageInfo;

  factory CopyWith$Query$GetMeals$meals$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMeals$meals$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetMeals$meals$pageInfo<TRes>
    implements CopyWith$Query$GetMeals$meals$pageInfo<TRes> {
  _CopyWithImpl$Query$GetMeals$meals$pageInfo(this._instance, this._then);

  final Query$GetMeals$meals$pageInfo _instance;

  final TRes Function(Query$GetMeals$meals$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMeals$meals$pageInfo(
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

class _CopyWithStubImpl$Query$GetMeals$meals$pageInfo<TRes>
    implements CopyWith$Query$GetMeals$meals$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetMeals$meals$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetMeal {
  factory Variables$Query$GetMeal({required String id}) =>
      Variables$Query$GetMeal._({r'id': id});

  Variables$Query$GetMeal._(this._$data);

  factory Variables$Query$GetMeal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetMeal._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetMeal<Variables$Query$GetMeal> get copyWith =>
      CopyWith$Variables$Query$GetMeal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMeal || runtimeType != other.runtimeType) {
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

abstract class CopyWith$Variables$Query$GetMeal<TRes> {
  factory CopyWith$Variables$Query$GetMeal(
    Variables$Query$GetMeal instance,
    TRes Function(Variables$Query$GetMeal) then,
  ) = _CopyWithImpl$Variables$Query$GetMeal;

  factory CopyWith$Variables$Query$GetMeal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMeal;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetMeal<TRes>
    implements CopyWith$Variables$Query$GetMeal<TRes> {
  _CopyWithImpl$Variables$Query$GetMeal(this._instance, this._then);

  final Variables$Query$GetMeal _instance;

  final TRes Function(Variables$Query$GetMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetMeal._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMeal<TRes>
    implements CopyWith$Variables$Query$GetMeal<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMeal(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetMeal {
  Query$GetMeal({this.meal, this.$__typename = 'Query'});

  factory Query$GetMeal.fromJson(Map<String, dynamic> json) {
    final l$meal = json['meal'];
    final l$$__typename = json['__typename'];
    return Query$GetMeal(
      meal: l$meal == null
          ? null
          : Fragment$MealFragment.fromJson((l$meal as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealFragment? meal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$meal = meal;
    _resultData['meal'] = l$meal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$meal = meal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$meal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMeal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$meal = meal;
    final lOther$meal = other.meal;
    if (l$meal != lOther$meal) {
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

extension UtilityExtension$Query$GetMeal on Query$GetMeal {
  CopyWith$Query$GetMeal<Query$GetMeal> get copyWith =>
      CopyWith$Query$GetMeal(this, (i) => i);
}

abstract class CopyWith$Query$GetMeal<TRes> {
  factory CopyWith$Query$GetMeal(
    Query$GetMeal instance,
    TRes Function(Query$GetMeal) then,
  ) = _CopyWithImpl$Query$GetMeal;

  factory CopyWith$Query$GetMeal.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMeal;

  TRes call({Fragment$MealFragment? meal, String? $__typename});
  CopyWith$Fragment$MealFragment<TRes> get meal;
}

class _CopyWithImpl$Query$GetMeal<TRes>
    implements CopyWith$Query$GetMeal<TRes> {
  _CopyWithImpl$Query$GetMeal(this._instance, this._then);

  final Query$GetMeal _instance;

  final TRes Function(Query$GetMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? meal = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMeal(
          meal: meal == _undefined
              ? _instance.meal
              : (meal as Fragment$MealFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealFragment<TRes> get meal {
    final local$meal = _instance.meal;
    return local$meal == null
        ? CopyWith$Fragment$MealFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealFragment(local$meal, (e) => call(meal: e));
  }
}

class _CopyWithStubImpl$Query$GetMeal<TRes>
    implements CopyWith$Query$GetMeal<TRes> {
  _CopyWithStubImpl$Query$GetMeal(this._res);

  TRes _res;

  call({Fragment$MealFragment? meal, String? $__typename}) => _res;

  CopyWith$Fragment$MealFragment<TRes> get meal =>
      CopyWith$Fragment$MealFragment.stub(_res);
}

const documentNodeQueryGetMeal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMeal'),
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
            name: NameNode(value: 'meal'),
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
                  name: NameNode(value: 'MealFragment'),
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
    fragmentDefinitionMealFragment,
  ],
);
Query$GetMeal _parserFn$Query$GetMeal(Map<String, dynamic> data) =>
    Query$GetMeal.fromJson(data);
typedef OnQueryComplete$Query$GetMeal =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMeal?);

class Options$Query$GetMeal extends graphql.QueryOptions<Query$GetMeal> {
  Options$Query$GetMeal({
    String? operationName,
    required Variables$Query$GetMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMeal? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMeal? onComplete,
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
                 data == null ? null : _parserFn$Query$GetMeal(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMeal,
         parserFn: _parserFn$Query$GetMeal,
       );

  final OnQueryComplete$Query$GetMeal? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMeal
    extends graphql.WatchQueryOptions<Query$GetMeal> {
  WatchOptions$Query$GetMeal({
    String? operationName,
    required Variables$Query$GetMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMeal? typedOptimisticResult,
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
         document: documentNodeQueryGetMeal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMeal,
       );
}

class FetchMoreOptions$Query$GetMeal extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMeal({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMeal variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetMeal,
       );
}

extension ClientExtension$Query$GetMeal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMeal>> query$GetMeal(
    Options$Query$GetMeal options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetMeal> watchQuery$GetMeal(
    WatchOptions$Query$GetMeal options,
  ) => this.watchQuery(options);

  void writeQuery$GetMeal({
    required Query$GetMeal data,
    required Variables$Query$GetMeal variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetMeal),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMeal? readQuery$GetMeal({
    required Variables$Query$GetMeal variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMeal),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMeal.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMeal> useQuery$GetMeal(
  Options$Query$GetMeal options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMeal> useWatchQuery$GetMeal(
  WatchOptions$Query$GetMeal options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetMeal$Widget extends graphql_flutter.Query<Query$GetMeal> {
  Query$GetMeal$Widget({
    widgets.Key? key,
    required Options$Query$GetMeal options,
    required graphql_flutter.QueryBuilder<Query$GetMeal> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Query$GetMealsByRestaurant {
  factory Variables$Query$GetMealsByRestaurant({
    required String restaurantId,
    int? first,
    String? after,
    String? search,
    List<Input$MealFilter_price?>? price,
    List<Input$MealFilter_calories?>? calories,
    List<Input$MealFilter_protein?>? protein,
    List<Input$MealFilter_fat?>? fat,
    List<Input$MealFilter_carbs?>? carbs,
  }) => Variables$Query$GetMealsByRestaurant._({
    r'restaurantId': restaurantId,
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (search != null) r'search': search,
    if (price != null) r'price': price,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
  });

  Variables$Query$GetMealsByRestaurant._(this._$data);

  factory Variables$Query$GetMealsByRestaurant.fromJson(
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
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_price.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_calories.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_protein.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_fat.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealFilter_carbs.fromJson((e as Map<String, dynamic>)),
          )
          .toList();
    }
    return Variables$Query$GetMealsByRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  String get restaurantId => (_$data['restaurantId'] as String);

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get search => (_$data['search'] as String?);

  List<Input$MealFilter_price?>? get price =>
      (_$data['price'] as List<Input$MealFilter_price?>?);

  List<Input$MealFilter_calories?>? get calories =>
      (_$data['calories'] as List<Input$MealFilter_calories?>?);

  List<Input$MealFilter_protein?>? get protein =>
      (_$data['protein'] as List<Input$MealFilter_protein?>?);

  List<Input$MealFilter_fat?>? get fat =>
      (_$data['fat'] as List<Input$MealFilter_fat?>?);

  List<Input$MealFilter_carbs?>? get carbs =>
      (_$data['carbs'] as List<Input$MealFilter_carbs?>?);

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
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs?.map((e) => e?.toJson()).toList();
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMealsByRestaurant<
    Variables$Query$GetMealsByRestaurant
  >
  get copyWith => CopyWith$Variables$Query$GetMealsByRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMealsByRestaurant ||
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
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != null && lOther$price != null) {
      if (l$price.length != lOther$price.length) {
        return false;
      }
      for (int i = 0; i < l$price.length; i++) {
        final l$price$entry = l$price[i];
        final lOther$price$entry = lOther$price[i];
        if (l$price$entry != lOther$price$entry) {
          return false;
        }
      }
    } else if (l$price != lOther$price) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != null && lOther$calories != null) {
      if (l$calories.length != lOther$calories.length) {
        return false;
      }
      for (int i = 0; i < l$calories.length; i++) {
        final l$calories$entry = l$calories[i];
        final lOther$calories$entry = lOther$calories[i];
        if (l$calories$entry != lOther$calories$entry) {
          return false;
        }
      }
    } else if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != null && lOther$protein != null) {
      if (l$protein.length != lOther$protein.length) {
        return false;
      }
      for (int i = 0; i < l$protein.length; i++) {
        final l$protein$entry = l$protein[i];
        final lOther$protein$entry = lOther$protein[i];
        if (l$protein$entry != lOther$protein$entry) {
          return false;
        }
      }
    } else if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != null && lOther$fat != null) {
      if (l$fat.length != lOther$fat.length) {
        return false;
      }
      for (int i = 0; i < l$fat.length; i++) {
        final l$fat$entry = l$fat[i];
        final lOther$fat$entry = lOther$fat[i];
        if (l$fat$entry != lOther$fat$entry) {
          return false;
        }
      }
    } else if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != null && lOther$carbs != null) {
      if (l$carbs.length != lOther$carbs.length) {
        return false;
      }
      for (int i = 0; i < l$carbs.length; i++) {
        final l$carbs$entry = l$carbs[i];
        final lOther$carbs$entry = lOther$carbs[i];
        if (l$carbs$entry != lOther$carbs$entry) {
          return false;
        }
      }
    } else if (l$carbs != lOther$carbs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    final l$first = first;
    final l$after = after;
    final l$search = search;
    final l$price = price;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    return Object.hashAll([
      l$restaurantId,
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('price')
          ? l$price == null
                ? null
                : Object.hashAll(l$price.map((v) => v))
          : const {},
      _$data.containsKey('calories')
          ? l$calories == null
                ? null
                : Object.hashAll(l$calories.map((v) => v))
          : const {},
      _$data.containsKey('protein')
          ? l$protein == null
                ? null
                : Object.hashAll(l$protein.map((v) => v))
          : const {},
      _$data.containsKey('fat')
          ? l$fat == null
                ? null
                : Object.hashAll(l$fat.map((v) => v))
          : const {},
      _$data.containsKey('carbs')
          ? l$carbs == null
                ? null
                : Object.hashAll(l$carbs.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetMealsByRestaurant<TRes> {
  factory CopyWith$Variables$Query$GetMealsByRestaurant(
    Variables$Query$GetMealsByRestaurant instance,
    TRes Function(Variables$Query$GetMealsByRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$GetMealsByRestaurant;

  factory CopyWith$Variables$Query$GetMealsByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMealsByRestaurant;

  TRes call({
    String? restaurantId,
    int? first,
    String? after,
    String? search,
    List<Input$MealFilter_price?>? price,
    List<Input$MealFilter_calories?>? calories,
    List<Input$MealFilter_protein?>? protein,
    List<Input$MealFilter_fat?>? fat,
    List<Input$MealFilter_carbs?>? carbs,
  });
}

class _CopyWithImpl$Variables$Query$GetMealsByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetMealsByRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$GetMealsByRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMealsByRestaurant _instance;

  final TRes Function(Variables$Query$GetMealsByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantId = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
    Object? search = _undefined,
    Object? price = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
  }) => _then(
    Variables$Query$GetMealsByRestaurant._({
      ..._instance._$data,
      if (restaurantId != _undefined && restaurantId != null)
        'restaurantId': (restaurantId as String),
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (search != _undefined) 'search': (search as String?),
      if (price != _undefined)
        'price': (price as List<Input$MealFilter_price?>?),
      if (calories != _undefined)
        'calories': (calories as List<Input$MealFilter_calories?>?),
      if (protein != _undefined)
        'protein': (protein as List<Input$MealFilter_protein?>?),
      if (fat != _undefined) 'fat': (fat as List<Input$MealFilter_fat?>?),
      if (carbs != _undefined)
        'carbs': (carbs as List<Input$MealFilter_carbs?>?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMealsByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetMealsByRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMealsByRestaurant(this._res);

  TRes _res;

  call({
    String? restaurantId,
    int? first,
    String? after,
    String? search,
    List<Input$MealFilter_price?>? price,
    List<Input$MealFilter_calories?>? calories,
    List<Input$MealFilter_protein?>? protein,
    List<Input$MealFilter_fat?>? fat,
    List<Input$MealFilter_carbs?>? carbs,
  }) => _res;
}

class Query$GetMealsByRestaurant {
  Query$GetMealsByRestaurant({this.restaurant, this.$__typename = 'Query'});

  factory Query$GetMealsByRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetMealsByRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Query$GetMealsByRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMealsByRestaurant$restaurant? restaurant;

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
    if (other is! Query$GetMealsByRestaurant ||
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

extension UtilityExtension$Query$GetMealsByRestaurant
    on Query$GetMealsByRestaurant {
  CopyWith$Query$GetMealsByRestaurant<Query$GetMealsByRestaurant>
  get copyWith => CopyWith$Query$GetMealsByRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetMealsByRestaurant<TRes> {
  factory CopyWith$Query$GetMealsByRestaurant(
    Query$GetMealsByRestaurant instance,
    TRes Function(Query$GetMealsByRestaurant) then,
  ) = _CopyWithImpl$Query$GetMealsByRestaurant;

  factory CopyWith$Query$GetMealsByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealsByRestaurant;

  TRes call({
    Query$GetMealsByRestaurant$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetMealsByRestaurant$restaurant<TRes> get restaurant;
}

class _CopyWithImpl$Query$GetMealsByRestaurant<TRes>
    implements CopyWith$Query$GetMealsByRestaurant<TRes> {
  _CopyWithImpl$Query$GetMealsByRestaurant(this._instance, this._then);

  final Query$GetMealsByRestaurant _instance;

  final TRes Function(Query$GetMealsByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealsByRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetMealsByRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMealsByRestaurant$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetMealsByRestaurant$restaurant.stub(_then(_instance))
        : CopyWith$Query$GetMealsByRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMealsByRestaurant<TRes>
    implements CopyWith$Query$GetMealsByRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetMealsByRestaurant(this._res);

  TRes _res;

  call({
    Query$GetMealsByRestaurant$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMealsByRestaurant$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetMealsByRestaurant$restaurant.stub(_res);
}

const documentNodeQueryGetMealsByRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMealsByRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
          variable: VariableNode(name: NameNode(value: 'search')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'price')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_price'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'calories')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_calories'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'protein')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_protein'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'fat')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_fat'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'carbs')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealFilter_carbs'),
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
            name: NameNode(value: 'restaurant'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'restaurantId')),
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
                  name: NameNode(value: 'meals'),
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
                      name: NameNode(value: 'price'),
                      value: VariableNode(name: NameNode(value: 'price')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'calories'),
                      value: VariableNode(name: NameNode(value: 'calories')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'protein'),
                      value: VariableNode(name: NameNode(value: 'protein')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'fat'),
                      value: VariableNode(name: NameNode(value: 'fat')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'carbs'),
                      value: VariableNode(name: NameNode(value: 'carbs')),
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
                                    name: NameNode(value: 'MealFragment'),
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
                        name: NameNode(value: 'totalCount'),
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
    fragmentDefinitionMealFragment,
  ],
);
Query$GetMealsByRestaurant _parserFn$Query$GetMealsByRestaurant(
  Map<String, dynamic> data,
) => Query$GetMealsByRestaurant.fromJson(data);
typedef OnQueryComplete$Query$GetMealsByRestaurant =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMealsByRestaurant?);

class Options$Query$GetMealsByRestaurant
    extends graphql.QueryOptions<Query$GetMealsByRestaurant> {
  Options$Query$GetMealsByRestaurant({
    String? operationName,
    required Variables$Query$GetMealsByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealsByRestaurant? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMealsByRestaurant? onComplete,
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
                     : _parserFn$Query$GetMealsByRestaurant(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMealsByRestaurant,
         parserFn: _parserFn$Query$GetMealsByRestaurant,
       );

  final OnQueryComplete$Query$GetMealsByRestaurant? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMealsByRestaurant
    extends graphql.WatchQueryOptions<Query$GetMealsByRestaurant> {
  WatchOptions$Query$GetMealsByRestaurant({
    String? operationName,
    required Variables$Query$GetMealsByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealsByRestaurant? typedOptimisticResult,
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
         document: documentNodeQueryGetMealsByRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMealsByRestaurant,
       );
}

class FetchMoreOptions$Query$GetMealsByRestaurant
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMealsByRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMealsByRestaurant variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetMealsByRestaurant,
       );
}

extension ClientExtension$Query$GetMealsByRestaurant on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMealsByRestaurant>>
  query$GetMealsByRestaurant(
    Options$Query$GetMealsByRestaurant options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetMealsByRestaurant>
  watchQuery$GetMealsByRestaurant(
    WatchOptions$Query$GetMealsByRestaurant options,
  ) => this.watchQuery(options);

  void writeQuery$GetMealsByRestaurant({
    required Query$GetMealsByRestaurant data,
    required Variables$Query$GetMealsByRestaurant variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetMealsByRestaurant,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMealsByRestaurant? readQuery$GetMealsByRestaurant({
    required Variables$Query$GetMealsByRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetMealsByRestaurant,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMealsByRestaurant.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMealsByRestaurant>
useQuery$GetMealsByRestaurant(Options$Query$GetMealsByRestaurant options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMealsByRestaurant>
useWatchQuery$GetMealsByRestaurant(
  WatchOptions$Query$GetMealsByRestaurant options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetMealsByRestaurant$Widget
    extends graphql_flutter.Query<Query$GetMealsByRestaurant> {
  Query$GetMealsByRestaurant$Widget({
    widgets.Key? key,
    required Options$Query$GetMealsByRestaurant options,
    required graphql_flutter.QueryBuilder<Query$GetMealsByRestaurant> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetMealsByRestaurant$restaurant {
  Query$GetMealsByRestaurant$restaurant({
    required this.id,
    this.meals,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetMealsByRestaurant$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$meals = json['meals'];
    final l$$__typename = json['__typename'];
    return Query$GetMealsByRestaurant$restaurant(
      id: (l$id as String),
      meals: l$meals == null
          ? null
          : Query$GetMealsByRestaurant$restaurant$meals.fromJson(
              (l$meals as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetMealsByRestaurant$restaurant$meals? meals;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$meals = meals;
    _resultData['meals'] = l$meals?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$meals = meals;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$meals, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealsByRestaurant$restaurant ||
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

extension UtilityExtension$Query$GetMealsByRestaurant$restaurant
    on Query$GetMealsByRestaurant$restaurant {
  CopyWith$Query$GetMealsByRestaurant$restaurant<
    Query$GetMealsByRestaurant$restaurant
  >
  get copyWith =>
      CopyWith$Query$GetMealsByRestaurant$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetMealsByRestaurant$restaurant<TRes> {
  factory CopyWith$Query$GetMealsByRestaurant$restaurant(
    Query$GetMealsByRestaurant$restaurant instance,
    TRes Function(Query$GetMealsByRestaurant$restaurant) then,
  ) = _CopyWithImpl$Query$GetMealsByRestaurant$restaurant;

  factory CopyWith$Query$GetMealsByRestaurant$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant;

  TRes call({
    String? id,
    Query$GetMealsByRestaurant$restaurant$meals? meals,
    String? $__typename,
  });
  CopyWith$Query$GetMealsByRestaurant$restaurant$meals<TRes> get meals;
}

class _CopyWithImpl$Query$GetMealsByRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetMealsByRestaurant$restaurant<TRes> {
  _CopyWithImpl$Query$GetMealsByRestaurant$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetMealsByRestaurant$restaurant _instance;

  final TRes Function(Query$GetMealsByRestaurant$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? meals = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealsByRestaurant$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      meals: meals == _undefined
          ? _instance.meals
          : (meals as Query$GetMealsByRestaurant$restaurant$meals?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMealsByRestaurant$restaurant$meals<TRes> get meals {
    final local$meals = _instance.meals;
    return local$meals == null
        ? CopyWith$Query$GetMealsByRestaurant$restaurant$meals.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetMealsByRestaurant$restaurant$meals(
            local$meals,
            (e) => call(meals: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetMealsByRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetMealsByRestaurant$restaurant$meals? meals,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMealsByRestaurant$restaurant$meals<TRes> get meals =>
      CopyWith$Query$GetMealsByRestaurant$restaurant$meals.stub(_res);
}

class Query$GetMealsByRestaurant$restaurant$meals {
  Query$GetMealsByRestaurant$restaurant$meals({
    this.edges,
    required this.pageInfo,
    required this.totalCount,
    this.$__typename = 'MealCursorConnection',
  });

  factory Query$GetMealsByRestaurant$restaurant$meals.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$GetMealsByRestaurant$restaurant$meals(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetMealsByRestaurant$restaurant$meals$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetMealsByRestaurant$restaurant$meals$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMealsByRestaurant$restaurant$meals$edges?>? edges;

  final Query$GetMealsByRestaurant$restaurant$meals$pageInfo pageInfo;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealsByRestaurant$restaurant$meals ||
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
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$GetMealsByRestaurant$restaurant$meals
    on Query$GetMealsByRestaurant$restaurant$meals {
  CopyWith$Query$GetMealsByRestaurant$restaurant$meals<
    Query$GetMealsByRestaurant$restaurant$meals
  >
  get copyWith =>
      CopyWith$Query$GetMealsByRestaurant$restaurant$meals(this, (i) => i);
}

abstract class CopyWith$Query$GetMealsByRestaurant$restaurant$meals<TRes> {
  factory CopyWith$Query$GetMealsByRestaurant$restaurant$meals(
    Query$GetMealsByRestaurant$restaurant$meals instance,
    TRes Function(Query$GetMealsByRestaurant$restaurant$meals) then,
  ) = _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals;

  factory CopyWith$Query$GetMealsByRestaurant$restaurant$meals.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals;

  TRes call({
    List<Query$GetMealsByRestaurant$restaurant$meals$edges?>? edges,
    Query$GetMealsByRestaurant$restaurant$meals$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetMealsByRestaurant$restaurant$meals$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges<
          Query$GetMealsByRestaurant$restaurant$meals$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<TRes>
  get pageInfo;
}

class _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals<TRes>
    implements CopyWith$Query$GetMealsByRestaurant$restaurant$meals<TRes> {
  _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals(
    this._instance,
    this._then,
  );

  final Query$GetMealsByRestaurant$restaurant$meals _instance;

  final TRes Function(Query$GetMealsByRestaurant$restaurant$meals) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealsByRestaurant$restaurant$meals(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<Query$GetMealsByRestaurant$restaurant$meals$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetMealsByRestaurant$restaurant$meals$pageInfo),
      totalCount: totalCount == _undefined || totalCount == null
          ? _instance.totalCount
          : (totalCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetMealsByRestaurant$restaurant$meals$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges<
          Query$GetMealsByRestaurant$restaurant$meals$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<TRes>
  get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals<TRes>
    implements CopyWith$Query$GetMealsByRestaurant$restaurant$meals<TRes> {
  _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals(this._res);

  TRes _res;

  call({
    List<Query$GetMealsByRestaurant$restaurant$meals$edges?>? edges,
    Query$GetMealsByRestaurant$restaurant$meals$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo.stub(_res);
}

class Query$GetMealsByRestaurant$restaurant$meals$edges {
  Query$GetMealsByRestaurant$restaurant$meals$edges({
    this.node,
    this.$__typename = 'MealEdge',
  });

  factory Query$GetMealsByRestaurant$restaurant$meals$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetMealsByRestaurant$restaurant$meals$edges(
      node: l$node == null
          ? null
          : Fragment$MealFragment.fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealFragment? node;

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
    if (other is! Query$GetMealsByRestaurant$restaurant$meals$edges ||
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

extension UtilityExtension$Query$GetMealsByRestaurant$restaurant$meals$edges
    on Query$GetMealsByRestaurant$restaurant$meals$edges {
  CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges<
    Query$GetMealsByRestaurant$restaurant$meals$edges
  >
  get copyWith => CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges<
  TRes
> {
  factory CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges(
    Query$GetMealsByRestaurant$restaurant$meals$edges instance,
    TRes Function(Query$GetMealsByRestaurant$restaurant$meals$edges) then,
  ) = _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals$edges;

  factory CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals$edges;

  TRes call({Fragment$MealFragment? node, String? $__typename});
  CopyWith$Fragment$MealFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals$edges<TRes>
    implements
        CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges<TRes> {
  _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals$edges(
    this._instance,
    this._then,
  );

  final Query$GetMealsByRestaurant$restaurant$meals$edges _instance;

  final TRes Function(Query$GetMealsByRestaurant$restaurant$meals$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMealsByRestaurant$restaurant$meals$edges(
          node: node == _undefined
              ? _instance.node
              : (node as Fragment$MealFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealFragment<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Fragment$MealFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealFragment(local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals$edges<TRes>
    implements
        CopyWith$Query$GetMealsByRestaurant$restaurant$meals$edges<TRes> {
  _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals$edges(
    this._res,
  );

  TRes _res;

  call({Fragment$MealFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$MealFragment<TRes> get node =>
      CopyWith$Fragment$MealFragment.stub(_res);
}

class Query$GetMealsByRestaurant$restaurant$meals$pageInfo {
  Query$GetMealsByRestaurant$restaurant$meals$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'MealPageInfo',
  });

  factory Query$GetMealsByRestaurant$restaurant$meals$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
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
    if (other is! Query$GetMealsByRestaurant$restaurant$meals$pageInfo ||
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

extension UtilityExtension$Query$GetMealsByRestaurant$restaurant$meals$pageInfo
    on Query$GetMealsByRestaurant$restaurant$meals$pageInfo {
  CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<
    Query$GetMealsByRestaurant$restaurant$meals$pageInfo
  >
  get copyWith => CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<
  TRes
> {
  factory CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
    Query$GetMealsByRestaurant$restaurant$meals$pageInfo instance,
    TRes Function(Query$GetMealsByRestaurant$restaurant$meals$pageInfo) then,
  ) = _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals$pageInfo;

  factory CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<TRes>
    implements
        CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<TRes> {
  _CopyWithImpl$Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetMealsByRestaurant$restaurant$meals$pageInfo _instance;

  final TRes Function(Query$GetMealsByRestaurant$restaurant$meals$pageInfo)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
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

class _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<
  TRes
>
    implements
        CopyWith$Query$GetMealsByRestaurant$restaurant$meals$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetMealsByRestaurant$restaurant$meals$pageInfo(
    this._res,
  );

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Mutation$CreateMeal {
  factory Variables$Mutation$CreateMeal({
    required Input$createMealInput input,
  }) => Variables$Mutation$CreateMeal._({r'input': input});

  Variables$Mutation$CreateMeal._(this._$data);

  factory Variables$Mutation$CreateMeal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createMealInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateMeal._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createMealInput get input => (_$data['input'] as Input$createMealInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateMeal<Variables$Mutation$CreateMeal>
  get copyWith => CopyWith$Variables$Mutation$CreateMeal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateMeal ||
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

abstract class CopyWith$Variables$Mutation$CreateMeal<TRes> {
  factory CopyWith$Variables$Mutation$CreateMeal(
    Variables$Mutation$CreateMeal instance,
    TRes Function(Variables$Mutation$CreateMeal) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateMeal;

  factory CopyWith$Variables$Mutation$CreateMeal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateMeal;

  TRes call({Input$createMealInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateMeal<TRes>
    implements CopyWith$Variables$Mutation$CreateMeal<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateMeal(this._instance, this._then);

  final Variables$Mutation$CreateMeal _instance;

  final TRes Function(Variables$Mutation$CreateMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateMeal._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createMealInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateMeal<TRes>
    implements CopyWith$Variables$Mutation$CreateMeal<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateMeal(this._res);

  TRes _res;

  call({Input$createMealInput? input}) => _res;
}

class Mutation$CreateMeal {
  Mutation$CreateMeal({this.createMeal, this.$__typename = 'Mutation'});

  factory Mutation$CreateMeal.fromJson(Map<String, dynamic> json) {
    final l$createMeal = json['createMeal'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMeal(
      createMeal: l$createMeal == null
          ? null
          : Mutation$CreateMeal$createMeal.fromJson(
              (l$createMeal as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateMeal$createMeal? createMeal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createMeal = createMeal;
    _resultData['createMeal'] = l$createMeal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createMeal = createMeal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createMeal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMeal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createMeal = createMeal;
    final lOther$createMeal = other.createMeal;
    if (l$createMeal != lOther$createMeal) {
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

extension UtilityExtension$Mutation$CreateMeal on Mutation$CreateMeal {
  CopyWith$Mutation$CreateMeal<Mutation$CreateMeal> get copyWith =>
      CopyWith$Mutation$CreateMeal(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMeal<TRes> {
  factory CopyWith$Mutation$CreateMeal(
    Mutation$CreateMeal instance,
    TRes Function(Mutation$CreateMeal) then,
  ) = _CopyWithImpl$Mutation$CreateMeal;

  factory CopyWith$Mutation$CreateMeal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMeal;

  TRes call({Mutation$CreateMeal$createMeal? createMeal, String? $__typename});
  CopyWith$Mutation$CreateMeal$createMeal<TRes> get createMeal;
}

class _CopyWithImpl$Mutation$CreateMeal<TRes>
    implements CopyWith$Mutation$CreateMeal<TRes> {
  _CopyWithImpl$Mutation$CreateMeal(this._instance, this._then);

  final Mutation$CreateMeal _instance;

  final TRes Function(Mutation$CreateMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createMeal = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateMeal(
      createMeal: createMeal == _undefined
          ? _instance.createMeal
          : (createMeal as Mutation$CreateMeal$createMeal?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateMeal$createMeal<TRes> get createMeal {
    final local$createMeal = _instance.createMeal;
    return local$createMeal == null
        ? CopyWith$Mutation$CreateMeal$createMeal.stub(_then(_instance))
        : CopyWith$Mutation$CreateMeal$createMeal(
            local$createMeal,
            (e) => call(createMeal: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateMeal<TRes>
    implements CopyWith$Mutation$CreateMeal<TRes> {
  _CopyWithStubImpl$Mutation$CreateMeal(this._res);

  TRes _res;

  call({Mutation$CreateMeal$createMeal? createMeal, String? $__typename}) =>
      _res;

  CopyWith$Mutation$CreateMeal$createMeal<TRes> get createMeal =>
      CopyWith$Mutation$CreateMeal$createMeal.stub(_res);
}

const documentNodeMutationCreateMeal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateMeal'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createMealInput'),
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
            name: NameNode(value: 'createMeal'),
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
                  name: NameNode(value: 'meal'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'MealFragment'),
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
    fragmentDefinitionMealFragment,
  ],
);
Mutation$CreateMeal _parserFn$Mutation$CreateMeal(Map<String, dynamic> data) =>
    Mutation$CreateMeal.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateMeal =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateMeal?);

class Options$Mutation$CreateMeal
    extends graphql.MutationOptions<Mutation$CreateMeal> {
  Options$Mutation$CreateMeal({
    String? operationName,
    required Variables$Mutation$CreateMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMeal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMeal? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMeal>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateMeal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateMeal,
         parserFn: _parserFn$Mutation$CreateMeal,
       );

  final OnMutationCompleted$Mutation$CreateMeal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateMeal
    extends graphql.WatchQueryOptions<Mutation$CreateMeal> {
  WatchOptions$Mutation$CreateMeal({
    String? operationName,
    required Variables$Mutation$CreateMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMeal? typedOptimisticResult,
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
         document: documentNodeMutationCreateMeal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateMeal,
       );
}

extension ClientExtension$Mutation$CreateMeal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateMeal>> mutate$CreateMeal(
    Options$Mutation$CreateMeal options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateMeal> watchMutation$CreateMeal(
    WatchOptions$Mutation$CreateMeal options,
  ) => this.watchMutation(options);
}

class Mutation$CreateMeal$HookResult {
  Mutation$CreateMeal$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateMeal runMutation;

  final graphql.QueryResult<Mutation$CreateMeal> result;
}

Mutation$CreateMeal$HookResult useMutation$CreateMeal([
  WidgetOptions$Mutation$CreateMeal? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateMeal(),
  );
  return Mutation$CreateMeal$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateMeal> useWatchMutation$CreateMeal(
  WatchOptions$Mutation$CreateMeal options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateMeal
    extends graphql.MutationOptions<Mutation$CreateMeal> {
  WidgetOptions$Mutation$CreateMeal({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMeal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMeal? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMeal>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateMeal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateMeal,
         parserFn: _parserFn$Mutation$CreateMeal,
       );

  final OnMutationCompleted$Mutation$CreateMeal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateMeal =
    graphql.MultiSourceResult<Mutation$CreateMeal> Function(
      Variables$Mutation$CreateMeal, {
      Object? optimisticResult,
      Mutation$CreateMeal? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateMeal =
    widgets.Widget Function(
      RunMutation$Mutation$CreateMeal,
      graphql.QueryResult<Mutation$CreateMeal>?,
    );

class Mutation$CreateMeal$Widget
    extends graphql_flutter.Mutation<Mutation$CreateMeal> {
  Mutation$CreateMeal$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateMeal? options,
    required Builder$Mutation$CreateMeal builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateMeal(),
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

class Mutation$CreateMeal$createMeal {
  Mutation$CreateMeal$createMeal({
    this.meal,
    this.$__typename = 'createMealPayload',
  });

  factory Mutation$CreateMeal$createMeal.fromJson(Map<String, dynamic> json) {
    final l$meal = json['meal'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMeal$createMeal(
      meal: l$meal == null
          ? null
          : Fragment$MealFragment.fromJson((l$meal as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealFragment? meal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$meal = meal;
    _resultData['meal'] = l$meal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$meal = meal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$meal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMeal$createMeal ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$meal = meal;
    final lOther$meal = other.meal;
    if (l$meal != lOther$meal) {
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

extension UtilityExtension$Mutation$CreateMeal$createMeal
    on Mutation$CreateMeal$createMeal {
  CopyWith$Mutation$CreateMeal$createMeal<Mutation$CreateMeal$createMeal>
  get copyWith => CopyWith$Mutation$CreateMeal$createMeal(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMeal$createMeal<TRes> {
  factory CopyWith$Mutation$CreateMeal$createMeal(
    Mutation$CreateMeal$createMeal instance,
    TRes Function(Mutation$CreateMeal$createMeal) then,
  ) = _CopyWithImpl$Mutation$CreateMeal$createMeal;

  factory CopyWith$Mutation$CreateMeal$createMeal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMeal$createMeal;

  TRes call({Fragment$MealFragment? meal, String? $__typename});
  CopyWith$Fragment$MealFragment<TRes> get meal;
}

class _CopyWithImpl$Mutation$CreateMeal$createMeal<TRes>
    implements CopyWith$Mutation$CreateMeal$createMeal<TRes> {
  _CopyWithImpl$Mutation$CreateMeal$createMeal(this._instance, this._then);

  final Mutation$CreateMeal$createMeal _instance;

  final TRes Function(Mutation$CreateMeal$createMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? meal = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$CreateMeal$createMeal(
          meal: meal == _undefined
              ? _instance.meal
              : (meal as Fragment$MealFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealFragment<TRes> get meal {
    final local$meal = _instance.meal;
    return local$meal == null
        ? CopyWith$Fragment$MealFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealFragment(local$meal, (e) => call(meal: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateMeal$createMeal<TRes>
    implements CopyWith$Mutation$CreateMeal$createMeal<TRes> {
  _CopyWithStubImpl$Mutation$CreateMeal$createMeal(this._res);

  TRes _res;

  call({Fragment$MealFragment? meal, String? $__typename}) => _res;

  CopyWith$Fragment$MealFragment<TRes> get meal =>
      CopyWith$Fragment$MealFragment.stub(_res);
}

class Variables$Mutation$UpdateMeal {
  factory Variables$Mutation$UpdateMeal({
    required Input$updateMealInput input,
  }) => Variables$Mutation$UpdateMeal._({r'input': input});

  Variables$Mutation$UpdateMeal._(this._$data);

  factory Variables$Mutation$UpdateMeal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateMealInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateMeal._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateMealInput get input => (_$data['input'] as Input$updateMealInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMeal<Variables$Mutation$UpdateMeal>
  get copyWith => CopyWith$Variables$Mutation$UpdateMeal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateMeal ||
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

abstract class CopyWith$Variables$Mutation$UpdateMeal<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMeal(
    Variables$Mutation$UpdateMeal instance,
    TRes Function(Variables$Mutation$UpdateMeal) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMeal;

  factory CopyWith$Variables$Mutation$UpdateMeal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMeal;

  TRes call({Input$updateMealInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateMeal<TRes>
    implements CopyWith$Variables$Mutation$UpdateMeal<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMeal(this._instance, this._then);

  final Variables$Mutation$UpdateMeal _instance;

  final TRes Function(Variables$Mutation$UpdateMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateMeal._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateMealInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMeal<TRes>
    implements CopyWith$Variables$Mutation$UpdateMeal<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMeal(this._res);

  TRes _res;

  call({Input$updateMealInput? input}) => _res;
}

class Mutation$UpdateMeal {
  Mutation$UpdateMeal({this.updateMeal, this.$__typename = 'Mutation'});

  factory Mutation$UpdateMeal.fromJson(Map<String, dynamic> json) {
    final l$updateMeal = json['updateMeal'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMeal(
      updateMeal: l$updateMeal == null
          ? null
          : Mutation$UpdateMeal$updateMeal.fromJson(
              (l$updateMeal as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMeal$updateMeal? updateMeal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMeal = updateMeal;
    _resultData['updateMeal'] = l$updateMeal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMeal = updateMeal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateMeal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMeal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMeal = updateMeal;
    final lOther$updateMeal = other.updateMeal;
    if (l$updateMeal != lOther$updateMeal) {
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

extension UtilityExtension$Mutation$UpdateMeal on Mutation$UpdateMeal {
  CopyWith$Mutation$UpdateMeal<Mutation$UpdateMeal> get copyWith =>
      CopyWith$Mutation$UpdateMeal(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMeal<TRes> {
  factory CopyWith$Mutation$UpdateMeal(
    Mutation$UpdateMeal instance,
    TRes Function(Mutation$UpdateMeal) then,
  ) = _CopyWithImpl$Mutation$UpdateMeal;

  factory CopyWith$Mutation$UpdateMeal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMeal;

  TRes call({Mutation$UpdateMeal$updateMeal? updateMeal, String? $__typename});
  CopyWith$Mutation$UpdateMeal$updateMeal<TRes> get updateMeal;
}

class _CopyWithImpl$Mutation$UpdateMeal<TRes>
    implements CopyWith$Mutation$UpdateMeal<TRes> {
  _CopyWithImpl$Mutation$UpdateMeal(this._instance, this._then);

  final Mutation$UpdateMeal _instance;

  final TRes Function(Mutation$UpdateMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMeal = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMeal(
      updateMeal: updateMeal == _undefined
          ? _instance.updateMeal
          : (updateMeal as Mutation$UpdateMeal$updateMeal?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateMeal$updateMeal<TRes> get updateMeal {
    final local$updateMeal = _instance.updateMeal;
    return local$updateMeal == null
        ? CopyWith$Mutation$UpdateMeal$updateMeal.stub(_then(_instance))
        : CopyWith$Mutation$UpdateMeal$updateMeal(
            local$updateMeal,
            (e) => call(updateMeal: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateMeal<TRes>
    implements CopyWith$Mutation$UpdateMeal<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMeal(this._res);

  TRes _res;

  call({Mutation$UpdateMeal$updateMeal? updateMeal, String? $__typename}) =>
      _res;

  CopyWith$Mutation$UpdateMeal$updateMeal<TRes> get updateMeal =>
      CopyWith$Mutation$UpdateMeal$updateMeal.stub(_res);
}

const documentNodeMutationUpdateMeal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateMeal'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateMealInput'),
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
            name: NameNode(value: 'updateMeal'),
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
                  name: NameNode(value: 'meal'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'MealFragment'),
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
    fragmentDefinitionMealFragment,
  ],
);
Mutation$UpdateMeal _parserFn$Mutation$UpdateMeal(Map<String, dynamic> data) =>
    Mutation$UpdateMeal.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMeal =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateMeal?);

class Options$Mutation$UpdateMeal
    extends graphql.MutationOptions<Mutation$UpdateMeal> {
  Options$Mutation$UpdateMeal({
    String? operationName,
    required Variables$Mutation$UpdateMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMeal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMeal? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMeal>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateMeal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateMeal,
         parserFn: _parserFn$Mutation$UpdateMeal,
       );

  final OnMutationCompleted$Mutation$UpdateMeal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateMeal
    extends graphql.WatchQueryOptions<Mutation$UpdateMeal> {
  WatchOptions$Mutation$UpdateMeal({
    String? operationName,
    required Variables$Mutation$UpdateMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMeal? typedOptimisticResult,
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
         document: documentNodeMutationUpdateMeal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateMeal,
       );
}

extension ClientExtension$Mutation$UpdateMeal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMeal>> mutate$UpdateMeal(
    Options$Mutation$UpdateMeal options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateMeal> watchMutation$UpdateMeal(
    WatchOptions$Mutation$UpdateMeal options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateMeal$HookResult {
  Mutation$UpdateMeal$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateMeal runMutation;

  final graphql.QueryResult<Mutation$UpdateMeal> result;
}

Mutation$UpdateMeal$HookResult useMutation$UpdateMeal([
  WidgetOptions$Mutation$UpdateMeal? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateMeal(),
  );
  return Mutation$UpdateMeal$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateMeal> useWatchMutation$UpdateMeal(
  WatchOptions$Mutation$UpdateMeal options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateMeal
    extends graphql.MutationOptions<Mutation$UpdateMeal> {
  WidgetOptions$Mutation$UpdateMeal({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMeal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMeal? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMeal>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateMeal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateMeal,
         parserFn: _parserFn$Mutation$UpdateMeal,
       );

  final OnMutationCompleted$Mutation$UpdateMeal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateMeal =
    graphql.MultiSourceResult<Mutation$UpdateMeal> Function(
      Variables$Mutation$UpdateMeal, {
      Object? optimisticResult,
      Mutation$UpdateMeal? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateMeal =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateMeal,
      graphql.QueryResult<Mutation$UpdateMeal>?,
    );

class Mutation$UpdateMeal$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateMeal> {
  Mutation$UpdateMeal$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateMeal? options,
    required Builder$Mutation$UpdateMeal builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateMeal(),
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

class Mutation$UpdateMeal$updateMeal {
  Mutation$UpdateMeal$updateMeal({
    this.meal,
    this.$__typename = 'updateMealPayload',
  });

  factory Mutation$UpdateMeal$updateMeal.fromJson(Map<String, dynamic> json) {
    final l$meal = json['meal'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMeal$updateMeal(
      meal: l$meal == null
          ? null
          : Fragment$MealFragment.fromJson((l$meal as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealFragment? meal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$meal = meal;
    _resultData['meal'] = l$meal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$meal = meal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$meal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMeal$updateMeal ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$meal = meal;
    final lOther$meal = other.meal;
    if (l$meal != lOther$meal) {
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

extension UtilityExtension$Mutation$UpdateMeal$updateMeal
    on Mutation$UpdateMeal$updateMeal {
  CopyWith$Mutation$UpdateMeal$updateMeal<Mutation$UpdateMeal$updateMeal>
  get copyWith => CopyWith$Mutation$UpdateMeal$updateMeal(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMeal$updateMeal<TRes> {
  factory CopyWith$Mutation$UpdateMeal$updateMeal(
    Mutation$UpdateMeal$updateMeal instance,
    TRes Function(Mutation$UpdateMeal$updateMeal) then,
  ) = _CopyWithImpl$Mutation$UpdateMeal$updateMeal;

  factory CopyWith$Mutation$UpdateMeal$updateMeal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMeal$updateMeal;

  TRes call({Fragment$MealFragment? meal, String? $__typename});
  CopyWith$Fragment$MealFragment<TRes> get meal;
}

class _CopyWithImpl$Mutation$UpdateMeal$updateMeal<TRes>
    implements CopyWith$Mutation$UpdateMeal$updateMeal<TRes> {
  _CopyWithImpl$Mutation$UpdateMeal$updateMeal(this._instance, this._then);

  final Mutation$UpdateMeal$updateMeal _instance;

  final TRes Function(Mutation$UpdateMeal$updateMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? meal = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$UpdateMeal$updateMeal(
          meal: meal == _undefined
              ? _instance.meal
              : (meal as Fragment$MealFragment?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Fragment$MealFragment<TRes> get meal {
    final local$meal = _instance.meal;
    return local$meal == null
        ? CopyWith$Fragment$MealFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealFragment(local$meal, (e) => call(meal: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateMeal$updateMeal<TRes>
    implements CopyWith$Mutation$UpdateMeal$updateMeal<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMeal$updateMeal(this._res);

  TRes _res;

  call({Fragment$MealFragment? meal, String? $__typename}) => _res;

  CopyWith$Fragment$MealFragment<TRes> get meal =>
      CopyWith$Fragment$MealFragment.stub(_res);
}

class Variables$Mutation$DeleteMeal {
  factory Variables$Mutation$DeleteMeal({
    required Input$deleteMealInput input,
  }) => Variables$Mutation$DeleteMeal._({r'input': input});

  Variables$Mutation$DeleteMeal._(this._$data);

  factory Variables$Mutation$DeleteMeal.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteMealInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteMeal._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteMealInput get input => (_$data['input'] as Input$deleteMealInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteMeal<Variables$Mutation$DeleteMeal>
  get copyWith => CopyWith$Variables$Mutation$DeleteMeal(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteMeal ||
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

abstract class CopyWith$Variables$Mutation$DeleteMeal<TRes> {
  factory CopyWith$Variables$Mutation$DeleteMeal(
    Variables$Mutation$DeleteMeal instance,
    TRes Function(Variables$Mutation$DeleteMeal) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteMeal;

  factory CopyWith$Variables$Mutation$DeleteMeal.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteMeal;

  TRes call({Input$deleteMealInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteMeal<TRes>
    implements CopyWith$Variables$Mutation$DeleteMeal<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteMeal(this._instance, this._then);

  final Variables$Mutation$DeleteMeal _instance;

  final TRes Function(Variables$Mutation$DeleteMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteMeal._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteMealInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteMeal<TRes>
    implements CopyWith$Variables$Mutation$DeleteMeal<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteMeal(this._res);

  TRes _res;

  call({Input$deleteMealInput? input}) => _res;
}

class Mutation$DeleteMeal {
  Mutation$DeleteMeal({this.deleteMeal, this.$__typename = 'Mutation'});

  factory Mutation$DeleteMeal.fromJson(Map<String, dynamic> json) {
    final l$deleteMeal = json['deleteMeal'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMeal(
      deleteMeal: l$deleteMeal == null
          ? null
          : Mutation$DeleteMeal$deleteMeal.fromJson(
              (l$deleteMeal as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMeal$deleteMeal? deleteMeal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMeal = deleteMeal;
    _resultData['deleteMeal'] = l$deleteMeal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMeal = deleteMeal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteMeal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMeal || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMeal = deleteMeal;
    final lOther$deleteMeal = other.deleteMeal;
    if (l$deleteMeal != lOther$deleteMeal) {
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

extension UtilityExtension$Mutation$DeleteMeal on Mutation$DeleteMeal {
  CopyWith$Mutation$DeleteMeal<Mutation$DeleteMeal> get copyWith =>
      CopyWith$Mutation$DeleteMeal(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMeal<TRes> {
  factory CopyWith$Mutation$DeleteMeal(
    Mutation$DeleteMeal instance,
    TRes Function(Mutation$DeleteMeal) then,
  ) = _CopyWithImpl$Mutation$DeleteMeal;

  factory CopyWith$Mutation$DeleteMeal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMeal;

  TRes call({Mutation$DeleteMeal$deleteMeal? deleteMeal, String? $__typename});
  CopyWith$Mutation$DeleteMeal$deleteMeal<TRes> get deleteMeal;
}

class _CopyWithImpl$Mutation$DeleteMeal<TRes>
    implements CopyWith$Mutation$DeleteMeal<TRes> {
  _CopyWithImpl$Mutation$DeleteMeal(this._instance, this._then);

  final Mutation$DeleteMeal _instance;

  final TRes Function(Mutation$DeleteMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMeal = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteMeal(
      deleteMeal: deleteMeal == _undefined
          ? _instance.deleteMeal
          : (deleteMeal as Mutation$DeleteMeal$deleteMeal?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteMeal$deleteMeal<TRes> get deleteMeal {
    final local$deleteMeal = _instance.deleteMeal;
    return local$deleteMeal == null
        ? CopyWith$Mutation$DeleteMeal$deleteMeal.stub(_then(_instance))
        : CopyWith$Mutation$DeleteMeal$deleteMeal(
            local$deleteMeal,
            (e) => call(deleteMeal: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteMeal<TRes>
    implements CopyWith$Mutation$DeleteMeal<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMeal(this._res);

  TRes _res;

  call({Mutation$DeleteMeal$deleteMeal? deleteMeal, String? $__typename}) =>
      _res;

  CopyWith$Mutation$DeleteMeal$deleteMeal<TRes> get deleteMeal =>
      CopyWith$Mutation$DeleteMeal$deleteMeal.stub(_res);
}

const documentNodeMutationDeleteMeal = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteMeal'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteMealInput'),
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
            name: NameNode(value: 'deleteMeal'),
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
                  name: NameNode(value: 'meal'),
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
Mutation$DeleteMeal _parserFn$Mutation$DeleteMeal(Map<String, dynamic> data) =>
    Mutation$DeleteMeal.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteMeal =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteMeal?);

class Options$Mutation$DeleteMeal
    extends graphql.MutationOptions<Mutation$DeleteMeal> {
  Options$Mutation$DeleteMeal({
    String? operationName,
    required Variables$Mutation$DeleteMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMeal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMeal? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMeal>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteMeal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMeal,
         parserFn: _parserFn$Mutation$DeleteMeal,
       );

  final OnMutationCompleted$Mutation$DeleteMeal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteMeal
    extends graphql.WatchQueryOptions<Mutation$DeleteMeal> {
  WatchOptions$Mutation$DeleteMeal({
    String? operationName,
    required Variables$Mutation$DeleteMeal variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMeal? typedOptimisticResult,
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
         document: documentNodeMutationDeleteMeal,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteMeal,
       );
}

extension ClientExtension$Mutation$DeleteMeal on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteMeal>> mutate$DeleteMeal(
    Options$Mutation$DeleteMeal options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteMeal> watchMutation$DeleteMeal(
    WatchOptions$Mutation$DeleteMeal options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteMeal$HookResult {
  Mutation$DeleteMeal$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteMeal runMutation;

  final graphql.QueryResult<Mutation$DeleteMeal> result;
}

Mutation$DeleteMeal$HookResult useMutation$DeleteMeal([
  WidgetOptions$Mutation$DeleteMeal? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteMeal(),
  );
  return Mutation$DeleteMeal$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteMeal> useWatchMutation$DeleteMeal(
  WatchOptions$Mutation$DeleteMeal options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteMeal
    extends graphql.MutationOptions<Mutation$DeleteMeal> {
  WidgetOptions$Mutation$DeleteMeal({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMeal? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMeal? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMeal>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteMeal(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMeal,
         parserFn: _parserFn$Mutation$DeleteMeal,
       );

  final OnMutationCompleted$Mutation$DeleteMeal? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteMeal =
    graphql.MultiSourceResult<Mutation$DeleteMeal> Function(
      Variables$Mutation$DeleteMeal, {
      Object? optimisticResult,
      Mutation$DeleteMeal? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteMeal =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteMeal,
      graphql.QueryResult<Mutation$DeleteMeal>?,
    );

class Mutation$DeleteMeal$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteMeal> {
  Mutation$DeleteMeal$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteMeal? options,
    required Builder$Mutation$DeleteMeal builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteMeal(),
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

class Mutation$DeleteMeal$deleteMeal {
  Mutation$DeleteMeal$deleteMeal({
    this.meal,
    this.$__typename = 'deleteMealPayload',
  });

  factory Mutation$DeleteMeal$deleteMeal.fromJson(Map<String, dynamic> json) {
    final l$meal = json['meal'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMeal$deleteMeal(
      meal: l$meal == null
          ? null
          : Mutation$DeleteMeal$deleteMeal$meal.fromJson(
              (l$meal as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMeal$deleteMeal$meal? meal;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$meal = meal;
    _resultData['meal'] = l$meal?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$meal = meal;
    final l$$__typename = $__typename;
    return Object.hashAll([l$meal, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMeal$deleteMeal ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$meal = meal;
    final lOther$meal = other.meal;
    if (l$meal != lOther$meal) {
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

extension UtilityExtension$Mutation$DeleteMeal$deleteMeal
    on Mutation$DeleteMeal$deleteMeal {
  CopyWith$Mutation$DeleteMeal$deleteMeal<Mutation$DeleteMeal$deleteMeal>
  get copyWith => CopyWith$Mutation$DeleteMeal$deleteMeal(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMeal$deleteMeal<TRes> {
  factory CopyWith$Mutation$DeleteMeal$deleteMeal(
    Mutation$DeleteMeal$deleteMeal instance,
    TRes Function(Mutation$DeleteMeal$deleteMeal) then,
  ) = _CopyWithImpl$Mutation$DeleteMeal$deleteMeal;

  factory CopyWith$Mutation$DeleteMeal$deleteMeal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMeal$deleteMeal;

  TRes call({Mutation$DeleteMeal$deleteMeal$meal? meal, String? $__typename});
  CopyWith$Mutation$DeleteMeal$deleteMeal$meal<TRes> get meal;
}

class _CopyWithImpl$Mutation$DeleteMeal$deleteMeal<TRes>
    implements CopyWith$Mutation$DeleteMeal$deleteMeal<TRes> {
  _CopyWithImpl$Mutation$DeleteMeal$deleteMeal(this._instance, this._then);

  final Mutation$DeleteMeal$deleteMeal _instance;

  final TRes Function(Mutation$DeleteMeal$deleteMeal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? meal = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteMeal$deleteMeal(
          meal: meal == _undefined
              ? _instance.meal
              : (meal as Mutation$DeleteMeal$deleteMeal$meal?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$DeleteMeal$deleteMeal$meal<TRes> get meal {
    final local$meal = _instance.meal;
    return local$meal == null
        ? CopyWith$Mutation$DeleteMeal$deleteMeal$meal.stub(_then(_instance))
        : CopyWith$Mutation$DeleteMeal$deleteMeal$meal(
            local$meal,
            (e) => call(meal: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteMeal$deleteMeal<TRes>
    implements CopyWith$Mutation$DeleteMeal$deleteMeal<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMeal$deleteMeal(this._res);

  TRes _res;

  call({Mutation$DeleteMeal$deleteMeal$meal? meal, String? $__typename}) =>
      _res;

  CopyWith$Mutation$DeleteMeal$deleteMeal$meal<TRes> get meal =>
      CopyWith$Mutation$DeleteMeal$deleteMeal$meal.stub(_res);
}

class Mutation$DeleteMeal$deleteMeal$meal {
  Mutation$DeleteMeal$deleteMeal$meal({
    required this.id,
    this.$__typename = 'Meal',
  });

  factory Mutation$DeleteMeal$deleteMeal$meal.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMeal$deleteMeal$meal(
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
    if (other is! Mutation$DeleteMeal$deleteMeal$meal ||
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

extension UtilityExtension$Mutation$DeleteMeal$deleteMeal$meal
    on Mutation$DeleteMeal$deleteMeal$meal {
  CopyWith$Mutation$DeleteMeal$deleteMeal$meal<
    Mutation$DeleteMeal$deleteMeal$meal
  >
  get copyWith => CopyWith$Mutation$DeleteMeal$deleteMeal$meal(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMeal$deleteMeal$meal<TRes> {
  factory CopyWith$Mutation$DeleteMeal$deleteMeal$meal(
    Mutation$DeleteMeal$deleteMeal$meal instance,
    TRes Function(Mutation$DeleteMeal$deleteMeal$meal) then,
  ) = _CopyWithImpl$Mutation$DeleteMeal$deleteMeal$meal;

  factory CopyWith$Mutation$DeleteMeal$deleteMeal$meal.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMeal$deleteMeal$meal;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteMeal$deleteMeal$meal<TRes>
    implements CopyWith$Mutation$DeleteMeal$deleteMeal$meal<TRes> {
  _CopyWithImpl$Mutation$DeleteMeal$deleteMeal$meal(this._instance, this._then);

  final Mutation$DeleteMeal$deleteMeal$meal _instance;

  final TRes Function(Mutation$DeleteMeal$deleteMeal$meal) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteMeal$deleteMeal$meal(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteMeal$deleteMeal$meal<TRes>
    implements CopyWith$Mutation$DeleteMeal$deleteMeal$meal<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMeal$deleteMeal$meal(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}

class Variables$Query$GetMealPlans {
  factory Variables$Query$GetMealPlans({
    int? first,
    String? after,
    String? search,
    List<Input$MealPlanFilter_price?>? price,
    List<Input$MealPlanFilter_calories?>? calories,
    List<Input$MealPlanFilter_protein?>? protein,
    List<Input$MealPlanFilter_fat?>? fat,
    List<Input$MealPlanFilter_carbs?>? carbs,
    String? category,
  }) => Variables$Query$GetMealPlans._({
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (search != null) r'search': search,
    if (price != null) r'price': price,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
    if (category != null) r'category': category,
  });

  Variables$Query$GetMealPlans._(this._$data);

  factory Variables$Query$GetMealPlans.fromJson(Map<String, dynamic> data) {
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
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_price.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_calories.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_protein.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_fat.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_carbs.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    return Variables$Query$GetMealPlans._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get search => (_$data['search'] as String?);

  List<Input$MealPlanFilter_price?>? get price =>
      (_$data['price'] as List<Input$MealPlanFilter_price?>?);

  List<Input$MealPlanFilter_calories?>? get calories =>
      (_$data['calories'] as List<Input$MealPlanFilter_calories?>?);

  List<Input$MealPlanFilter_protein?>? get protein =>
      (_$data['protein'] as List<Input$MealPlanFilter_protein?>?);

  List<Input$MealPlanFilter_fat?>? get fat =>
      (_$data['fat'] as List<Input$MealPlanFilter_fat?>?);

  List<Input$MealPlanFilter_carbs?>? get carbs =>
      (_$data['carbs'] as List<Input$MealPlanFilter_carbs?>?);

  String? get category => (_$data['category'] as String?);

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
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMealPlans<Variables$Query$GetMealPlans>
  get copyWith => CopyWith$Variables$Query$GetMealPlans(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMealPlans ||
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
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != null && lOther$price != null) {
      if (l$price.length != lOther$price.length) {
        return false;
      }
      for (int i = 0; i < l$price.length; i++) {
        final l$price$entry = l$price[i];
        final lOther$price$entry = lOther$price[i];
        if (l$price$entry != lOther$price$entry) {
          return false;
        }
      }
    } else if (l$price != lOther$price) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != null && lOther$calories != null) {
      if (l$calories.length != lOther$calories.length) {
        return false;
      }
      for (int i = 0; i < l$calories.length; i++) {
        final l$calories$entry = l$calories[i];
        final lOther$calories$entry = lOther$calories[i];
        if (l$calories$entry != lOther$calories$entry) {
          return false;
        }
      }
    } else if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != null && lOther$protein != null) {
      if (l$protein.length != lOther$protein.length) {
        return false;
      }
      for (int i = 0; i < l$protein.length; i++) {
        final l$protein$entry = l$protein[i];
        final lOther$protein$entry = lOther$protein[i];
        if (l$protein$entry != lOther$protein$entry) {
          return false;
        }
      }
    } else if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != null && lOther$fat != null) {
      if (l$fat.length != lOther$fat.length) {
        return false;
      }
      for (int i = 0; i < l$fat.length; i++) {
        final l$fat$entry = l$fat[i];
        final lOther$fat$entry = lOther$fat[i];
        if (l$fat$entry != lOther$fat$entry) {
          return false;
        }
      }
    } else if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != null && lOther$carbs != null) {
      if (l$carbs.length != lOther$carbs.length) {
        return false;
      }
      for (int i = 0; i < l$carbs.length; i++) {
        final l$carbs$entry = l$carbs[i];
        final lOther$carbs$entry = lOther$carbs[i];
        if (l$carbs$entry != lOther$carbs$entry) {
          return false;
        }
      }
    } else if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$search = search;
    final l$price = price;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$category = category;
    return Object.hashAll([
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('price')
          ? l$price == null
                ? null
                : Object.hashAll(l$price.map((v) => v))
          : const {},
      _$data.containsKey('calories')
          ? l$calories == null
                ? null
                : Object.hashAll(l$calories.map((v) => v))
          : const {},
      _$data.containsKey('protein')
          ? l$protein == null
                ? null
                : Object.hashAll(l$protein.map((v) => v))
          : const {},
      _$data.containsKey('fat')
          ? l$fat == null
                ? null
                : Object.hashAll(l$fat.map((v) => v))
          : const {},
      _$data.containsKey('carbs')
          ? l$carbs == null
                ? null
                : Object.hashAll(l$carbs.map((v) => v))
          : const {},
      _$data.containsKey('category') ? l$category : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetMealPlans<TRes> {
  factory CopyWith$Variables$Query$GetMealPlans(
    Variables$Query$GetMealPlans instance,
    TRes Function(Variables$Query$GetMealPlans) then,
  ) = _CopyWithImpl$Variables$Query$GetMealPlans;

  factory CopyWith$Variables$Query$GetMealPlans.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMealPlans;

  TRes call({
    int? first,
    String? after,
    String? search,
    List<Input$MealPlanFilter_price?>? price,
    List<Input$MealPlanFilter_calories?>? calories,
    List<Input$MealPlanFilter_protein?>? protein,
    List<Input$MealPlanFilter_fat?>? fat,
    List<Input$MealPlanFilter_carbs?>? carbs,
    String? category,
  });
}

class _CopyWithImpl$Variables$Query$GetMealPlans<TRes>
    implements CopyWith$Variables$Query$GetMealPlans<TRes> {
  _CopyWithImpl$Variables$Query$GetMealPlans(this._instance, this._then);

  final Variables$Query$GetMealPlans _instance;

  final TRes Function(Variables$Query$GetMealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? search = _undefined,
    Object? price = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? category = _undefined,
  }) => _then(
    Variables$Query$GetMealPlans._({
      ..._instance._$data,
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (search != _undefined) 'search': (search as String?),
      if (price != _undefined)
        'price': (price as List<Input$MealPlanFilter_price?>?),
      if (calories != _undefined)
        'calories': (calories as List<Input$MealPlanFilter_calories?>?),
      if (protein != _undefined)
        'protein': (protein as List<Input$MealPlanFilter_protein?>?),
      if (fat != _undefined) 'fat': (fat as List<Input$MealPlanFilter_fat?>?),
      if (carbs != _undefined)
        'carbs': (carbs as List<Input$MealPlanFilter_carbs?>?),
      if (category != _undefined) 'category': (category as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMealPlans<TRes>
    implements CopyWith$Variables$Query$GetMealPlans<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMealPlans(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? search,
    List<Input$MealPlanFilter_price?>? price,
    List<Input$MealPlanFilter_calories?>? calories,
    List<Input$MealPlanFilter_protein?>? protein,
    List<Input$MealPlanFilter_fat?>? fat,
    List<Input$MealPlanFilter_carbs?>? carbs,
    String? category,
  }) => _res;
}

class Query$GetMealPlans {
  Query$GetMealPlans({this.mealPlans, this.$__typename = 'Query'});

  factory Query$GetMealPlans.fromJson(Map<String, dynamic> json) {
    final l$mealPlans = json['mealPlans'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlans(
      mealPlans: l$mealPlans == null
          ? null
          : Query$GetMealPlans$mealPlans.fromJson(
              (l$mealPlans as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMealPlans$mealPlans? mealPlans;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mealPlans = mealPlans;
    _resultData['mealPlans'] = l$mealPlans?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mealPlans = mealPlans;
    final l$$__typename = $__typename;
    return Object.hashAll([l$mealPlans, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealPlans || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetMealPlans on Query$GetMealPlans {
  CopyWith$Query$GetMealPlans<Query$GetMealPlans> get copyWith =>
      CopyWith$Query$GetMealPlans(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlans<TRes> {
  factory CopyWith$Query$GetMealPlans(
    Query$GetMealPlans instance,
    TRes Function(Query$GetMealPlans) then,
  ) = _CopyWithImpl$Query$GetMealPlans;

  factory CopyWith$Query$GetMealPlans.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlans;

  TRes call({Query$GetMealPlans$mealPlans? mealPlans, String? $__typename});
  CopyWith$Query$GetMealPlans$mealPlans<TRes> get mealPlans;
}

class _CopyWithImpl$Query$GetMealPlans<TRes>
    implements CopyWith$Query$GetMealPlans<TRes> {
  _CopyWithImpl$Query$GetMealPlans(this._instance, this._then);

  final Query$GetMealPlans _instance;

  final TRes Function(Query$GetMealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mealPlans = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlans(
      mealPlans: mealPlans == _undefined
          ? _instance.mealPlans
          : (mealPlans as Query$GetMealPlans$mealPlans?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMealPlans$mealPlans<TRes> get mealPlans {
    final local$mealPlans = _instance.mealPlans;
    return local$mealPlans == null
        ? CopyWith$Query$GetMealPlans$mealPlans.stub(_then(_instance))
        : CopyWith$Query$GetMealPlans$mealPlans(
            local$mealPlans,
            (e) => call(mealPlans: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMealPlans<TRes>
    implements CopyWith$Query$GetMealPlans<TRes> {
  _CopyWithStubImpl$Query$GetMealPlans(this._res);

  TRes _res;

  call({Query$GetMealPlans$mealPlans? mealPlans, String? $__typename}) => _res;

  CopyWith$Query$GetMealPlans$mealPlans<TRes> get mealPlans =>
      CopyWith$Query$GetMealPlans$mealPlans.stub(_res);
}

const documentNodeQueryGetMealPlans = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMealPlans'),
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
          variable: VariableNode(name: NameNode(value: 'price')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_price'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'calories')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_calories'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'protein')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_protein'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'fat')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_fat'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'carbs')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_carbs'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'category')),
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
            name: NameNode(value: 'mealPlans'),
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
                name: NameNode(value: 'price'),
                value: VariableNode(name: NameNode(value: 'price')),
              ),
              ArgumentNode(
                name: NameNode(value: 'calories'),
                value: VariableNode(name: NameNode(value: 'calories')),
              ),
              ArgumentNode(
                name: NameNode(value: 'protein'),
                value: VariableNode(name: NameNode(value: 'protein')),
              ),
              ArgumentNode(
                name: NameNode(value: 'fat'),
                value: VariableNode(name: NameNode(value: 'fat')),
              ),
              ArgumentNode(
                name: NameNode(value: 'carbs'),
                value: VariableNode(name: NameNode(value: 'carbs')),
              ),
              ArgumentNode(
                name: NameNode(value: 'dietCategories_name'),
                value: VariableNode(name: NameNode(value: 'category')),
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
                              name: NameNode(value: 'MealPlanSummaryFragment'),
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
                  name: NameNode(value: 'totalCount'),
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
    fragmentDefinitionMealPlanSummaryFragment,
  ],
);
Query$GetMealPlans _parserFn$Query$GetMealPlans(Map<String, dynamic> data) =>
    Query$GetMealPlans.fromJson(data);
typedef OnQueryComplete$Query$GetMealPlans =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMealPlans?);

class Options$Query$GetMealPlans
    extends graphql.QueryOptions<Query$GetMealPlans> {
  Options$Query$GetMealPlans({
    String? operationName,
    Variables$Query$GetMealPlans? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealPlans? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMealPlans? onComplete,
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
                 data == null ? null : _parserFn$Query$GetMealPlans(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMealPlans,
         parserFn: _parserFn$Query$GetMealPlans,
       );

  final OnQueryComplete$Query$GetMealPlans? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMealPlans
    extends graphql.WatchQueryOptions<Query$GetMealPlans> {
  WatchOptions$Query$GetMealPlans({
    String? operationName,
    Variables$Query$GetMealPlans? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealPlans? typedOptimisticResult,
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
         document: documentNodeQueryGetMealPlans,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMealPlans,
       );
}

class FetchMoreOptions$Query$GetMealPlans extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMealPlans({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$GetMealPlans? variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables?.toJson() ?? {},
         document: documentNodeQueryGetMealPlans,
       );
}

extension ClientExtension$Query$GetMealPlans on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMealPlans>> query$GetMealPlans([
    Options$Query$GetMealPlans? options,
  ]) async => await this.query(options ?? Options$Query$GetMealPlans());

  graphql.ObservableQuery<Query$GetMealPlans> watchQuery$GetMealPlans([
    WatchOptions$Query$GetMealPlans? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetMealPlans());

  void writeQuery$GetMealPlans({
    required Query$GetMealPlans data,
    Variables$Query$GetMealPlans? variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetMealPlans),
      variables: variables?.toJson() ?? const {},
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMealPlans? readQuery$GetMealPlans({
    Variables$Query$GetMealPlans? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMealPlans),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMealPlans.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMealPlans> useQuery$GetMealPlans([
  Options$Query$GetMealPlans? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetMealPlans());
graphql.ObservableQuery<Query$GetMealPlans> useWatchQuery$GetMealPlans([
  WatchOptions$Query$GetMealPlans? options,
]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetMealPlans());

class Query$GetMealPlans$Widget
    extends graphql_flutter.Query<Query$GetMealPlans> {
  Query$GetMealPlans$Widget({
    widgets.Key? key,
    Options$Query$GetMealPlans? options,
    required graphql_flutter.QueryBuilder<Query$GetMealPlans> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetMealPlans(),
         builder: builder,
       );
}

class Query$GetMealPlans$mealPlans {
  Query$GetMealPlans$mealPlans({
    this.edges,
    required this.pageInfo,
    required this.totalCount,
    this.$__typename = 'MealPlanCursorConnection',
  });

  factory Query$GetMealPlans$mealPlans.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlans$mealPlans(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetMealPlans$mealPlans$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo: Query$GetMealPlans$mealPlans$pageInfo.fromJson(
        (l$pageInfo as Map<String, dynamic>),
      ),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMealPlans$mealPlans$edges?>? edges;

  final Query$GetMealPlans$mealPlans$pageInfo pageInfo;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealPlans$mealPlans ||
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
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$GetMealPlans$mealPlans
    on Query$GetMealPlans$mealPlans {
  CopyWith$Query$GetMealPlans$mealPlans<Query$GetMealPlans$mealPlans>
  get copyWith => CopyWith$Query$GetMealPlans$mealPlans(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlans$mealPlans<TRes> {
  factory CopyWith$Query$GetMealPlans$mealPlans(
    Query$GetMealPlans$mealPlans instance,
    TRes Function(Query$GetMealPlans$mealPlans) then,
  ) = _CopyWithImpl$Query$GetMealPlans$mealPlans;

  factory CopyWith$Query$GetMealPlans$mealPlans.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlans$mealPlans;

  TRes call({
    List<Query$GetMealPlans$mealPlans$edges?>? edges,
    Query$GetMealPlans$mealPlans$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetMealPlans$mealPlans$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMealPlans$mealPlans$edges<
          Query$GetMealPlans$mealPlans$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetMealPlans$mealPlans$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetMealPlans$mealPlans<TRes>
    implements CopyWith$Query$GetMealPlans$mealPlans<TRes> {
  _CopyWithImpl$Query$GetMealPlans$mealPlans(this._instance, this._then);

  final Query$GetMealPlans$mealPlans _instance;

  final TRes Function(Query$GetMealPlans$mealPlans) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlans$mealPlans(
      edges: edges == _undefined
          ? _instance.edges
          : (edges as List<Query$GetMealPlans$mealPlans$edges?>?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo as Query$GetMealPlans$mealPlans$pageInfo),
      totalCount: totalCount == _undefined || totalCount == null
          ? _instance.totalCount
          : (totalCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetMealPlans$mealPlans$edges?>? Function(
      Iterable<
        CopyWith$Query$GetMealPlans$mealPlans$edges<
          Query$GetMealPlans$mealPlans$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetMealPlans$mealPlans$edges(e, (i) => i),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetMealPlans$mealPlans$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetMealPlans$mealPlans$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetMealPlans$mealPlans<TRes>
    implements CopyWith$Query$GetMealPlans$mealPlans<TRes> {
  _CopyWithStubImpl$Query$GetMealPlans$mealPlans(this._res);

  TRes _res;

  call({
    List<Query$GetMealPlans$mealPlans$edges?>? edges,
    Query$GetMealPlans$mealPlans$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetMealPlans$mealPlans$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetMealPlans$mealPlans$pageInfo.stub(_res);
}

class Query$GetMealPlans$mealPlans$edges {
  Query$GetMealPlans$mealPlans$edges({
    this.node,
    this.$__typename = 'MealPlanEdge',
  });

  factory Query$GetMealPlans$mealPlans$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlans$mealPlans$edges(
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
    if (other is! Query$GetMealPlans$mealPlans$edges ||
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

extension UtilityExtension$Query$GetMealPlans$mealPlans$edges
    on Query$GetMealPlans$mealPlans$edges {
  CopyWith$Query$GetMealPlans$mealPlans$edges<
    Query$GetMealPlans$mealPlans$edges
  >
  get copyWith => CopyWith$Query$GetMealPlans$mealPlans$edges(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlans$mealPlans$edges<TRes> {
  factory CopyWith$Query$GetMealPlans$mealPlans$edges(
    Query$GetMealPlans$mealPlans$edges instance,
    TRes Function(Query$GetMealPlans$mealPlans$edges) then,
  ) = _CopyWithImpl$Query$GetMealPlans$mealPlans$edges;

  factory CopyWith$Query$GetMealPlans$mealPlans$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlans$mealPlans$edges;

  TRes call({Fragment$MealPlanSummaryFragment? node, String? $__typename});
  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetMealPlans$mealPlans$edges<TRes>
    implements CopyWith$Query$GetMealPlans$mealPlans$edges<TRes> {
  _CopyWithImpl$Query$GetMealPlans$mealPlans$edges(this._instance, this._then);

  final Query$GetMealPlans$mealPlans$edges _instance;

  final TRes Function(Query$GetMealPlans$mealPlans$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMealPlans$mealPlans$edges(
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

class _CopyWithStubImpl$Query$GetMealPlans$mealPlans$edges<TRes>
    implements CopyWith$Query$GetMealPlans$mealPlans$edges<TRes> {
  _CopyWithStubImpl$Query$GetMealPlans$mealPlans$edges(this._res);

  TRes _res;

  call({Fragment$MealPlanSummaryFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node =>
      CopyWith$Fragment$MealPlanSummaryFragment.stub(_res);
}

class Query$GetMealPlans$mealPlans$pageInfo {
  Query$GetMealPlans$mealPlans$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'MealPlanPageInfo',
  });

  factory Query$GetMealPlans$mealPlans$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlans$mealPlans$pageInfo(
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
    if (other is! Query$GetMealPlans$mealPlans$pageInfo ||
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

extension UtilityExtension$Query$GetMealPlans$mealPlans$pageInfo
    on Query$GetMealPlans$mealPlans$pageInfo {
  CopyWith$Query$GetMealPlans$mealPlans$pageInfo<
    Query$GetMealPlans$mealPlans$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetMealPlans$mealPlans$pageInfo(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlans$mealPlans$pageInfo<TRes> {
  factory CopyWith$Query$GetMealPlans$mealPlans$pageInfo(
    Query$GetMealPlans$mealPlans$pageInfo instance,
    TRes Function(Query$GetMealPlans$mealPlans$pageInfo) then,
  ) = _CopyWithImpl$Query$GetMealPlans$mealPlans$pageInfo;

  factory CopyWith$Query$GetMealPlans$mealPlans$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlans$mealPlans$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetMealPlans$mealPlans$pageInfo<TRes>
    implements CopyWith$Query$GetMealPlans$mealPlans$pageInfo<TRes> {
  _CopyWithImpl$Query$GetMealPlans$mealPlans$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetMealPlans$mealPlans$pageInfo _instance;

  final TRes Function(Query$GetMealPlans$mealPlans$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlans$mealPlans$pageInfo(
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

class _CopyWithStubImpl$Query$GetMealPlans$mealPlans$pageInfo<TRes>
    implements CopyWith$Query$GetMealPlans$mealPlans$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetMealPlans$mealPlans$pageInfo(this._res);

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Query$GetMealPlan {
  factory Variables$Query$GetMealPlan({required String id}) =>
      Variables$Query$GetMealPlan._({r'id': id});

  Variables$Query$GetMealPlan._(this._$data);

  factory Variables$Query$GetMealPlan.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetMealPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetMealPlan<Variables$Query$GetMealPlan>
  get copyWith => CopyWith$Variables$Query$GetMealPlan(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMealPlan ||
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

abstract class CopyWith$Variables$Query$GetMealPlan<TRes> {
  factory CopyWith$Variables$Query$GetMealPlan(
    Variables$Query$GetMealPlan instance,
    TRes Function(Variables$Query$GetMealPlan) then,
  ) = _CopyWithImpl$Variables$Query$GetMealPlan;

  factory CopyWith$Variables$Query$GetMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMealPlan;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetMealPlan<TRes>
    implements CopyWith$Variables$Query$GetMealPlan<TRes> {
  _CopyWithImpl$Variables$Query$GetMealPlan(this._instance, this._then);

  final Variables$Query$GetMealPlan _instance;

  final TRes Function(Variables$Query$GetMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(
    Variables$Query$GetMealPlan._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMealPlan<TRes>
    implements CopyWith$Variables$Query$GetMealPlan<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMealPlan(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetMealPlan {
  Query$GetMealPlan({this.mealPlan, this.$__typename = 'Query'});

  factory Query$GetMealPlan.fromJson(Map<String, dynamic> json) {
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlan(
      mealPlan: l$mealPlan == null
          ? null
          : Fragment$MealPlanFragment.fromJson(
              (l$mealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealPlanFragment? mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mealPlan = mealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$mealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealPlan || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetMealPlan on Query$GetMealPlan {
  CopyWith$Query$GetMealPlan<Query$GetMealPlan> get copyWith =>
      CopyWith$Query$GetMealPlan(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlan<TRes> {
  factory CopyWith$Query$GetMealPlan(
    Query$GetMealPlan instance,
    TRes Function(Query$GetMealPlan) then,
  ) = _CopyWithImpl$Query$GetMealPlan;

  factory CopyWith$Query$GetMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlan;

  TRes call({Fragment$MealPlanFragment? mealPlan, String? $__typename});
  CopyWith$Fragment$MealPlanFragment<TRes> get mealPlan;
}

class _CopyWithImpl$Query$GetMealPlan<TRes>
    implements CopyWith$Query$GetMealPlan<TRes> {
  _CopyWithImpl$Query$GetMealPlan(this._instance, this._then);

  final Query$GetMealPlan _instance;

  final TRes Function(Query$GetMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlan(
      mealPlan: mealPlan == _undefined
          ? _instance.mealPlan
          : (mealPlan as Fragment$MealPlanFragment?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$MealPlanFragment<TRes> get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return local$mealPlan == null
        ? CopyWith$Fragment$MealPlanFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanFragment(
            local$mealPlan,
            (e) => call(mealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMealPlan<TRes>
    implements CopyWith$Query$GetMealPlan<TRes> {
  _CopyWithStubImpl$Query$GetMealPlan(this._res);

  TRes _res;

  call({Fragment$MealPlanFragment? mealPlan, String? $__typename}) => _res;

  CopyWith$Fragment$MealPlanFragment<TRes> get mealPlan =>
      CopyWith$Fragment$MealPlanFragment.stub(_res);
}

const documentNodeQueryGetMealPlan = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMealPlan'),
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
            name: NameNode(value: 'mealPlan'),
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
                  name: NameNode(value: 'MealPlanFragment'),
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
    fragmentDefinitionMealPlanFragment,
    fragmentDefinitionMealPlanSummaryFragment,
    fragmentDefinitionMealFragment,
  ],
);
Query$GetMealPlan _parserFn$Query$GetMealPlan(Map<String, dynamic> data) =>
    Query$GetMealPlan.fromJson(data);
typedef OnQueryComplete$Query$GetMealPlan =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMealPlan?);

class Options$Query$GetMealPlan
    extends graphql.QueryOptions<Query$GetMealPlan> {
  Options$Query$GetMealPlan({
    String? operationName,
    required Variables$Query$GetMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealPlan? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMealPlan? onComplete,
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
                 data == null ? null : _parserFn$Query$GetMealPlan(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMealPlan,
         parserFn: _parserFn$Query$GetMealPlan,
       );

  final OnQueryComplete$Query$GetMealPlan? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMealPlan
    extends graphql.WatchQueryOptions<Query$GetMealPlan> {
  WatchOptions$Query$GetMealPlan({
    String? operationName,
    required Variables$Query$GetMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealPlan? typedOptimisticResult,
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
         document: documentNodeQueryGetMealPlan,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMealPlan,
       );
}

class FetchMoreOptions$Query$GetMealPlan extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMealPlan({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMealPlan variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetMealPlan,
       );
}

extension ClientExtension$Query$GetMealPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMealPlan>> query$GetMealPlan(
    Options$Query$GetMealPlan options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetMealPlan> watchQuery$GetMealPlan(
    WatchOptions$Query$GetMealPlan options,
  ) => this.watchQuery(options);

  void writeQuery$GetMealPlan({
    required Query$GetMealPlan data,
    required Variables$Query$GetMealPlan variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetMealPlan),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMealPlan? readQuery$GetMealPlan({
    required Variables$Query$GetMealPlan variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMealPlan),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMealPlan.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMealPlan> useQuery$GetMealPlan(
  Options$Query$GetMealPlan options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMealPlan> useWatchQuery$GetMealPlan(
  WatchOptions$Query$GetMealPlan options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetMealPlan$Widget
    extends graphql_flutter.Query<Query$GetMealPlan> {
  Query$GetMealPlan$Widget({
    widgets.Key? key,
    required Options$Query$GetMealPlan options,
    required graphql_flutter.QueryBuilder<Query$GetMealPlan> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Query$GetMealPlansByRestaurant {
  factory Variables$Query$GetMealPlansByRestaurant({
    required String restaurantId,
    int? first,
    String? after,
    String? search,
    List<Input$MealPlanFilter_price?>? price,
    List<Input$MealPlanFilter_calories?>? calories,
    List<Input$MealPlanFilter_protein?>? protein,
    List<Input$MealPlanFilter_fat?>? fat,
    List<Input$MealPlanFilter_carbs?>? carbs,
    String? category,
  }) => Variables$Query$GetMealPlansByRestaurant._({
    r'restaurantId': restaurantId,
    if (first != null) r'first': first,
    if (after != null) r'after': after,
    if (search != null) r'search': search,
    if (price != null) r'price': price,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
    if (category != null) r'category': category,
  });

  Variables$Query$GetMealPlansByRestaurant._(this._$data);

  factory Variables$Query$GetMealPlansByRestaurant.fromJson(
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
    if (data.containsKey('search')) {
      final l$search = data['search'];
      result$data['search'] = (l$search as String?);
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_price.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_calories.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_protein.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_fat.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$MealPlanFilter_carbs.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('category')) {
      final l$category = data['category'];
      result$data['category'] = (l$category as String?);
    }
    return Variables$Query$GetMealPlansByRestaurant._(result$data);
  }

  Map<String, dynamic> _$data;

  String get restaurantId => (_$data['restaurantId'] as String);

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get search => (_$data['search'] as String?);

  List<Input$MealPlanFilter_price?>? get price =>
      (_$data['price'] as List<Input$MealPlanFilter_price?>?);

  List<Input$MealPlanFilter_calories?>? get calories =>
      (_$data['calories'] as List<Input$MealPlanFilter_calories?>?);

  List<Input$MealPlanFilter_protein?>? get protein =>
      (_$data['protein'] as List<Input$MealPlanFilter_protein?>?);

  List<Input$MealPlanFilter_fat?>? get fat =>
      (_$data['fat'] as List<Input$MealPlanFilter_fat?>?);

  List<Input$MealPlanFilter_carbs?>? get carbs =>
      (_$data['carbs'] as List<Input$MealPlanFilter_carbs?>?);

  String? get category => (_$data['category'] as String?);

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
    if (_$data.containsKey('search')) {
      final l$search = search;
      result$data['search'] = l$search;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs?.map((e) => e?.toJson()).toList();
    }
    if (_$data.containsKey('category')) {
      final l$category = category;
      result$data['category'] = l$category;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMealPlansByRestaurant<
    Variables$Query$GetMealPlansByRestaurant
  >
  get copyWith =>
      CopyWith$Variables$Query$GetMealPlansByRestaurant(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMealPlansByRestaurant ||
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
    final l$search = search;
    final lOther$search = other.search;
    if (_$data.containsKey('search') != other._$data.containsKey('search')) {
      return false;
    }
    if (l$search != lOther$search) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != null && lOther$price != null) {
      if (l$price.length != lOther$price.length) {
        return false;
      }
      for (int i = 0; i < l$price.length; i++) {
        final l$price$entry = l$price[i];
        final lOther$price$entry = lOther$price[i];
        if (l$price$entry != lOther$price$entry) {
          return false;
        }
      }
    } else if (l$price != lOther$price) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != null && lOther$calories != null) {
      if (l$calories.length != lOther$calories.length) {
        return false;
      }
      for (int i = 0; i < l$calories.length; i++) {
        final l$calories$entry = l$calories[i];
        final lOther$calories$entry = lOther$calories[i];
        if (l$calories$entry != lOther$calories$entry) {
          return false;
        }
      }
    } else if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != null && lOther$protein != null) {
      if (l$protein.length != lOther$protein.length) {
        return false;
      }
      for (int i = 0; i < l$protein.length; i++) {
        final l$protein$entry = l$protein[i];
        final lOther$protein$entry = lOther$protein[i];
        if (l$protein$entry != lOther$protein$entry) {
          return false;
        }
      }
    } else if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != null && lOther$fat != null) {
      if (l$fat.length != lOther$fat.length) {
        return false;
      }
      for (int i = 0; i < l$fat.length; i++) {
        final l$fat$entry = l$fat[i];
        final lOther$fat$entry = lOther$fat[i];
        if (l$fat$entry != lOther$fat$entry) {
          return false;
        }
      }
    } else if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != null && lOther$carbs != null) {
      if (l$carbs.length != lOther$carbs.length) {
        return false;
      }
      for (int i = 0; i < l$carbs.length; i++) {
        final l$carbs$entry = l$carbs[i];
        final lOther$carbs$entry = lOther$carbs[i];
        if (l$carbs$entry != lOther$carbs$entry) {
          return false;
        }
      }
    } else if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$category = category;
    final lOther$category = other.category;
    if (_$data.containsKey('category') !=
        other._$data.containsKey('category')) {
      return false;
    }
    if (l$category != lOther$category) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$restaurantId = restaurantId;
    final l$first = first;
    final l$after = after;
    final l$search = search;
    final l$price = price;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$category = category;
    return Object.hashAll([
      l$restaurantId,
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('search') ? l$search : const {},
      _$data.containsKey('price')
          ? l$price == null
                ? null
                : Object.hashAll(l$price.map((v) => v))
          : const {},
      _$data.containsKey('calories')
          ? l$calories == null
                ? null
                : Object.hashAll(l$calories.map((v) => v))
          : const {},
      _$data.containsKey('protein')
          ? l$protein == null
                ? null
                : Object.hashAll(l$protein.map((v) => v))
          : const {},
      _$data.containsKey('fat')
          ? l$fat == null
                ? null
                : Object.hashAll(l$fat.map((v) => v))
          : const {},
      _$data.containsKey('carbs')
          ? l$carbs == null
                ? null
                : Object.hashAll(l$carbs.map((v) => v))
          : const {},
      _$data.containsKey('category') ? l$category : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetMealPlansByRestaurant<TRes> {
  factory CopyWith$Variables$Query$GetMealPlansByRestaurant(
    Variables$Query$GetMealPlansByRestaurant instance,
    TRes Function(Variables$Query$GetMealPlansByRestaurant) then,
  ) = _CopyWithImpl$Variables$Query$GetMealPlansByRestaurant;

  factory CopyWith$Variables$Query$GetMealPlansByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMealPlansByRestaurant;

  TRes call({
    String? restaurantId,
    int? first,
    String? after,
    String? search,
    List<Input$MealPlanFilter_price?>? price,
    List<Input$MealPlanFilter_calories?>? calories,
    List<Input$MealPlanFilter_protein?>? protein,
    List<Input$MealPlanFilter_fat?>? fat,
    List<Input$MealPlanFilter_carbs?>? carbs,
    String? category,
  });
}

class _CopyWithImpl$Variables$Query$GetMealPlansByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetMealPlansByRestaurant<TRes> {
  _CopyWithImpl$Variables$Query$GetMealPlansByRestaurant(
    this._instance,
    this._then,
  );

  final Variables$Query$GetMealPlansByRestaurant _instance;

  final TRes Function(Variables$Query$GetMealPlansByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurantId = _undefined,
    Object? first = _undefined,
    Object? after = _undefined,
    Object? search = _undefined,
    Object? price = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? category = _undefined,
  }) => _then(
    Variables$Query$GetMealPlansByRestaurant._({
      ..._instance._$data,
      if (restaurantId != _undefined && restaurantId != null)
        'restaurantId': (restaurantId as String),
      if (first != _undefined) 'first': (first as int?),
      if (after != _undefined) 'after': (after as String?),
      if (search != _undefined) 'search': (search as String?),
      if (price != _undefined)
        'price': (price as List<Input$MealPlanFilter_price?>?),
      if (calories != _undefined)
        'calories': (calories as List<Input$MealPlanFilter_calories?>?),
      if (protein != _undefined)
        'protein': (protein as List<Input$MealPlanFilter_protein?>?),
      if (fat != _undefined) 'fat': (fat as List<Input$MealPlanFilter_fat?>?),
      if (carbs != _undefined)
        'carbs': (carbs as List<Input$MealPlanFilter_carbs?>?),
      if (category != _undefined) 'category': (category as String?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMealPlansByRestaurant<TRes>
    implements CopyWith$Variables$Query$GetMealPlansByRestaurant<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMealPlansByRestaurant(this._res);

  TRes _res;

  call({
    String? restaurantId,
    int? first,
    String? after,
    String? search,
    List<Input$MealPlanFilter_price?>? price,
    List<Input$MealPlanFilter_calories?>? calories,
    List<Input$MealPlanFilter_protein?>? protein,
    List<Input$MealPlanFilter_fat?>? fat,
    List<Input$MealPlanFilter_carbs?>? carbs,
    String? category,
  }) => _res;
}

class Query$GetMealPlansByRestaurant {
  Query$GetMealPlansByRestaurant({this.restaurant, this.$__typename = 'Query'});

  factory Query$GetMealPlansByRestaurant.fromJson(Map<String, dynamic> json) {
    final l$restaurant = json['restaurant'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlansByRestaurant(
      restaurant: l$restaurant == null
          ? null
          : Query$GetMealPlansByRestaurant$restaurant.fromJson(
              (l$restaurant as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMealPlansByRestaurant$restaurant? restaurant;

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
    if (other is! Query$GetMealPlansByRestaurant ||
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

extension UtilityExtension$Query$GetMealPlansByRestaurant
    on Query$GetMealPlansByRestaurant {
  CopyWith$Query$GetMealPlansByRestaurant<Query$GetMealPlansByRestaurant>
  get copyWith => CopyWith$Query$GetMealPlansByRestaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlansByRestaurant<TRes> {
  factory CopyWith$Query$GetMealPlansByRestaurant(
    Query$GetMealPlansByRestaurant instance,
    TRes Function(Query$GetMealPlansByRestaurant) then,
  ) = _CopyWithImpl$Query$GetMealPlansByRestaurant;

  factory CopyWith$Query$GetMealPlansByRestaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlansByRestaurant;

  TRes call({
    Query$GetMealPlansByRestaurant$restaurant? restaurant,
    String? $__typename,
  });
  CopyWith$Query$GetMealPlansByRestaurant$restaurant<TRes> get restaurant;
}

class _CopyWithImpl$Query$GetMealPlansByRestaurant<TRes>
    implements CopyWith$Query$GetMealPlansByRestaurant<TRes> {
  _CopyWithImpl$Query$GetMealPlansByRestaurant(this._instance, this._then);

  final Query$GetMealPlansByRestaurant _instance;

  final TRes Function(Query$GetMealPlansByRestaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? restaurant = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlansByRestaurant(
      restaurant: restaurant == _undefined
          ? _instance.restaurant
          : (restaurant as Query$GetMealPlansByRestaurant$restaurant?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMealPlansByRestaurant$restaurant<TRes> get restaurant {
    final local$restaurant = _instance.restaurant;
    return local$restaurant == null
        ? CopyWith$Query$GetMealPlansByRestaurant$restaurant.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetMealPlansByRestaurant$restaurant(
            local$restaurant,
            (e) => call(restaurant: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMealPlansByRestaurant<TRes>
    implements CopyWith$Query$GetMealPlansByRestaurant<TRes> {
  _CopyWithStubImpl$Query$GetMealPlansByRestaurant(this._res);

  TRes _res;

  call({
    Query$GetMealPlansByRestaurant$restaurant? restaurant,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMealPlansByRestaurant$restaurant<TRes> get restaurant =>
      CopyWith$Query$GetMealPlansByRestaurant$restaurant.stub(_res);
}

const documentNodeQueryGetMealPlansByRestaurant = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMealPlansByRestaurant'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'restaurantId')),
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
          variable: VariableNode(name: NameNode(value: 'search')),
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'price')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_price'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'calories')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_calories'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'protein')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_protein'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'fat')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_fat'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'carbs')),
          type: ListTypeNode(
            type: NamedTypeNode(
              name: NameNode(value: 'MealPlanFilter_carbs'),
              isNonNull: false,
            ),
            isNonNull: false,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'category')),
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
                value: VariableNode(name: NameNode(value: 'restaurantId')),
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
                  name: NameNode(value: 'mealPlans'),
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
                      name: NameNode(value: 'price'),
                      value: VariableNode(name: NameNode(value: 'price')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'calories'),
                      value: VariableNode(name: NameNode(value: 'calories')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'protein'),
                      value: VariableNode(name: NameNode(value: 'protein')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'fat'),
                      value: VariableNode(name: NameNode(value: 'fat')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'carbs'),
                      value: VariableNode(name: NameNode(value: 'carbs')),
                    ),
                    ArgumentNode(
                      name: NameNode(value: 'dietCategories_name'),
                      value: VariableNode(name: NameNode(value: 'category')),
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
                        name: NameNode(value: 'totalCount'),
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
    fragmentDefinitionMealPlanSummaryFragment,
  ],
);
Query$GetMealPlansByRestaurant _parserFn$Query$GetMealPlansByRestaurant(
  Map<String, dynamic> data,
) => Query$GetMealPlansByRestaurant.fromJson(data);
typedef OnQueryComplete$Query$GetMealPlansByRestaurant =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Query$GetMealPlansByRestaurant?,
    );

class Options$Query$GetMealPlansByRestaurant
    extends graphql.QueryOptions<Query$GetMealPlansByRestaurant> {
  Options$Query$GetMealPlansByRestaurant({
    String? operationName,
    required Variables$Query$GetMealPlansByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealPlansByRestaurant? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMealPlansByRestaurant? onComplete,
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
                     : _parserFn$Query$GetMealPlansByRestaurant(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMealPlansByRestaurant,
         parserFn: _parserFn$Query$GetMealPlansByRestaurant,
       );

  final OnQueryComplete$Query$GetMealPlansByRestaurant? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMealPlansByRestaurant
    extends graphql.WatchQueryOptions<Query$GetMealPlansByRestaurant> {
  WatchOptions$Query$GetMealPlansByRestaurant({
    String? operationName,
    required Variables$Query$GetMealPlansByRestaurant variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMealPlansByRestaurant? typedOptimisticResult,
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
         document: documentNodeQueryGetMealPlansByRestaurant,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMealPlansByRestaurant,
       );
}

class FetchMoreOptions$Query$GetMealPlansByRestaurant
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMealPlansByRestaurant({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMealPlansByRestaurant variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetMealPlansByRestaurant,
       );
}

extension ClientExtension$Query$GetMealPlansByRestaurant
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMealPlansByRestaurant>>
  query$GetMealPlansByRestaurant(
    Options$Query$GetMealPlansByRestaurant options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetMealPlansByRestaurant>
  watchQuery$GetMealPlansByRestaurant(
    WatchOptions$Query$GetMealPlansByRestaurant options,
  ) => this.watchQuery(options);

  void writeQuery$GetMealPlansByRestaurant({
    required Query$GetMealPlansByRestaurant data,
    required Variables$Query$GetMealPlansByRestaurant variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(
        document: documentNodeQueryGetMealPlansByRestaurant,
      ),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMealPlansByRestaurant? readQuery$GetMealPlansByRestaurant({
    required Variables$Query$GetMealPlansByRestaurant variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetMealPlansByRestaurant,
        ),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$GetMealPlansByRestaurant.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMealPlansByRestaurant>
useQuery$GetMealPlansByRestaurant(
  Options$Query$GetMealPlansByRestaurant options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMealPlansByRestaurant>
useWatchQuery$GetMealPlansByRestaurant(
  WatchOptions$Query$GetMealPlansByRestaurant options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetMealPlansByRestaurant$Widget
    extends graphql_flutter.Query<Query$GetMealPlansByRestaurant> {
  Query$GetMealPlansByRestaurant$Widget({
    widgets.Key? key,
    required Options$Query$GetMealPlansByRestaurant options,
    required graphql_flutter.QueryBuilder<Query$GetMealPlansByRestaurant>
    builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetMealPlansByRestaurant$restaurant {
  Query$GetMealPlansByRestaurant$restaurant({
    required this.id,
    this.mealPlans,
    this.$__typename = 'Restaurant',
  });

  factory Query$GetMealPlansByRestaurant$restaurant.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$mealPlans = json['mealPlans'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlansByRestaurant$restaurant(
      id: (l$id as String),
      mealPlans: l$mealPlans == null
          ? null
          : Query$GetMealPlansByRestaurant$restaurant$mealPlans.fromJson(
              (l$mealPlans as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Query$GetMealPlansByRestaurant$restaurant$mealPlans? mealPlans;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$mealPlans = mealPlans;
    _resultData['mealPlans'] = l$mealPlans?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$mealPlans = mealPlans;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$mealPlans, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealPlansByRestaurant$restaurant ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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

extension UtilityExtension$Query$GetMealPlansByRestaurant$restaurant
    on Query$GetMealPlansByRestaurant$restaurant {
  CopyWith$Query$GetMealPlansByRestaurant$restaurant<
    Query$GetMealPlansByRestaurant$restaurant
  >
  get copyWith =>
      CopyWith$Query$GetMealPlansByRestaurant$restaurant(this, (i) => i);
}

abstract class CopyWith$Query$GetMealPlansByRestaurant$restaurant<TRes> {
  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant(
    Query$GetMealPlansByRestaurant$restaurant instance,
    TRes Function(Query$GetMealPlansByRestaurant$restaurant) then,
  ) = _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant;

  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant;

  TRes call({
    String? id,
    Query$GetMealPlansByRestaurant$restaurant$mealPlans? mealPlans,
    String? $__typename,
  });
  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<TRes>
  get mealPlans;
}

class _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetMealPlansByRestaurant$restaurant<TRes> {
  _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant(
    this._instance,
    this._then,
  );

  final Query$GetMealPlansByRestaurant$restaurant _instance;

  final TRes Function(Query$GetMealPlansByRestaurant$restaurant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? mealPlans = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlansByRestaurant$restaurant(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      mealPlans: mealPlans == _undefined
          ? _instance.mealPlans
          : (mealPlans as Query$GetMealPlansByRestaurant$restaurant$mealPlans?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<TRes>
  get mealPlans {
    final local$mealPlans = _instance.mealPlans;
    return local$mealPlans == null
        ? CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans(
            local$mealPlans,
            (e) => call(mealPlans: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant<TRes>
    implements CopyWith$Query$GetMealPlansByRestaurant$restaurant<TRes> {
  _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant(this._res);

  TRes _res;

  call({
    String? id,
    Query$GetMealPlansByRestaurant$restaurant$mealPlans? mealPlans,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<TRes>
  get mealPlans =>
      CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans.stub(_res);
}

class Query$GetMealPlansByRestaurant$restaurant$mealPlans {
  Query$GetMealPlansByRestaurant$restaurant$mealPlans({
    this.edges,
    required this.pageInfo,
    required this.totalCount,
    this.$__typename = 'MealPlanCursorConnection',
  });

  factory Query$GetMealPlansByRestaurant$restaurant$mealPlans.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$totalCount = json['totalCount'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlansByRestaurant$restaurant$mealPlans(
      edges: (l$edges as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList(),
      pageInfo:
          Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo.fromJson(
            (l$pageInfo as Map<String, dynamic>),
          ),
      totalCount: (l$totalCount as int),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges?>? edges;

  final Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo pageInfo;

  final int totalCount;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges?.map((e) => e?.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$totalCount = totalCount;
    _resultData['totalCount'] = l$totalCount;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$totalCount = totalCount;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$edges == null ? null : Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$totalCount,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMealPlansByRestaurant$restaurant$mealPlans ||
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
    final l$totalCount = totalCount;
    final lOther$totalCount = other.totalCount;
    if (l$totalCount != lOther$totalCount) {
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

extension UtilityExtension$Query$GetMealPlansByRestaurant$restaurant$mealPlans
    on Query$GetMealPlansByRestaurant$restaurant$mealPlans {
  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<
    Query$GetMealPlansByRestaurant$restaurant$mealPlans
  >
  get copyWith => CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<
  TRes
> {
  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans(
    Query$GetMealPlansByRestaurant$restaurant$mealPlans instance,
    TRes Function(Query$GetMealPlansByRestaurant$restaurant$mealPlans) then,
  ) = _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans;

  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans;

  TRes call({
    List<Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges?>? edges,
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  });
  TRes edges(
    Iterable<Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
          Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges
        >?
      >?,
    )
    _fn,
  );
  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<TRes>
  get pageInfo;
}

class _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans<TRes>
    implements
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<TRes> {
  _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans(
    this._instance,
    this._then,
  );

  final Query$GetMealPlansByRestaurant$restaurant$mealPlans _instance;

  final TRes Function(Query$GetMealPlansByRestaurant$restaurant$mealPlans)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? totalCount = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlansByRestaurant$restaurant$mealPlans(
      edges: edges == _undefined
          ? _instance.edges
          : (edges
                as List<
                  Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges?
                >?),
      pageInfo: pageInfo == _undefined || pageInfo == null
          ? _instance.pageInfo
          : (pageInfo
                as Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo),
      totalCount: totalCount == _undefined || totalCount == null
          ? _instance.totalCount
          : (totalCount as int),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes edges(
    Iterable<Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges?>?
    Function(
      Iterable<
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
          Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges
        >?
      >?,
    )
    _fn,
  ) => call(
    edges: _fn(
      _instance.edges?.map(
        (e) => e == null
            ? null
            : CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
                e,
                (i) => i,
              ),
      ),
    )?.toList(),
  );

  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<TRes>
  get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
      local$pageInfo,
      (e) => call(pageInfo: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans<
  TRes
>
    implements
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans<TRes> {
  _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans(
    this._res,
  );

  TRes _res;

  call({
    List<Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges?>? edges,
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo? pageInfo,
    int? totalCount,
    String? $__typename,
  }) => _res;

  edges(_fn) => _res;

  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<TRes>
  get pageInfo =>
      CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo.stub(
        _res,
      );
}

class Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges {
  Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges({
    this.node,
    this.$__typename = 'MealPlanEdge',
  });

  factory Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
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
    if (other is! Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges ||
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

extension UtilityExtension$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges
    on Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges {
  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges
  >
  get copyWith =>
      CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
  TRes
> {
  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges instance,
    TRes Function(Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges)
    then,
  ) = _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges;

  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges;

  TRes call({Fragment$MealPlanSummaryFragment? node, String? $__typename});
  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node;
}

class _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
  TRes
>
    implements
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
          TRes
        > {
  _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
    this._instance,
    this._then,
  );

  final Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges _instance;

  final TRes Function(Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? node = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
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

class _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
  TRes
>
    implements
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges<
          TRes
        > {
  _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$edges(
    this._res,
  );

  TRes _res;

  call({Fragment$MealPlanSummaryFragment? node, String? $__typename}) => _res;

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get node =>
      CopyWith$Fragment$MealPlanSummaryFragment.stub(_res);
}

class Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo {
  Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo({
    required this.hasNextPage,
    this.endCursor,
    this.$__typename = 'MealPlanPageInfo',
  });

  factory Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$hasNextPage = json['hasNextPage'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
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
    if (other
            is! Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo ||
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

extension UtilityExtension$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo
    on Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo {
  CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo
  >
  get copyWith =>
      CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<
  TRes
> {
  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo instance,
    TRes Function(Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo)
    then,
  ) = _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo;

  factory CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo;

  TRes call({bool? hasNextPage, String? endCursor, String? $__typename});
}

class _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<
  TRes
>
    implements
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<
          TRes
        > {
  _CopyWithImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo _instance;

  final TRes Function(
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
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

class _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<
  TRes
>
    implements
        CopyWith$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo<
          TRes
        > {
  _CopyWithStubImpl$Query$GetMealPlansByRestaurant$restaurant$mealPlans$pageInfo(
    this._res,
  );

  TRes _res;

  call({bool? hasNextPage, String? endCursor, String? $__typename}) => _res;
}

class Variables$Mutation$CreateMealPlan {
  factory Variables$Mutation$CreateMealPlan({
    required Input$createMealPlanInput input,
  }) => Variables$Mutation$CreateMealPlan._({r'input': input});

  Variables$Mutation$CreateMealPlan._(this._$data);

  factory Variables$Mutation$CreateMealPlan.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$createMealPlanInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateMealPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$createMealPlanInput get input =>
      (_$data['input'] as Input$createMealPlanInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateMealPlan<Variables$Mutation$CreateMealPlan>
  get copyWith => CopyWith$Variables$Mutation$CreateMealPlan(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateMealPlan ||
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

abstract class CopyWith$Variables$Mutation$CreateMealPlan<TRes> {
  factory CopyWith$Variables$Mutation$CreateMealPlan(
    Variables$Mutation$CreateMealPlan instance,
    TRes Function(Variables$Mutation$CreateMealPlan) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateMealPlan;

  factory CopyWith$Variables$Mutation$CreateMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateMealPlan;

  TRes call({Input$createMealPlanInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateMealPlan<TRes>
    implements CopyWith$Variables$Mutation$CreateMealPlan<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateMealPlan(this._instance, this._then);

  final Variables$Mutation$CreateMealPlan _instance;

  final TRes Function(Variables$Mutation$CreateMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateMealPlan._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$createMealPlanInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateMealPlan<TRes>
    implements CopyWith$Variables$Mutation$CreateMealPlan<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateMealPlan(this._res);

  TRes _res;

  call({Input$createMealPlanInput? input}) => _res;
}

class Mutation$CreateMealPlan {
  Mutation$CreateMealPlan({this.createMealPlan, this.$__typename = 'Mutation'});

  factory Mutation$CreateMealPlan.fromJson(Map<String, dynamic> json) {
    final l$createMealPlan = json['createMealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMealPlan(
      createMealPlan: l$createMealPlan == null
          ? null
          : Mutation$CreateMealPlan$createMealPlan.fromJson(
              (l$createMealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateMealPlan$createMealPlan? createMealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createMealPlan = createMealPlan;
    _resultData['createMealPlan'] = l$createMealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createMealPlan = createMealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createMealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMealPlan || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createMealPlan = createMealPlan;
    final lOther$createMealPlan = other.createMealPlan;
    if (l$createMealPlan != lOther$createMealPlan) {
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

extension UtilityExtension$Mutation$CreateMealPlan on Mutation$CreateMealPlan {
  CopyWith$Mutation$CreateMealPlan<Mutation$CreateMealPlan> get copyWith =>
      CopyWith$Mutation$CreateMealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMealPlan<TRes> {
  factory CopyWith$Mutation$CreateMealPlan(
    Mutation$CreateMealPlan instance,
    TRes Function(Mutation$CreateMealPlan) then,
  ) = _CopyWithImpl$Mutation$CreateMealPlan;

  factory CopyWith$Mutation$CreateMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMealPlan;

  TRes call({
    Mutation$CreateMealPlan$createMealPlan? createMealPlan,
    String? $__typename,
  });
  CopyWith$Mutation$CreateMealPlan$createMealPlan<TRes> get createMealPlan;
}

class _CopyWithImpl$Mutation$CreateMealPlan<TRes>
    implements CopyWith$Mutation$CreateMealPlan<TRes> {
  _CopyWithImpl$Mutation$CreateMealPlan(this._instance, this._then);

  final Mutation$CreateMealPlan _instance;

  final TRes Function(Mutation$CreateMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createMealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateMealPlan(
      createMealPlan: createMealPlan == _undefined
          ? _instance.createMealPlan
          : (createMealPlan as Mutation$CreateMealPlan$createMealPlan?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateMealPlan$createMealPlan<TRes> get createMealPlan {
    final local$createMealPlan = _instance.createMealPlan;
    return local$createMealPlan == null
        ? CopyWith$Mutation$CreateMealPlan$createMealPlan.stub(_then(_instance))
        : CopyWith$Mutation$CreateMealPlan$createMealPlan(
            local$createMealPlan,
            (e) => call(createMealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateMealPlan<TRes>
    implements CopyWith$Mutation$CreateMealPlan<TRes> {
  _CopyWithStubImpl$Mutation$CreateMealPlan(this._res);

  TRes _res;

  call({
    Mutation$CreateMealPlan$createMealPlan? createMealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$CreateMealPlan$createMealPlan<TRes> get createMealPlan =>
      CopyWith$Mutation$CreateMealPlan$createMealPlan.stub(_res);
}

const documentNodeMutationCreateMealPlan = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateMealPlan'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'createMealPlanInput'),
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
            name: NameNode(value: 'createMealPlan'),
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
                  name: NameNode(value: 'mealPlan'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'MealPlanSummaryFragment'),
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
    fragmentDefinitionMealPlanSummaryFragment,
  ],
);
Mutation$CreateMealPlan _parserFn$Mutation$CreateMealPlan(
  Map<String, dynamic> data,
) => Mutation$CreateMealPlan.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateMealPlan =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateMealPlan?);

class Options$Mutation$CreateMealPlan
    extends graphql.MutationOptions<Mutation$CreateMealPlan> {
  Options$Mutation$CreateMealPlan({
    String? operationName,
    required Variables$Mutation$CreateMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMealPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMealPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMealPlan>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateMealPlan(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateMealPlan,
         parserFn: _parserFn$Mutation$CreateMealPlan,
       );

  final OnMutationCompleted$Mutation$CreateMealPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateMealPlan
    extends graphql.WatchQueryOptions<Mutation$CreateMealPlan> {
  WatchOptions$Mutation$CreateMealPlan({
    String? operationName,
    required Variables$Mutation$CreateMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMealPlan? typedOptimisticResult,
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
         document: documentNodeMutationCreateMealPlan,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateMealPlan,
       );
}

extension ClientExtension$Mutation$CreateMealPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateMealPlan>> mutate$CreateMealPlan(
    Options$Mutation$CreateMealPlan options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateMealPlan> watchMutation$CreateMealPlan(
    WatchOptions$Mutation$CreateMealPlan options,
  ) => this.watchMutation(options);
}

class Mutation$CreateMealPlan$HookResult {
  Mutation$CreateMealPlan$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateMealPlan runMutation;

  final graphql.QueryResult<Mutation$CreateMealPlan> result;
}

Mutation$CreateMealPlan$HookResult useMutation$CreateMealPlan([
  WidgetOptions$Mutation$CreateMealPlan? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateMealPlan(),
  );
  return Mutation$CreateMealPlan$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateMealPlan>
useWatchMutation$CreateMealPlan(WatchOptions$Mutation$CreateMealPlan options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateMealPlan
    extends graphql.MutationOptions<Mutation$CreateMealPlan> {
  WidgetOptions$Mutation$CreateMealPlan({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateMealPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateMealPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateMealPlan>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateMealPlan(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateMealPlan,
         parserFn: _parserFn$Mutation$CreateMealPlan,
       );

  final OnMutationCompleted$Mutation$CreateMealPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateMealPlan =
    graphql.MultiSourceResult<Mutation$CreateMealPlan> Function(
      Variables$Mutation$CreateMealPlan, {
      Object? optimisticResult,
      Mutation$CreateMealPlan? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateMealPlan =
    widgets.Widget Function(
      RunMutation$Mutation$CreateMealPlan,
      graphql.QueryResult<Mutation$CreateMealPlan>?,
    );

class Mutation$CreateMealPlan$Widget
    extends graphql_flutter.Mutation<Mutation$CreateMealPlan> {
  Mutation$CreateMealPlan$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateMealPlan? options,
    required Builder$Mutation$CreateMealPlan builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateMealPlan(),
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

class Mutation$CreateMealPlan$createMealPlan {
  Mutation$CreateMealPlan$createMealPlan({
    this.mealPlan,
    this.$__typename = 'createMealPlanPayload',
  });

  factory Mutation$CreateMealPlan$createMealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateMealPlan$createMealPlan(
      mealPlan: l$mealPlan == null
          ? null
          : Fragment$MealPlanSummaryFragment.fromJson(
              (l$mealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealPlanSummaryFragment? mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mealPlan = mealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$mealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateMealPlan$createMealPlan ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$CreateMealPlan$createMealPlan
    on Mutation$CreateMealPlan$createMealPlan {
  CopyWith$Mutation$CreateMealPlan$createMealPlan<
    Mutation$CreateMealPlan$createMealPlan
  >
  get copyWith =>
      CopyWith$Mutation$CreateMealPlan$createMealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateMealPlan$createMealPlan<TRes> {
  factory CopyWith$Mutation$CreateMealPlan$createMealPlan(
    Mutation$CreateMealPlan$createMealPlan instance,
    TRes Function(Mutation$CreateMealPlan$createMealPlan) then,
  ) = _CopyWithImpl$Mutation$CreateMealPlan$createMealPlan;

  factory CopyWith$Mutation$CreateMealPlan$createMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateMealPlan$createMealPlan;

  TRes call({Fragment$MealPlanSummaryFragment? mealPlan, String? $__typename});
  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get mealPlan;
}

class _CopyWithImpl$Mutation$CreateMealPlan$createMealPlan<TRes>
    implements CopyWith$Mutation$CreateMealPlan$createMealPlan<TRes> {
  _CopyWithImpl$Mutation$CreateMealPlan$createMealPlan(
    this._instance,
    this._then,
  );

  final Mutation$CreateMealPlan$createMealPlan _instance;

  final TRes Function(Mutation$CreateMealPlan$createMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateMealPlan$createMealPlan(
      mealPlan: mealPlan == _undefined
          ? _instance.mealPlan
          : (mealPlan as Fragment$MealPlanSummaryFragment?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return local$mealPlan == null
        ? CopyWith$Fragment$MealPlanSummaryFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanSummaryFragment(
            local$mealPlan,
            (e) => call(mealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$CreateMealPlan$createMealPlan<TRes>
    implements CopyWith$Mutation$CreateMealPlan$createMealPlan<TRes> {
  _CopyWithStubImpl$Mutation$CreateMealPlan$createMealPlan(this._res);

  TRes _res;

  call({Fragment$MealPlanSummaryFragment? mealPlan, String? $__typename}) =>
      _res;

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get mealPlan =>
      CopyWith$Fragment$MealPlanSummaryFragment.stub(_res);
}

class Variables$Mutation$UpdateMealPlan {
  factory Variables$Mutation$UpdateMealPlan({
    required Input$updateMealPlanInput input,
  }) => Variables$Mutation$UpdateMealPlan._({r'input': input});

  Variables$Mutation$UpdateMealPlan._(this._$data);

  factory Variables$Mutation$UpdateMealPlan.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$updateMealPlanInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateMealPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$updateMealPlanInput get input =>
      (_$data['input'] as Input$updateMealPlanInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateMealPlan<Variables$Mutation$UpdateMealPlan>
  get copyWith => CopyWith$Variables$Mutation$UpdateMealPlan(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateMealPlan ||
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

abstract class CopyWith$Variables$Mutation$UpdateMealPlan<TRes> {
  factory CopyWith$Variables$Mutation$UpdateMealPlan(
    Variables$Mutation$UpdateMealPlan instance,
    TRes Function(Variables$Mutation$UpdateMealPlan) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateMealPlan;

  factory CopyWith$Variables$Mutation$UpdateMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateMealPlan;

  TRes call({Input$updateMealPlanInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateMealPlan<TRes>
    implements CopyWith$Variables$Mutation$UpdateMealPlan<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateMealPlan(this._instance, this._then);

  final Variables$Mutation$UpdateMealPlan _instance;

  final TRes Function(Variables$Mutation$UpdateMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateMealPlan._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$updateMealPlanInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateMealPlan<TRes>
    implements CopyWith$Variables$Mutation$UpdateMealPlan<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateMealPlan(this._res);

  TRes _res;

  call({Input$updateMealPlanInput? input}) => _res;
}

class Mutation$UpdateMealPlan {
  Mutation$UpdateMealPlan({this.updateMealPlan, this.$__typename = 'Mutation'});

  factory Mutation$UpdateMealPlan.fromJson(Map<String, dynamic> json) {
    final l$updateMealPlan = json['updateMealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMealPlan(
      updateMealPlan: l$updateMealPlan == null
          ? null
          : Mutation$UpdateMealPlan$updateMealPlan.fromJson(
              (l$updateMealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateMealPlan$updateMealPlan? updateMealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateMealPlan = updateMealPlan;
    _resultData['updateMealPlan'] = l$updateMealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateMealPlan = updateMealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateMealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMealPlan || runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateMealPlan = updateMealPlan;
    final lOther$updateMealPlan = other.updateMealPlan;
    if (l$updateMealPlan != lOther$updateMealPlan) {
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

extension UtilityExtension$Mutation$UpdateMealPlan on Mutation$UpdateMealPlan {
  CopyWith$Mutation$UpdateMealPlan<Mutation$UpdateMealPlan> get copyWith =>
      CopyWith$Mutation$UpdateMealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMealPlan<TRes> {
  factory CopyWith$Mutation$UpdateMealPlan(
    Mutation$UpdateMealPlan instance,
    TRes Function(Mutation$UpdateMealPlan) then,
  ) = _CopyWithImpl$Mutation$UpdateMealPlan;

  factory CopyWith$Mutation$UpdateMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMealPlan;

  TRes call({
    Mutation$UpdateMealPlan$updateMealPlan? updateMealPlan,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateMealPlan$updateMealPlan<TRes> get updateMealPlan;
}

class _CopyWithImpl$Mutation$UpdateMealPlan<TRes>
    implements CopyWith$Mutation$UpdateMealPlan<TRes> {
  _CopyWithImpl$Mutation$UpdateMealPlan(this._instance, this._then);

  final Mutation$UpdateMealPlan _instance;

  final TRes Function(Mutation$UpdateMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateMealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMealPlan(
      updateMealPlan: updateMealPlan == _undefined
          ? _instance.updateMealPlan
          : (updateMealPlan as Mutation$UpdateMealPlan$updateMealPlan?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$UpdateMealPlan$updateMealPlan<TRes> get updateMealPlan {
    final local$updateMealPlan = _instance.updateMealPlan;
    return local$updateMealPlan == null
        ? CopyWith$Mutation$UpdateMealPlan$updateMealPlan.stub(_then(_instance))
        : CopyWith$Mutation$UpdateMealPlan$updateMealPlan(
            local$updateMealPlan,
            (e) => call(updateMealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateMealPlan<TRes>
    implements CopyWith$Mutation$UpdateMealPlan<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMealPlan(this._res);

  TRes _res;

  call({
    Mutation$UpdateMealPlan$updateMealPlan? updateMealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$UpdateMealPlan$updateMealPlan<TRes> get updateMealPlan =>
      CopyWith$Mutation$UpdateMealPlan$updateMealPlan.stub(_res);
}

const documentNodeMutationUpdateMealPlan = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateMealPlan'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'updateMealPlanInput'),
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
            name: NameNode(value: 'updateMealPlan'),
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
                  name: NameNode(value: 'mealPlan'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(
                    selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'MealPlanSummaryFragment'),
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
    fragmentDefinitionMealPlanSummaryFragment,
  ],
);
Mutation$UpdateMealPlan _parserFn$Mutation$UpdateMealPlan(
  Map<String, dynamic> data,
) => Mutation$UpdateMealPlan.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateMealPlan =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateMealPlan?);

class Options$Mutation$UpdateMealPlan
    extends graphql.MutationOptions<Mutation$UpdateMealPlan> {
  Options$Mutation$UpdateMealPlan({
    String? operationName,
    required Variables$Mutation$UpdateMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMealPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMealPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMealPlan>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateMealPlan(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateMealPlan,
         parserFn: _parserFn$Mutation$UpdateMealPlan,
       );

  final OnMutationCompleted$Mutation$UpdateMealPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateMealPlan
    extends graphql.WatchQueryOptions<Mutation$UpdateMealPlan> {
  WatchOptions$Mutation$UpdateMealPlan({
    String? operationName,
    required Variables$Mutation$UpdateMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMealPlan? typedOptimisticResult,
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
         document: documentNodeMutationUpdateMealPlan,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateMealPlan,
       );
}

extension ClientExtension$Mutation$UpdateMealPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateMealPlan>> mutate$UpdateMealPlan(
    Options$Mutation$UpdateMealPlan options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateMealPlan> watchMutation$UpdateMealPlan(
    WatchOptions$Mutation$UpdateMealPlan options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateMealPlan$HookResult {
  Mutation$UpdateMealPlan$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateMealPlan runMutation;

  final graphql.QueryResult<Mutation$UpdateMealPlan> result;
}

Mutation$UpdateMealPlan$HookResult useMutation$UpdateMealPlan([
  WidgetOptions$Mutation$UpdateMealPlan? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateMealPlan(),
  );
  return Mutation$UpdateMealPlan$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateMealPlan>
useWatchMutation$UpdateMealPlan(WatchOptions$Mutation$UpdateMealPlan options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateMealPlan
    extends graphql.MutationOptions<Mutation$UpdateMealPlan> {
  WidgetOptions$Mutation$UpdateMealPlan({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateMealPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateMealPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateMealPlan>? update,
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
                 data == null ? null : _parserFn$Mutation$UpdateMealPlan(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateMealPlan,
         parserFn: _parserFn$Mutation$UpdateMealPlan,
       );

  final OnMutationCompleted$Mutation$UpdateMealPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateMealPlan =
    graphql.MultiSourceResult<Mutation$UpdateMealPlan> Function(
      Variables$Mutation$UpdateMealPlan, {
      Object? optimisticResult,
      Mutation$UpdateMealPlan? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateMealPlan =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateMealPlan,
      graphql.QueryResult<Mutation$UpdateMealPlan>?,
    );

class Mutation$UpdateMealPlan$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateMealPlan> {
  Mutation$UpdateMealPlan$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateMealPlan? options,
    required Builder$Mutation$UpdateMealPlan builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateMealPlan(),
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

class Mutation$UpdateMealPlan$updateMealPlan {
  Mutation$UpdateMealPlan$updateMealPlan({
    this.mealPlan,
    this.$__typename = 'updateMealPlanPayload',
  });

  factory Mutation$UpdateMealPlan$updateMealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateMealPlan$updateMealPlan(
      mealPlan: l$mealPlan == null
          ? null
          : Fragment$MealPlanSummaryFragment.fromJson(
              (l$mealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$MealPlanSummaryFragment? mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mealPlan = mealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$mealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateMealPlan$updateMealPlan ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$UpdateMealPlan$updateMealPlan
    on Mutation$UpdateMealPlan$updateMealPlan {
  CopyWith$Mutation$UpdateMealPlan$updateMealPlan<
    Mutation$UpdateMealPlan$updateMealPlan
  >
  get copyWith =>
      CopyWith$Mutation$UpdateMealPlan$updateMealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateMealPlan$updateMealPlan<TRes> {
  factory CopyWith$Mutation$UpdateMealPlan$updateMealPlan(
    Mutation$UpdateMealPlan$updateMealPlan instance,
    TRes Function(Mutation$UpdateMealPlan$updateMealPlan) then,
  ) = _CopyWithImpl$Mutation$UpdateMealPlan$updateMealPlan;

  factory CopyWith$Mutation$UpdateMealPlan$updateMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateMealPlan$updateMealPlan;

  TRes call({Fragment$MealPlanSummaryFragment? mealPlan, String? $__typename});
  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get mealPlan;
}

class _CopyWithImpl$Mutation$UpdateMealPlan$updateMealPlan<TRes>
    implements CopyWith$Mutation$UpdateMealPlan$updateMealPlan<TRes> {
  _CopyWithImpl$Mutation$UpdateMealPlan$updateMealPlan(
    this._instance,
    this._then,
  );

  final Mutation$UpdateMealPlan$updateMealPlan _instance;

  final TRes Function(Mutation$UpdateMealPlan$updateMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateMealPlan$updateMealPlan(
      mealPlan: mealPlan == _undefined
          ? _instance.mealPlan
          : (mealPlan as Fragment$MealPlanSummaryFragment?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return local$mealPlan == null
        ? CopyWith$Fragment$MealPlanSummaryFragment.stub(_then(_instance))
        : CopyWith$Fragment$MealPlanSummaryFragment(
            local$mealPlan,
            (e) => call(mealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UpdateMealPlan$updateMealPlan<TRes>
    implements CopyWith$Mutation$UpdateMealPlan$updateMealPlan<TRes> {
  _CopyWithStubImpl$Mutation$UpdateMealPlan$updateMealPlan(this._res);

  TRes _res;

  call({Fragment$MealPlanSummaryFragment? mealPlan, String? $__typename}) =>
      _res;

  CopyWith$Fragment$MealPlanSummaryFragment<TRes> get mealPlan =>
      CopyWith$Fragment$MealPlanSummaryFragment.stub(_res);
}

class Variables$Mutation$DeleteMealPlan {
  factory Variables$Mutation$DeleteMealPlan({
    required Input$deleteMealPlanInput input,
  }) => Variables$Mutation$DeleteMealPlan._({r'input': input});

  Variables$Mutation$DeleteMealPlan._(this._$data);

  factory Variables$Mutation$DeleteMealPlan.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$deleteMealPlanInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$DeleteMealPlan._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$deleteMealPlanInput get input =>
      (_$data['input'] as Input$deleteMealPlanInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteMealPlan<Variables$Mutation$DeleteMealPlan>
  get copyWith => CopyWith$Variables$Mutation$DeleteMealPlan(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteMealPlan ||
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

abstract class CopyWith$Variables$Mutation$DeleteMealPlan<TRes> {
  factory CopyWith$Variables$Mutation$DeleteMealPlan(
    Variables$Mutation$DeleteMealPlan instance,
    TRes Function(Variables$Mutation$DeleteMealPlan) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteMealPlan;

  factory CopyWith$Variables$Mutation$DeleteMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteMealPlan;

  TRes call({Input$deleteMealPlanInput? input});
}

class _CopyWithImpl$Variables$Mutation$DeleteMealPlan<TRes>
    implements CopyWith$Variables$Mutation$DeleteMealPlan<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteMealPlan(this._instance, this._then);

  final Variables$Mutation$DeleteMealPlan _instance;

  final TRes Function(Variables$Mutation$DeleteMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$DeleteMealPlan._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$deleteMealPlanInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteMealPlan<TRes>
    implements CopyWith$Variables$Mutation$DeleteMealPlan<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteMealPlan(this._res);

  TRes _res;

  call({Input$deleteMealPlanInput? input}) => _res;
}

class Mutation$DeleteMealPlan {
  Mutation$DeleteMealPlan({this.deleteMealPlan, this.$__typename = 'Mutation'});

  factory Mutation$DeleteMealPlan.fromJson(Map<String, dynamic> json) {
    final l$deleteMealPlan = json['deleteMealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMealPlan(
      deleteMealPlan: l$deleteMealPlan == null
          ? null
          : Mutation$DeleteMealPlan$deleteMealPlan.fromJson(
              (l$deleteMealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMealPlan$deleteMealPlan? deleteMealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMealPlan = deleteMealPlan;
    _resultData['deleteMealPlan'] = l$deleteMealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMealPlan = deleteMealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteMealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMealPlan || runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMealPlan = deleteMealPlan;
    final lOther$deleteMealPlan = other.deleteMealPlan;
    if (l$deleteMealPlan != lOther$deleteMealPlan) {
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

extension UtilityExtension$Mutation$DeleteMealPlan on Mutation$DeleteMealPlan {
  CopyWith$Mutation$DeleteMealPlan<Mutation$DeleteMealPlan> get copyWith =>
      CopyWith$Mutation$DeleteMealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMealPlan<TRes> {
  factory CopyWith$Mutation$DeleteMealPlan(
    Mutation$DeleteMealPlan instance,
    TRes Function(Mutation$DeleteMealPlan) then,
  ) = _CopyWithImpl$Mutation$DeleteMealPlan;

  factory CopyWith$Mutation$DeleteMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMealPlan;

  TRes call({
    Mutation$DeleteMealPlan$deleteMealPlan? deleteMealPlan,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<TRes> get deleteMealPlan;
}

class _CopyWithImpl$Mutation$DeleteMealPlan<TRes>
    implements CopyWith$Mutation$DeleteMealPlan<TRes> {
  _CopyWithImpl$Mutation$DeleteMealPlan(this._instance, this._then);

  final Mutation$DeleteMealPlan _instance;

  final TRes Function(Mutation$DeleteMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteMealPlan(
      deleteMealPlan: deleteMealPlan == _undefined
          ? _instance.deleteMealPlan
          : (deleteMealPlan as Mutation$DeleteMealPlan$deleteMealPlan?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<TRes> get deleteMealPlan {
    final local$deleteMealPlan = _instance.deleteMealPlan;
    return local$deleteMealPlan == null
        ? CopyWith$Mutation$DeleteMealPlan$deleteMealPlan.stub(_then(_instance))
        : CopyWith$Mutation$DeleteMealPlan$deleteMealPlan(
            local$deleteMealPlan,
            (e) => call(deleteMealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteMealPlan<TRes>
    implements CopyWith$Mutation$DeleteMealPlan<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMealPlan(this._res);

  TRes _res;

  call({
    Mutation$DeleteMealPlan$deleteMealPlan? deleteMealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<TRes> get deleteMealPlan =>
      CopyWith$Mutation$DeleteMealPlan$deleteMealPlan.stub(_res);
}

const documentNodeMutationDeleteMealPlan = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteMealPlan'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'deleteMealPlanInput'),
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
            name: NameNode(value: 'deleteMealPlan'),
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
Mutation$DeleteMealPlan _parserFn$Mutation$DeleteMealPlan(
  Map<String, dynamic> data,
) => Mutation$DeleteMealPlan.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteMealPlan =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$DeleteMealPlan?);

class Options$Mutation$DeleteMealPlan
    extends graphql.MutationOptions<Mutation$DeleteMealPlan> {
  Options$Mutation$DeleteMealPlan({
    String? operationName,
    required Variables$Mutation$DeleteMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMealPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMealPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMealPlan>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteMealPlan(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMealPlan,
         parserFn: _parserFn$Mutation$DeleteMealPlan,
       );

  final OnMutationCompleted$Mutation$DeleteMealPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteMealPlan
    extends graphql.WatchQueryOptions<Mutation$DeleteMealPlan> {
  WatchOptions$Mutation$DeleteMealPlan({
    String? operationName,
    required Variables$Mutation$DeleteMealPlan variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMealPlan? typedOptimisticResult,
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
         document: documentNodeMutationDeleteMealPlan,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteMealPlan,
       );
}

extension ClientExtension$Mutation$DeleteMealPlan on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteMealPlan>> mutate$DeleteMealPlan(
    Options$Mutation$DeleteMealPlan options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteMealPlan> watchMutation$DeleteMealPlan(
    WatchOptions$Mutation$DeleteMealPlan options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteMealPlan$HookResult {
  Mutation$DeleteMealPlan$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteMealPlan runMutation;

  final graphql.QueryResult<Mutation$DeleteMealPlan> result;
}

Mutation$DeleteMealPlan$HookResult useMutation$DeleteMealPlan([
  WidgetOptions$Mutation$DeleteMealPlan? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteMealPlan(),
  );
  return Mutation$DeleteMealPlan$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteMealPlan>
useWatchMutation$DeleteMealPlan(WatchOptions$Mutation$DeleteMealPlan options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteMealPlan
    extends graphql.MutationOptions<Mutation$DeleteMealPlan> {
  WidgetOptions$Mutation$DeleteMealPlan({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMealPlan? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMealPlan? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMealPlan>? update,
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
                 data == null ? null : _parserFn$Mutation$DeleteMealPlan(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMealPlan,
         parserFn: _parserFn$Mutation$DeleteMealPlan,
       );

  final OnMutationCompleted$Mutation$DeleteMealPlan? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteMealPlan =
    graphql.MultiSourceResult<Mutation$DeleteMealPlan> Function(
      Variables$Mutation$DeleteMealPlan, {
      Object? optimisticResult,
      Mutation$DeleteMealPlan? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteMealPlan =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteMealPlan,
      graphql.QueryResult<Mutation$DeleteMealPlan>?,
    );

class Mutation$DeleteMealPlan$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteMealPlan> {
  Mutation$DeleteMealPlan$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteMealPlan? options,
    required Builder$Mutation$DeleteMealPlan builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteMealPlan(),
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

class Mutation$DeleteMealPlan$deleteMealPlan {
  Mutation$DeleteMealPlan$deleteMealPlan({
    this.mealPlan,
    this.$__typename = 'deleteMealPlanPayload',
  });

  factory Mutation$DeleteMealPlan$deleteMealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$mealPlan = json['mealPlan'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMealPlan$deleteMealPlan(
      mealPlan: l$mealPlan == null
          ? null
          : Mutation$DeleteMealPlan$deleteMealPlan$mealPlan.fromJson(
              (l$mealPlan as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMealPlan$deleteMealPlan$mealPlan? mealPlan;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$mealPlan = mealPlan;
    _resultData['mealPlan'] = l$mealPlan?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$mealPlan = mealPlan;
    final l$$__typename = $__typename;
    return Object.hashAll([l$mealPlan, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMealPlan$deleteMealPlan ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$DeleteMealPlan$deleteMealPlan
    on Mutation$DeleteMealPlan$deleteMealPlan {
  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<
    Mutation$DeleteMealPlan$deleteMealPlan
  >
  get copyWith =>
      CopyWith$Mutation$DeleteMealPlan$deleteMealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<TRes> {
  factory CopyWith$Mutation$DeleteMealPlan$deleteMealPlan(
    Mutation$DeleteMealPlan$deleteMealPlan instance,
    TRes Function(Mutation$DeleteMealPlan$deleteMealPlan) then,
  ) = _CopyWithImpl$Mutation$DeleteMealPlan$deleteMealPlan;

  factory CopyWith$Mutation$DeleteMealPlan$deleteMealPlan.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMealPlan$deleteMealPlan;

  TRes call({
    Mutation$DeleteMealPlan$deleteMealPlan$mealPlan? mealPlan,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes> get mealPlan;
}

class _CopyWithImpl$Mutation$DeleteMealPlan$deleteMealPlan<TRes>
    implements CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<TRes> {
  _CopyWithImpl$Mutation$DeleteMealPlan$deleteMealPlan(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMealPlan$deleteMealPlan _instance;

  final TRes Function(Mutation$DeleteMealPlan$deleteMealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? mealPlan = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteMealPlan$deleteMealPlan(
      mealPlan: mealPlan == _undefined
          ? _instance.mealPlan
          : (mealPlan as Mutation$DeleteMealPlan$deleteMealPlan$mealPlan?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes> get mealPlan {
    final local$mealPlan = _instance.mealPlan;
    return local$mealPlan == null
        ? CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan.stub(
            _then(_instance),
          )
        : CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(
            local$mealPlan,
            (e) => call(mealPlan: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$DeleteMealPlan$deleteMealPlan<TRes>
    implements CopyWith$Mutation$DeleteMealPlan$deleteMealPlan<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMealPlan$deleteMealPlan(this._res);

  TRes _res;

  call({
    Mutation$DeleteMealPlan$deleteMealPlan$mealPlan? mealPlan,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes> get mealPlan =>
      CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan.stub(_res);
}

class Mutation$DeleteMealPlan$deleteMealPlan$mealPlan {
  Mutation$DeleteMealPlan$deleteMealPlan$mealPlan({
    required this.id,
    this.$__typename = 'MealPlan',
  });

  factory Mutation$DeleteMealPlan$deleteMealPlan$mealPlan.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(
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
    if (other is! Mutation$DeleteMealPlan$deleteMealPlan$mealPlan ||
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

extension UtilityExtension$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan
    on Mutation$DeleteMealPlan$deleteMealPlan$mealPlan {
  CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<
    Mutation$DeleteMealPlan$deleteMealPlan$mealPlan
  >
  get copyWith =>
      CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes> {
  factory CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(
    Mutation$DeleteMealPlan$deleteMealPlan$mealPlan instance,
    TRes Function(Mutation$DeleteMealPlan$deleteMealPlan$mealPlan) then,
  ) = _CopyWithImpl$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan;

  factory CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan;

  TRes call({String? id, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes>
    implements CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes> {
  _CopyWithImpl$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMealPlan$deleteMealPlan$mealPlan _instance;

  final TRes Function(Mutation$DeleteMealPlan$deleteMealPlan$mealPlan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(
          id: id == _undefined || id == null ? _instance.id : (id as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );
}

class _CopyWithStubImpl$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes>
    implements CopyWith$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMealPlan$deleteMealPlan$mealPlan(this._res);

  TRes _res;

  call({String? id, String? $__typename}) => _res;
}
