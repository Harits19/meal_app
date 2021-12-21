// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_repository.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Favorite extends DataClass implements Insertable<Favorite> {
  final String idMeal;
  final String? strMeal;
  final String? strMealThumb;
  Favorite({required this.idMeal, this.strMeal, this.strMealThumb});
  factory Favorite.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Favorite(
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
      strMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal']),
      strMealThumb: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    if (!nullToAbsent || strMeal != null) {
      map['str_meal'] = Variable<String?>(strMeal);
    }
    if (!nullToAbsent || strMealThumb != null) {
      map['str_meal_thumb'] = Variable<String?>(strMealThumb);
    }
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      idMeal: Value(idMeal),
      strMeal: strMeal == null && nullToAbsent
          ? const Value.absent()
          : Value(strMeal),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Favorite(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String?>(json['strMeal']),
      strMealThumb: serializer.fromJson<String?>(json['strMealThumb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String?>(strMeal),
      'strMealThumb': serializer.toJson<String?>(strMealThumb),
    };
  }

  Favorite copyWith({String? idMeal, String? strMeal, String? strMealThumb}) =>
      Favorite(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb: strMealThumb ?? this.strMealThumb,
      );
  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, strMeal, strMealThumb);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<String> idMeal;
  final Value<String?> strMeal;
  final Value<String?> strMealThumb;
  const FavoritesCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
  });
  FavoritesCompanion.insert({
    required String idMeal,
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
  }) : idMeal = Value(idMeal);
  static Insertable<Favorite> custom({
    Expression<String>? idMeal,
    Expression<String?>? strMeal,
    Expression<String?>? strMealThumb,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
    });
  }

  FavoritesCompanion copyWith(
      {Value<String>? idMeal,
      Value<String?>? strMeal,
      Value<String?>? strMealThumb}) {
    return FavoritesCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String?>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String?>(strMealThumb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoritesTable(this._db, [this._alias]);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  @override
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE');
  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  @override
  late final GeneratedColumn<String?> strMeal = GeneratedColumn<String?>(
      'str_meal', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  @override
  late final GeneratedColumn<String?> strMealThumb = GeneratedColumn<String?>(
      'str_meal_thumb', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [idMeal, strMeal, strMealThumb];
  @override
  String get aliasedName => _alias ?? 'favorites';
  @override
  String get actualTableName => 'favorites';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Favorite.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favorites];
}
