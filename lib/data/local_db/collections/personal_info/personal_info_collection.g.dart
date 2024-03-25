// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPersonalInfoCollection on Isar {
  IsarCollection<PersonalInfo> get personalInfos => this.collection();
}

const PersonalInfoSchema = CollectionSchema(
  name: r'PersonalInfo',
  id: -8858677963028947337,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dpLocalPath': PropertySchema(
      id: 1,
      name: r'dpLocalPath',
      type: IsarType.string,
    ),
    r'dpUrl': PropertySchema(
      id: 2,
      name: r'dpUrl',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 3,
      name: r'email',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 4,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.long,
    ),
    r'userID': PropertySchema(
      id: 6,
      name: r'userID',
      type: IsarType.string,
    )
  },
  estimateSize: _personalInfoEstimateSize,
  serialize: _personalInfoSerialize,
  deserialize: _personalInfoDeserialize,
  deserializeProp: _personalInfoDeserializeProp,
  idName: r'localId',
  indexes: {
    r'userID': IndexSchema(
      id: 5409443695161892061,
      name: r'userID',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userID',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _personalInfoGetId,
  getLinks: _personalInfoGetLinks,
  attach: _personalInfoAttach,
  version: '3.1.0+1',
);

int _personalInfoEstimateSize(
  PersonalInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dpLocalPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dpUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fullName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _personalInfoSerialize(
  PersonalInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.dpLocalPath);
  writer.writeString(offsets[2], object.dpUrl);
  writer.writeString(offsets[3], object.email);
  writer.writeString(offsets[4], object.fullName);
  writer.writeLong(offsets[5], object.id);
  writer.writeString(offsets[6], object.userID);
}

PersonalInfo _personalInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PersonalInfo(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    dpLocalPath: reader.readStringOrNull(offsets[1]),
    dpUrl: reader.readStringOrNull(offsets[2]),
    email: reader.readStringOrNull(offsets[3]),
    fullName: reader.readStringOrNull(offsets[4]),
    id: reader.readLongOrNull(offsets[5]),
    userID: reader.readStringOrNull(offsets[6]),
  );
  object.localId = id;
  return object;
}

P _personalInfoDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _personalInfoGetId(PersonalInfo object) {
  return object.localId;
}

List<IsarLinkBase<dynamic>> _personalInfoGetLinks(PersonalInfo object) {
  return [];
}

void _personalInfoAttach(
    IsarCollection<dynamic> col, Id id, PersonalInfo object) {
  object.localId = id;
}

extension PersonalInfoQueryWhereSort
    on QueryBuilder<PersonalInfo, PersonalInfo, QWhere> {
  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhere> anyLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PersonalInfoQueryWhere
    on QueryBuilder<PersonalInfo, PersonalInfo, QWhereClause> {
  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> localIdEqualTo(
      Id localId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: localId,
        upper: localId,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> localIdNotEqualTo(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause>
      localIdGreaterThan(Id localId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: localId, includeLower: include),
      );
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> localIdLessThan(
      Id localId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: localId, includeUpper: include),
      );
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> localIdBetween(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> userIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userID',
        value: [null],
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause>
      userIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userID',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> userIDEqualTo(
      String? userID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userID',
        value: [userID],
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterWhereClause> userIDNotEqualTo(
      String? userID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userID',
              lower: [],
              upper: [userID],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userID',
              lower: [userID],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userID',
              lower: [userID],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userID',
              lower: [],
              upper: [userID],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PersonalInfoQueryFilter
    on QueryBuilder<PersonalInfo, PersonalInfo, QFilterCondition> {
  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dpLocalPath',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dpLocalPath',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dpLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dpLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dpLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dpLocalPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dpLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dpLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dpLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dpLocalPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dpLocalPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpLocalPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dpLocalPath',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dpUrl',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dpUrl',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> dpUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dpUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dpUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> dpUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dpUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> dpUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dpUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dpUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> dpUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dpUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> dpUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dpUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> dpUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dpUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dpUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      dpUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dpUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fullName',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      localIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localId',
        value: value,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      localIdLessThan(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      localIdBetween(
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

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userID',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userID',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> userIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> userIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition> userIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userID',
        value: '',
      ));
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterFilterCondition>
      userIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userID',
        value: '',
      ));
    });
  }
}

extension PersonalInfoQueryObject
    on QueryBuilder<PersonalInfo, PersonalInfo, QFilterCondition> {}

extension PersonalInfoQueryLinks
    on QueryBuilder<PersonalInfo, PersonalInfo, QFilterCondition> {}

extension PersonalInfoQuerySortBy
    on QueryBuilder<PersonalInfo, PersonalInfo, QSortBy> {
  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByDpLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpLocalPath', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy>
      sortByDpLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpLocalPath', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByDpUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpUrl', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByDpUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpUrl', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> sortByUserIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.desc);
    });
  }
}

extension PersonalInfoQuerySortThenBy
    on QueryBuilder<PersonalInfo, PersonalInfo, QSortThenBy> {
  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByDpLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpLocalPath', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy>
      thenByDpLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpLocalPath', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByDpUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpUrl', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByDpUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dpUrl', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByLocalId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByLocalIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localId', Sort.desc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByUserID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.asc);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QAfterSortBy> thenByUserIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userID', Sort.desc);
    });
  }
}

extension PersonalInfoQueryWhereDistinct
    on QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> {
  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctByDpLocalPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dpLocalPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctByDpUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dpUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<PersonalInfo, PersonalInfo, QDistinct> distinctByUserID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userID', caseSensitive: caseSensitive);
    });
  }
}

extension PersonalInfoQueryProperty
    on QueryBuilder<PersonalInfo, PersonalInfo, QQueryProperty> {
  QueryBuilder<PersonalInfo, int, QQueryOperations> localIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localId');
    });
  }

  QueryBuilder<PersonalInfo, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<PersonalInfo, String?, QQueryOperations> dpLocalPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dpLocalPath');
    });
  }

  QueryBuilder<PersonalInfo, String?, QQueryOperations> dpUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dpUrl');
    });
  }

  QueryBuilder<PersonalInfo, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<PersonalInfo, String?, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<PersonalInfo, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PersonalInfo, String?, QQueryOperations> userIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userID');
    });
  }
}
