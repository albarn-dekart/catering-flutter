class Input$OrderFilter_createdAt {
  factory Input$OrderFilter_createdAt({
    String? before,
    String? strictly_before,
    String? after,
    String? strictly_after,
  }) => Input$OrderFilter_createdAt._({
    if (before != null) r'before': before,
    if (strictly_before != null) r'strictly_before': strictly_before,
    if (after != null) r'after': after,
    if (strictly_after != null) r'strictly_after': strictly_after,
  });

  Input$OrderFilter_createdAt._(this._$data);

  factory Input$OrderFilter_createdAt.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('before')) {
      final l$before = data['before'];
      result$data['before'] = (l$before as String?);
    }
    if (data.containsKey('strictly_before')) {
      final l$strictly_before = data['strictly_before'];
      result$data['strictly_before'] = (l$strictly_before as String?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('strictly_after')) {
      final l$strictly_after = data['strictly_after'];
      result$data['strictly_after'] = (l$strictly_after as String?);
    }
    return Input$OrderFilter_createdAt._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get before => (_$data['before'] as String?);

  String? get strictly_before => (_$data['strictly_before'] as String?);

  String? get after => (_$data['after'] as String?);

  String? get strictly_after => (_$data['strictly_after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('before')) {
      final l$before = before;
      result$data['before'] = l$before;
    }
    if (_$data.containsKey('strictly_before')) {
      final l$strictly_before = strictly_before;
      result$data['strictly_before'] = l$strictly_before;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('strictly_after')) {
      final l$strictly_after = strictly_after;
      result$data['strictly_after'] = l$strictly_after;
    }
    return result$data;
  }

  CopyWith$Input$OrderFilter_createdAt<Input$OrderFilter_createdAt>
  get copyWith => CopyWith$Input$OrderFilter_createdAt(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$OrderFilter_createdAt ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$before = before;
    final lOther$before = other.before;
    if (_$data.containsKey('before') != other._$data.containsKey('before')) {
      return false;
    }
    if (l$before != lOther$before) {
      return false;
    }
    final l$strictly_before = strictly_before;
    final lOther$strictly_before = other.strictly_before;
    if (_$data.containsKey('strictly_before') !=
        other._$data.containsKey('strictly_before')) {
      return false;
    }
    if (l$strictly_before != lOther$strictly_before) {
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
    final l$strictly_after = strictly_after;
    final lOther$strictly_after = other.strictly_after;
    if (_$data.containsKey('strictly_after') !=
        other._$data.containsKey('strictly_after')) {
      return false;
    }
    if (l$strictly_after != lOther$strictly_after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$before = before;
    final l$strictly_before = strictly_before;
    final l$after = after;
    final l$strictly_after = strictly_after;
    return Object.hashAll([
      _$data.containsKey('before') ? l$before : const {},
      _$data.containsKey('strictly_before') ? l$strictly_before : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('strictly_after') ? l$strictly_after : const {},
    ]);
  }
}

abstract class CopyWith$Input$OrderFilter_createdAt<TRes> {
  factory CopyWith$Input$OrderFilter_createdAt(
    Input$OrderFilter_createdAt instance,
    TRes Function(Input$OrderFilter_createdAt) then,
  ) = _CopyWithImpl$Input$OrderFilter_createdAt;

  factory CopyWith$Input$OrderFilter_createdAt.stub(TRes res) =
      _CopyWithStubImpl$Input$OrderFilter_createdAt;

  TRes call({
    String? before,
    String? strictly_before,
    String? after,
    String? strictly_after,
  });
}

class _CopyWithImpl$Input$OrderFilter_createdAt<TRes>
    implements CopyWith$Input$OrderFilter_createdAt<TRes> {
  _CopyWithImpl$Input$OrderFilter_createdAt(this._instance, this._then);

  final Input$OrderFilter_createdAt _instance;

  final TRes Function(Input$OrderFilter_createdAt) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? before = _undefined,
    Object? strictly_before = _undefined,
    Object? after = _undefined,
    Object? strictly_after = _undefined,
  }) => _then(
    Input$OrderFilter_createdAt._({
      ..._instance._$data,
      if (before != _undefined) 'before': (before as String?),
      if (strictly_before != _undefined)
        'strictly_before': (strictly_before as String?),
      if (after != _undefined) 'after': (after as String?),
      if (strictly_after != _undefined)
        'strictly_after': (strictly_after as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$OrderFilter_createdAt<TRes>
    implements CopyWith$Input$OrderFilter_createdAt<TRes> {
  _CopyWithStubImpl$Input$OrderFilter_createdAt(this._res);

  TRes _res;

  call({
    String? before,
    String? strictly_before,
    String? after,
    String? strictly_after,
  }) => _res;
}

class Input$MealFilter_price {
  factory Input$MealFilter_price({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealFilter_price._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealFilter_price._(this._$data);

  factory Input$MealFilter_price.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealFilter_price._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealFilter_price<Input$MealFilter_price> get copyWith =>
      CopyWith$Input$MealFilter_price(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealFilter_price || runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealFilter_price<TRes> {
  factory CopyWith$Input$MealFilter_price(
    Input$MealFilter_price instance,
    TRes Function(Input$MealFilter_price) then,
  ) = _CopyWithImpl$Input$MealFilter_price;

  factory CopyWith$Input$MealFilter_price.stub(TRes res) =
      _CopyWithStubImpl$Input$MealFilter_price;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealFilter_price<TRes>
    implements CopyWith$Input$MealFilter_price<TRes> {
  _CopyWithImpl$Input$MealFilter_price(this._instance, this._then);

  final Input$MealFilter_price _instance;

  final TRes Function(Input$MealFilter_price) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealFilter_price._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealFilter_price<TRes>
    implements CopyWith$Input$MealFilter_price<TRes> {
  _CopyWithStubImpl$Input$MealFilter_price(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealFilter_calories {
  factory Input$MealFilter_calories({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealFilter_calories._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealFilter_calories._(this._$data);

  factory Input$MealFilter_calories.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealFilter_calories._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealFilter_calories<Input$MealFilter_calories> get copyWith =>
      CopyWith$Input$MealFilter_calories(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealFilter_calories ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealFilter_calories<TRes> {
  factory CopyWith$Input$MealFilter_calories(
    Input$MealFilter_calories instance,
    TRes Function(Input$MealFilter_calories) then,
  ) = _CopyWithImpl$Input$MealFilter_calories;

  factory CopyWith$Input$MealFilter_calories.stub(TRes res) =
      _CopyWithStubImpl$Input$MealFilter_calories;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealFilter_calories<TRes>
    implements CopyWith$Input$MealFilter_calories<TRes> {
  _CopyWithImpl$Input$MealFilter_calories(this._instance, this._then);

  final Input$MealFilter_calories _instance;

  final TRes Function(Input$MealFilter_calories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealFilter_calories._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealFilter_calories<TRes>
    implements CopyWith$Input$MealFilter_calories<TRes> {
  _CopyWithStubImpl$Input$MealFilter_calories(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealFilter_protein {
  factory Input$MealFilter_protein({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealFilter_protein._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealFilter_protein._(this._$data);

  factory Input$MealFilter_protein.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealFilter_protein._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealFilter_protein<Input$MealFilter_protein> get copyWith =>
      CopyWith$Input$MealFilter_protein(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealFilter_protein ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealFilter_protein<TRes> {
  factory CopyWith$Input$MealFilter_protein(
    Input$MealFilter_protein instance,
    TRes Function(Input$MealFilter_protein) then,
  ) = _CopyWithImpl$Input$MealFilter_protein;

  factory CopyWith$Input$MealFilter_protein.stub(TRes res) =
      _CopyWithStubImpl$Input$MealFilter_protein;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealFilter_protein<TRes>
    implements CopyWith$Input$MealFilter_protein<TRes> {
  _CopyWithImpl$Input$MealFilter_protein(this._instance, this._then);

  final Input$MealFilter_protein _instance;

  final TRes Function(Input$MealFilter_protein) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealFilter_protein._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealFilter_protein<TRes>
    implements CopyWith$Input$MealFilter_protein<TRes> {
  _CopyWithStubImpl$Input$MealFilter_protein(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealFilter_fat {
  factory Input$MealFilter_fat({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealFilter_fat._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealFilter_fat._(this._$data);

  factory Input$MealFilter_fat.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealFilter_fat._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealFilter_fat<Input$MealFilter_fat> get copyWith =>
      CopyWith$Input$MealFilter_fat(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealFilter_fat || runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealFilter_fat<TRes> {
  factory CopyWith$Input$MealFilter_fat(
    Input$MealFilter_fat instance,
    TRes Function(Input$MealFilter_fat) then,
  ) = _CopyWithImpl$Input$MealFilter_fat;

  factory CopyWith$Input$MealFilter_fat.stub(TRes res) =
      _CopyWithStubImpl$Input$MealFilter_fat;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealFilter_fat<TRes>
    implements CopyWith$Input$MealFilter_fat<TRes> {
  _CopyWithImpl$Input$MealFilter_fat(this._instance, this._then);

  final Input$MealFilter_fat _instance;

  final TRes Function(Input$MealFilter_fat) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealFilter_fat._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealFilter_fat<TRes>
    implements CopyWith$Input$MealFilter_fat<TRes> {
  _CopyWithStubImpl$Input$MealFilter_fat(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealFilter_carbs {
  factory Input$MealFilter_carbs({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealFilter_carbs._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealFilter_carbs._(this._$data);

  factory Input$MealFilter_carbs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealFilter_carbs._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealFilter_carbs<Input$MealFilter_carbs> get copyWith =>
      CopyWith$Input$MealFilter_carbs(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealFilter_carbs || runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealFilter_carbs<TRes> {
  factory CopyWith$Input$MealFilter_carbs(
    Input$MealFilter_carbs instance,
    TRes Function(Input$MealFilter_carbs) then,
  ) = _CopyWithImpl$Input$MealFilter_carbs;

  factory CopyWith$Input$MealFilter_carbs.stub(TRes res) =
      _CopyWithStubImpl$Input$MealFilter_carbs;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealFilter_carbs<TRes>
    implements CopyWith$Input$MealFilter_carbs<TRes> {
  _CopyWithImpl$Input$MealFilter_carbs(this._instance, this._then);

  final Input$MealFilter_carbs _instance;

  final TRes Function(Input$MealFilter_carbs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealFilter_carbs._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealFilter_carbs<TRes>
    implements CopyWith$Input$MealFilter_carbs<TRes> {
  _CopyWithStubImpl$Input$MealFilter_carbs(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealPlanFilter_price {
  factory Input$MealPlanFilter_price({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealPlanFilter_price._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealPlanFilter_price._(this._$data);

  factory Input$MealPlanFilter_price.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealPlanFilter_price._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealPlanFilter_price<Input$MealPlanFilter_price>
  get copyWith => CopyWith$Input$MealPlanFilter_price(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealPlanFilter_price ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealPlanFilter_price<TRes> {
  factory CopyWith$Input$MealPlanFilter_price(
    Input$MealPlanFilter_price instance,
    TRes Function(Input$MealPlanFilter_price) then,
  ) = _CopyWithImpl$Input$MealPlanFilter_price;

  factory CopyWith$Input$MealPlanFilter_price.stub(TRes res) =
      _CopyWithStubImpl$Input$MealPlanFilter_price;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealPlanFilter_price<TRes>
    implements CopyWith$Input$MealPlanFilter_price<TRes> {
  _CopyWithImpl$Input$MealPlanFilter_price(this._instance, this._then);

  final Input$MealPlanFilter_price _instance;

  final TRes Function(Input$MealPlanFilter_price) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealPlanFilter_price._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealPlanFilter_price<TRes>
    implements CopyWith$Input$MealPlanFilter_price<TRes> {
  _CopyWithStubImpl$Input$MealPlanFilter_price(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealPlanFilter_calories {
  factory Input$MealPlanFilter_calories({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealPlanFilter_calories._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealPlanFilter_calories._(this._$data);

  factory Input$MealPlanFilter_calories.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealPlanFilter_calories._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealPlanFilter_calories<Input$MealPlanFilter_calories>
  get copyWith => CopyWith$Input$MealPlanFilter_calories(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealPlanFilter_calories ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealPlanFilter_calories<TRes> {
  factory CopyWith$Input$MealPlanFilter_calories(
    Input$MealPlanFilter_calories instance,
    TRes Function(Input$MealPlanFilter_calories) then,
  ) = _CopyWithImpl$Input$MealPlanFilter_calories;

  factory CopyWith$Input$MealPlanFilter_calories.stub(TRes res) =
      _CopyWithStubImpl$Input$MealPlanFilter_calories;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealPlanFilter_calories<TRes>
    implements CopyWith$Input$MealPlanFilter_calories<TRes> {
  _CopyWithImpl$Input$MealPlanFilter_calories(this._instance, this._then);

  final Input$MealPlanFilter_calories _instance;

  final TRes Function(Input$MealPlanFilter_calories) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealPlanFilter_calories._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealPlanFilter_calories<TRes>
    implements CopyWith$Input$MealPlanFilter_calories<TRes> {
  _CopyWithStubImpl$Input$MealPlanFilter_calories(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealPlanFilter_protein {
  factory Input$MealPlanFilter_protein({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealPlanFilter_protein._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealPlanFilter_protein._(this._$data);

  factory Input$MealPlanFilter_protein.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealPlanFilter_protein._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealPlanFilter_protein<Input$MealPlanFilter_protein>
  get copyWith => CopyWith$Input$MealPlanFilter_protein(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealPlanFilter_protein ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealPlanFilter_protein<TRes> {
  factory CopyWith$Input$MealPlanFilter_protein(
    Input$MealPlanFilter_protein instance,
    TRes Function(Input$MealPlanFilter_protein) then,
  ) = _CopyWithImpl$Input$MealPlanFilter_protein;

  factory CopyWith$Input$MealPlanFilter_protein.stub(TRes res) =
      _CopyWithStubImpl$Input$MealPlanFilter_protein;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealPlanFilter_protein<TRes>
    implements CopyWith$Input$MealPlanFilter_protein<TRes> {
  _CopyWithImpl$Input$MealPlanFilter_protein(this._instance, this._then);

  final Input$MealPlanFilter_protein _instance;

  final TRes Function(Input$MealPlanFilter_protein) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealPlanFilter_protein._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealPlanFilter_protein<TRes>
    implements CopyWith$Input$MealPlanFilter_protein<TRes> {
  _CopyWithStubImpl$Input$MealPlanFilter_protein(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealPlanFilter_fat {
  factory Input$MealPlanFilter_fat({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealPlanFilter_fat._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealPlanFilter_fat._(this._$data);

  factory Input$MealPlanFilter_fat.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealPlanFilter_fat._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealPlanFilter_fat<Input$MealPlanFilter_fat> get copyWith =>
      CopyWith$Input$MealPlanFilter_fat(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealPlanFilter_fat ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealPlanFilter_fat<TRes> {
  factory CopyWith$Input$MealPlanFilter_fat(
    Input$MealPlanFilter_fat instance,
    TRes Function(Input$MealPlanFilter_fat) then,
  ) = _CopyWithImpl$Input$MealPlanFilter_fat;

  factory CopyWith$Input$MealPlanFilter_fat.stub(TRes res) =
      _CopyWithStubImpl$Input$MealPlanFilter_fat;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealPlanFilter_fat<TRes>
    implements CopyWith$Input$MealPlanFilter_fat<TRes> {
  _CopyWithImpl$Input$MealPlanFilter_fat(this._instance, this._then);

  final Input$MealPlanFilter_fat _instance;

  final TRes Function(Input$MealPlanFilter_fat) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealPlanFilter_fat._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealPlanFilter_fat<TRes>
    implements CopyWith$Input$MealPlanFilter_fat<TRes> {
  _CopyWithStubImpl$Input$MealPlanFilter_fat(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$MealPlanFilter_carbs {
  factory Input$MealPlanFilter_carbs({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  }) => Input$MealPlanFilter_carbs._({
    if (between != null) r'between': between,
    if (gt != null) r'gt': gt,
    if (gte != null) r'gte': gte,
    if (lt != null) r'lt': lt,
    if (lte != null) r'lte': lte,
  });

  Input$MealPlanFilter_carbs._(this._$data);

  factory Input$MealPlanFilter_carbs.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('between')) {
      final l$between = data['between'];
      result$data['between'] = (l$between as String?);
    }
    if (data.containsKey('gt')) {
      final l$gt = data['gt'];
      result$data['gt'] = (l$gt as String?);
    }
    if (data.containsKey('gte')) {
      final l$gte = data['gte'];
      result$data['gte'] = (l$gte as String?);
    }
    if (data.containsKey('lt')) {
      final l$lt = data['lt'];
      result$data['lt'] = (l$lt as String?);
    }
    if (data.containsKey('lte')) {
      final l$lte = data['lte'];
      result$data['lte'] = (l$lte as String?);
    }
    return Input$MealPlanFilter_carbs._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get between => (_$data['between'] as String?);

  String? get gt => (_$data['gt'] as String?);

  String? get gte => (_$data['gte'] as String?);

  String? get lt => (_$data['lt'] as String?);

  String? get lte => (_$data['lte'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('between')) {
      final l$between = between;
      result$data['between'] = l$between;
    }
    if (_$data.containsKey('gt')) {
      final l$gt = gt;
      result$data['gt'] = l$gt;
    }
    if (_$data.containsKey('gte')) {
      final l$gte = gte;
      result$data['gte'] = l$gte;
    }
    if (_$data.containsKey('lt')) {
      final l$lt = lt;
      result$data['lt'] = l$lt;
    }
    if (_$data.containsKey('lte')) {
      final l$lte = lte;
      result$data['lte'] = l$lte;
    }
    return result$data;
  }

  CopyWith$Input$MealPlanFilter_carbs<Input$MealPlanFilter_carbs>
  get copyWith => CopyWith$Input$MealPlanFilter_carbs(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$MealPlanFilter_carbs ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$between = between;
    final lOther$between = other.between;
    if (_$data.containsKey('between') != other._$data.containsKey('between')) {
      return false;
    }
    if (l$between != lOther$between) {
      return false;
    }
    final l$gt = gt;
    final lOther$gt = other.gt;
    if (_$data.containsKey('gt') != other._$data.containsKey('gt')) {
      return false;
    }
    if (l$gt != lOther$gt) {
      return false;
    }
    final l$gte = gte;
    final lOther$gte = other.gte;
    if (_$data.containsKey('gte') != other._$data.containsKey('gte')) {
      return false;
    }
    if (l$gte != lOther$gte) {
      return false;
    }
    final l$lt = lt;
    final lOther$lt = other.lt;
    if (_$data.containsKey('lt') != other._$data.containsKey('lt')) {
      return false;
    }
    if (l$lt != lOther$lt) {
      return false;
    }
    final l$lte = lte;
    final lOther$lte = other.lte;
    if (_$data.containsKey('lte') != other._$data.containsKey('lte')) {
      return false;
    }
    if (l$lte != lOther$lte) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$between = between;
    final l$gt = gt;
    final l$gte = gte;
    final l$lt = lt;
    final l$lte = lte;
    return Object.hashAll([
      _$data.containsKey('between') ? l$between : const {},
      _$data.containsKey('gt') ? l$gt : const {},
      _$data.containsKey('gte') ? l$gte : const {},
      _$data.containsKey('lt') ? l$lt : const {},
      _$data.containsKey('lte') ? l$lte : const {},
    ]);
  }
}

abstract class CopyWith$Input$MealPlanFilter_carbs<TRes> {
  factory CopyWith$Input$MealPlanFilter_carbs(
    Input$MealPlanFilter_carbs instance,
    TRes Function(Input$MealPlanFilter_carbs) then,
  ) = _CopyWithImpl$Input$MealPlanFilter_carbs;

  factory CopyWith$Input$MealPlanFilter_carbs.stub(TRes res) =
      _CopyWithStubImpl$Input$MealPlanFilter_carbs;

  TRes call({
    String? between,
    String? gt,
    String? gte,
    String? lt,
    String? lte,
  });
}

class _CopyWithImpl$Input$MealPlanFilter_carbs<TRes>
    implements CopyWith$Input$MealPlanFilter_carbs<TRes> {
  _CopyWithImpl$Input$MealPlanFilter_carbs(this._instance, this._then);

  final Input$MealPlanFilter_carbs _instance;

  final TRes Function(Input$MealPlanFilter_carbs) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? between = _undefined,
    Object? gt = _undefined,
    Object? gte = _undefined,
    Object? lt = _undefined,
    Object? lte = _undefined,
  }) => _then(
    Input$MealPlanFilter_carbs._({
      ..._instance._$data,
      if (between != _undefined) 'between': (between as String?),
      if (gt != _undefined) 'gt': (gt as String?),
      if (gte != _undefined) 'gte': (gte as String?),
      if (lt != _undefined) 'lt': (lt as String?),
      if (lte != _undefined) 'lte': (lte as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$MealPlanFilter_carbs<TRes>
    implements CopyWith$Input$MealPlanFilter_carbs<TRes> {
  _CopyWithStubImpl$Input$MealPlanFilter_carbs(this._res);

  TRes _res;

  call({String? between, String? gt, String? gte, String? lt, String? lte}) =>
      _res;
}

class Input$DeliveryFilter_deliveryDate {
  factory Input$DeliveryFilter_deliveryDate({
    String? before,
    String? strictly_before,
    String? after,
    String? strictly_after,
  }) => Input$DeliveryFilter_deliveryDate._({
    if (before != null) r'before': before,
    if (strictly_before != null) r'strictly_before': strictly_before,
    if (after != null) r'after': after,
    if (strictly_after != null) r'strictly_after': strictly_after,
  });

  Input$DeliveryFilter_deliveryDate._(this._$data);

  factory Input$DeliveryFilter_deliveryDate.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('before')) {
      final l$before = data['before'];
      result$data['before'] = (l$before as String?);
    }
    if (data.containsKey('strictly_before')) {
      final l$strictly_before = data['strictly_before'];
      result$data['strictly_before'] = (l$strictly_before as String?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('strictly_after')) {
      final l$strictly_after = data['strictly_after'];
      result$data['strictly_after'] = (l$strictly_after as String?);
    }
    return Input$DeliveryFilter_deliveryDate._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get before => (_$data['before'] as String?);

  String? get strictly_before => (_$data['strictly_before'] as String?);

  String? get after => (_$data['after'] as String?);

  String? get strictly_after => (_$data['strictly_after'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('before')) {
      final l$before = before;
      result$data['before'] = l$before;
    }
    if (_$data.containsKey('strictly_before')) {
      final l$strictly_before = strictly_before;
      result$data['strictly_before'] = l$strictly_before;
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('strictly_after')) {
      final l$strictly_after = strictly_after;
      result$data['strictly_after'] = l$strictly_after;
    }
    return result$data;
  }

  CopyWith$Input$DeliveryFilter_deliveryDate<Input$DeliveryFilter_deliveryDate>
  get copyWith => CopyWith$Input$DeliveryFilter_deliveryDate(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DeliveryFilter_deliveryDate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$before = before;
    final lOther$before = other.before;
    if (_$data.containsKey('before') != other._$data.containsKey('before')) {
      return false;
    }
    if (l$before != lOther$before) {
      return false;
    }
    final l$strictly_before = strictly_before;
    final lOther$strictly_before = other.strictly_before;
    if (_$data.containsKey('strictly_before') !=
        other._$data.containsKey('strictly_before')) {
      return false;
    }
    if (l$strictly_before != lOther$strictly_before) {
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
    final l$strictly_after = strictly_after;
    final lOther$strictly_after = other.strictly_after;
    if (_$data.containsKey('strictly_after') !=
        other._$data.containsKey('strictly_after')) {
      return false;
    }
    if (l$strictly_after != lOther$strictly_after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$before = before;
    final l$strictly_before = strictly_before;
    final l$after = after;
    final l$strictly_after = strictly_after;
    return Object.hashAll([
      _$data.containsKey('before') ? l$before : const {},
      _$data.containsKey('strictly_before') ? l$strictly_before : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('strictly_after') ? l$strictly_after : const {},
    ]);
  }
}

abstract class CopyWith$Input$DeliveryFilter_deliveryDate<TRes> {
  factory CopyWith$Input$DeliveryFilter_deliveryDate(
    Input$DeliveryFilter_deliveryDate instance,
    TRes Function(Input$DeliveryFilter_deliveryDate) then,
  ) = _CopyWithImpl$Input$DeliveryFilter_deliveryDate;

  factory CopyWith$Input$DeliveryFilter_deliveryDate.stub(TRes res) =
      _CopyWithStubImpl$Input$DeliveryFilter_deliveryDate;

  TRes call({
    String? before,
    String? strictly_before,
    String? after,
    String? strictly_after,
  });
}

class _CopyWithImpl$Input$DeliveryFilter_deliveryDate<TRes>
    implements CopyWith$Input$DeliveryFilter_deliveryDate<TRes> {
  _CopyWithImpl$Input$DeliveryFilter_deliveryDate(this._instance, this._then);

  final Input$DeliveryFilter_deliveryDate _instance;

  final TRes Function(Input$DeliveryFilter_deliveryDate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? before = _undefined,
    Object? strictly_before = _undefined,
    Object? after = _undefined,
    Object? strictly_after = _undefined,
  }) => _then(
    Input$DeliveryFilter_deliveryDate._({
      ..._instance._$data,
      if (before != _undefined) 'before': (before as String?),
      if (strictly_before != _undefined)
        'strictly_before': (strictly_before as String?),
      if (after != _undefined) 'after': (after as String?),
      if (strictly_after != _undefined)
        'strictly_after': (strictly_after as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$DeliveryFilter_deliveryDate<TRes>
    implements CopyWith$Input$DeliveryFilter_deliveryDate<TRes> {
  _CopyWithStubImpl$Input$DeliveryFilter_deliveryDate(this._res);

  TRes _res;

  call({
    String? before,
    String? strictly_before,
    String? after,
    String? strictly_after,
  }) => _res;
}

class Input$DeliveryFilter_order {
  factory Input$DeliveryFilter_order({String? deliveryDate, String? id}) =>
      Input$DeliveryFilter_order._({
        if (deliveryDate != null) r'deliveryDate': deliveryDate,
        if (id != null) r'id': id,
      });

  Input$DeliveryFilter_order._(this._$data);

  factory Input$DeliveryFilter_order.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as String?);
    }
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    return Input$DeliveryFilter_order._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get deliveryDate => (_$data['deliveryDate'] as String?);

  String? get id => (_$data['id'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate;
    }
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    return result$data;
  }

  CopyWith$Input$DeliveryFilter_order<Input$DeliveryFilter_order>
  get copyWith => CopyWith$Input$DeliveryFilter_order(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$DeliveryFilter_order ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$deliveryDate = deliveryDate;
    final l$id = id;
    return Object.hashAll([
      _$data.containsKey('deliveryDate') ? l$deliveryDate : const {},
      _$data.containsKey('id') ? l$id : const {},
    ]);
  }
}

abstract class CopyWith$Input$DeliveryFilter_order<TRes> {
  factory CopyWith$Input$DeliveryFilter_order(
    Input$DeliveryFilter_order instance,
    TRes Function(Input$DeliveryFilter_order) then,
  ) = _CopyWithImpl$Input$DeliveryFilter_order;

  factory CopyWith$Input$DeliveryFilter_order.stub(TRes res) =
      _CopyWithStubImpl$Input$DeliveryFilter_order;

  TRes call({String? deliveryDate, String? id});
}

class _CopyWithImpl$Input$DeliveryFilter_order<TRes>
    implements CopyWith$Input$DeliveryFilter_order<TRes> {
  _CopyWithImpl$Input$DeliveryFilter_order(this._instance, this._then);

  final Input$DeliveryFilter_order _instance;

  final TRes Function(Input$DeliveryFilter_order) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? deliveryDate = _undefined, Object? id = _undefined}) =>
      _then(
        Input$DeliveryFilter_order._({
          ..._instance._$data,
          if (deliveryDate != _undefined)
            'deliveryDate': (deliveryDate as String?),
          if (id != _undefined) 'id': (id as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$DeliveryFilter_order<TRes>
    implements CopyWith$Input$DeliveryFilter_order<TRes> {
  _CopyWithStubImpl$Input$DeliveryFilter_order(this._res);

  TRes _res;

  call({String? deliveryDate, String? id}) => _res;
}

class Input$createPaymentInput {
  factory Input$createPaymentInput({
    String? $_id,
    String? order,
    String? sessionId,
    String? url,
    String? clientMutationId,
  }) => Input$createPaymentInput._({
    if ($_id != null) r'_id': $_id,
    if (order != null) r'order': order,
    if (sessionId != null) r'sessionId': sessionId,
    if (url != null) r'url': url,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createPaymentInput._(this._$data);

  factory Input$createPaymentInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_id')) {
      final l$$_id = data['_id'];
      result$data['_id'] = (l$$_id as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('sessionId')) {
      final l$sessionId = data['sessionId'];
      result$data['sessionId'] = (l$sessionId as String?);
    }
    if (data.containsKey('url')) {
      final l$url = data['url'];
      result$data['url'] = (l$url as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createPaymentInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get $_id => (_$data['_id'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get sessionId => (_$data['sessionId'] as String?);

  String? get url => (_$data['url'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_id')) {
      final l$$_id = $_id;
      result$data['_id'] = l$$_id;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('sessionId')) {
      final l$sessionId = sessionId;
      result$data['sessionId'] = l$sessionId;
    }
    if (_$data.containsKey('url')) {
      final l$url = url;
      result$data['url'] = l$url;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createPaymentInput<Input$createPaymentInput> get copyWith =>
      CopyWith$Input$createPaymentInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createPaymentInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_id = $_id;
    final lOther$$_id = other.$_id;
    if (_$data.containsKey('_id') != other._$data.containsKey('_id')) {
      return false;
    }
    if (l$$_id != lOther$$_id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$sessionId = sessionId;
    final lOther$sessionId = other.sessionId;
    if (_$data.containsKey('sessionId') !=
        other._$data.containsKey('sessionId')) {
      return false;
    }
    if (l$sessionId != lOther$sessionId) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (_$data.containsKey('url') != other._$data.containsKey('url')) {
      return false;
    }
    if (l$url != lOther$url) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_id = $_id;
    final l$order = order;
    final l$sessionId = sessionId;
    final l$url = url;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('_id') ? l$$_id : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('sessionId') ? l$sessionId : const {},
      _$data.containsKey('url') ? l$url : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createPaymentInput<TRes> {
  factory CopyWith$Input$createPaymentInput(
    Input$createPaymentInput instance,
    TRes Function(Input$createPaymentInput) then,
  ) = _CopyWithImpl$Input$createPaymentInput;

  factory CopyWith$Input$createPaymentInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createPaymentInput;

  TRes call({
    String? $_id,
    String? order,
    String? sessionId,
    String? url,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createPaymentInput<TRes>
    implements CopyWith$Input$createPaymentInput<TRes> {
  _CopyWithImpl$Input$createPaymentInput(this._instance, this._then);

  final Input$createPaymentInput _instance;

  final TRes Function(Input$createPaymentInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_id = _undefined,
    Object? order = _undefined,
    Object? sessionId = _undefined,
    Object? url = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createPaymentInput._({
      ..._instance._$data,
      if ($_id != _undefined) '_id': ($_id as String?),
      if (order != _undefined) 'order': (order as String?),
      if (sessionId != _undefined) 'sessionId': (sessionId as String?),
      if (url != _undefined) 'url': (url as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createPaymentInput<TRes>
    implements CopyWith$Input$createPaymentInput<TRes> {
  _CopyWithStubImpl$Input$createPaymentInput(this._res);

  TRes _res;

  call({
    String? $_id,
    String? order,
    String? sessionId,
    String? url,
    String? clientMutationId,
  }) => _res;
}

class Input$createAddressInput {
  factory Input$createAddressInput({
    required String user,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String street,
    String? apartment,
    required String city,
    required String zipCode,
    required bool isDefault,
    String? clientMutationId,
  }) => Input$createAddressInput._({
    r'user': user,
    r'firstName': firstName,
    r'lastName': lastName,
    r'phoneNumber': phoneNumber,
    r'street': street,
    if (apartment != null) r'apartment': apartment,
    r'city': city,
    r'zipCode': zipCode,
    r'isDefault': isDefault,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createAddressInput._(this._$data);

  factory Input$createAddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user = data['user'];
    result$data['user'] = (l$user as String);
    final l$firstName = data['firstName'];
    result$data['firstName'] = (l$firstName as String);
    final l$lastName = data['lastName'];
    result$data['lastName'] = (l$lastName as String);
    final l$phoneNumber = data['phoneNumber'];
    result$data['phoneNumber'] = (l$phoneNumber as String);
    final l$street = data['street'];
    result$data['street'] = (l$street as String);
    if (data.containsKey('apartment')) {
      final l$apartment = data['apartment'];
      result$data['apartment'] = (l$apartment as String?);
    }
    final l$city = data['city'];
    result$data['city'] = (l$city as String);
    final l$zipCode = data['zipCode'];
    result$data['zipCode'] = (l$zipCode as String);
    final l$isDefault = data['isDefault'];
    result$data['isDefault'] = (l$isDefault as bool);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createAddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user => (_$data['user'] as String);

  String get firstName => (_$data['firstName'] as String);

  String get lastName => (_$data['lastName'] as String);

  String get phoneNumber => (_$data['phoneNumber'] as String);

  String get street => (_$data['street'] as String);

  String? get apartment => (_$data['apartment'] as String?);

  String get city => (_$data['city'] as String);

  String get zipCode => (_$data['zipCode'] as String);

  bool get isDefault => (_$data['isDefault'] as bool);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user = user;
    result$data['user'] = l$user;
    final l$firstName = firstName;
    result$data['firstName'] = l$firstName;
    final l$lastName = lastName;
    result$data['lastName'] = l$lastName;
    final l$phoneNumber = phoneNumber;
    result$data['phoneNumber'] = l$phoneNumber;
    final l$street = street;
    result$data['street'] = l$street;
    if (_$data.containsKey('apartment')) {
      final l$apartment = apartment;
      result$data['apartment'] = l$apartment;
    }
    final l$city = city;
    result$data['city'] = l$city;
    final l$zipCode = zipCode;
    result$data['zipCode'] = l$zipCode;
    final l$isDefault = isDefault;
    result$data['isDefault'] = l$isDefault;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createAddressInput<Input$createAddressInput> get copyWith =>
      CopyWith$Input$createAddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createAddressInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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
    if (_$data.containsKey('apartment') !=
        other._$data.containsKey('apartment')) {
      return false;
    }
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
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user = user;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$user,
      l$firstName,
      l$lastName,
      l$phoneNumber,
      l$street,
      _$data.containsKey('apartment') ? l$apartment : const {},
      l$city,
      l$zipCode,
      l$isDefault,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createAddressInput<TRes> {
  factory CopyWith$Input$createAddressInput(
    Input$createAddressInput instance,
    TRes Function(Input$createAddressInput) then,
  ) = _CopyWithImpl$Input$createAddressInput;

  factory CopyWith$Input$createAddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createAddressInput;

  TRes call({
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createAddressInput<TRes>
    implements CopyWith$Input$createAddressInput<TRes> {
  _CopyWithImpl$Input$createAddressInput(this._instance, this._then);

  final Input$createAddressInput _instance;

  final TRes Function(Input$createAddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createAddressInput._({
      ..._instance._$data,
      if (user != _undefined && user != null) 'user': (user as String),
      if (firstName != _undefined && firstName != null)
        'firstName': (firstName as String),
      if (lastName != _undefined && lastName != null)
        'lastName': (lastName as String),
      if (phoneNumber != _undefined && phoneNumber != null)
        'phoneNumber': (phoneNumber as String),
      if (street != _undefined && street != null) 'street': (street as String),
      if (apartment != _undefined) 'apartment': (apartment as String?),
      if (city != _undefined && city != null) 'city': (city as String),
      if (zipCode != _undefined && zipCode != null)
        'zipCode': (zipCode as String),
      if (isDefault != _undefined && isDefault != null)
        'isDefault': (isDefault as bool),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createAddressInput<TRes>
    implements CopyWith$Input$createAddressInput<TRes> {
  _CopyWithStubImpl$Input$createAddressInput(this._res);

  TRes _res;

  call({
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  }) => _res;
}

class Input$updateAddressInput {
  factory Input$updateAddressInput({
    required String id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  }) => Input$updateAddressInput._({
    r'id': id,
    if (user != null) r'user': user,
    if (firstName != null) r'firstName': firstName,
    if (lastName != null) r'lastName': lastName,
    if (phoneNumber != null) r'phoneNumber': phoneNumber,
    if (street != null) r'street': street,
    if (apartment != null) r'apartment': apartment,
    if (city != null) r'city': city,
    if (zipCode != null) r'zipCode': zipCode,
    if (isDefault != null) r'isDefault': isDefault,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateAddressInput._(this._$data);

  factory Input$updateAddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('user')) {
      final l$user = data['user'];
      result$data['user'] = (l$user as String?);
    }
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    if (data.containsKey('street')) {
      final l$street = data['street'];
      result$data['street'] = (l$street as String?);
    }
    if (data.containsKey('apartment')) {
      final l$apartment = data['apartment'];
      result$data['apartment'] = (l$apartment as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('zipCode')) {
      final l$zipCode = data['zipCode'];
      result$data['zipCode'] = (l$zipCode as String?);
    }
    if (data.containsKey('isDefault')) {
      final l$isDefault = data['isDefault'];
      result$data['isDefault'] = (l$isDefault as bool?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateAddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get user => (_$data['user'] as String?);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  String? get street => (_$data['street'] as String?);

  String? get apartment => (_$data['apartment'] as String?);

  String? get city => (_$data['city'] as String?);

  String? get zipCode => (_$data['zipCode'] as String?);

  bool? get isDefault => (_$data['isDefault'] as bool?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('user')) {
      final l$user = user;
      result$data['user'] = l$user;
    }
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    if (_$data.containsKey('street')) {
      final l$street = street;
      result$data['street'] = l$street;
    }
    if (_$data.containsKey('apartment')) {
      final l$apartment = apartment;
      result$data['apartment'] = l$apartment;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('zipCode')) {
      final l$zipCode = zipCode;
      result$data['zipCode'] = l$zipCode;
    }
    if (_$data.containsKey('isDefault')) {
      final l$isDefault = isDefault;
      result$data['isDefault'] = l$isDefault;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateAddressInput<Input$updateAddressInput> get copyWith =>
      CopyWith$Input$updateAddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateAddressInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$user = user;
    final lOther$user = other.user;
    if (_$data.containsKey('user') != other._$data.containsKey('user')) {
      return false;
    }
    if (l$user != lOther$user) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (_$data.containsKey('street') != other._$data.containsKey('street')) {
      return false;
    }
    if (l$street != lOther$street) {
      return false;
    }
    final l$apartment = apartment;
    final lOther$apartment = other.apartment;
    if (_$data.containsKey('apartment') !=
        other._$data.containsKey('apartment')) {
      return false;
    }
    if (l$apartment != lOther$apartment) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$zipCode = zipCode;
    final lOther$zipCode = other.zipCode;
    if (_$data.containsKey('zipCode') != other._$data.containsKey('zipCode')) {
      return false;
    }
    if (l$zipCode != lOther$zipCode) {
      return false;
    }
    final l$isDefault = isDefault;
    final lOther$isDefault = other.isDefault;
    if (_$data.containsKey('isDefault') !=
        other._$data.containsKey('isDefault')) {
      return false;
    }
    if (l$isDefault != lOther$isDefault) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$user = user;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$phoneNumber = phoneNumber;
    final l$street = street;
    final l$apartment = apartment;
    final l$city = city;
    final l$zipCode = zipCode;
    final l$isDefault = isDefault;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('user') ? l$user : const {},
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      _$data.containsKey('street') ? l$street : const {},
      _$data.containsKey('apartment') ? l$apartment : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('zipCode') ? l$zipCode : const {},
      _$data.containsKey('isDefault') ? l$isDefault : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateAddressInput<TRes> {
  factory CopyWith$Input$updateAddressInput(
    Input$updateAddressInput instance,
    TRes Function(Input$updateAddressInput) then,
  ) = _CopyWithImpl$Input$updateAddressInput;

  factory CopyWith$Input$updateAddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateAddressInput;

  TRes call({
    String? id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateAddressInput<TRes>
    implements CopyWith$Input$updateAddressInput<TRes> {
  _CopyWithImpl$Input$updateAddressInput(this._instance, this._then);

  final Input$updateAddressInput _instance;

  final TRes Function(Input$updateAddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? user = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? phoneNumber = _undefined,
    Object? street = _undefined,
    Object? apartment = _undefined,
    Object? city = _undefined,
    Object? zipCode = _undefined,
    Object? isDefault = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateAddressInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (user != _undefined) 'user': (user as String?),
      if (firstName != _undefined) 'firstName': (firstName as String?),
      if (lastName != _undefined) 'lastName': (lastName as String?),
      if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
      if (street != _undefined) 'street': (street as String?),
      if (apartment != _undefined) 'apartment': (apartment as String?),
      if (city != _undefined) 'city': (city as String?),
      if (zipCode != _undefined) 'zipCode': (zipCode as String?),
      if (isDefault != _undefined) 'isDefault': (isDefault as bool?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateAddressInput<TRes>
    implements CopyWith$Input$updateAddressInput<TRes> {
  _CopyWithStubImpl$Input$updateAddressInput(this._res);

  TRes _res;

  call({
    String? id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? street,
    String? apartment,
    String? city,
    String? zipCode,
    bool? isDefault,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteAddressInput {
  factory Input$deleteAddressInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteAddressInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteAddressInput._(this._$data);

  factory Input$deleteAddressInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteAddressInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteAddressInput<Input$deleteAddressInput> get copyWith =>
      CopyWith$Input$deleteAddressInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteAddressInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteAddressInput<TRes> {
  factory CopyWith$Input$deleteAddressInput(
    Input$deleteAddressInput instance,
    TRes Function(Input$deleteAddressInput) then,
  ) = _CopyWithImpl$Input$deleteAddressInput;

  factory CopyWith$Input$deleteAddressInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteAddressInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteAddressInput<TRes>
    implements CopyWith$Input$deleteAddressInput<TRes> {
  _CopyWithImpl$Input$deleteAddressInput(this._instance, this._then);

  final Input$deleteAddressInput _instance;

  final TRes Function(Input$deleteAddressInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteAddressInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteAddressInput<TRes>
    implements CopyWith$Input$deleteAddressInput<TRes> {
  _CopyWithStubImpl$Input$deleteAddressInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$updateDeliveryInput {
  factory Input$updateDeliveryInput({
    required String id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  }) => Input$updateDeliveryInput._({
    r'id': id,
    if (courier != null) r'courier': courier,
    if (status != null) r'status': status,
    if (deliveryDate != null) r'deliveryDate': deliveryDate,
    if (order != null) r'order': order,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateDeliveryInput._(this._$data);

  factory Input$updateDeliveryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('courier')) {
      final l$courier = data['courier'];
      result$data['courier'] = (l$courier as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$DeliveryStatus((l$status as String));
    }
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateDeliveryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get courier => (_$data['courier'] as String?);

  Enum$DeliveryStatus? get status => (_$data['status'] as Enum$DeliveryStatus?);

  String? get deliveryDate => (_$data['deliveryDate'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('courier')) {
      final l$courier = courier;
      result$data['courier'] = l$courier;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$DeliveryStatus(l$status);
    }
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateDeliveryInput<Input$updateDeliveryInput> get copyWith =>
      CopyWith$Input$updateDeliveryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateDeliveryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$courier = courier;
    final lOther$courier = other.courier;
    if (_$data.containsKey('courier') != other._$data.containsKey('courier')) {
      return false;
    }
    if (l$courier != lOther$courier) {
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
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$courier = courier;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$order = order;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('courier') ? l$courier : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('deliveryDate') ? l$deliveryDate : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateDeliveryInput<TRes> {
  factory CopyWith$Input$updateDeliveryInput(
    Input$updateDeliveryInput instance,
    TRes Function(Input$updateDeliveryInput) then,
  ) = _CopyWithImpl$Input$updateDeliveryInput;

  factory CopyWith$Input$updateDeliveryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateDeliveryInput;

  TRes call({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateDeliveryInput<TRes>
    implements CopyWith$Input$updateDeliveryInput<TRes> {
  _CopyWithImpl$Input$updateDeliveryInput(this._instance, this._then);

  final Input$updateDeliveryInput _instance;

  final TRes Function(Input$updateDeliveryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? courier = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? order = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateDeliveryInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (courier != _undefined) 'courier': (courier as String?),
      if (status != _undefined) 'status': (status as Enum$DeliveryStatus?),
      if (deliveryDate != _undefined) 'deliveryDate': (deliveryDate as String?),
      if (order != _undefined) 'order': (order as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateDeliveryInput<TRes>
    implements CopyWith$Input$updateDeliveryInput<TRes> {
  _CopyWithStubImpl$Input$updateDeliveryInput(this._res);

  TRes _res;

  call({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteDeliveryInput {
  factory Input$deleteDeliveryInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteDeliveryInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteDeliveryInput._(this._$data);

  factory Input$deleteDeliveryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteDeliveryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteDeliveryInput<Input$deleteDeliveryInput> get copyWith =>
      CopyWith$Input$deleteDeliveryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteDeliveryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteDeliveryInput<TRes> {
  factory CopyWith$Input$deleteDeliveryInput(
    Input$deleteDeliveryInput instance,
    TRes Function(Input$deleteDeliveryInput) then,
  ) = _CopyWithImpl$Input$deleteDeliveryInput;

  factory CopyWith$Input$deleteDeliveryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteDeliveryInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteDeliveryInput<TRes>
    implements CopyWith$Input$deleteDeliveryInput<TRes> {
  _CopyWithImpl$Input$deleteDeliveryInput(this._instance, this._then);

  final Input$deleteDeliveryInput _instance;

  final TRes Function(Input$deleteDeliveryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteDeliveryInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteDeliveryInput<TRes>
    implements CopyWith$Input$deleteDeliveryInput<TRes> {
  _CopyWithStubImpl$Input$deleteDeliveryInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createDeliveryInput {
  factory Input$createDeliveryInput({
    String? courier,
    required Enum$DeliveryStatus status,
    required String deliveryDate,
    String? order,
    String? clientMutationId,
  }) => Input$createDeliveryInput._({
    if (courier != null) r'courier': courier,
    r'status': status,
    r'deliveryDate': deliveryDate,
    if (order != null) r'order': order,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createDeliveryInput._(this._$data);

  factory Input$createDeliveryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('courier')) {
      final l$courier = data['courier'];
      result$data['courier'] = (l$courier as String?);
    }
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$DeliveryStatus((l$status as String));
    final l$deliveryDate = data['deliveryDate'];
    result$data['deliveryDate'] = (l$deliveryDate as String);
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createDeliveryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get courier => (_$data['courier'] as String?);

  Enum$DeliveryStatus get status => (_$data['status'] as Enum$DeliveryStatus);

  String get deliveryDate => (_$data['deliveryDate'] as String);

  String? get order => (_$data['order'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('courier')) {
      final l$courier = courier;
      result$data['courier'] = l$courier;
    }
    final l$status = status;
    result$data['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    result$data['deliveryDate'] = l$deliveryDate;
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createDeliveryInput<Input$createDeliveryInput> get copyWith =>
      CopyWith$Input$createDeliveryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createDeliveryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$courier = courier;
    final lOther$courier = other.courier;
    if (_$data.containsKey('courier') != other._$data.containsKey('courier')) {
      return false;
    }
    if (l$courier != lOther$courier) {
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
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$courier = courier;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$order = order;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('courier') ? l$courier : const {},
      l$status,
      l$deliveryDate,
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createDeliveryInput<TRes> {
  factory CopyWith$Input$createDeliveryInput(
    Input$createDeliveryInput instance,
    TRes Function(Input$createDeliveryInput) then,
  ) = _CopyWithImpl$Input$createDeliveryInput;

  factory CopyWith$Input$createDeliveryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createDeliveryInput;

  TRes call({
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createDeliveryInput<TRes>
    implements CopyWith$Input$createDeliveryInput<TRes> {
  _CopyWithImpl$Input$createDeliveryInput(this._instance, this._then);

  final Input$createDeliveryInput _instance;

  final TRes Function(Input$createDeliveryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? courier = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? order = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createDeliveryInput._({
      ..._instance._$data,
      if (courier != _undefined) 'courier': (courier as String?),
      if (status != _undefined && status != null)
        'status': (status as Enum$DeliveryStatus),
      if (deliveryDate != _undefined && deliveryDate != null)
        'deliveryDate': (deliveryDate as String),
      if (order != _undefined) 'order': (order as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createDeliveryInput<TRes>
    implements CopyWith$Input$createDeliveryInput<TRes> {
  _CopyWithStubImpl$Input$createDeliveryInput(this._res);

  TRes _res;

  call({
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  }) => _res;
}

class Input$createDietCategoryInput {
  factory Input$createDietCategoryInput({
    required String name,
    String? clientMutationId,
  }) => Input$createDietCategoryInput._({
    r'name': name,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createDietCategoryInput._(this._$data);

  factory Input$createDietCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createDietCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createDietCategoryInput<Input$createDietCategoryInput>
  get copyWith => CopyWith$Input$createDietCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createDietCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createDietCategoryInput<TRes> {
  factory CopyWith$Input$createDietCategoryInput(
    Input$createDietCategoryInput instance,
    TRes Function(Input$createDietCategoryInput) then,
  ) = _CopyWithImpl$Input$createDietCategoryInput;

  factory CopyWith$Input$createDietCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createDietCategoryInput;

  TRes call({String? name, String? clientMutationId});
}

class _CopyWithImpl$Input$createDietCategoryInput<TRes>
    implements CopyWith$Input$createDietCategoryInput<TRes> {
  _CopyWithImpl$Input$createDietCategoryInput(this._instance, this._then);

  final Input$createDietCategoryInput _instance;

  final TRes Function(Input$createDietCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createDietCategoryInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createDietCategoryInput<TRes>
    implements CopyWith$Input$createDietCategoryInput<TRes> {
  _CopyWithStubImpl$Input$createDietCategoryInput(this._res);

  TRes _res;

  call({String? name, String? clientMutationId}) => _res;
}

class Input$updateDietCategoryInput {
  factory Input$updateDietCategoryInput({
    required String id,
    String? name,
    String? clientMutationId,
  }) => Input$updateDietCategoryInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateDietCategoryInput._(this._$data);

  factory Input$updateDietCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateDietCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateDietCategoryInput<Input$updateDietCategoryInput>
  get copyWith => CopyWith$Input$updateDietCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateDietCategoryInput ||
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
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateDietCategoryInput<TRes> {
  factory CopyWith$Input$updateDietCategoryInput(
    Input$updateDietCategoryInput instance,
    TRes Function(Input$updateDietCategoryInput) then,
  ) = _CopyWithImpl$Input$updateDietCategoryInput;

  factory CopyWith$Input$updateDietCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateDietCategoryInput;

  TRes call({String? id, String? name, String? clientMutationId});
}

class _CopyWithImpl$Input$updateDietCategoryInput<TRes>
    implements CopyWith$Input$updateDietCategoryInput<TRes> {
  _CopyWithImpl$Input$updateDietCategoryInput(this._instance, this._then);

  final Input$updateDietCategoryInput _instance;

  final TRes Function(Input$updateDietCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateDietCategoryInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateDietCategoryInput<TRes>
    implements CopyWith$Input$updateDietCategoryInput<TRes> {
  _CopyWithStubImpl$Input$updateDietCategoryInput(this._res);

  TRes _res;

  call({String? id, String? name, String? clientMutationId}) => _res;
}

class Input$deleteDietCategoryInput {
  factory Input$deleteDietCategoryInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteDietCategoryInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteDietCategoryInput._(this._$data);

  factory Input$deleteDietCategoryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteDietCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteDietCategoryInput<Input$deleteDietCategoryInput>
  get copyWith => CopyWith$Input$deleteDietCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteDietCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteDietCategoryInput<TRes> {
  factory CopyWith$Input$deleteDietCategoryInput(
    Input$deleteDietCategoryInput instance,
    TRes Function(Input$deleteDietCategoryInput) then,
  ) = _CopyWithImpl$Input$deleteDietCategoryInput;

  factory CopyWith$Input$deleteDietCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteDietCategoryInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteDietCategoryInput<TRes>
    implements CopyWith$Input$deleteDietCategoryInput<TRes> {
  _CopyWithImpl$Input$deleteDietCategoryInput(this._instance, this._then);

  final Input$deleteDietCategoryInput _instance;

  final TRes Function(Input$deleteDietCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteDietCategoryInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteDietCategoryInput<TRes>
    implements CopyWith$Input$deleteDietCategoryInput<TRes> {
  _CopyWithStubImpl$Input$deleteDietCategoryInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$updateMealInput {
  factory Input$updateMealInput({
    required String id,
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? imagePath,
    String? clientMutationId,
  }) => Input$updateMealInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
    if (price != null) r'price': price,
    if (restaurant != null) r'restaurant': restaurant,
    if (imagePath != null) r'imagePath': imagePath,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateMealInput._(this._$data);

  factory Input$updateMealInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as num?)?.toDouble();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as num?)?.toDouble();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as num?)?.toDouble();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as num?)?.toDouble();
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as int?);
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('imagePath')) {
      final l$imagePath = data['imagePath'];
      result$data['imagePath'] = (l$imagePath as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateMealInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  double? get calories => (_$data['calories'] as double?);

  double? get protein => (_$data['protein'] as double?);

  double? get fat => (_$data['fat'] as double?);

  double? get carbs => (_$data['carbs'] as double?);

  int? get price => (_$data['price'] as int?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get imagePath => (_$data['imagePath'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories;
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein;
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat;
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('imagePath')) {
      final l$imagePath = imagePath;
      result$data['imagePath'] = l$imagePath;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateMealInput<Input$updateMealInput> get copyWith =>
      CopyWith$Input$updateMealInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateMealInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != lOther$price) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$imagePath = imagePath;
    final lOther$imagePath = other.imagePath;
    if (_$data.containsKey('imagePath') !=
        other._$data.containsKey('imagePath')) {
      return false;
    }
    if (l$imagePath != lOther$imagePath) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$price = price;
    final l$restaurant = restaurant;
    final l$imagePath = imagePath;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('calories') ? l$calories : const {},
      _$data.containsKey('protein') ? l$protein : const {},
      _$data.containsKey('fat') ? l$fat : const {},
      _$data.containsKey('carbs') ? l$carbs : const {},
      _$data.containsKey('price') ? l$price : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('imagePath') ? l$imagePath : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateMealInput<TRes> {
  factory CopyWith$Input$updateMealInput(
    Input$updateMealInput instance,
    TRes Function(Input$updateMealInput) then,
  ) = _CopyWithImpl$Input$updateMealInput;

  factory CopyWith$Input$updateMealInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateMealInput;

  TRes call({
    String? id,
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? imagePath,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateMealInput<TRes>
    implements CopyWith$Input$updateMealInput<TRes> {
  _CopyWithImpl$Input$updateMealInput(this._instance, this._then);

  final Input$updateMealInput _instance;

  final TRes Function(Input$updateMealInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? price = _undefined,
    Object? restaurant = _undefined,
    Object? imagePath = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateMealInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (calories != _undefined) 'calories': (calories as double?),
      if (protein != _undefined) 'protein': (protein as double?),
      if (fat != _undefined) 'fat': (fat as double?),
      if (carbs != _undefined) 'carbs': (carbs as double?),
      if (price != _undefined) 'price': (price as int?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (imagePath != _undefined) 'imagePath': (imagePath as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateMealInput<TRes>
    implements CopyWith$Input$updateMealInput<TRes> {
  _CopyWithStubImpl$Input$updateMealInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? imagePath,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteMealInput {
  factory Input$deleteMealInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteMealInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteMealInput._(this._$data);

  factory Input$deleteMealInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteMealInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteMealInput<Input$deleteMealInput> get copyWith =>
      CopyWith$Input$deleteMealInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteMealInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteMealInput<TRes> {
  factory CopyWith$Input$deleteMealInput(
    Input$deleteMealInput instance,
    TRes Function(Input$deleteMealInput) then,
  ) = _CopyWithImpl$Input$deleteMealInput;

  factory CopyWith$Input$deleteMealInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteMealInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteMealInput<TRes>
    implements CopyWith$Input$deleteMealInput<TRes> {
  _CopyWithImpl$Input$deleteMealInput(this._instance, this._then);

  final Input$deleteMealInput _instance;

  final TRes Function(Input$deleteMealInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteMealInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteMealInput<TRes>
    implements CopyWith$Input$deleteMealInput<TRes> {
  _CopyWithStubImpl$Input$deleteMealInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createMealInput {
  factory Input$createMealInput({
    required String name,
    String? description,
    required double calories,
    required double protein,
    required double fat,
    required double carbs,
    required int price,
    required String restaurant,
    String? imagePath,
    String? clientMutationId,
  }) => Input$createMealInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'calories': calories,
    r'protein': protein,
    r'fat': fat,
    r'carbs': carbs,
    r'price': price,
    r'restaurant': restaurant,
    if (imagePath != null) r'imagePath': imagePath,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createMealInput._(this._$data);

  factory Input$createMealInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$calories = data['calories'];
    result$data['calories'] = (l$calories as num).toDouble();
    final l$protein = data['protein'];
    result$data['protein'] = (l$protein as num).toDouble();
    final l$fat = data['fat'];
    result$data['fat'] = (l$fat as num).toDouble();
    final l$carbs = data['carbs'];
    result$data['carbs'] = (l$carbs as num).toDouble();
    final l$price = data['price'];
    result$data['price'] = (l$price as int);
    final l$restaurant = data['restaurant'];
    result$data['restaurant'] = (l$restaurant as String);
    if (data.containsKey('imagePath')) {
      final l$imagePath = data['imagePath'];
      result$data['imagePath'] = (l$imagePath as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createMealInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  double get calories => (_$data['calories'] as double);

  double get protein => (_$data['protein'] as double);

  double get fat => (_$data['fat'] as double);

  double get carbs => (_$data['carbs'] as double);

  int get price => (_$data['price'] as int);

  String get restaurant => (_$data['restaurant'] as String);

  String? get imagePath => (_$data['imagePath'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$calories = calories;
    result$data['calories'] = l$calories;
    final l$protein = protein;
    result$data['protein'] = l$protein;
    final l$fat = fat;
    result$data['fat'] = l$fat;
    final l$carbs = carbs;
    result$data['carbs'] = l$carbs;
    final l$price = price;
    result$data['price'] = l$price;
    final l$restaurant = restaurant;
    result$data['restaurant'] = l$restaurant;
    if (_$data.containsKey('imagePath')) {
      final l$imagePath = imagePath;
      result$data['imagePath'] = l$imagePath;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createMealInput<Input$createMealInput> get copyWith =>
      CopyWith$Input$createMealInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createMealInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
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
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$imagePath = imagePath;
    final lOther$imagePath = other.imagePath;
    if (_$data.containsKey('imagePath') !=
        other._$data.containsKey('imagePath')) {
      return false;
    }
    if (l$imagePath != lOther$imagePath) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$price = price;
    final l$restaurant = restaurant;
    final l$imagePath = imagePath;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$calories,
      l$protein,
      l$fat,
      l$carbs,
      l$price,
      l$restaurant,
      _$data.containsKey('imagePath') ? l$imagePath : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createMealInput<TRes> {
  factory CopyWith$Input$createMealInput(
    Input$createMealInput instance,
    TRes Function(Input$createMealInput) then,
  ) = _CopyWithImpl$Input$createMealInput;

  factory CopyWith$Input$createMealInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createMealInput;

  TRes call({
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? imagePath,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createMealInput<TRes>
    implements CopyWith$Input$createMealInput<TRes> {
  _CopyWithImpl$Input$createMealInput(this._instance, this._then);

  final Input$createMealInput _instance;

  final TRes Function(Input$createMealInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? price = _undefined,
    Object? restaurant = _undefined,
    Object? imagePath = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createMealInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (calories != _undefined && calories != null)
        'calories': (calories as double),
      if (protein != _undefined && protein != null)
        'protein': (protein as double),
      if (fat != _undefined && fat != null) 'fat': (fat as double),
      if (carbs != _undefined && carbs != null) 'carbs': (carbs as double),
      if (price != _undefined && price != null) 'price': (price as int),
      if (restaurant != _undefined && restaurant != null)
        'restaurant': (restaurant as String),
      if (imagePath != _undefined) 'imagePath': (imagePath as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createMealInput<TRes>
    implements CopyWith$Input$createMealInput<TRes> {
  _CopyWithStubImpl$Input$createMealInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    int? price,
    String? restaurant,
    String? imagePath,
    String? clientMutationId,
  }) => _res;
}

class Input$updateMealPlanInput {
  factory Input$updateMealPlanInput({
    required String id,
    List<String?>? meals,
    List<String?>? dietCategories,
    String? name,
    String? description,
    int? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? restaurant,
    String? imagePath,
    String? owner,
    String? clientMutationId,
  }) => Input$updateMealPlanInput._({
    r'id': id,
    if (meals != null) r'meals': meals,
    if (dietCategories != null) r'dietCategories': dietCategories,
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (price != null) r'price': price,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
    if (restaurant != null) r'restaurant': restaurant,
    if (imagePath != null) r'imagePath': imagePath,
    if (owner != null) r'owner': owner,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateMealPlanInput._(this._$data);

  factory Input$updateMealPlanInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('meals')) {
      final l$meals = data['meals'];
      result$data['meals'] = (l$meals as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('dietCategories')) {
      final l$dietCategories = data['dietCategories'];
      result$data['dietCategories'] = (l$dietCategories as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as int?);
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as num?)?.toDouble();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as num?)?.toDouble();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as num?)?.toDouble();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as num?)?.toDouble();
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('imagePath')) {
      final l$imagePath = data['imagePath'];
      result$data['imagePath'] = (l$imagePath as String?);
    }
    if (data.containsKey('owner')) {
      final l$owner = data['owner'];
      result$data['owner'] = (l$owner as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateMealPlanInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  List<String?>? get meals => (_$data['meals'] as List<String?>?);

  List<String?>? get dietCategories =>
      (_$data['dietCategories'] as List<String?>?);

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  int? get price => (_$data['price'] as int?);

  double? get calories => (_$data['calories'] as double?);

  double? get protein => (_$data['protein'] as double?);

  double? get fat => (_$data['fat'] as double?);

  double? get carbs => (_$data['carbs'] as double?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get imagePath => (_$data['imagePath'] as String?);

  String? get owner => (_$data['owner'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('meals')) {
      final l$meals = meals;
      result$data['meals'] = l$meals?.map((e) => e).toList();
    }
    if (_$data.containsKey('dietCategories')) {
      final l$dietCategories = dietCategories;
      result$data['dietCategories'] = l$dietCategories?.map((e) => e).toList();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price;
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories;
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein;
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat;
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('imagePath')) {
      final l$imagePath = imagePath;
      result$data['imagePath'] = l$imagePath;
    }
    if (_$data.containsKey('owner')) {
      final l$owner = owner;
      result$data['owner'] = l$owner;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateMealPlanInput<Input$updateMealPlanInput> get copyWith =>
      CopyWith$Input$updateMealPlanInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateMealPlanInput ||
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
    if (_$data.containsKey('meals') != other._$data.containsKey('meals')) {
      return false;
    }
    if (l$meals != null && lOther$meals != null) {
      if (l$meals.length != lOther$meals.length) {
        return false;
      }
      for (int i = 0; i < l$meals.length; i++) {
        final l$meals$entry = l$meals[i];
        final lOther$meals$entry = lOther$meals[i];
        if (l$meals$entry != lOther$meals$entry) {
          return false;
        }
      }
    } else if (l$meals != lOther$meals) {
      return false;
    }
    final l$dietCategories = dietCategories;
    final lOther$dietCategories = other.dietCategories;
    if (_$data.containsKey('dietCategories') !=
        other._$data.containsKey('dietCategories')) {
      return false;
    }
    if (l$dietCategories != null && lOther$dietCategories != null) {
      if (l$dietCategories.length != lOther$dietCategories.length) {
        return false;
      }
      for (int i = 0; i < l$dietCategories.length; i++) {
        final l$dietCategories$entry = l$dietCategories[i];
        final lOther$dietCategories$entry = lOther$dietCategories[i];
        if (l$dietCategories$entry != lOther$dietCategories$entry) {
          return false;
        }
      }
    } else if (l$dietCategories != lOther$dietCategories) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != lOther$price) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$imagePath = imagePath;
    final lOther$imagePath = other.imagePath;
    if (_$data.containsKey('imagePath') !=
        other._$data.containsKey('imagePath')) {
      return false;
    }
    if (l$imagePath != lOther$imagePath) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (_$data.containsKey('owner') != other._$data.containsKey('owner')) {
      return false;
    }
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$meals = meals;
    final l$dietCategories = dietCategories;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$restaurant = restaurant;
    final l$imagePath = imagePath;
    final l$owner = owner;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('meals')
          ? l$meals == null
                ? null
                : Object.hashAll(l$meals.map((v) => v))
          : const {},
      _$data.containsKey('dietCategories')
          ? l$dietCategories == null
                ? null
                : Object.hashAll(l$dietCategories.map((v) => v))
          : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('price') ? l$price : const {},
      _$data.containsKey('calories') ? l$calories : const {},
      _$data.containsKey('protein') ? l$protein : const {},
      _$data.containsKey('fat') ? l$fat : const {},
      _$data.containsKey('carbs') ? l$carbs : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('imagePath') ? l$imagePath : const {},
      _$data.containsKey('owner') ? l$owner : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateMealPlanInput<TRes> {
  factory CopyWith$Input$updateMealPlanInput(
    Input$updateMealPlanInput instance,
    TRes Function(Input$updateMealPlanInput) then,
  ) = _CopyWithImpl$Input$updateMealPlanInput;

  factory CopyWith$Input$updateMealPlanInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateMealPlanInput;

  TRes call({
    String? id,
    List<String?>? meals,
    List<String?>? dietCategories,
    String? name,
    String? description,
    int? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? restaurant,
    String? imagePath,
    String? owner,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateMealPlanInput<TRes>
    implements CopyWith$Input$updateMealPlanInput<TRes> {
  _CopyWithImpl$Input$updateMealPlanInput(this._instance, this._then);

  final Input$updateMealPlanInput _instance;

  final TRes Function(Input$updateMealPlanInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? meals = _undefined,
    Object? dietCategories = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? restaurant = _undefined,
    Object? imagePath = _undefined,
    Object? owner = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateMealPlanInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (meals != _undefined) 'meals': (meals as List<String?>?),
      if (dietCategories != _undefined)
        'dietCategories': (dietCategories as List<String?>?),
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (price != _undefined) 'price': (price as int?),
      if (calories != _undefined) 'calories': (calories as double?),
      if (protein != _undefined) 'protein': (protein as double?),
      if (fat != _undefined) 'fat': (fat as double?),
      if (carbs != _undefined) 'carbs': (carbs as double?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (imagePath != _undefined) 'imagePath': (imagePath as String?),
      if (owner != _undefined) 'owner': (owner as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateMealPlanInput<TRes>
    implements CopyWith$Input$updateMealPlanInput<TRes> {
  _CopyWithStubImpl$Input$updateMealPlanInput(this._res);

  TRes _res;

  call({
    String? id,
    List<String?>? meals,
    List<String?>? dietCategories,
    String? name,
    String? description,
    int? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? restaurant,
    String? imagePath,
    String? owner,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteMealPlanInput {
  factory Input$deleteMealPlanInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteMealPlanInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteMealPlanInput._(this._$data);

  factory Input$deleteMealPlanInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteMealPlanInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteMealPlanInput<Input$deleteMealPlanInput> get copyWith =>
      CopyWith$Input$deleteMealPlanInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteMealPlanInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteMealPlanInput<TRes> {
  factory CopyWith$Input$deleteMealPlanInput(
    Input$deleteMealPlanInput instance,
    TRes Function(Input$deleteMealPlanInput) then,
  ) = _CopyWithImpl$Input$deleteMealPlanInput;

  factory CopyWith$Input$deleteMealPlanInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteMealPlanInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteMealPlanInput<TRes>
    implements CopyWith$Input$deleteMealPlanInput<TRes> {
  _CopyWithImpl$Input$deleteMealPlanInput(this._instance, this._then);

  final Input$deleteMealPlanInput _instance;

  final TRes Function(Input$deleteMealPlanInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteMealPlanInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteMealPlanInput<TRes>
    implements CopyWith$Input$deleteMealPlanInput<TRes> {
  _CopyWithStubImpl$Input$deleteMealPlanInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createMealPlanInput {
  factory Input$createMealPlanInput({
    List<String?>? meals,
    List<String?>? dietCategories,
    required String name,
    String? description,
    int? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? restaurant,
    String? imagePath,
    String? owner,
    String? clientMutationId,
  }) => Input$createMealPlanInput._({
    if (meals != null) r'meals': meals,
    if (dietCategories != null) r'dietCategories': dietCategories,
    r'name': name,
    if (description != null) r'description': description,
    if (price != null) r'price': price,
    if (calories != null) r'calories': calories,
    if (protein != null) r'protein': protein,
    if (fat != null) r'fat': fat,
    if (carbs != null) r'carbs': carbs,
    if (restaurant != null) r'restaurant': restaurant,
    if (imagePath != null) r'imagePath': imagePath,
    if (owner != null) r'owner': owner,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createMealPlanInput._(this._$data);

  factory Input$createMealPlanInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('meals')) {
      final l$meals = data['meals'];
      result$data['meals'] = (l$meals as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('dietCategories')) {
      final l$dietCategories = data['dietCategories'];
      result$data['dietCategories'] = (l$dietCategories as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('price')) {
      final l$price = data['price'];
      result$data['price'] = (l$price as int?);
    }
    if (data.containsKey('calories')) {
      final l$calories = data['calories'];
      result$data['calories'] = (l$calories as num?)?.toDouble();
    }
    if (data.containsKey('protein')) {
      final l$protein = data['protein'];
      result$data['protein'] = (l$protein as num?)?.toDouble();
    }
    if (data.containsKey('fat')) {
      final l$fat = data['fat'];
      result$data['fat'] = (l$fat as num?)?.toDouble();
    }
    if (data.containsKey('carbs')) {
      final l$carbs = data['carbs'];
      result$data['carbs'] = (l$carbs as num?)?.toDouble();
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('imagePath')) {
      final l$imagePath = data['imagePath'];
      result$data['imagePath'] = (l$imagePath as String?);
    }
    if (data.containsKey('owner')) {
      final l$owner = data['owner'];
      result$data['owner'] = (l$owner as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createMealPlanInput._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String?>? get meals => (_$data['meals'] as List<String?>?);

  List<String?>? get dietCategories =>
      (_$data['dietCategories'] as List<String?>?);

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  int? get price => (_$data['price'] as int?);

  double? get calories => (_$data['calories'] as double?);

  double? get protein => (_$data['protein'] as double?);

  double? get fat => (_$data['fat'] as double?);

  double? get carbs => (_$data['carbs'] as double?);

  String? get restaurant => (_$data['restaurant'] as String?);

  String? get imagePath => (_$data['imagePath'] as String?);

  String? get owner => (_$data['owner'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('meals')) {
      final l$meals = meals;
      result$data['meals'] = l$meals?.map((e) => e).toList();
    }
    if (_$data.containsKey('dietCategories')) {
      final l$dietCategories = dietCategories;
      result$data['dietCategories'] = l$dietCategories?.map((e) => e).toList();
    }
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('price')) {
      final l$price = price;
      result$data['price'] = l$price;
    }
    if (_$data.containsKey('calories')) {
      final l$calories = calories;
      result$data['calories'] = l$calories;
    }
    if (_$data.containsKey('protein')) {
      final l$protein = protein;
      result$data['protein'] = l$protein;
    }
    if (_$data.containsKey('fat')) {
      final l$fat = fat;
      result$data['fat'] = l$fat;
    }
    if (_$data.containsKey('carbs')) {
      final l$carbs = carbs;
      result$data['carbs'] = l$carbs;
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('imagePath')) {
      final l$imagePath = imagePath;
      result$data['imagePath'] = l$imagePath;
    }
    if (_$data.containsKey('owner')) {
      final l$owner = owner;
      result$data['owner'] = l$owner;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createMealPlanInput<Input$createMealPlanInput> get copyWith =>
      CopyWith$Input$createMealPlanInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createMealPlanInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$meals = meals;
    final lOther$meals = other.meals;
    if (_$data.containsKey('meals') != other._$data.containsKey('meals')) {
      return false;
    }
    if (l$meals != null && lOther$meals != null) {
      if (l$meals.length != lOther$meals.length) {
        return false;
      }
      for (int i = 0; i < l$meals.length; i++) {
        final l$meals$entry = l$meals[i];
        final lOther$meals$entry = lOther$meals[i];
        if (l$meals$entry != lOther$meals$entry) {
          return false;
        }
      }
    } else if (l$meals != lOther$meals) {
      return false;
    }
    final l$dietCategories = dietCategories;
    final lOther$dietCategories = other.dietCategories;
    if (_$data.containsKey('dietCategories') !=
        other._$data.containsKey('dietCategories')) {
      return false;
    }
    if (l$dietCategories != null && lOther$dietCategories != null) {
      if (l$dietCategories.length != lOther$dietCategories.length) {
        return false;
      }
      for (int i = 0; i < l$dietCategories.length; i++) {
        final l$dietCategories$entry = l$dietCategories[i];
        final lOther$dietCategories$entry = lOther$dietCategories[i];
        if (l$dietCategories$entry != lOther$dietCategories$entry) {
          return false;
        }
      }
    } else if (l$dietCategories != lOther$dietCategories) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (_$data.containsKey('price') != other._$data.containsKey('price')) {
      return false;
    }
    if (l$price != lOther$price) {
      return false;
    }
    final l$calories = calories;
    final lOther$calories = other.calories;
    if (_$data.containsKey('calories') !=
        other._$data.containsKey('calories')) {
      return false;
    }
    if (l$calories != lOther$calories) {
      return false;
    }
    final l$protein = protein;
    final lOther$protein = other.protein;
    if (_$data.containsKey('protein') != other._$data.containsKey('protein')) {
      return false;
    }
    if (l$protein != lOther$protein) {
      return false;
    }
    final l$fat = fat;
    final lOther$fat = other.fat;
    if (_$data.containsKey('fat') != other._$data.containsKey('fat')) {
      return false;
    }
    if (l$fat != lOther$fat) {
      return false;
    }
    final l$carbs = carbs;
    final lOther$carbs = other.carbs;
    if (_$data.containsKey('carbs') != other._$data.containsKey('carbs')) {
      return false;
    }
    if (l$carbs != lOther$carbs) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$imagePath = imagePath;
    final lOther$imagePath = other.imagePath;
    if (_$data.containsKey('imagePath') !=
        other._$data.containsKey('imagePath')) {
      return false;
    }
    if (l$imagePath != lOther$imagePath) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (_$data.containsKey('owner') != other._$data.containsKey('owner')) {
      return false;
    }
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$meals = meals;
    final l$dietCategories = dietCategories;
    final l$name = name;
    final l$description = description;
    final l$price = price;
    final l$calories = calories;
    final l$protein = protein;
    final l$fat = fat;
    final l$carbs = carbs;
    final l$restaurant = restaurant;
    final l$imagePath = imagePath;
    final l$owner = owner;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('meals')
          ? l$meals == null
                ? null
                : Object.hashAll(l$meals.map((v) => v))
          : const {},
      _$data.containsKey('dietCategories')
          ? l$dietCategories == null
                ? null
                : Object.hashAll(l$dietCategories.map((v) => v))
          : const {},
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('price') ? l$price : const {},
      _$data.containsKey('calories') ? l$calories : const {},
      _$data.containsKey('protein') ? l$protein : const {},
      _$data.containsKey('fat') ? l$fat : const {},
      _$data.containsKey('carbs') ? l$carbs : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('imagePath') ? l$imagePath : const {},
      _$data.containsKey('owner') ? l$owner : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createMealPlanInput<TRes> {
  factory CopyWith$Input$createMealPlanInput(
    Input$createMealPlanInput instance,
    TRes Function(Input$createMealPlanInput) then,
  ) = _CopyWithImpl$Input$createMealPlanInput;

  factory CopyWith$Input$createMealPlanInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createMealPlanInput;

  TRes call({
    List<String?>? meals,
    List<String?>? dietCategories,
    String? name,
    String? description,
    int? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? restaurant,
    String? imagePath,
    String? owner,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createMealPlanInput<TRes>
    implements CopyWith$Input$createMealPlanInput<TRes> {
  _CopyWithImpl$Input$createMealPlanInput(this._instance, this._then);

  final Input$createMealPlanInput _instance;

  final TRes Function(Input$createMealPlanInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? meals = _undefined,
    Object? dietCategories = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? price = _undefined,
    Object? calories = _undefined,
    Object? protein = _undefined,
    Object? fat = _undefined,
    Object? carbs = _undefined,
    Object? restaurant = _undefined,
    Object? imagePath = _undefined,
    Object? owner = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createMealPlanInput._({
      ..._instance._$data,
      if (meals != _undefined) 'meals': (meals as List<String?>?),
      if (dietCategories != _undefined)
        'dietCategories': (dietCategories as List<String?>?),
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (price != _undefined) 'price': (price as int?),
      if (calories != _undefined) 'calories': (calories as double?),
      if (protein != _undefined) 'protein': (protein as double?),
      if (fat != _undefined) 'fat': (fat as double?),
      if (carbs != _undefined) 'carbs': (carbs as double?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (imagePath != _undefined) 'imagePath': (imagePath as String?),
      if (owner != _undefined) 'owner': (owner as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createMealPlanInput<TRes>
    implements CopyWith$Input$createMealPlanInput<TRes> {
  _CopyWithStubImpl$Input$createMealPlanInput(this._res);

  TRes _res;

  call({
    List<String?>? meals,
    List<String?>? dietCategories,
    String? name,
    String? description,
    int? price,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    String? restaurant,
    String? imagePath,
    String? owner,
    String? clientMutationId,
  }) => _res;
}

class Input$updateOrderInput {
  factory Input$updateOrderInput({
    required String id,
    String? customer,
    Enum$OrderStatus? status,
    List<Input$updateOrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$updateDeliveryNestedInput?>? deliveries,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    int? deliveryFee,
    String? createdAt,
    String? clientMutationId,
  }) => Input$updateOrderInput._({
    r'id': id,
    if (customer != null) r'customer': customer,
    if (status != null) r'status': status,
    if (orderItems != null) r'orderItems': orderItems,
    if (restaurant != null) r'restaurant': restaurant,
    if (deliveries != null) r'deliveries': deliveries,
    if (total != null) r'total': total,
    if (paymentIntentId != null) r'paymentIntentId': paymentIntentId,
    if (deliveryFirstName != null) r'deliveryFirstName': deliveryFirstName,
    if (deliveryLastName != null) r'deliveryLastName': deliveryLastName,
    if (deliveryPhoneNumber != null)
      r'deliveryPhoneNumber': deliveryPhoneNumber,
    if (deliveryStreet != null) r'deliveryStreet': deliveryStreet,
    if (deliveryApartment != null) r'deliveryApartment': deliveryApartment,
    if (deliveryCity != null) r'deliveryCity': deliveryCity,
    if (deliveryZipCode != null) r'deliveryZipCode': deliveryZipCode,
    if (deliveryFee != null) r'deliveryFee': deliveryFee,
    if (createdAt != null) r'createdAt': createdAt,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateOrderInput._(this._$data);

  factory Input$updateOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('customer')) {
      final l$customer = data['customer'];
      result$data['customer'] = (l$customer as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$OrderStatus((l$status as String));
    }
    if (data.containsKey('orderItems')) {
      final l$orderItems = data['orderItems'];
      result$data['orderItems'] = (l$orderItems as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$updateOrderItemNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('deliveries')) {
      final l$deliveries = data['deliveries'];
      result$data['deliveries'] = (l$deliveries as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$updateDeliveryNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('total')) {
      final l$total = data['total'];
      result$data['total'] = (l$total as int?);
    }
    if (data.containsKey('paymentIntentId')) {
      final l$paymentIntentId = data['paymentIntentId'];
      result$data['paymentIntentId'] = (l$paymentIntentId as String?);
    }
    if (data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = data['deliveryFirstName'];
      result$data['deliveryFirstName'] = (l$deliveryFirstName as String?);
    }
    if (data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = data['deliveryLastName'];
      result$data['deliveryLastName'] = (l$deliveryLastName as String?);
    }
    if (data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = data['deliveryPhoneNumber'];
      result$data['deliveryPhoneNumber'] = (l$deliveryPhoneNumber as String?);
    }
    if (data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = data['deliveryStreet'];
      result$data['deliveryStreet'] = (l$deliveryStreet as String?);
    }
    if (data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = data['deliveryApartment'];
      result$data['deliveryApartment'] = (l$deliveryApartment as String?);
    }
    if (data.containsKey('deliveryCity')) {
      final l$deliveryCity = data['deliveryCity'];
      result$data['deliveryCity'] = (l$deliveryCity as String?);
    }
    if (data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = data['deliveryZipCode'];
      result$data['deliveryZipCode'] = (l$deliveryZipCode as String?);
    }
    if (data.containsKey('deliveryFee')) {
      final l$deliveryFee = data['deliveryFee'];
      result$data['deliveryFee'] = (l$deliveryFee as int?);
    }
    if (data.containsKey('createdAt')) {
      final l$createdAt = data['createdAt'];
      result$data['createdAt'] = (l$createdAt as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get customer => (_$data['customer'] as String?);

  Enum$OrderStatus? get status => (_$data['status'] as Enum$OrderStatus?);

  List<Input$updateOrderItemNestedInput?>? get orderItems =>
      (_$data['orderItems'] as List<Input$updateOrderItemNestedInput?>?);

  String? get restaurant => (_$data['restaurant'] as String?);

  List<Input$updateDeliveryNestedInput?>? get deliveries =>
      (_$data['deliveries'] as List<Input$updateDeliveryNestedInput?>?);

  int? get total => (_$data['total'] as int?);

  String? get paymentIntentId => (_$data['paymentIntentId'] as String?);

  String? get deliveryFirstName => (_$data['deliveryFirstName'] as String?);

  String? get deliveryLastName => (_$data['deliveryLastName'] as String?);

  String? get deliveryPhoneNumber => (_$data['deliveryPhoneNumber'] as String?);

  String? get deliveryStreet => (_$data['deliveryStreet'] as String?);

  String? get deliveryApartment => (_$data['deliveryApartment'] as String?);

  String? get deliveryCity => (_$data['deliveryCity'] as String?);

  String? get deliveryZipCode => (_$data['deliveryZipCode'] as String?);

  int? get deliveryFee => (_$data['deliveryFee'] as int?);

  String? get createdAt => (_$data['createdAt'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('customer')) {
      final l$customer = customer;
      result$data['customer'] = l$customer;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$OrderStatus(l$status);
    }
    if (_$data.containsKey('orderItems')) {
      final l$orderItems = orderItems;
      result$data['orderItems'] = l$orderItems
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('deliveries')) {
      final l$deliveries = deliveries;
      result$data['deliveries'] = l$deliveries
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('total')) {
      final l$total = total;
      result$data['total'] = l$total;
    }
    if (_$data.containsKey('paymentIntentId')) {
      final l$paymentIntentId = paymentIntentId;
      result$data['paymentIntentId'] = l$paymentIntentId;
    }
    if (_$data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = deliveryFirstName;
      result$data['deliveryFirstName'] = l$deliveryFirstName;
    }
    if (_$data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = deliveryLastName;
      result$data['deliveryLastName'] = l$deliveryLastName;
    }
    if (_$data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = deliveryPhoneNumber;
      result$data['deliveryPhoneNumber'] = l$deliveryPhoneNumber;
    }
    if (_$data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = deliveryStreet;
      result$data['deliveryStreet'] = l$deliveryStreet;
    }
    if (_$data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = deliveryApartment;
      result$data['deliveryApartment'] = l$deliveryApartment;
    }
    if (_$data.containsKey('deliveryCity')) {
      final l$deliveryCity = deliveryCity;
      result$data['deliveryCity'] = l$deliveryCity;
    }
    if (_$data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = deliveryZipCode;
      result$data['deliveryZipCode'] = l$deliveryZipCode;
    }
    if (_$data.containsKey('deliveryFee')) {
      final l$deliveryFee = deliveryFee;
      result$data['deliveryFee'] = l$deliveryFee;
    }
    if (_$data.containsKey('createdAt')) {
      final l$createdAt = createdAt;
      result$data['createdAt'] = l$createdAt;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateOrderInput<Input$updateOrderInput> get copyWith =>
      CopyWith$Input$updateOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (_$data.containsKey('customer') !=
        other._$data.containsKey('customer')) {
      return false;
    }
    if (l$customer != lOther$customer) {
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
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (_$data.containsKey('orderItems') !=
        other._$data.containsKey('orderItems')) {
      return false;
    }
    if (l$orderItems != null && lOther$orderItems != null) {
      if (l$orderItems.length != lOther$orderItems.length) {
        return false;
      }
      for (int i = 0; i < l$orderItems.length; i++) {
        final l$orderItems$entry = l$orderItems[i];
        final lOther$orderItems$entry = lOther$orderItems[i];
        if (l$orderItems$entry != lOther$orderItems$entry) {
          return false;
        }
      }
    } else if (l$orderItems != lOther$orderItems) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (_$data.containsKey('deliveries') !=
        other._$data.containsKey('deliveries')) {
      return false;
    }
    if (l$deliveries != null && lOther$deliveries != null) {
      if (l$deliveries.length != lOther$deliveries.length) {
        return false;
      }
      for (int i = 0; i < l$deliveries.length; i++) {
        final l$deliveries$entry = l$deliveries[i];
        final lOther$deliveries$entry = lOther$deliveries[i];
        if (l$deliveries$entry != lOther$deliveries$entry) {
          return false;
        }
      }
    } else if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (_$data.containsKey('total') != other._$data.containsKey('total')) {
      return false;
    }
    if (l$total != lOther$total) {
      return false;
    }
    final l$paymentIntentId = paymentIntentId;
    final lOther$paymentIntentId = other.paymentIntentId;
    if (_$data.containsKey('paymentIntentId') !=
        other._$data.containsKey('paymentIntentId')) {
      return false;
    }
    if (l$paymentIntentId != lOther$paymentIntentId) {
      return false;
    }
    final l$deliveryFirstName = deliveryFirstName;
    final lOther$deliveryFirstName = other.deliveryFirstName;
    if (_$data.containsKey('deliveryFirstName') !=
        other._$data.containsKey('deliveryFirstName')) {
      return false;
    }
    if (l$deliveryFirstName != lOther$deliveryFirstName) {
      return false;
    }
    final l$deliveryLastName = deliveryLastName;
    final lOther$deliveryLastName = other.deliveryLastName;
    if (_$data.containsKey('deliveryLastName') !=
        other._$data.containsKey('deliveryLastName')) {
      return false;
    }
    if (l$deliveryLastName != lOther$deliveryLastName) {
      return false;
    }
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final lOther$deliveryPhoneNumber = other.deliveryPhoneNumber;
    if (_$data.containsKey('deliveryPhoneNumber') !=
        other._$data.containsKey('deliveryPhoneNumber')) {
      return false;
    }
    if (l$deliveryPhoneNumber != lOther$deliveryPhoneNumber) {
      return false;
    }
    final l$deliveryStreet = deliveryStreet;
    final lOther$deliveryStreet = other.deliveryStreet;
    if (_$data.containsKey('deliveryStreet') !=
        other._$data.containsKey('deliveryStreet')) {
      return false;
    }
    if (l$deliveryStreet != lOther$deliveryStreet) {
      return false;
    }
    final l$deliveryApartment = deliveryApartment;
    final lOther$deliveryApartment = other.deliveryApartment;
    if (_$data.containsKey('deliveryApartment') !=
        other._$data.containsKey('deliveryApartment')) {
      return false;
    }
    if (l$deliveryApartment != lOther$deliveryApartment) {
      return false;
    }
    final l$deliveryCity = deliveryCity;
    final lOther$deliveryCity = other.deliveryCity;
    if (_$data.containsKey('deliveryCity') !=
        other._$data.containsKey('deliveryCity')) {
      return false;
    }
    if (l$deliveryCity != lOther$deliveryCity) {
      return false;
    }
    final l$deliveryZipCode = deliveryZipCode;
    final lOther$deliveryZipCode = other.deliveryZipCode;
    if (_$data.containsKey('deliveryZipCode') !=
        other._$data.containsKey('deliveryZipCode')) {
      return false;
    }
    if (l$deliveryZipCode != lOther$deliveryZipCode) {
      return false;
    }
    final l$deliveryFee = deliveryFee;
    final lOther$deliveryFee = other.deliveryFee;
    if (_$data.containsKey('deliveryFee') !=
        other._$data.containsKey('deliveryFee')) {
      return false;
    }
    if (l$deliveryFee != lOther$deliveryFee) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (_$data.containsKey('createdAt') !=
        other._$data.containsKey('createdAt')) {
      return false;
    }
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$customer = customer;
    final l$status = status;
    final l$orderItems = orderItems;
    final l$restaurant = restaurant;
    final l$deliveries = deliveries;
    final l$total = total;
    final l$paymentIntentId = paymentIntentId;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$deliveryFee = deliveryFee;
    final l$createdAt = createdAt;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('customer') ? l$customer : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('orderItems')
          ? l$orderItems == null
                ? null
                : Object.hashAll(l$orderItems.map((v) => v))
          : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('deliveries')
          ? l$deliveries == null
                ? null
                : Object.hashAll(l$deliveries.map((v) => v))
          : const {},
      _$data.containsKey('total') ? l$total : const {},
      _$data.containsKey('paymentIntentId') ? l$paymentIntentId : const {},
      _$data.containsKey('deliveryFirstName') ? l$deliveryFirstName : const {},
      _$data.containsKey('deliveryLastName') ? l$deliveryLastName : const {},
      _$data.containsKey('deliveryPhoneNumber')
          ? l$deliveryPhoneNumber
          : const {},
      _$data.containsKey('deliveryStreet') ? l$deliveryStreet : const {},
      _$data.containsKey('deliveryApartment') ? l$deliveryApartment : const {},
      _$data.containsKey('deliveryCity') ? l$deliveryCity : const {},
      _$data.containsKey('deliveryZipCode') ? l$deliveryZipCode : const {},
      _$data.containsKey('deliveryFee') ? l$deliveryFee : const {},
      _$data.containsKey('createdAt') ? l$createdAt : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateOrderInput<TRes> {
  factory CopyWith$Input$updateOrderInput(
    Input$updateOrderInput instance,
    TRes Function(Input$updateOrderInput) then,
  ) = _CopyWithImpl$Input$updateOrderInput;

  factory CopyWith$Input$updateOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateOrderInput;

  TRes call({
    String? id,
    String? customer,
    Enum$OrderStatus? status,
    List<Input$updateOrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$updateDeliveryNestedInput?>? deliveries,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    int? deliveryFee,
    String? createdAt,
    String? clientMutationId,
  });
  TRes orderItems(
    Iterable<Input$updateOrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateOrderItemNestedInput<
          Input$updateOrderItemNestedInput
        >?
      >?,
    )
    _fn,
  );
  TRes deliveries(
    Iterable<Input$updateDeliveryNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateDeliveryNestedInput<
          Input$updateDeliveryNestedInput
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$updateOrderInput<TRes>
    implements CopyWith$Input$updateOrderInput<TRes> {
  _CopyWithImpl$Input$updateOrderInput(this._instance, this._then);

  final Input$updateOrderInput _instance;

  final TRes Function(Input$updateOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? customer = _undefined,
    Object? status = _undefined,
    Object? orderItems = _undefined,
    Object? restaurant = _undefined,
    Object? deliveries = _undefined,
    Object? total = _undefined,
    Object? paymentIntentId = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? deliveryFee = _undefined,
    Object? createdAt = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateOrderInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (customer != _undefined) 'customer': (customer as String?),
      if (status != _undefined) 'status': (status as Enum$OrderStatus?),
      if (orderItems != _undefined)
        'orderItems': (orderItems as List<Input$updateOrderItemNestedInput?>?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (deliveries != _undefined)
        'deliveries': (deliveries as List<Input$updateDeliveryNestedInput?>?),
      if (total != _undefined) 'total': (total as int?),
      if (paymentIntentId != _undefined)
        'paymentIntentId': (paymentIntentId as String?),
      if (deliveryFirstName != _undefined)
        'deliveryFirstName': (deliveryFirstName as String?),
      if (deliveryLastName != _undefined)
        'deliveryLastName': (deliveryLastName as String?),
      if (deliveryPhoneNumber != _undefined)
        'deliveryPhoneNumber': (deliveryPhoneNumber as String?),
      if (deliveryStreet != _undefined)
        'deliveryStreet': (deliveryStreet as String?),
      if (deliveryApartment != _undefined)
        'deliveryApartment': (deliveryApartment as String?),
      if (deliveryCity != _undefined) 'deliveryCity': (deliveryCity as String?),
      if (deliveryZipCode != _undefined)
        'deliveryZipCode': (deliveryZipCode as String?),
      if (deliveryFee != _undefined) 'deliveryFee': (deliveryFee as int?),
      if (createdAt != _undefined) 'createdAt': (createdAt as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );

  TRes orderItems(
    Iterable<Input$updateOrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateOrderItemNestedInput<
          Input$updateOrderItemNestedInput
        >?
      >?,
    )
    _fn,
  ) => call(
    orderItems: _fn(
      _instance.orderItems?.map(
        (e) => e == null
            ? null
            : CopyWith$Input$updateOrderItemNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes deliveries(
    Iterable<Input$updateDeliveryNestedInput?>? Function(
      Iterable<
        CopyWith$Input$updateDeliveryNestedInput<
          Input$updateDeliveryNestedInput
        >?
      >?,
    )
    _fn,
  ) => call(
    deliveries: _fn(
      _instance.deliveries?.map(
        (e) => e == null
            ? null
            : CopyWith$Input$updateDeliveryNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$updateOrderInput<TRes>
    implements CopyWith$Input$updateOrderInput<TRes> {
  _CopyWithStubImpl$Input$updateOrderInput(this._res);

  TRes _res;

  call({
    String? id,
    String? customer,
    Enum$OrderStatus? status,
    List<Input$updateOrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$updateDeliveryNestedInput?>? deliveries,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    int? deliveryFee,
    String? createdAt,
    String? clientMutationId,
  }) => _res;

  orderItems(_fn) => _res;

  deliveries(_fn) => _res;
}

class Input$updateOrderItemNestedInput {
  factory Input$updateOrderItemNestedInput({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
    String? clientMutationId,
  }) => Input$updateOrderItemNestedInput._({
    if (id != null) r'id': id,
    if (order != null) r'order': order,
    if (mealPlan != null) r'mealPlan': mealPlan,
    if (quantity != null) r'quantity': quantity,
    if (mealPlanName != null) r'mealPlanName': mealPlanName,
    if (mealPlanPrice != null) r'mealPlanPrice': mealPlanPrice,
    if (mealPlanCalories != null) r'mealPlanCalories': mealPlanCalories,
    if (mealPlanProtein != null) r'mealPlanProtein': mealPlanProtein,
    if (mealPlanFat != null) r'mealPlanFat': mealPlanFat,
    if (mealPlanCarbs != null) r'mealPlanCarbs': mealPlanCarbs,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateOrderItemNestedInput._(this._$data);

  factory Input$updateOrderItemNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('mealPlan')) {
      final l$mealPlan = data['mealPlan'];
      result$data['mealPlan'] = (l$mealPlan as String?);
    }
    if (data.containsKey('quantity')) {
      final l$quantity = data['quantity'];
      result$data['quantity'] = (l$quantity as int?);
    }
    if (data.containsKey('mealPlanName')) {
      final l$mealPlanName = data['mealPlanName'];
      result$data['mealPlanName'] = (l$mealPlanName as String?);
    }
    if (data.containsKey('mealPlanPrice')) {
      final l$mealPlanPrice = data['mealPlanPrice'];
      result$data['mealPlanPrice'] = (l$mealPlanPrice as int?);
    }
    if (data.containsKey('mealPlanCalories')) {
      final l$mealPlanCalories = data['mealPlanCalories'];
      result$data['mealPlanCalories'] = (l$mealPlanCalories as num?)
          ?.toDouble();
    }
    if (data.containsKey('mealPlanProtein')) {
      final l$mealPlanProtein = data['mealPlanProtein'];
      result$data['mealPlanProtein'] = (l$mealPlanProtein as num?)?.toDouble();
    }
    if (data.containsKey('mealPlanFat')) {
      final l$mealPlanFat = data['mealPlanFat'];
      result$data['mealPlanFat'] = (l$mealPlanFat as num?)?.toDouble();
    }
    if (data.containsKey('mealPlanCarbs')) {
      final l$mealPlanCarbs = data['mealPlanCarbs'];
      result$data['mealPlanCarbs'] = (l$mealPlanCarbs as num?)?.toDouble();
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateOrderItemNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get mealPlan => (_$data['mealPlan'] as String?);

  int? get quantity => (_$data['quantity'] as int?);

  String? get mealPlanName => (_$data['mealPlanName'] as String?);

  int? get mealPlanPrice => (_$data['mealPlanPrice'] as int?);

  double? get mealPlanCalories => (_$data['mealPlanCalories'] as double?);

  double? get mealPlanProtein => (_$data['mealPlanProtein'] as double?);

  double? get mealPlanFat => (_$data['mealPlanFat'] as double?);

  double? get mealPlanCarbs => (_$data['mealPlanCarbs'] as double?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('mealPlan')) {
      final l$mealPlan = mealPlan;
      result$data['mealPlan'] = l$mealPlan;
    }
    if (_$data.containsKey('quantity')) {
      final l$quantity = quantity;
      result$data['quantity'] = l$quantity;
    }
    if (_$data.containsKey('mealPlanName')) {
      final l$mealPlanName = mealPlanName;
      result$data['mealPlanName'] = l$mealPlanName;
    }
    if (_$data.containsKey('mealPlanPrice')) {
      final l$mealPlanPrice = mealPlanPrice;
      result$data['mealPlanPrice'] = l$mealPlanPrice;
    }
    if (_$data.containsKey('mealPlanCalories')) {
      final l$mealPlanCalories = mealPlanCalories;
      result$data['mealPlanCalories'] = l$mealPlanCalories;
    }
    if (_$data.containsKey('mealPlanProtein')) {
      final l$mealPlanProtein = mealPlanProtein;
      result$data['mealPlanProtein'] = l$mealPlanProtein;
    }
    if (_$data.containsKey('mealPlanFat')) {
      final l$mealPlanFat = mealPlanFat;
      result$data['mealPlanFat'] = l$mealPlanFat;
    }
    if (_$data.containsKey('mealPlanCarbs')) {
      final l$mealPlanCarbs = mealPlanCarbs;
      result$data['mealPlanCarbs'] = l$mealPlanCarbs;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateOrderItemNestedInput<Input$updateOrderItemNestedInput>
  get copyWith => CopyWith$Input$updateOrderItemNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateOrderItemNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (_$data.containsKey('mealPlan') !=
        other._$data.containsKey('mealPlan')) {
      return false;
    }
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (_$data.containsKey('quantity') !=
        other._$data.containsKey('quantity')) {
      return false;
    }
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$mealPlanName = mealPlanName;
    final lOther$mealPlanName = other.mealPlanName;
    if (_$data.containsKey('mealPlanName') !=
        other._$data.containsKey('mealPlanName')) {
      return false;
    }
    if (l$mealPlanName != lOther$mealPlanName) {
      return false;
    }
    final l$mealPlanPrice = mealPlanPrice;
    final lOther$mealPlanPrice = other.mealPlanPrice;
    if (_$data.containsKey('mealPlanPrice') !=
        other._$data.containsKey('mealPlanPrice')) {
      return false;
    }
    if (l$mealPlanPrice != lOther$mealPlanPrice) {
      return false;
    }
    final l$mealPlanCalories = mealPlanCalories;
    final lOther$mealPlanCalories = other.mealPlanCalories;
    if (_$data.containsKey('mealPlanCalories') !=
        other._$data.containsKey('mealPlanCalories')) {
      return false;
    }
    if (l$mealPlanCalories != lOther$mealPlanCalories) {
      return false;
    }
    final l$mealPlanProtein = mealPlanProtein;
    final lOther$mealPlanProtein = other.mealPlanProtein;
    if (_$data.containsKey('mealPlanProtein') !=
        other._$data.containsKey('mealPlanProtein')) {
      return false;
    }
    if (l$mealPlanProtein != lOther$mealPlanProtein) {
      return false;
    }
    final l$mealPlanFat = mealPlanFat;
    final lOther$mealPlanFat = other.mealPlanFat;
    if (_$data.containsKey('mealPlanFat') !=
        other._$data.containsKey('mealPlanFat')) {
      return false;
    }
    if (l$mealPlanFat != lOther$mealPlanFat) {
      return false;
    }
    final l$mealPlanCarbs = mealPlanCarbs;
    final lOther$mealPlanCarbs = other.mealPlanCarbs;
    if (_$data.containsKey('mealPlanCarbs') !=
        other._$data.containsKey('mealPlanCarbs')) {
      return false;
    }
    if (l$mealPlanCarbs != lOther$mealPlanCarbs) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$mealPlan = mealPlan;
    final l$quantity = quantity;
    final l$mealPlanName = mealPlanName;
    final l$mealPlanPrice = mealPlanPrice;
    final l$mealPlanCalories = mealPlanCalories;
    final l$mealPlanProtein = mealPlanProtein;
    final l$mealPlanFat = mealPlanFat;
    final l$mealPlanCarbs = mealPlanCarbs;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('mealPlan') ? l$mealPlan : const {},
      _$data.containsKey('quantity') ? l$quantity : const {},
      _$data.containsKey('mealPlanName') ? l$mealPlanName : const {},
      _$data.containsKey('mealPlanPrice') ? l$mealPlanPrice : const {},
      _$data.containsKey('mealPlanCalories') ? l$mealPlanCalories : const {},
      _$data.containsKey('mealPlanProtein') ? l$mealPlanProtein : const {},
      _$data.containsKey('mealPlanFat') ? l$mealPlanFat : const {},
      _$data.containsKey('mealPlanCarbs') ? l$mealPlanCarbs : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateOrderItemNestedInput<TRes> {
  factory CopyWith$Input$updateOrderItemNestedInput(
    Input$updateOrderItemNestedInput instance,
    TRes Function(Input$updateOrderItemNestedInput) then,
  ) = _CopyWithImpl$Input$updateOrderItemNestedInput;

  factory CopyWith$Input$updateOrderItemNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateOrderItemNestedInput;

  TRes call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateOrderItemNestedInput<TRes>
    implements CopyWith$Input$updateOrderItemNestedInput<TRes> {
  _CopyWithImpl$Input$updateOrderItemNestedInput(this._instance, this._then);

  final Input$updateOrderItemNestedInput _instance;

  final TRes Function(Input$updateOrderItemNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? mealPlan = _undefined,
    Object? quantity = _undefined,
    Object? mealPlanName = _undefined,
    Object? mealPlanPrice = _undefined,
    Object? mealPlanCalories = _undefined,
    Object? mealPlanProtein = _undefined,
    Object? mealPlanFat = _undefined,
    Object? mealPlanCarbs = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateOrderItemNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (order != _undefined) 'order': (order as String?),
      if (mealPlan != _undefined) 'mealPlan': (mealPlan as String?),
      if (quantity != _undefined) 'quantity': (quantity as int?),
      if (mealPlanName != _undefined) 'mealPlanName': (mealPlanName as String?),
      if (mealPlanPrice != _undefined) 'mealPlanPrice': (mealPlanPrice as int?),
      if (mealPlanCalories != _undefined)
        'mealPlanCalories': (mealPlanCalories as double?),
      if (mealPlanProtein != _undefined)
        'mealPlanProtein': (mealPlanProtein as double?),
      if (mealPlanFat != _undefined) 'mealPlanFat': (mealPlanFat as double?),
      if (mealPlanCarbs != _undefined)
        'mealPlanCarbs': (mealPlanCarbs as double?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateOrderItemNestedInput<TRes>
    implements CopyWith$Input$updateOrderItemNestedInput<TRes> {
  _CopyWithStubImpl$Input$updateOrderItemNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
    String? clientMutationId,
  }) => _res;
}

class Input$updateDeliveryNestedInput {
  factory Input$updateDeliveryNestedInput({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  }) => Input$updateDeliveryNestedInput._({
    if (id != null) r'id': id,
    if (courier != null) r'courier': courier,
    if (status != null) r'status': status,
    if (deliveryDate != null) r'deliveryDate': deliveryDate,
    if (order != null) r'order': order,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateDeliveryNestedInput._(this._$data);

  factory Input$updateDeliveryNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('courier')) {
      final l$courier = data['courier'];
      result$data['courier'] = (l$courier as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = l$status == null
          ? null
          : fromJson$Enum$DeliveryStatus((l$status as String));
    }
    if (data.containsKey('deliveryDate')) {
      final l$deliveryDate = data['deliveryDate'];
      result$data['deliveryDate'] = (l$deliveryDate as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateDeliveryNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get courier => (_$data['courier'] as String?);

  Enum$DeliveryStatus? get status => (_$data['status'] as Enum$DeliveryStatus?);

  String? get deliveryDate => (_$data['deliveryDate'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('courier')) {
      final l$courier = courier;
      result$data['courier'] = l$courier;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status == null
          ? null
          : toJson$Enum$DeliveryStatus(l$status);
    }
    if (_$data.containsKey('deliveryDate')) {
      final l$deliveryDate = deliveryDate;
      result$data['deliveryDate'] = l$deliveryDate;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateDeliveryNestedInput<Input$updateDeliveryNestedInput>
  get copyWith => CopyWith$Input$updateDeliveryNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateDeliveryNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$courier = courier;
    final lOther$courier = other.courier;
    if (_$data.containsKey('courier') != other._$data.containsKey('courier')) {
      return false;
    }
    if (l$courier != lOther$courier) {
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
    final l$deliveryDate = deliveryDate;
    final lOther$deliveryDate = other.deliveryDate;
    if (_$data.containsKey('deliveryDate') !=
        other._$data.containsKey('deliveryDate')) {
      return false;
    }
    if (l$deliveryDate != lOther$deliveryDate) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$courier = courier;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$order = order;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('courier') ? l$courier : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('deliveryDate') ? l$deliveryDate : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateDeliveryNestedInput<TRes> {
  factory CopyWith$Input$updateDeliveryNestedInput(
    Input$updateDeliveryNestedInput instance,
    TRes Function(Input$updateDeliveryNestedInput) then,
  ) = _CopyWithImpl$Input$updateDeliveryNestedInput;

  factory CopyWith$Input$updateDeliveryNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateDeliveryNestedInput;

  TRes call({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateDeliveryNestedInput<TRes>
    implements CopyWith$Input$updateDeliveryNestedInput<TRes> {
  _CopyWithImpl$Input$updateDeliveryNestedInput(this._instance, this._then);

  final Input$updateDeliveryNestedInput _instance;

  final TRes Function(Input$updateDeliveryNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? courier = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? order = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateDeliveryNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (courier != _undefined) 'courier': (courier as String?),
      if (status != _undefined) 'status': (status as Enum$DeliveryStatus?),
      if (deliveryDate != _undefined) 'deliveryDate': (deliveryDate as String?),
      if (order != _undefined) 'order': (order as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateDeliveryNestedInput<TRes>
    implements CopyWith$Input$updateDeliveryNestedInput<TRes> {
  _CopyWithStubImpl$Input$updateDeliveryNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteOrderInput {
  factory Input$deleteOrderInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteOrderInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteOrderInput._(this._$data);

  factory Input$deleteOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteOrderInput<Input$deleteOrderInput> get copyWith =>
      CopyWith$Input$deleteOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteOrderInput<TRes> {
  factory CopyWith$Input$deleteOrderInput(
    Input$deleteOrderInput instance,
    TRes Function(Input$deleteOrderInput) then,
  ) = _CopyWithImpl$Input$deleteOrderInput;

  factory CopyWith$Input$deleteOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteOrderInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteOrderInput<TRes>
    implements CopyWith$Input$deleteOrderInput<TRes> {
  _CopyWithImpl$Input$deleteOrderInput(this._instance, this._then);

  final Input$deleteOrderInput _instance;

  final TRes Function(Input$deleteOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteOrderInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteOrderInput<TRes>
    implements CopyWith$Input$deleteOrderInput<TRes> {
  _CopyWithStubImpl$Input$deleteOrderInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createOrderInput {
  factory Input$createOrderInput({
    String? customer,
    required Enum$OrderStatus status,
    List<Input$OrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$createDeliveryNestedInput?>? deliveries,
    required int total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    int? deliveryFee,
    required String createdAt,
    String? clientMutationId,
  }) => Input$createOrderInput._({
    if (customer != null) r'customer': customer,
    r'status': status,
    if (orderItems != null) r'orderItems': orderItems,
    if (restaurant != null) r'restaurant': restaurant,
    if (deliveries != null) r'deliveries': deliveries,
    r'total': total,
    if (paymentIntentId != null) r'paymentIntentId': paymentIntentId,
    if (deliveryFirstName != null) r'deliveryFirstName': deliveryFirstName,
    if (deliveryLastName != null) r'deliveryLastName': deliveryLastName,
    if (deliveryPhoneNumber != null)
      r'deliveryPhoneNumber': deliveryPhoneNumber,
    if (deliveryStreet != null) r'deliveryStreet': deliveryStreet,
    if (deliveryApartment != null) r'deliveryApartment': deliveryApartment,
    if (deliveryCity != null) r'deliveryCity': deliveryCity,
    if (deliveryZipCode != null) r'deliveryZipCode': deliveryZipCode,
    if (deliveryFee != null) r'deliveryFee': deliveryFee,
    r'createdAt': createdAt,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createOrderInput._(this._$data);

  factory Input$createOrderInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('customer')) {
      final l$customer = data['customer'];
      result$data['customer'] = (l$customer as String?);
    }
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$OrderStatus((l$status as String));
    if (data.containsKey('orderItems')) {
      final l$orderItems = data['orderItems'];
      result$data['orderItems'] = (l$orderItems as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$OrderItemNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    if (data.containsKey('restaurant')) {
      final l$restaurant = data['restaurant'];
      result$data['restaurant'] = (l$restaurant as String?);
    }
    if (data.containsKey('deliveries')) {
      final l$deliveries = data['deliveries'];
      result$data['deliveries'] = (l$deliveries as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : Input$createDeliveryNestedInput.fromJson(
                    (e as Map<String, dynamic>),
                  ),
          )
          .toList();
    }
    final l$total = data['total'];
    result$data['total'] = (l$total as int);
    if (data.containsKey('paymentIntentId')) {
      final l$paymentIntentId = data['paymentIntentId'];
      result$data['paymentIntentId'] = (l$paymentIntentId as String?);
    }
    if (data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = data['deliveryFirstName'];
      result$data['deliveryFirstName'] = (l$deliveryFirstName as String?);
    }
    if (data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = data['deliveryLastName'];
      result$data['deliveryLastName'] = (l$deliveryLastName as String?);
    }
    if (data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = data['deliveryPhoneNumber'];
      result$data['deliveryPhoneNumber'] = (l$deliveryPhoneNumber as String?);
    }
    if (data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = data['deliveryStreet'];
      result$data['deliveryStreet'] = (l$deliveryStreet as String?);
    }
    if (data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = data['deliveryApartment'];
      result$data['deliveryApartment'] = (l$deliveryApartment as String?);
    }
    if (data.containsKey('deliveryCity')) {
      final l$deliveryCity = data['deliveryCity'];
      result$data['deliveryCity'] = (l$deliveryCity as String?);
    }
    if (data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = data['deliveryZipCode'];
      result$data['deliveryZipCode'] = (l$deliveryZipCode as String?);
    }
    if (data.containsKey('deliveryFee')) {
      final l$deliveryFee = data['deliveryFee'];
      result$data['deliveryFee'] = (l$deliveryFee as int?);
    }
    final l$createdAt = data['createdAt'];
    result$data['createdAt'] = (l$createdAt as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createOrderInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get customer => (_$data['customer'] as String?);

  Enum$OrderStatus get status => (_$data['status'] as Enum$OrderStatus);

  List<Input$OrderItemNestedInput?>? get orderItems =>
      (_$data['orderItems'] as List<Input$OrderItemNestedInput?>?);

  String? get restaurant => (_$data['restaurant'] as String?);

  List<Input$createDeliveryNestedInput?>? get deliveries =>
      (_$data['deliveries'] as List<Input$createDeliveryNestedInput?>?);

  int get total => (_$data['total'] as int);

  String? get paymentIntentId => (_$data['paymentIntentId'] as String?);

  String? get deliveryFirstName => (_$data['deliveryFirstName'] as String?);

  String? get deliveryLastName => (_$data['deliveryLastName'] as String?);

  String? get deliveryPhoneNumber => (_$data['deliveryPhoneNumber'] as String?);

  String? get deliveryStreet => (_$data['deliveryStreet'] as String?);

  String? get deliveryApartment => (_$data['deliveryApartment'] as String?);

  String? get deliveryCity => (_$data['deliveryCity'] as String?);

  String? get deliveryZipCode => (_$data['deliveryZipCode'] as String?);

  int? get deliveryFee => (_$data['deliveryFee'] as int?);

  String get createdAt => (_$data['createdAt'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('customer')) {
      final l$customer = customer;
      result$data['customer'] = l$customer;
    }
    final l$status = status;
    result$data['status'] = toJson$Enum$OrderStatus(l$status);
    if (_$data.containsKey('orderItems')) {
      final l$orderItems = orderItems;
      result$data['orderItems'] = l$orderItems
          ?.map((e) => e?.toJson())
          .toList();
    }
    if (_$data.containsKey('restaurant')) {
      final l$restaurant = restaurant;
      result$data['restaurant'] = l$restaurant;
    }
    if (_$data.containsKey('deliveries')) {
      final l$deliveries = deliveries;
      result$data['deliveries'] = l$deliveries
          ?.map((e) => e?.toJson())
          .toList();
    }
    final l$total = total;
    result$data['total'] = l$total;
    if (_$data.containsKey('paymentIntentId')) {
      final l$paymentIntentId = paymentIntentId;
      result$data['paymentIntentId'] = l$paymentIntentId;
    }
    if (_$data.containsKey('deliveryFirstName')) {
      final l$deliveryFirstName = deliveryFirstName;
      result$data['deliveryFirstName'] = l$deliveryFirstName;
    }
    if (_$data.containsKey('deliveryLastName')) {
      final l$deliveryLastName = deliveryLastName;
      result$data['deliveryLastName'] = l$deliveryLastName;
    }
    if (_$data.containsKey('deliveryPhoneNumber')) {
      final l$deliveryPhoneNumber = deliveryPhoneNumber;
      result$data['deliveryPhoneNumber'] = l$deliveryPhoneNumber;
    }
    if (_$data.containsKey('deliveryStreet')) {
      final l$deliveryStreet = deliveryStreet;
      result$data['deliveryStreet'] = l$deliveryStreet;
    }
    if (_$data.containsKey('deliveryApartment')) {
      final l$deliveryApartment = deliveryApartment;
      result$data['deliveryApartment'] = l$deliveryApartment;
    }
    if (_$data.containsKey('deliveryCity')) {
      final l$deliveryCity = deliveryCity;
      result$data['deliveryCity'] = l$deliveryCity;
    }
    if (_$data.containsKey('deliveryZipCode')) {
      final l$deliveryZipCode = deliveryZipCode;
      result$data['deliveryZipCode'] = l$deliveryZipCode;
    }
    if (_$data.containsKey('deliveryFee')) {
      final l$deliveryFee = deliveryFee;
      result$data['deliveryFee'] = l$deliveryFee;
    }
    final l$createdAt = createdAt;
    result$data['createdAt'] = l$createdAt;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createOrderInput<Input$createOrderInput> get copyWith =>
      CopyWith$Input$createOrderInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createOrderInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (_$data.containsKey('customer') !=
        other._$data.containsKey('customer')) {
      return false;
    }
    if (l$customer != lOther$customer) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$orderItems = orderItems;
    final lOther$orderItems = other.orderItems;
    if (_$data.containsKey('orderItems') !=
        other._$data.containsKey('orderItems')) {
      return false;
    }
    if (l$orderItems != null && lOther$orderItems != null) {
      if (l$orderItems.length != lOther$orderItems.length) {
        return false;
      }
      for (int i = 0; i < l$orderItems.length; i++) {
        final l$orderItems$entry = l$orderItems[i];
        final lOther$orderItems$entry = lOther$orderItems[i];
        if (l$orderItems$entry != lOther$orderItems$entry) {
          return false;
        }
      }
    } else if (l$orderItems != lOther$orderItems) {
      return false;
    }
    final l$restaurant = restaurant;
    final lOther$restaurant = other.restaurant;
    if (_$data.containsKey('restaurant') !=
        other._$data.containsKey('restaurant')) {
      return false;
    }
    if (l$restaurant != lOther$restaurant) {
      return false;
    }
    final l$deliveries = deliveries;
    final lOther$deliveries = other.deliveries;
    if (_$data.containsKey('deliveries') !=
        other._$data.containsKey('deliveries')) {
      return false;
    }
    if (l$deliveries != null && lOther$deliveries != null) {
      if (l$deliveries.length != lOther$deliveries.length) {
        return false;
      }
      for (int i = 0; i < l$deliveries.length; i++) {
        final l$deliveries$entry = l$deliveries[i];
        final lOther$deliveries$entry = lOther$deliveries[i];
        if (l$deliveries$entry != lOther$deliveries$entry) {
          return false;
        }
      }
    } else if (l$deliveries != lOther$deliveries) {
      return false;
    }
    final l$total = total;
    final lOther$total = other.total;
    if (l$total != lOther$total) {
      return false;
    }
    final l$paymentIntentId = paymentIntentId;
    final lOther$paymentIntentId = other.paymentIntentId;
    if (_$data.containsKey('paymentIntentId') !=
        other._$data.containsKey('paymentIntentId')) {
      return false;
    }
    if (l$paymentIntentId != lOther$paymentIntentId) {
      return false;
    }
    final l$deliveryFirstName = deliveryFirstName;
    final lOther$deliveryFirstName = other.deliveryFirstName;
    if (_$data.containsKey('deliveryFirstName') !=
        other._$data.containsKey('deliveryFirstName')) {
      return false;
    }
    if (l$deliveryFirstName != lOther$deliveryFirstName) {
      return false;
    }
    final l$deliveryLastName = deliveryLastName;
    final lOther$deliveryLastName = other.deliveryLastName;
    if (_$data.containsKey('deliveryLastName') !=
        other._$data.containsKey('deliveryLastName')) {
      return false;
    }
    if (l$deliveryLastName != lOther$deliveryLastName) {
      return false;
    }
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final lOther$deliveryPhoneNumber = other.deliveryPhoneNumber;
    if (_$data.containsKey('deliveryPhoneNumber') !=
        other._$data.containsKey('deliveryPhoneNumber')) {
      return false;
    }
    if (l$deliveryPhoneNumber != lOther$deliveryPhoneNumber) {
      return false;
    }
    final l$deliveryStreet = deliveryStreet;
    final lOther$deliveryStreet = other.deliveryStreet;
    if (_$data.containsKey('deliveryStreet') !=
        other._$data.containsKey('deliveryStreet')) {
      return false;
    }
    if (l$deliveryStreet != lOther$deliveryStreet) {
      return false;
    }
    final l$deliveryApartment = deliveryApartment;
    final lOther$deliveryApartment = other.deliveryApartment;
    if (_$data.containsKey('deliveryApartment') !=
        other._$data.containsKey('deliveryApartment')) {
      return false;
    }
    if (l$deliveryApartment != lOther$deliveryApartment) {
      return false;
    }
    final l$deliveryCity = deliveryCity;
    final lOther$deliveryCity = other.deliveryCity;
    if (_$data.containsKey('deliveryCity') !=
        other._$data.containsKey('deliveryCity')) {
      return false;
    }
    if (l$deliveryCity != lOther$deliveryCity) {
      return false;
    }
    final l$deliveryZipCode = deliveryZipCode;
    final lOther$deliveryZipCode = other.deliveryZipCode;
    if (_$data.containsKey('deliveryZipCode') !=
        other._$data.containsKey('deliveryZipCode')) {
      return false;
    }
    if (l$deliveryZipCode != lOther$deliveryZipCode) {
      return false;
    }
    final l$deliveryFee = deliveryFee;
    final lOther$deliveryFee = other.deliveryFee;
    if (_$data.containsKey('deliveryFee') !=
        other._$data.containsKey('deliveryFee')) {
      return false;
    }
    if (l$deliveryFee != lOther$deliveryFee) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$customer = customer;
    final l$status = status;
    final l$orderItems = orderItems;
    final l$restaurant = restaurant;
    final l$deliveries = deliveries;
    final l$total = total;
    final l$paymentIntentId = paymentIntentId;
    final l$deliveryFirstName = deliveryFirstName;
    final l$deliveryLastName = deliveryLastName;
    final l$deliveryPhoneNumber = deliveryPhoneNumber;
    final l$deliveryStreet = deliveryStreet;
    final l$deliveryApartment = deliveryApartment;
    final l$deliveryCity = deliveryCity;
    final l$deliveryZipCode = deliveryZipCode;
    final l$deliveryFee = deliveryFee;
    final l$createdAt = createdAt;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('customer') ? l$customer : const {},
      l$status,
      _$data.containsKey('orderItems')
          ? l$orderItems == null
                ? null
                : Object.hashAll(l$orderItems.map((v) => v))
          : const {},
      _$data.containsKey('restaurant') ? l$restaurant : const {},
      _$data.containsKey('deliveries')
          ? l$deliveries == null
                ? null
                : Object.hashAll(l$deliveries.map((v) => v))
          : const {},
      l$total,
      _$data.containsKey('paymentIntentId') ? l$paymentIntentId : const {},
      _$data.containsKey('deliveryFirstName') ? l$deliveryFirstName : const {},
      _$data.containsKey('deliveryLastName') ? l$deliveryLastName : const {},
      _$data.containsKey('deliveryPhoneNumber')
          ? l$deliveryPhoneNumber
          : const {},
      _$data.containsKey('deliveryStreet') ? l$deliveryStreet : const {},
      _$data.containsKey('deliveryApartment') ? l$deliveryApartment : const {},
      _$data.containsKey('deliveryCity') ? l$deliveryCity : const {},
      _$data.containsKey('deliveryZipCode') ? l$deliveryZipCode : const {},
      _$data.containsKey('deliveryFee') ? l$deliveryFee : const {},
      l$createdAt,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createOrderInput<TRes> {
  factory CopyWith$Input$createOrderInput(
    Input$createOrderInput instance,
    TRes Function(Input$createOrderInput) then,
  ) = _CopyWithImpl$Input$createOrderInput;

  factory CopyWith$Input$createOrderInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createOrderInput;

  TRes call({
    String? customer,
    Enum$OrderStatus? status,
    List<Input$OrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$createDeliveryNestedInput?>? deliveries,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    int? deliveryFee,
    String? createdAt,
    String? clientMutationId,
  });
  TRes orderItems(
    Iterable<Input$OrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$OrderItemNestedInput<Input$OrderItemNestedInput>?
      >?,
    )
    _fn,
  );
  TRes deliveries(
    Iterable<Input$createDeliveryNestedInput?>? Function(
      Iterable<
        CopyWith$Input$createDeliveryNestedInput<
          Input$createDeliveryNestedInput
        >?
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$createOrderInput<TRes>
    implements CopyWith$Input$createOrderInput<TRes> {
  _CopyWithImpl$Input$createOrderInput(this._instance, this._then);

  final Input$createOrderInput _instance;

  final TRes Function(Input$createOrderInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customer = _undefined,
    Object? status = _undefined,
    Object? orderItems = _undefined,
    Object? restaurant = _undefined,
    Object? deliveries = _undefined,
    Object? total = _undefined,
    Object? paymentIntentId = _undefined,
    Object? deliveryFirstName = _undefined,
    Object? deliveryLastName = _undefined,
    Object? deliveryPhoneNumber = _undefined,
    Object? deliveryStreet = _undefined,
    Object? deliveryApartment = _undefined,
    Object? deliveryCity = _undefined,
    Object? deliveryZipCode = _undefined,
    Object? deliveryFee = _undefined,
    Object? createdAt = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createOrderInput._({
      ..._instance._$data,
      if (customer != _undefined) 'customer': (customer as String?),
      if (status != _undefined && status != null)
        'status': (status as Enum$OrderStatus),
      if (orderItems != _undefined)
        'orderItems': (orderItems as List<Input$OrderItemNestedInput?>?),
      if (restaurant != _undefined) 'restaurant': (restaurant as String?),
      if (deliveries != _undefined)
        'deliveries': (deliveries as List<Input$createDeliveryNestedInput?>?),
      if (total != _undefined && total != null) 'total': (total as int),
      if (paymentIntentId != _undefined)
        'paymentIntentId': (paymentIntentId as String?),
      if (deliveryFirstName != _undefined)
        'deliveryFirstName': (deliveryFirstName as String?),
      if (deliveryLastName != _undefined)
        'deliveryLastName': (deliveryLastName as String?),
      if (deliveryPhoneNumber != _undefined)
        'deliveryPhoneNumber': (deliveryPhoneNumber as String?),
      if (deliveryStreet != _undefined)
        'deliveryStreet': (deliveryStreet as String?),
      if (deliveryApartment != _undefined)
        'deliveryApartment': (deliveryApartment as String?),
      if (deliveryCity != _undefined) 'deliveryCity': (deliveryCity as String?),
      if (deliveryZipCode != _undefined)
        'deliveryZipCode': (deliveryZipCode as String?),
      if (deliveryFee != _undefined) 'deliveryFee': (deliveryFee as int?),
      if (createdAt != _undefined && createdAt != null)
        'createdAt': (createdAt as String),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );

  TRes orderItems(
    Iterable<Input$OrderItemNestedInput?>? Function(
      Iterable<
        CopyWith$Input$OrderItemNestedInput<Input$OrderItemNestedInput>?
      >?,
    )
    _fn,
  ) => call(
    orderItems: _fn(
      _instance.orderItems?.map(
        (e) =>
            e == null ? null : CopyWith$Input$OrderItemNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes deliveries(
    Iterable<Input$createDeliveryNestedInput?>? Function(
      Iterable<
        CopyWith$Input$createDeliveryNestedInput<
          Input$createDeliveryNestedInput
        >?
      >?,
    )
    _fn,
  ) => call(
    deliveries: _fn(
      _instance.deliveries?.map(
        (e) => e == null
            ? null
            : CopyWith$Input$createDeliveryNestedInput(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$createOrderInput<TRes>
    implements CopyWith$Input$createOrderInput<TRes> {
  _CopyWithStubImpl$Input$createOrderInput(this._res);

  TRes _res;

  call({
    String? customer,
    Enum$OrderStatus? status,
    List<Input$OrderItemNestedInput?>? orderItems,
    String? restaurant,
    List<Input$createDeliveryNestedInput?>? deliveries,
    int? total,
    String? paymentIntentId,
    String? deliveryFirstName,
    String? deliveryLastName,
    String? deliveryPhoneNumber,
    String? deliveryStreet,
    String? deliveryApartment,
    String? deliveryCity,
    String? deliveryZipCode,
    int? deliveryFee,
    String? createdAt,
    String? clientMutationId,
  }) => _res;

  orderItems(_fn) => _res;

  deliveries(_fn) => _res;
}

class Input$OrderItemNestedInput {
  factory Input$OrderItemNestedInput({
    String? id,
    String? order,
    String? mealPlan,
    required int quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
  }) => Input$OrderItemNestedInput._({
    if (id != null) r'id': id,
    if (order != null) r'order': order,
    if (mealPlan != null) r'mealPlan': mealPlan,
    r'quantity': quantity,
    if (mealPlanName != null) r'mealPlanName': mealPlanName,
    if (mealPlanPrice != null) r'mealPlanPrice': mealPlanPrice,
    if (mealPlanCalories != null) r'mealPlanCalories': mealPlanCalories,
    if (mealPlanProtein != null) r'mealPlanProtein': mealPlanProtein,
    if (mealPlanFat != null) r'mealPlanFat': mealPlanFat,
    if (mealPlanCarbs != null) r'mealPlanCarbs': mealPlanCarbs,
  });

  Input$OrderItemNestedInput._(this._$data);

  factory Input$OrderItemNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('mealPlan')) {
      final l$mealPlan = data['mealPlan'];
      result$data['mealPlan'] = (l$mealPlan as String?);
    }
    final l$quantity = data['quantity'];
    result$data['quantity'] = (l$quantity as int);
    if (data.containsKey('mealPlanName')) {
      final l$mealPlanName = data['mealPlanName'];
      result$data['mealPlanName'] = (l$mealPlanName as String?);
    }
    if (data.containsKey('mealPlanPrice')) {
      final l$mealPlanPrice = data['mealPlanPrice'];
      result$data['mealPlanPrice'] = (l$mealPlanPrice as int?);
    }
    if (data.containsKey('mealPlanCalories')) {
      final l$mealPlanCalories = data['mealPlanCalories'];
      result$data['mealPlanCalories'] = (l$mealPlanCalories as num?)
          ?.toDouble();
    }
    if (data.containsKey('mealPlanProtein')) {
      final l$mealPlanProtein = data['mealPlanProtein'];
      result$data['mealPlanProtein'] = (l$mealPlanProtein as num?)?.toDouble();
    }
    if (data.containsKey('mealPlanFat')) {
      final l$mealPlanFat = data['mealPlanFat'];
      result$data['mealPlanFat'] = (l$mealPlanFat as num?)?.toDouble();
    }
    if (data.containsKey('mealPlanCarbs')) {
      final l$mealPlanCarbs = data['mealPlanCarbs'];
      result$data['mealPlanCarbs'] = (l$mealPlanCarbs as num?)?.toDouble();
    }
    return Input$OrderItemNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get order => (_$data['order'] as String?);

  String? get mealPlan => (_$data['mealPlan'] as String?);

  int get quantity => (_$data['quantity'] as int);

  String? get mealPlanName => (_$data['mealPlanName'] as String?);

  int? get mealPlanPrice => (_$data['mealPlanPrice'] as int?);

  double? get mealPlanCalories => (_$data['mealPlanCalories'] as double?);

  double? get mealPlanProtein => (_$data['mealPlanProtein'] as double?);

  double? get mealPlanFat => (_$data['mealPlanFat'] as double?);

  double? get mealPlanCarbs => (_$data['mealPlanCarbs'] as double?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('mealPlan')) {
      final l$mealPlan = mealPlan;
      result$data['mealPlan'] = l$mealPlan;
    }
    final l$quantity = quantity;
    result$data['quantity'] = l$quantity;
    if (_$data.containsKey('mealPlanName')) {
      final l$mealPlanName = mealPlanName;
      result$data['mealPlanName'] = l$mealPlanName;
    }
    if (_$data.containsKey('mealPlanPrice')) {
      final l$mealPlanPrice = mealPlanPrice;
      result$data['mealPlanPrice'] = l$mealPlanPrice;
    }
    if (_$data.containsKey('mealPlanCalories')) {
      final l$mealPlanCalories = mealPlanCalories;
      result$data['mealPlanCalories'] = l$mealPlanCalories;
    }
    if (_$data.containsKey('mealPlanProtein')) {
      final l$mealPlanProtein = mealPlanProtein;
      result$data['mealPlanProtein'] = l$mealPlanProtein;
    }
    if (_$data.containsKey('mealPlanFat')) {
      final l$mealPlanFat = mealPlanFat;
      result$data['mealPlanFat'] = l$mealPlanFat;
    }
    if (_$data.containsKey('mealPlanCarbs')) {
      final l$mealPlanCarbs = mealPlanCarbs;
      result$data['mealPlanCarbs'] = l$mealPlanCarbs;
    }
    return result$data;
  }

  CopyWith$Input$OrderItemNestedInput<Input$OrderItemNestedInput>
  get copyWith => CopyWith$Input$OrderItemNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$OrderItemNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (_$data.containsKey('mealPlan') !=
        other._$data.containsKey('mealPlan')) {
      return false;
    }
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$mealPlanName = mealPlanName;
    final lOther$mealPlanName = other.mealPlanName;
    if (_$data.containsKey('mealPlanName') !=
        other._$data.containsKey('mealPlanName')) {
      return false;
    }
    if (l$mealPlanName != lOther$mealPlanName) {
      return false;
    }
    final l$mealPlanPrice = mealPlanPrice;
    final lOther$mealPlanPrice = other.mealPlanPrice;
    if (_$data.containsKey('mealPlanPrice') !=
        other._$data.containsKey('mealPlanPrice')) {
      return false;
    }
    if (l$mealPlanPrice != lOther$mealPlanPrice) {
      return false;
    }
    final l$mealPlanCalories = mealPlanCalories;
    final lOther$mealPlanCalories = other.mealPlanCalories;
    if (_$data.containsKey('mealPlanCalories') !=
        other._$data.containsKey('mealPlanCalories')) {
      return false;
    }
    if (l$mealPlanCalories != lOther$mealPlanCalories) {
      return false;
    }
    final l$mealPlanProtein = mealPlanProtein;
    final lOther$mealPlanProtein = other.mealPlanProtein;
    if (_$data.containsKey('mealPlanProtein') !=
        other._$data.containsKey('mealPlanProtein')) {
      return false;
    }
    if (l$mealPlanProtein != lOther$mealPlanProtein) {
      return false;
    }
    final l$mealPlanFat = mealPlanFat;
    final lOther$mealPlanFat = other.mealPlanFat;
    if (_$data.containsKey('mealPlanFat') !=
        other._$data.containsKey('mealPlanFat')) {
      return false;
    }
    if (l$mealPlanFat != lOther$mealPlanFat) {
      return false;
    }
    final l$mealPlanCarbs = mealPlanCarbs;
    final lOther$mealPlanCarbs = other.mealPlanCarbs;
    if (_$data.containsKey('mealPlanCarbs') !=
        other._$data.containsKey('mealPlanCarbs')) {
      return false;
    }
    if (l$mealPlanCarbs != lOther$mealPlanCarbs) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$mealPlan = mealPlan;
    final l$quantity = quantity;
    final l$mealPlanName = mealPlanName;
    final l$mealPlanPrice = mealPlanPrice;
    final l$mealPlanCalories = mealPlanCalories;
    final l$mealPlanProtein = mealPlanProtein;
    final l$mealPlanFat = mealPlanFat;
    final l$mealPlanCarbs = mealPlanCarbs;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('mealPlan') ? l$mealPlan : const {},
      l$quantity,
      _$data.containsKey('mealPlanName') ? l$mealPlanName : const {},
      _$data.containsKey('mealPlanPrice') ? l$mealPlanPrice : const {},
      _$data.containsKey('mealPlanCalories') ? l$mealPlanCalories : const {},
      _$data.containsKey('mealPlanProtein') ? l$mealPlanProtein : const {},
      _$data.containsKey('mealPlanFat') ? l$mealPlanFat : const {},
      _$data.containsKey('mealPlanCarbs') ? l$mealPlanCarbs : const {},
    ]);
  }
}

abstract class CopyWith$Input$OrderItemNestedInput<TRes> {
  factory CopyWith$Input$OrderItemNestedInput(
    Input$OrderItemNestedInput instance,
    TRes Function(Input$OrderItemNestedInput) then,
  ) = _CopyWithImpl$Input$OrderItemNestedInput;

  factory CopyWith$Input$OrderItemNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrderItemNestedInput;

  TRes call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
  });
}

class _CopyWithImpl$Input$OrderItemNestedInput<TRes>
    implements CopyWith$Input$OrderItemNestedInput<TRes> {
  _CopyWithImpl$Input$OrderItemNestedInput(this._instance, this._then);

  final Input$OrderItemNestedInput _instance;

  final TRes Function(Input$OrderItemNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? mealPlan = _undefined,
    Object? quantity = _undefined,
    Object? mealPlanName = _undefined,
    Object? mealPlanPrice = _undefined,
    Object? mealPlanCalories = _undefined,
    Object? mealPlanProtein = _undefined,
    Object? mealPlanFat = _undefined,
    Object? mealPlanCarbs = _undefined,
  }) => _then(
    Input$OrderItemNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (order != _undefined) 'order': (order as String?),
      if (mealPlan != _undefined) 'mealPlan': (mealPlan as String?),
      if (quantity != _undefined && quantity != null)
        'quantity': (quantity as int),
      if (mealPlanName != _undefined) 'mealPlanName': (mealPlanName as String?),
      if (mealPlanPrice != _undefined) 'mealPlanPrice': (mealPlanPrice as int?),
      if (mealPlanCalories != _undefined)
        'mealPlanCalories': (mealPlanCalories as double?),
      if (mealPlanProtein != _undefined)
        'mealPlanProtein': (mealPlanProtein as double?),
      if (mealPlanFat != _undefined) 'mealPlanFat': (mealPlanFat as double?),
      if (mealPlanCarbs != _undefined)
        'mealPlanCarbs': (mealPlanCarbs as double?),
    }),
  );
}

class _CopyWithStubImpl$Input$OrderItemNestedInput<TRes>
    implements CopyWith$Input$OrderItemNestedInput<TRes> {
  _CopyWithStubImpl$Input$OrderItemNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
  }) => _res;
}

class Input$createDeliveryNestedInput {
  factory Input$createDeliveryNestedInput({
    String? id,
    String? courier,
    required Enum$DeliveryStatus status,
    required String deliveryDate,
    String? order,
    String? clientMutationId,
  }) => Input$createDeliveryNestedInput._({
    if (id != null) r'id': id,
    if (courier != null) r'courier': courier,
    r'status': status,
    r'deliveryDate': deliveryDate,
    if (order != null) r'order': order,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createDeliveryNestedInput._(this._$data);

  factory Input$createDeliveryNestedInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('id')) {
      final l$id = data['id'];
      result$data['id'] = (l$id as String?);
    }
    if (data.containsKey('courier')) {
      final l$courier = data['courier'];
      result$data['courier'] = (l$courier as String?);
    }
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$DeliveryStatus((l$status as String));
    final l$deliveryDate = data['deliveryDate'];
    result$data['deliveryDate'] = (l$deliveryDate as String);
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createDeliveryNestedInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get id => (_$data['id'] as String?);

  String? get courier => (_$data['courier'] as String?);

  Enum$DeliveryStatus get status => (_$data['status'] as Enum$DeliveryStatus);

  String get deliveryDate => (_$data['deliveryDate'] as String);

  String? get order => (_$data['order'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('id')) {
      final l$id = id;
      result$data['id'] = l$id;
    }
    if (_$data.containsKey('courier')) {
      final l$courier = courier;
      result$data['courier'] = l$courier;
    }
    final l$status = status;
    result$data['status'] = toJson$Enum$DeliveryStatus(l$status);
    final l$deliveryDate = deliveryDate;
    result$data['deliveryDate'] = l$deliveryDate;
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createDeliveryNestedInput<Input$createDeliveryNestedInput>
  get copyWith => CopyWith$Input$createDeliveryNestedInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createDeliveryNestedInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (_$data.containsKey('id') != other._$data.containsKey('id')) {
      return false;
    }
    if (l$id != lOther$id) {
      return false;
    }
    final l$courier = courier;
    final lOther$courier = other.courier;
    if (_$data.containsKey('courier') != other._$data.containsKey('courier')) {
      return false;
    }
    if (l$courier != lOther$courier) {
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
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$courier = courier;
    final l$status = status;
    final l$deliveryDate = deliveryDate;
    final l$order = order;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      _$data.containsKey('id') ? l$id : const {},
      _$data.containsKey('courier') ? l$courier : const {},
      l$status,
      l$deliveryDate,
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createDeliveryNestedInput<TRes> {
  factory CopyWith$Input$createDeliveryNestedInput(
    Input$createDeliveryNestedInput instance,
    TRes Function(Input$createDeliveryNestedInput) then,
  ) = _CopyWithImpl$Input$createDeliveryNestedInput;

  factory CopyWith$Input$createDeliveryNestedInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createDeliveryNestedInput;

  TRes call({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createDeliveryNestedInput<TRes>
    implements CopyWith$Input$createDeliveryNestedInput<TRes> {
  _CopyWithImpl$Input$createDeliveryNestedInput(this._instance, this._then);

  final Input$createDeliveryNestedInput _instance;

  final TRes Function(Input$createDeliveryNestedInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? courier = _undefined,
    Object? status = _undefined,
    Object? deliveryDate = _undefined,
    Object? order = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createDeliveryNestedInput._({
      ..._instance._$data,
      if (id != _undefined) 'id': (id as String?),
      if (courier != _undefined) 'courier': (courier as String?),
      if (status != _undefined && status != null)
        'status': (status as Enum$DeliveryStatus),
      if (deliveryDate != _undefined && deliveryDate != null)
        'deliveryDate': (deliveryDate as String),
      if (order != _undefined) 'order': (order as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createDeliveryNestedInput<TRes>
    implements CopyWith$Input$createDeliveryNestedInput<TRes> {
  _CopyWithStubImpl$Input$createDeliveryNestedInput(this._res);

  TRes _res;

  call({
    String? id,
    String? courier,
    Enum$DeliveryStatus? status,
    String? deliveryDate,
    String? order,
    String? clientMutationId,
  }) => _res;
}

class Input$updateOrderItemInput {
  factory Input$updateOrderItemInput({
    required String id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
    String? clientMutationId,
  }) => Input$updateOrderItemInput._({
    r'id': id,
    if (order != null) r'order': order,
    if (mealPlan != null) r'mealPlan': mealPlan,
    if (quantity != null) r'quantity': quantity,
    if (mealPlanName != null) r'mealPlanName': mealPlanName,
    if (mealPlanPrice != null) r'mealPlanPrice': mealPlanPrice,
    if (mealPlanCalories != null) r'mealPlanCalories': mealPlanCalories,
    if (mealPlanProtein != null) r'mealPlanProtein': mealPlanProtein,
    if (mealPlanFat != null) r'mealPlanFat': mealPlanFat,
    if (mealPlanCarbs != null) r'mealPlanCarbs': mealPlanCarbs,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateOrderItemInput._(this._$data);

  factory Input$updateOrderItemInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('order')) {
      final l$order = data['order'];
      result$data['order'] = (l$order as String?);
    }
    if (data.containsKey('mealPlan')) {
      final l$mealPlan = data['mealPlan'];
      result$data['mealPlan'] = (l$mealPlan as String?);
    }
    if (data.containsKey('quantity')) {
      final l$quantity = data['quantity'];
      result$data['quantity'] = (l$quantity as int?);
    }
    if (data.containsKey('mealPlanName')) {
      final l$mealPlanName = data['mealPlanName'];
      result$data['mealPlanName'] = (l$mealPlanName as String?);
    }
    if (data.containsKey('mealPlanPrice')) {
      final l$mealPlanPrice = data['mealPlanPrice'];
      result$data['mealPlanPrice'] = (l$mealPlanPrice as int?);
    }
    if (data.containsKey('mealPlanCalories')) {
      final l$mealPlanCalories = data['mealPlanCalories'];
      result$data['mealPlanCalories'] = (l$mealPlanCalories as num?)
          ?.toDouble();
    }
    if (data.containsKey('mealPlanProtein')) {
      final l$mealPlanProtein = data['mealPlanProtein'];
      result$data['mealPlanProtein'] = (l$mealPlanProtein as num?)?.toDouble();
    }
    if (data.containsKey('mealPlanFat')) {
      final l$mealPlanFat = data['mealPlanFat'];
      result$data['mealPlanFat'] = (l$mealPlanFat as num?)?.toDouble();
    }
    if (data.containsKey('mealPlanCarbs')) {
      final l$mealPlanCarbs = data['mealPlanCarbs'];
      result$data['mealPlanCarbs'] = (l$mealPlanCarbs as num?)?.toDouble();
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateOrderItemInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get order => (_$data['order'] as String?);

  String? get mealPlan => (_$data['mealPlan'] as String?);

  int? get quantity => (_$data['quantity'] as int?);

  String? get mealPlanName => (_$data['mealPlanName'] as String?);

  int? get mealPlanPrice => (_$data['mealPlanPrice'] as int?);

  double? get mealPlanCalories => (_$data['mealPlanCalories'] as double?);

  double? get mealPlanProtein => (_$data['mealPlanProtein'] as double?);

  double? get mealPlanFat => (_$data['mealPlanFat'] as double?);

  double? get mealPlanCarbs => (_$data['mealPlanCarbs'] as double?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('order')) {
      final l$order = order;
      result$data['order'] = l$order;
    }
    if (_$data.containsKey('mealPlan')) {
      final l$mealPlan = mealPlan;
      result$data['mealPlan'] = l$mealPlan;
    }
    if (_$data.containsKey('quantity')) {
      final l$quantity = quantity;
      result$data['quantity'] = l$quantity;
    }
    if (_$data.containsKey('mealPlanName')) {
      final l$mealPlanName = mealPlanName;
      result$data['mealPlanName'] = l$mealPlanName;
    }
    if (_$data.containsKey('mealPlanPrice')) {
      final l$mealPlanPrice = mealPlanPrice;
      result$data['mealPlanPrice'] = l$mealPlanPrice;
    }
    if (_$data.containsKey('mealPlanCalories')) {
      final l$mealPlanCalories = mealPlanCalories;
      result$data['mealPlanCalories'] = l$mealPlanCalories;
    }
    if (_$data.containsKey('mealPlanProtein')) {
      final l$mealPlanProtein = mealPlanProtein;
      result$data['mealPlanProtein'] = l$mealPlanProtein;
    }
    if (_$data.containsKey('mealPlanFat')) {
      final l$mealPlanFat = mealPlanFat;
      result$data['mealPlanFat'] = l$mealPlanFat;
    }
    if (_$data.containsKey('mealPlanCarbs')) {
      final l$mealPlanCarbs = mealPlanCarbs;
      result$data['mealPlanCarbs'] = l$mealPlanCarbs;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateOrderItemInput<Input$updateOrderItemInput>
  get copyWith => CopyWith$Input$updateOrderItemInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateOrderItemInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$order = order;
    final lOther$order = other.order;
    if (_$data.containsKey('order') != other._$data.containsKey('order')) {
      return false;
    }
    if (l$order != lOther$order) {
      return false;
    }
    final l$mealPlan = mealPlan;
    final lOther$mealPlan = other.mealPlan;
    if (_$data.containsKey('mealPlan') !=
        other._$data.containsKey('mealPlan')) {
      return false;
    }
    if (l$mealPlan != lOther$mealPlan) {
      return false;
    }
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (_$data.containsKey('quantity') !=
        other._$data.containsKey('quantity')) {
      return false;
    }
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$mealPlanName = mealPlanName;
    final lOther$mealPlanName = other.mealPlanName;
    if (_$data.containsKey('mealPlanName') !=
        other._$data.containsKey('mealPlanName')) {
      return false;
    }
    if (l$mealPlanName != lOther$mealPlanName) {
      return false;
    }
    final l$mealPlanPrice = mealPlanPrice;
    final lOther$mealPlanPrice = other.mealPlanPrice;
    if (_$data.containsKey('mealPlanPrice') !=
        other._$data.containsKey('mealPlanPrice')) {
      return false;
    }
    if (l$mealPlanPrice != lOther$mealPlanPrice) {
      return false;
    }
    final l$mealPlanCalories = mealPlanCalories;
    final lOther$mealPlanCalories = other.mealPlanCalories;
    if (_$data.containsKey('mealPlanCalories') !=
        other._$data.containsKey('mealPlanCalories')) {
      return false;
    }
    if (l$mealPlanCalories != lOther$mealPlanCalories) {
      return false;
    }
    final l$mealPlanProtein = mealPlanProtein;
    final lOther$mealPlanProtein = other.mealPlanProtein;
    if (_$data.containsKey('mealPlanProtein') !=
        other._$data.containsKey('mealPlanProtein')) {
      return false;
    }
    if (l$mealPlanProtein != lOther$mealPlanProtein) {
      return false;
    }
    final l$mealPlanFat = mealPlanFat;
    final lOther$mealPlanFat = other.mealPlanFat;
    if (_$data.containsKey('mealPlanFat') !=
        other._$data.containsKey('mealPlanFat')) {
      return false;
    }
    if (l$mealPlanFat != lOther$mealPlanFat) {
      return false;
    }
    final l$mealPlanCarbs = mealPlanCarbs;
    final lOther$mealPlanCarbs = other.mealPlanCarbs;
    if (_$data.containsKey('mealPlanCarbs') !=
        other._$data.containsKey('mealPlanCarbs')) {
      return false;
    }
    if (l$mealPlanCarbs != lOther$mealPlanCarbs) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$order = order;
    final l$mealPlan = mealPlan;
    final l$quantity = quantity;
    final l$mealPlanName = mealPlanName;
    final l$mealPlanPrice = mealPlanPrice;
    final l$mealPlanCalories = mealPlanCalories;
    final l$mealPlanProtein = mealPlanProtein;
    final l$mealPlanFat = mealPlanFat;
    final l$mealPlanCarbs = mealPlanCarbs;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('order') ? l$order : const {},
      _$data.containsKey('mealPlan') ? l$mealPlan : const {},
      _$data.containsKey('quantity') ? l$quantity : const {},
      _$data.containsKey('mealPlanName') ? l$mealPlanName : const {},
      _$data.containsKey('mealPlanPrice') ? l$mealPlanPrice : const {},
      _$data.containsKey('mealPlanCalories') ? l$mealPlanCalories : const {},
      _$data.containsKey('mealPlanProtein') ? l$mealPlanProtein : const {},
      _$data.containsKey('mealPlanFat') ? l$mealPlanFat : const {},
      _$data.containsKey('mealPlanCarbs') ? l$mealPlanCarbs : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateOrderItemInput<TRes> {
  factory CopyWith$Input$updateOrderItemInput(
    Input$updateOrderItemInput instance,
    TRes Function(Input$updateOrderItemInput) then,
  ) = _CopyWithImpl$Input$updateOrderItemInput;

  factory CopyWith$Input$updateOrderItemInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateOrderItemInput;

  TRes call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateOrderItemInput<TRes>
    implements CopyWith$Input$updateOrderItemInput<TRes> {
  _CopyWithImpl$Input$updateOrderItemInput(this._instance, this._then);

  final Input$updateOrderItemInput _instance;

  final TRes Function(Input$updateOrderItemInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? order = _undefined,
    Object? mealPlan = _undefined,
    Object? quantity = _undefined,
    Object? mealPlanName = _undefined,
    Object? mealPlanPrice = _undefined,
    Object? mealPlanCalories = _undefined,
    Object? mealPlanProtein = _undefined,
    Object? mealPlanFat = _undefined,
    Object? mealPlanCarbs = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateOrderItemInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (order != _undefined) 'order': (order as String?),
      if (mealPlan != _undefined) 'mealPlan': (mealPlan as String?),
      if (quantity != _undefined) 'quantity': (quantity as int?),
      if (mealPlanName != _undefined) 'mealPlanName': (mealPlanName as String?),
      if (mealPlanPrice != _undefined) 'mealPlanPrice': (mealPlanPrice as int?),
      if (mealPlanCalories != _undefined)
        'mealPlanCalories': (mealPlanCalories as double?),
      if (mealPlanProtein != _undefined)
        'mealPlanProtein': (mealPlanProtein as double?),
      if (mealPlanFat != _undefined) 'mealPlanFat': (mealPlanFat as double?),
      if (mealPlanCarbs != _undefined)
        'mealPlanCarbs': (mealPlanCarbs as double?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateOrderItemInput<TRes>
    implements CopyWith$Input$updateOrderItemInput<TRes> {
  _CopyWithStubImpl$Input$updateOrderItemInput(this._res);

  TRes _res;

  call({
    String? id,
    String? order,
    String? mealPlan,
    int? quantity,
    String? mealPlanName,
    int? mealPlanPrice,
    double? mealPlanCalories,
    double? mealPlanProtein,
    double? mealPlanFat,
    double? mealPlanCarbs,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteOrderItemInput {
  factory Input$deleteOrderItemInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteOrderItemInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteOrderItemInput._(this._$data);

  factory Input$deleteOrderItemInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteOrderItemInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteOrderItemInput<Input$deleteOrderItemInput>
  get copyWith => CopyWith$Input$deleteOrderItemInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteOrderItemInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteOrderItemInput<TRes> {
  factory CopyWith$Input$deleteOrderItemInput(
    Input$deleteOrderItemInput instance,
    TRes Function(Input$deleteOrderItemInput) then,
  ) = _CopyWithImpl$Input$deleteOrderItemInput;

  factory CopyWith$Input$deleteOrderItemInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteOrderItemInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteOrderItemInput<TRes>
    implements CopyWith$Input$deleteOrderItemInput<TRes> {
  _CopyWithImpl$Input$deleteOrderItemInput(this._instance, this._then);

  final Input$deleteOrderItemInput _instance;

  final TRes Function(Input$deleteOrderItemInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteOrderItemInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteOrderItemInput<TRes>
    implements CopyWith$Input$deleteOrderItemInput<TRes> {
  _CopyWithStubImpl$Input$deleteOrderItemInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createRestaurantInput {
  factory Input$createRestaurantInput({
    required String name,
    String? description,
    required int deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? owner,
    List<String?>? couriers,
    List<String?>? restaurantCategories,
    String? clientMutationId,
  }) => Input$createRestaurantInput._({
    r'name': name,
    if (description != null) r'description': description,
    r'deliveryPrice': deliveryPrice,
    if (phoneNumber != null) r'phoneNumber': phoneNumber,
    if (email != null) r'email': email,
    if (city != null) r'city': city,
    if (street != null) r'street': street,
    if (zipCode != null) r'zipCode': zipCode,
    if (nip != null) r'nip': nip,
    if (owner != null) r'owner': owner,
    if (couriers != null) r'couriers': couriers,
    if (restaurantCategories != null)
      r'restaurantCategories': restaurantCategories,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createRestaurantInput._(this._$data);

  factory Input$createRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$deliveryPrice = data['deliveryPrice'];
    result$data['deliveryPrice'] = (l$deliveryPrice as int);
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('street')) {
      final l$street = data['street'];
      result$data['street'] = (l$street as String?);
    }
    if (data.containsKey('zipCode')) {
      final l$zipCode = data['zipCode'];
      result$data['zipCode'] = (l$zipCode as String?);
    }
    if (data.containsKey('nip')) {
      final l$nip = data['nip'];
      result$data['nip'] = (l$nip as String?);
    }
    if (data.containsKey('owner')) {
      final l$owner = data['owner'];
      result$data['owner'] = (l$owner as String?);
    }
    if (data.containsKey('couriers')) {
      final l$couriers = data['couriers'];
      result$data['couriers'] = (l$couriers as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('restaurantCategories')) {
      final l$restaurantCategories = data['restaurantCategories'];
      result$data['restaurantCategories'] =
          (l$restaurantCategories as List<dynamic>?)
              ?.map((e) => (e as String?))
              .toList();
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get description => (_$data['description'] as String?);

  int get deliveryPrice => (_$data['deliveryPrice'] as int);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get city => (_$data['city'] as String?);

  String? get street => (_$data['street'] as String?);

  String? get zipCode => (_$data['zipCode'] as String?);

  String? get nip => (_$data['nip'] as String?);

  String? get owner => (_$data['owner'] as String?);

  List<String?>? get couriers => (_$data['couriers'] as List<String?>?);

  List<String?>? get restaurantCategories =>
      (_$data['restaurantCategories'] as List<String?>?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$deliveryPrice = deliveryPrice;
    result$data['deliveryPrice'] = l$deliveryPrice;
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('street')) {
      final l$street = street;
      result$data['street'] = l$street;
    }
    if (_$data.containsKey('zipCode')) {
      final l$zipCode = zipCode;
      result$data['zipCode'] = l$zipCode;
    }
    if (_$data.containsKey('nip')) {
      final l$nip = nip;
      result$data['nip'] = l$nip;
    }
    if (_$data.containsKey('owner')) {
      final l$owner = owner;
      result$data['owner'] = l$owner;
    }
    if (_$data.containsKey('couriers')) {
      final l$couriers = couriers;
      result$data['couriers'] = l$couriers?.map((e) => e).toList();
    }
    if (_$data.containsKey('restaurantCategories')) {
      final l$restaurantCategories = restaurantCategories;
      result$data['restaurantCategories'] = l$restaurantCategories
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createRestaurantInput<Input$createRestaurantInput>
  get copyWith => CopyWith$Input$createRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createRestaurantInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$deliveryPrice = deliveryPrice;
    final lOther$deliveryPrice = other.deliveryPrice;
    if (l$deliveryPrice != lOther$deliveryPrice) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (_$data.containsKey('street') != other._$data.containsKey('street')) {
      return false;
    }
    if (l$street != lOther$street) {
      return false;
    }
    final l$zipCode = zipCode;
    final lOther$zipCode = other.zipCode;
    if (_$data.containsKey('zipCode') != other._$data.containsKey('zipCode')) {
      return false;
    }
    if (l$zipCode != lOther$zipCode) {
      return false;
    }
    final l$nip = nip;
    final lOther$nip = other.nip;
    if (_$data.containsKey('nip') != other._$data.containsKey('nip')) {
      return false;
    }
    if (l$nip != lOther$nip) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (_$data.containsKey('owner') != other._$data.containsKey('owner')) {
      return false;
    }
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$couriers = couriers;
    final lOther$couriers = other.couriers;
    if (_$data.containsKey('couriers') !=
        other._$data.containsKey('couriers')) {
      return false;
    }
    if (l$couriers != null && lOther$couriers != null) {
      if (l$couriers.length != lOther$couriers.length) {
        return false;
      }
      for (int i = 0; i < l$couriers.length; i++) {
        final l$couriers$entry = l$couriers[i];
        final lOther$couriers$entry = lOther$couriers[i];
        if (l$couriers$entry != lOther$couriers$entry) {
          return false;
        }
      }
    } else if (l$couriers != lOther$couriers) {
      return false;
    }
    final l$restaurantCategories = restaurantCategories;
    final lOther$restaurantCategories = other.restaurantCategories;
    if (_$data.containsKey('restaurantCategories') !=
        other._$data.containsKey('restaurantCategories')) {
      return false;
    }
    if (l$restaurantCategories != null && lOther$restaurantCategories != null) {
      if (l$restaurantCategories.length != lOther$restaurantCategories.length) {
        return false;
      }
      for (int i = 0; i < l$restaurantCategories.length; i++) {
        final l$restaurantCategories$entry = l$restaurantCategories[i];
        final lOther$restaurantCategories$entry =
            lOther$restaurantCategories[i];
        if (l$restaurantCategories$entry != lOther$restaurantCategories$entry) {
          return false;
        }
      }
    } else if (l$restaurantCategories != lOther$restaurantCategories) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$description = description;
    final l$deliveryPrice = deliveryPrice;
    final l$phoneNumber = phoneNumber;
    final l$email = email;
    final l$city = city;
    final l$street = street;
    final l$zipCode = zipCode;
    final l$nip = nip;
    final l$owner = owner;
    final l$couriers = couriers;
    final l$restaurantCategories = restaurantCategories;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('description') ? l$description : const {},
      l$deliveryPrice,
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('street') ? l$street : const {},
      _$data.containsKey('zipCode') ? l$zipCode : const {},
      _$data.containsKey('nip') ? l$nip : const {},
      _$data.containsKey('owner') ? l$owner : const {},
      _$data.containsKey('couriers')
          ? l$couriers == null
                ? null
                : Object.hashAll(l$couriers.map((v) => v))
          : const {},
      _$data.containsKey('restaurantCategories')
          ? l$restaurantCategories == null
                ? null
                : Object.hashAll(l$restaurantCategories.map((v) => v))
          : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createRestaurantInput<TRes> {
  factory CopyWith$Input$createRestaurantInput(
    Input$createRestaurantInput instance,
    TRes Function(Input$createRestaurantInput) then,
  ) = _CopyWithImpl$Input$createRestaurantInput;

  factory CopyWith$Input$createRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createRestaurantInput;

  TRes call({
    String? name,
    String? description,
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? owner,
    List<String?>? couriers,
    List<String?>? restaurantCategories,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$createRestaurantInput<TRes>
    implements CopyWith$Input$createRestaurantInput<TRes> {
  _CopyWithImpl$Input$createRestaurantInput(this._instance, this._then);

  final Input$createRestaurantInput _instance;

  final TRes Function(Input$createRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? description = _undefined,
    Object? deliveryPrice = _undefined,
    Object? phoneNumber = _undefined,
    Object? email = _undefined,
    Object? city = _undefined,
    Object? street = _undefined,
    Object? zipCode = _undefined,
    Object? nip = _undefined,
    Object? owner = _undefined,
    Object? couriers = _undefined,
    Object? restaurantCategories = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createRestaurantInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (description != _undefined) 'description': (description as String?),
      if (deliveryPrice != _undefined && deliveryPrice != null)
        'deliveryPrice': (deliveryPrice as int),
      if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
      if (email != _undefined) 'email': (email as String?),
      if (city != _undefined) 'city': (city as String?),
      if (street != _undefined) 'street': (street as String?),
      if (zipCode != _undefined) 'zipCode': (zipCode as String?),
      if (nip != _undefined) 'nip': (nip as String?),
      if (owner != _undefined) 'owner': (owner as String?),
      if (couriers != _undefined) 'couriers': (couriers as List<String?>?),
      if (restaurantCategories != _undefined)
        'restaurantCategories': (restaurantCategories as List<String?>?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createRestaurantInput<TRes>
    implements CopyWith$Input$createRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$createRestaurantInput(this._res);

  TRes _res;

  call({
    String? name,
    String? description,
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? owner,
    List<String?>? couriers,
    List<String?>? restaurantCategories,
    String? clientMutationId,
  }) => _res;
}

class Input$updateRestaurantInput {
  factory Input$updateRestaurantInput({
    required String id,
    String? name,
    String? description,
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? owner,
    List<String?>? couriers,
    List<String?>? restaurantCategories,
    String? clientMutationId,
  }) => Input$updateRestaurantInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (description != null) r'description': description,
    if (deliveryPrice != null) r'deliveryPrice': deliveryPrice,
    if (phoneNumber != null) r'phoneNumber': phoneNumber,
    if (email != null) r'email': email,
    if (city != null) r'city': city,
    if (street != null) r'street': street,
    if (zipCode != null) r'zipCode': zipCode,
    if (nip != null) r'nip': nip,
    if (owner != null) r'owner': owner,
    if (couriers != null) r'couriers': couriers,
    if (restaurantCategories != null)
      r'restaurantCategories': restaurantCategories,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateRestaurantInput._(this._$data);

  factory Input$updateRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('deliveryPrice')) {
      final l$deliveryPrice = data['deliveryPrice'];
      result$data['deliveryPrice'] = (l$deliveryPrice as int?);
    }
    if (data.containsKey('phoneNumber')) {
      final l$phoneNumber = data['phoneNumber'];
      result$data['phoneNumber'] = (l$phoneNumber as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('city')) {
      final l$city = data['city'];
      result$data['city'] = (l$city as String?);
    }
    if (data.containsKey('street')) {
      final l$street = data['street'];
      result$data['street'] = (l$street as String?);
    }
    if (data.containsKey('zipCode')) {
      final l$zipCode = data['zipCode'];
      result$data['zipCode'] = (l$zipCode as String?);
    }
    if (data.containsKey('nip')) {
      final l$nip = data['nip'];
      result$data['nip'] = (l$nip as String?);
    }
    if (data.containsKey('owner')) {
      final l$owner = data['owner'];
      result$data['owner'] = (l$owner as String?);
    }
    if (data.containsKey('couriers')) {
      final l$couriers = data['couriers'];
      result$data['couriers'] = (l$couriers as List<dynamic>?)
          ?.map((e) => (e as String?))
          .toList();
    }
    if (data.containsKey('restaurantCategories')) {
      final l$restaurantCategories = data['restaurantCategories'];
      result$data['restaurantCategories'] =
          (l$restaurantCategories as List<dynamic>?)
              ?.map((e) => (e as String?))
              .toList();
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get description => (_$data['description'] as String?);

  int? get deliveryPrice => (_$data['deliveryPrice'] as int?);

  String? get phoneNumber => (_$data['phoneNumber'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get city => (_$data['city'] as String?);

  String? get street => (_$data['street'] as String?);

  String? get zipCode => (_$data['zipCode'] as String?);

  String? get nip => (_$data['nip'] as String?);

  String? get owner => (_$data['owner'] as String?);

  List<String?>? get couriers => (_$data['couriers'] as List<String?>?);

  List<String?>? get restaurantCategories =>
      (_$data['restaurantCategories'] as List<String?>?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('deliveryPrice')) {
      final l$deliveryPrice = deliveryPrice;
      result$data['deliveryPrice'] = l$deliveryPrice;
    }
    if (_$data.containsKey('phoneNumber')) {
      final l$phoneNumber = phoneNumber;
      result$data['phoneNumber'] = l$phoneNumber;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('city')) {
      final l$city = city;
      result$data['city'] = l$city;
    }
    if (_$data.containsKey('street')) {
      final l$street = street;
      result$data['street'] = l$street;
    }
    if (_$data.containsKey('zipCode')) {
      final l$zipCode = zipCode;
      result$data['zipCode'] = l$zipCode;
    }
    if (_$data.containsKey('nip')) {
      final l$nip = nip;
      result$data['nip'] = l$nip;
    }
    if (_$data.containsKey('owner')) {
      final l$owner = owner;
      result$data['owner'] = l$owner;
    }
    if (_$data.containsKey('couriers')) {
      final l$couriers = couriers;
      result$data['couriers'] = l$couriers?.map((e) => e).toList();
    }
    if (_$data.containsKey('restaurantCategories')) {
      final l$restaurantCategories = restaurantCategories;
      result$data['restaurantCategories'] = l$restaurantCategories
          ?.map((e) => e)
          .toList();
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateRestaurantInput<Input$updateRestaurantInput>
  get copyWith => CopyWith$Input$updateRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateRestaurantInput ||
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
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$deliveryPrice = deliveryPrice;
    final lOther$deliveryPrice = other.deliveryPrice;
    if (_$data.containsKey('deliveryPrice') !=
        other._$data.containsKey('deliveryPrice')) {
      return false;
    }
    if (l$deliveryPrice != lOther$deliveryPrice) {
      return false;
    }
    final l$phoneNumber = phoneNumber;
    final lOther$phoneNumber = other.phoneNumber;
    if (_$data.containsKey('phoneNumber') !=
        other._$data.containsKey('phoneNumber')) {
      return false;
    }
    if (l$phoneNumber != lOther$phoneNumber) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (_$data.containsKey('city') != other._$data.containsKey('city')) {
      return false;
    }
    if (l$city != lOther$city) {
      return false;
    }
    final l$street = street;
    final lOther$street = other.street;
    if (_$data.containsKey('street') != other._$data.containsKey('street')) {
      return false;
    }
    if (l$street != lOther$street) {
      return false;
    }
    final l$zipCode = zipCode;
    final lOther$zipCode = other.zipCode;
    if (_$data.containsKey('zipCode') != other._$data.containsKey('zipCode')) {
      return false;
    }
    if (l$zipCode != lOther$zipCode) {
      return false;
    }
    final l$nip = nip;
    final lOther$nip = other.nip;
    if (_$data.containsKey('nip') != other._$data.containsKey('nip')) {
      return false;
    }
    if (l$nip != lOther$nip) {
      return false;
    }
    final l$owner = owner;
    final lOther$owner = other.owner;
    if (_$data.containsKey('owner') != other._$data.containsKey('owner')) {
      return false;
    }
    if (l$owner != lOther$owner) {
      return false;
    }
    final l$couriers = couriers;
    final lOther$couriers = other.couriers;
    if (_$data.containsKey('couriers') !=
        other._$data.containsKey('couriers')) {
      return false;
    }
    if (l$couriers != null && lOther$couriers != null) {
      if (l$couriers.length != lOther$couriers.length) {
        return false;
      }
      for (int i = 0; i < l$couriers.length; i++) {
        final l$couriers$entry = l$couriers[i];
        final lOther$couriers$entry = lOther$couriers[i];
        if (l$couriers$entry != lOther$couriers$entry) {
          return false;
        }
      }
    } else if (l$couriers != lOther$couriers) {
      return false;
    }
    final l$restaurantCategories = restaurantCategories;
    final lOther$restaurantCategories = other.restaurantCategories;
    if (_$data.containsKey('restaurantCategories') !=
        other._$data.containsKey('restaurantCategories')) {
      return false;
    }
    if (l$restaurantCategories != null && lOther$restaurantCategories != null) {
      if (l$restaurantCategories.length != lOther$restaurantCategories.length) {
        return false;
      }
      for (int i = 0; i < l$restaurantCategories.length; i++) {
        final l$restaurantCategories$entry = l$restaurantCategories[i];
        final lOther$restaurantCategories$entry =
            lOther$restaurantCategories[i];
        if (l$restaurantCategories$entry != lOther$restaurantCategories$entry) {
          return false;
        }
      }
    } else if (l$restaurantCategories != lOther$restaurantCategories) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$description = description;
    final l$deliveryPrice = deliveryPrice;
    final l$phoneNumber = phoneNumber;
    final l$email = email;
    final l$city = city;
    final l$street = street;
    final l$zipCode = zipCode;
    final l$nip = nip;
    final l$owner = owner;
    final l$couriers = couriers;
    final l$restaurantCategories = restaurantCategories;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('deliveryPrice') ? l$deliveryPrice : const {},
      _$data.containsKey('phoneNumber') ? l$phoneNumber : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('city') ? l$city : const {},
      _$data.containsKey('street') ? l$street : const {},
      _$data.containsKey('zipCode') ? l$zipCode : const {},
      _$data.containsKey('nip') ? l$nip : const {},
      _$data.containsKey('owner') ? l$owner : const {},
      _$data.containsKey('couriers')
          ? l$couriers == null
                ? null
                : Object.hashAll(l$couriers.map((v) => v))
          : const {},
      _$data.containsKey('restaurantCategories')
          ? l$restaurantCategories == null
                ? null
                : Object.hashAll(l$restaurantCategories.map((v) => v))
          : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateRestaurantInput<TRes> {
  factory CopyWith$Input$updateRestaurantInput(
    Input$updateRestaurantInput instance,
    TRes Function(Input$updateRestaurantInput) then,
  ) = _CopyWithImpl$Input$updateRestaurantInput;

  factory CopyWith$Input$updateRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateRestaurantInput;

  TRes call({
    String? id,
    String? name,
    String? description,
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? owner,
    List<String?>? couriers,
    List<String?>? restaurantCategories,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateRestaurantInput<TRes>
    implements CopyWith$Input$updateRestaurantInput<TRes> {
  _CopyWithImpl$Input$updateRestaurantInput(this._instance, this._then);

  final Input$updateRestaurantInput _instance;

  final TRes Function(Input$updateRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? description = _undefined,
    Object? deliveryPrice = _undefined,
    Object? phoneNumber = _undefined,
    Object? email = _undefined,
    Object? city = _undefined,
    Object? street = _undefined,
    Object? zipCode = _undefined,
    Object? nip = _undefined,
    Object? owner = _undefined,
    Object? couriers = _undefined,
    Object? restaurantCategories = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateRestaurantInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (description != _undefined) 'description': (description as String?),
      if (deliveryPrice != _undefined) 'deliveryPrice': (deliveryPrice as int?),
      if (phoneNumber != _undefined) 'phoneNumber': (phoneNumber as String?),
      if (email != _undefined) 'email': (email as String?),
      if (city != _undefined) 'city': (city as String?),
      if (street != _undefined) 'street': (street as String?),
      if (zipCode != _undefined) 'zipCode': (zipCode as String?),
      if (nip != _undefined) 'nip': (nip as String?),
      if (owner != _undefined) 'owner': (owner as String?),
      if (couriers != _undefined) 'couriers': (couriers as List<String?>?),
      if (restaurantCategories != _undefined)
        'restaurantCategories': (restaurantCategories as List<String?>?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateRestaurantInput<TRes>
    implements CopyWith$Input$updateRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$updateRestaurantInput(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? description,
    int? deliveryPrice,
    String? phoneNumber,
    String? email,
    String? city,
    String? street,
    String? zipCode,
    String? nip,
    String? owner,
    List<String?>? couriers,
    List<String?>? restaurantCategories,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteRestaurantInput {
  factory Input$deleteRestaurantInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteRestaurantInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteRestaurantInput._(this._$data);

  factory Input$deleteRestaurantInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteRestaurantInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteRestaurantInput<Input$deleteRestaurantInput>
  get copyWith => CopyWith$Input$deleteRestaurantInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteRestaurantInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteRestaurantInput<TRes> {
  factory CopyWith$Input$deleteRestaurantInput(
    Input$deleteRestaurantInput instance,
    TRes Function(Input$deleteRestaurantInput) then,
  ) = _CopyWithImpl$Input$deleteRestaurantInput;

  factory CopyWith$Input$deleteRestaurantInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteRestaurantInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteRestaurantInput<TRes>
    implements CopyWith$Input$deleteRestaurantInput<TRes> {
  _CopyWithImpl$Input$deleteRestaurantInput(this._instance, this._then);

  final Input$deleteRestaurantInput _instance;

  final TRes Function(Input$deleteRestaurantInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteRestaurantInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteRestaurantInput<TRes>
    implements CopyWith$Input$deleteRestaurantInput<TRes> {
  _CopyWithStubImpl$Input$deleteRestaurantInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$createRestaurantCategoryInput {
  factory Input$createRestaurantCategoryInput({
    required String name,
    String? clientMutationId,
  }) => Input$createRestaurantCategoryInput._({
    r'name': name,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$createRestaurantCategoryInput._(this._$data);

  factory Input$createRestaurantCategoryInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$createRestaurantCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$createRestaurantCategoryInput<
    Input$createRestaurantCategoryInput
  >
  get copyWith => CopyWith$Input$createRestaurantCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$createRestaurantCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$name,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$createRestaurantCategoryInput<TRes> {
  factory CopyWith$Input$createRestaurantCategoryInput(
    Input$createRestaurantCategoryInput instance,
    TRes Function(Input$createRestaurantCategoryInput) then,
  ) = _CopyWithImpl$Input$createRestaurantCategoryInput;

  factory CopyWith$Input$createRestaurantCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$createRestaurantCategoryInput;

  TRes call({String? name, String? clientMutationId});
}

class _CopyWithImpl$Input$createRestaurantCategoryInput<TRes>
    implements CopyWith$Input$createRestaurantCategoryInput<TRes> {
  _CopyWithImpl$Input$createRestaurantCategoryInput(this._instance, this._then);

  final Input$createRestaurantCategoryInput _instance;

  final TRes Function(Input$createRestaurantCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$createRestaurantCategoryInput._({
      ..._instance._$data,
      if (name != _undefined && name != null) 'name': (name as String),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$createRestaurantCategoryInput<TRes>
    implements CopyWith$Input$createRestaurantCategoryInput<TRes> {
  _CopyWithStubImpl$Input$createRestaurantCategoryInput(this._res);

  TRes _res;

  call({String? name, String? clientMutationId}) => _res;
}

class Input$updateRestaurantCategoryInput {
  factory Input$updateRestaurantCategoryInput({
    required String id,
    String? name,
    String? clientMutationId,
  }) => Input$updateRestaurantCategoryInput._({
    r'id': id,
    if (name != null) r'name': name,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateRestaurantCategoryInput._(this._$data);

  factory Input$updateRestaurantCategoryInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateRestaurantCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateRestaurantCategoryInput<
    Input$updateRestaurantCategoryInput
  >
  get copyWith => CopyWith$Input$updateRestaurantCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateRestaurantCategoryInput ||
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
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateRestaurantCategoryInput<TRes> {
  factory CopyWith$Input$updateRestaurantCategoryInput(
    Input$updateRestaurantCategoryInput instance,
    TRes Function(Input$updateRestaurantCategoryInput) then,
  ) = _CopyWithImpl$Input$updateRestaurantCategoryInput;

  factory CopyWith$Input$updateRestaurantCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateRestaurantCategoryInput;

  TRes call({String? id, String? name, String? clientMutationId});
}

class _CopyWithImpl$Input$updateRestaurantCategoryInput<TRes>
    implements CopyWith$Input$updateRestaurantCategoryInput<TRes> {
  _CopyWithImpl$Input$updateRestaurantCategoryInput(this._instance, this._then);

  final Input$updateRestaurantCategoryInput _instance;

  final TRes Function(Input$updateRestaurantCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateRestaurantCategoryInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateRestaurantCategoryInput<TRes>
    implements CopyWith$Input$updateRestaurantCategoryInput<TRes> {
  _CopyWithStubImpl$Input$updateRestaurantCategoryInput(this._res);

  TRes _res;

  call({String? id, String? name, String? clientMutationId}) => _res;
}

class Input$deleteRestaurantCategoryInput {
  factory Input$deleteRestaurantCategoryInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteRestaurantCategoryInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteRestaurantCategoryInput._(this._$data);

  factory Input$deleteRestaurantCategoryInput.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteRestaurantCategoryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteRestaurantCategoryInput<
    Input$deleteRestaurantCategoryInput
  >
  get copyWith => CopyWith$Input$deleteRestaurantCategoryInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteRestaurantCategoryInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteRestaurantCategoryInput<TRes> {
  factory CopyWith$Input$deleteRestaurantCategoryInput(
    Input$deleteRestaurantCategoryInput instance,
    TRes Function(Input$deleteRestaurantCategoryInput) then,
  ) = _CopyWithImpl$Input$deleteRestaurantCategoryInput;

  factory CopyWith$Input$deleteRestaurantCategoryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteRestaurantCategoryInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteRestaurantCategoryInput<TRes>
    implements CopyWith$Input$deleteRestaurantCategoryInput<TRes> {
  _CopyWithImpl$Input$deleteRestaurantCategoryInput(this._instance, this._then);

  final Input$deleteRestaurantCategoryInput _instance;

  final TRes Function(Input$deleteRestaurantCategoryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteRestaurantCategoryInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteRestaurantCategoryInput<TRes>
    implements CopyWith$Input$deleteRestaurantCategoryInput<TRes> {
  _CopyWithStubImpl$Input$deleteRestaurantCategoryInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

class Input$updateUserInput {
  factory Input$updateUserInput({
    required String id,
    String? email,
    List<dynamic>? roles,
    String? clientMutationId,
  }) => Input$updateUserInput._({
    r'id': id,
    if (email != null) r'email': email,
    if (roles != null) r'roles': roles,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$updateUserInput._(this._$data);

  factory Input$updateUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('roles')) {
      final l$roles = data['roles'];
      result$data['roles'] = (l$roles as List<dynamic>?);
    }
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$updateUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get email => (_$data['email'] as String?);

  List<dynamic>? get roles => (_$data['roles'] as List<dynamic>?);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('roles')) {
      final l$roles = roles;
      result$data['roles'] = l$roles;
    }
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$updateUserInput<Input$updateUserInput> get copyWith =>
      CopyWith$Input$updateUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$updateUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$roles = roles;
    final lOther$roles = other.roles;
    if (_$data.containsKey('roles') != other._$data.containsKey('roles')) {
      return false;
    }
    if (l$roles != lOther$roles) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$roles = roles;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('roles') ? l$roles : const {},
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$updateUserInput<TRes> {
  factory CopyWith$Input$updateUserInput(
    Input$updateUserInput instance,
    TRes Function(Input$updateUserInput) then,
  ) = _CopyWithImpl$Input$updateUserInput;

  factory CopyWith$Input$updateUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$updateUserInput;

  TRes call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? clientMutationId,
  });
}

class _CopyWithImpl$Input$updateUserInput<TRes>
    implements CopyWith$Input$updateUserInput<TRes> {
  _CopyWithImpl$Input$updateUserInput(this._instance, this._then);

  final Input$updateUserInput _instance;

  final TRes Function(Input$updateUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? roles = _undefined,
    Object? clientMutationId = _undefined,
  }) => _then(
    Input$updateUserInput._({
      ..._instance._$data,
      if (id != _undefined && id != null) 'id': (id as String),
      if (email != _undefined) 'email': (email as String?),
      if (roles != _undefined) 'roles': (roles as List<dynamic>?),
      if (clientMutationId != _undefined)
        'clientMutationId': (clientMutationId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$updateUserInput<TRes>
    implements CopyWith$Input$updateUserInput<TRes> {
  _CopyWithStubImpl$Input$updateUserInput(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    List<dynamic>? roles,
    String? clientMutationId,
  }) => _res;
}

class Input$deleteUserInput {
  factory Input$deleteUserInput({
    required String id,
    String? clientMutationId,
  }) => Input$deleteUserInput._({
    r'id': id,
    if (clientMutationId != null) r'clientMutationId': clientMutationId,
  });

  Input$deleteUserInput._(this._$data);

  factory Input$deleteUserInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('clientMutationId')) {
      final l$clientMutationId = data['clientMutationId'];
      result$data['clientMutationId'] = (l$clientMutationId as String?);
    }
    return Input$deleteUserInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get clientMutationId => (_$data['clientMutationId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('clientMutationId')) {
      final l$clientMutationId = clientMutationId;
      result$data['clientMutationId'] = l$clientMutationId;
    }
    return result$data;
  }

  CopyWith$Input$deleteUserInput<Input$deleteUserInput> get copyWith =>
      CopyWith$Input$deleteUserInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$deleteUserInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$clientMutationId = clientMutationId;
    final lOther$clientMutationId = other.clientMutationId;
    if (_$data.containsKey('clientMutationId') !=
        other._$data.containsKey('clientMutationId')) {
      return false;
    }
    if (l$clientMutationId != lOther$clientMutationId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$clientMutationId = clientMutationId;
    return Object.hashAll([
      l$id,
      _$data.containsKey('clientMutationId') ? l$clientMutationId : const {},
    ]);
  }
}

abstract class CopyWith$Input$deleteUserInput<TRes> {
  factory CopyWith$Input$deleteUserInput(
    Input$deleteUserInput instance,
    TRes Function(Input$deleteUserInput) then,
  ) = _CopyWithImpl$Input$deleteUserInput;

  factory CopyWith$Input$deleteUserInput.stub(TRes res) =
      _CopyWithStubImpl$Input$deleteUserInput;

  TRes call({String? id, String? clientMutationId});
}

class _CopyWithImpl$Input$deleteUserInput<TRes>
    implements CopyWith$Input$deleteUserInput<TRes> {
  _CopyWithImpl$Input$deleteUserInput(this._instance, this._then);

  final Input$deleteUserInput _instance;

  final TRes Function(Input$deleteUserInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined, Object? clientMutationId = _undefined}) =>
      _then(
        Input$deleteUserInput._({
          ..._instance._$data,
          if (id != _undefined && id != null) 'id': (id as String),
          if (clientMutationId != _undefined)
            'clientMutationId': (clientMutationId as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$deleteUserInput<TRes>
    implements CopyWith$Input$deleteUserInput<TRes> {
  _CopyWithStubImpl$Input$deleteUserInput(this._res);

  TRes _res;

  call({String? id, String? clientMutationId}) => _res;
}

enum Enum$OrderStatus {
  Unpaid,
  Paid,
  Active,
  Completed,
  Cancelled,
  $unknown;

  factory Enum$OrderStatus.fromJson(String value) =>
      fromJson$Enum$OrderStatus(value);

  String toJson() => toJson$Enum$OrderStatus(this);
}

String toJson$Enum$OrderStatus(Enum$OrderStatus e) {
  switch (e) {
    case Enum$OrderStatus.Unpaid:
      return r'Unpaid';
    case Enum$OrderStatus.Paid:
      return r'Paid';
    case Enum$OrderStatus.Active:
      return r'Active';
    case Enum$OrderStatus.Completed:
      return r'Completed';
    case Enum$OrderStatus.Cancelled:
      return r'Cancelled';
    case Enum$OrderStatus.$unknown:
      return r'$unknown';
  }
}

Enum$OrderStatus fromJson$Enum$OrderStatus(String value) {
  switch (value) {
    case r'Unpaid':
      return Enum$OrderStatus.Unpaid;
    case r'Paid':
      return Enum$OrderStatus.Paid;
    case r'Active':
      return Enum$OrderStatus.Active;
    case r'Completed':
      return Enum$OrderStatus.Completed;
    case r'Cancelled':
      return Enum$OrderStatus.Cancelled;
    default:
      return Enum$OrderStatus.$unknown;
  }
}

enum Enum$DeliveryStatus {
  Pending,
  Assigned,
  Picked_up,
  Delivered,
  Failed,
  Returned,
  $unknown;

  factory Enum$DeliveryStatus.fromJson(String value) =>
      fromJson$Enum$DeliveryStatus(value);

  String toJson() => toJson$Enum$DeliveryStatus(this);
}

String toJson$Enum$DeliveryStatus(Enum$DeliveryStatus e) {
  switch (e) {
    case Enum$DeliveryStatus.Pending:
      return r'Pending';
    case Enum$DeliveryStatus.Assigned:
      return r'Assigned';
    case Enum$DeliveryStatus.Picked_up:
      return r'Picked_up';
    case Enum$DeliveryStatus.Delivered:
      return r'Delivered';
    case Enum$DeliveryStatus.Failed:
      return r'Failed';
    case Enum$DeliveryStatus.Returned:
      return r'Returned';
    case Enum$DeliveryStatus.$unknown:
      return r'$unknown';
  }
}

Enum$DeliveryStatus fromJson$Enum$DeliveryStatus(String value) {
  switch (value) {
    case r'Pending':
      return Enum$DeliveryStatus.Pending;
    case r'Assigned':
      return Enum$DeliveryStatus.Assigned;
    case r'Picked_up':
      return Enum$DeliveryStatus.Picked_up;
    case r'Delivered':
      return Enum$DeliveryStatus.Delivered;
    case r'Failed':
      return Enum$DeliveryStatus.Failed;
    case r'Returned':
      return Enum$DeliveryStatus.Returned;
    default:
      return Enum$DeliveryStatus.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{
  'Node': {
    'Address',
    'Delivery',
    'User',
    'Order',
    'OrderItem',
    'MealPlan',
    'Meal',
    'Restaurant',
    'RestaurantCategory',
    'DietCategory',
    'Payment',
  },
};
