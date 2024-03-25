// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trx_category_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTrxCategoryCollection on Isar {
  IsarCollection<TrxCategory> get trxCategorys => this.collection();
}

const TrxCategorySchema = CollectionSchema(
  name: r'TrxCategory',
  id: 4743373657504009470,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'emoji': PropertySchema(
      id: 1,
      name: r'emoji',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'isExpense': PropertySchema(
      id: 3,
      name: r'isExpense',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'needToSync': PropertySchema(
      id: 5,
      name: r'needToSync',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userServerID': PropertySchema(
      id: 7,
      name: r'userServerID',
      type: IsarType.long,
    )
  },
  estimateSize: _trxCategoryEstimateSize,
  serialize: _trxCategorySerialize,
  deserialize: _trxCategoryDeserialize,
  deserializeProp: _trxCategoryDeserializeProp,
  idName: r'localId',
  indexes: {
    r'isExpense': IndexSchema(
      id: -9091271992371882740,
      name: r'isExpense',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isExpense',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'emoji': IndexSchema(
      id: 7078352851780811074,
      name: r'emoji',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'emoji',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'userServerID': IndexSchema(
      id: -30017850418526353,
      name: r'userServerID',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userServerID',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _trxCategoryGetId,
  getLinks: _trxCategoryGetLinks,
  attach: _trxCategoryAttach,
  version: '3.1.0+1',
);

int _trxCategoryEstimateSize(
  TrxCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.emoji;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _trxCategorySerialize(
  TrxCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.emoji);
  writer.writeLong(offsets[2], object.id);
  writer.writeBool(offsets[3], object.isExpense);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.needToSync);
  writer.writeDateTime(offsets[6], object.updatedAt);
  writer.writeLong(offsets[7], object.userServerID);
}

TrxCategory _trxCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TrxCategory(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    emoji: reader.readStringOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[2]),
    isExpense: reader.readBoolOrNull(offsets[3]),
    name: reader.readStringOrNull(offsets[4]),
    needToSync: reader.readLongOrNull(offsets[5]),
    updatedAt: reader.readDateTimeOrNull(offsets[6]),
    userServerID: reader.readLongOrNull(offsets[7]),
  );
  object.localId = id;
  return object;
}

P _trxCategoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _trxCategoryGetId(TrxCategory object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _trxCategoryGetLinks(TrxCategory object) {
  return [];
}

void _trxCategoryAttach(
    IsarCollection<dynamic> col, Id id, TrxCategory object) {
  object.localId = id;
}

extension TrxCategoryQueryWhereSort
    on QueryBuilder<TrxCategory, TrxCategory, QWhere> {
  QueryBuilder<TrxCategory, TrxCategory, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhere> anyIsExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isExpense'),
      );
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhere> anyUserServerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userServerID'),
      );
    });
  }
}

extension TrxCategoryQueryWhere
    on QueryBuilder<TrxCategory, TrxCategory, QWhereClause> {
  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> localIdEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> localIdNotEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: localId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: localId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> localIdGreaterThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> localIdLessThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> localIdBetween(
    Id lowerLocalId,
    Id upperLocalId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerLocalId,
        includeLower: includeLower,
        upper: upperLocalId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> isExpenseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isExpense',
        value: [null],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause>
      isExpenseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'isExpense',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> isExpenseEqualTo(
      bool? isExpense) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isExpense',
        value: [isExpense],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> isExpenseNotEqualTo(
      bool? isExpense) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isExpense',
              lower: [],
              upper: [isExpense],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isExpense',
              lower: [isExpense],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isExpense',
              lower: [isExpense],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isExpense',
              lower: [],
              upper: [isExpense],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> nameEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> emojiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'emoji',
        value: [null],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> emojiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'emoji',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> emojiEqualTo(
      String? emoji) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'emoji',
        value: [emoji],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> emojiNotEqualTo(
      String? emoji) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emoji',
              lower: [],
              upper: [emoji],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emoji',
              lower: [emoji],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emoji',
              lower: [emoji],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'emoji',
              lower: [],
              upper: [emoji],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause>
      userServerIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userServerID',
        value: [null],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause>
      userServerIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userServerID',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> userServerIDEqualTo(
      int? userServerID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userServerID',
        value: [userServerID],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause>
      userServerIDNotEqualTo(int? userServerID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userServerID',
              lower: [],
              upper: [userServerID],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userServerID',
              lower: [userServerID],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userServerID',
              lower: [userServerID],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userServerID',
              lower: [],
              upper: [userServerID],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause>
      userServerIDGreaterThan(
    int? userServerID, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userServerID',
        lower: [userServerID],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause>
      userServerIDLessThan(
    int? userServerID, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userServerID',
        lower: [],
        upper: [userServerID],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterWhereClause> userServerIDBetween(
    int? lowerUserServerID,
    int? upperUserServerID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userServerID',
        lower: [lowerUserServerID],
        includeLower: includeLower,
        upper: [upperUserServerID],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TrxCategoryQueryFilter
    on QueryBuilder<TrxCategory, TrxCategory, QFilterCondition> {
  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emoji',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      emojiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emoji',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      emojiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emoji',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emoji',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emoji',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> emojiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      emojiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emoji',
        value: '',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      isExpenseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isExpense',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      isExpenseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isExpense',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      isExpenseEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isExpense',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> localIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      localIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> localIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> localIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      needToSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'needToSync',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      needToSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'needToSync',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      needToSyncEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'needToSync',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      needToSyncGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'needToSync',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      needToSyncLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'needToSync',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      needToSyncBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'needToSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      userServerIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userServerID',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      userServerIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userServerID',
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      userServerIDEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userServerID',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      userServerIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userServerID',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      userServerIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userServerID',
        value: value,
      ));
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterFilterCondition>
      userServerIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userServerID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TrxCategoryQueryObject
    on QueryBuilder<TrxCategory, TrxCategory, QFilterCondition> {}

extension TrxCategoryQueryLinks
    on QueryBuilder<TrxCategory, TrxCategory, QFilterCondition> {}

extension TrxCategoryQuerySortBy
    on QueryBuilder<TrxCategory, TrxCategory, QSortBy> {
  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByIsExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpense', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByIsExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpense', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByNeedToSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needToSync', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByNeedToSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needToSync', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> sortByUserServerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userServerID', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy>
      sortByUserServerIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userServerID', Sort.desc);
    });
  }
}

extension TrxCategoryQuerySortThenBy
    on QueryBuilder<TrxCategory, TrxCategory, QSortThenBy> {
  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByEmoji() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByEmojiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emoji', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByIsExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpense', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByIsExpenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpense', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByNeedToSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needToSync', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByNeedToSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'needToSync', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy> thenByUserServerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userServerID', Sort.asc);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QAfterSortBy>
      thenByUserServerIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userServerID', Sort.desc);
    });
  }
}

extension TrxCategoryQueryWhereDistinct
    on QueryBuilder<TrxCategory, TrxCategory, QDistinct> {
  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emoji', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByIsExpense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isExpense');
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByNeedToSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'needToSync');
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<TrxCategory, TrxCategory, QDistinct> distinctByUserServerID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userServerID');
    });
  }
}

extension TrxCategoryQueryProperty
    on QueryBuilder<TrxCategory, TrxCategory, QQueryProperty> {
  QueryBuilder<TrxCategory, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<TrxCategory, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TrxCategory, String?, QQueryOperations> emojiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emoji');
    });
  }

  QueryBuilder<TrxCategory, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TrxCategory, bool?, QQueryOperations> isExpenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isExpense');
    });
  }

  QueryBuilder<TrxCategory, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TrxCategory, int?, QQueryOperations> needToSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'needToSync');
    });
  }

  QueryBuilder<TrxCategory, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<TrxCategory, int?, QQueryOperations> userServerIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userServerID');
    });
  }
}
