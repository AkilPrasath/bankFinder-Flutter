// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Bankrecord extends DataClass implements Insertable<Bankrecord> {
  final int id;
  final String name;
  final String branch;
  final String code;
  final String address;
  final String city;
  final String district;
  final String state;
  final String ifsc;
  final String contact;
  final String stdCode;
  final bool neft;
  final bool upi;
  final bool rtgs;
  final bool imps;
  Bankrecord(
      {@required this.id,
      @required this.name,
      @required this.branch,
      @required this.code,
      @required this.address,
      @required this.city,
      @required this.district,
      @required this.state,
      @required this.ifsc,
      this.contact,
      @required this.stdCode,
      @required this.neft,
      @required this.upi,
      @required this.rtgs,
      @required this.imps});
  factory Bankrecord.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Bankrecord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      branch:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}branch']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      city: stringType.mapFromDatabaseResponse(data['${effectivePrefix}city']),
      district: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}district']),
      state:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}state']),
      ifsc: stringType.mapFromDatabaseResponse(data['${effectivePrefix}ifsc']),
      contact:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}contact']),
      stdCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}std_code']),
      neft: boolType.mapFromDatabaseResponse(data['${effectivePrefix}neft']),
      upi: boolType.mapFromDatabaseResponse(data['${effectivePrefix}upi']),
      rtgs: boolType.mapFromDatabaseResponse(data['${effectivePrefix}rtgs']),
      imps: boolType.mapFromDatabaseResponse(data['${effectivePrefix}imps']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || branch != null) {
      map['branch'] = Variable<String>(branch);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || district != null) {
      map['district'] = Variable<String>(district);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || ifsc != null) {
      map['ifsc'] = Variable<String>(ifsc);
    }
    if (!nullToAbsent || contact != null) {
      map['contact'] = Variable<String>(contact);
    }
    if (!nullToAbsent || stdCode != null) {
      map['std_code'] = Variable<String>(stdCode);
    }
    if (!nullToAbsent || neft != null) {
      map['neft'] = Variable<bool>(neft);
    }
    if (!nullToAbsent || upi != null) {
      map['upi'] = Variable<bool>(upi);
    }
    if (!nullToAbsent || rtgs != null) {
      map['rtgs'] = Variable<bool>(rtgs);
    }
    if (!nullToAbsent || imps != null) {
      map['imps'] = Variable<bool>(imps);
    }
    return map;
  }

  BankrecordsCompanion toCompanion(bool nullToAbsent) {
    return BankrecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      branch:
          branch == null && nullToAbsent ? const Value.absent() : Value(branch),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      ifsc: ifsc == null && nullToAbsent ? const Value.absent() : Value(ifsc),
      contact: contact == null && nullToAbsent
          ? const Value.absent()
          : Value(contact),
      stdCode: stdCode == null && nullToAbsent
          ? const Value.absent()
          : Value(stdCode),
      neft: neft == null && nullToAbsent ? const Value.absent() : Value(neft),
      upi: upi == null && nullToAbsent ? const Value.absent() : Value(upi),
      rtgs: rtgs == null && nullToAbsent ? const Value.absent() : Value(rtgs),
      imps: imps == null && nullToAbsent ? const Value.absent() : Value(imps),
    );
  }

  factory Bankrecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Bankrecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      branch: serializer.fromJson<String>(json['branch']),
      code: serializer.fromJson<String>(json['code']),
      address: serializer.fromJson<String>(json['address']),
      city: serializer.fromJson<String>(json['city']),
      district: serializer.fromJson<String>(json['district']),
      state: serializer.fromJson<String>(json['state']),
      ifsc: serializer.fromJson<String>(json['ifsc']),
      contact: serializer.fromJson<String>(json['contact']),
      stdCode: serializer.fromJson<String>(json['stdCode']),
      neft: serializer.fromJson<bool>(json['neft']),
      upi: serializer.fromJson<bool>(json['upi']),
      rtgs: serializer.fromJson<bool>(json['rtgs']),
      imps: serializer.fromJson<bool>(json['imps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'branch': serializer.toJson<String>(branch),
      'code': serializer.toJson<String>(code),
      'address': serializer.toJson<String>(address),
      'city': serializer.toJson<String>(city),
      'district': serializer.toJson<String>(district),
      'state': serializer.toJson<String>(state),
      'ifsc': serializer.toJson<String>(ifsc),
      'contact': serializer.toJson<String>(contact),
      'stdCode': serializer.toJson<String>(stdCode),
      'neft': serializer.toJson<bool>(neft),
      'upi': serializer.toJson<bool>(upi),
      'rtgs': serializer.toJson<bool>(rtgs),
      'imps': serializer.toJson<bool>(imps),
    };
  }

  Bankrecord copyWith(
          {int id,
          String name,
          String branch,
          String code,
          String address,
          String city,
          String district,
          String state,
          String ifsc,
          String contact,
          String stdCode,
          bool neft,
          bool upi,
          bool rtgs,
          bool imps}) =>
      Bankrecord(
        id: id ?? this.id,
        name: name ?? this.name,
        branch: branch ?? this.branch,
        code: code ?? this.code,
        address: address ?? this.address,
        city: city ?? this.city,
        district: district ?? this.district,
        state: state ?? this.state,
        ifsc: ifsc ?? this.ifsc,
        contact: contact ?? this.contact,
        stdCode: stdCode ?? this.stdCode,
        neft: neft ?? this.neft,
        upi: upi ?? this.upi,
        rtgs: rtgs ?? this.rtgs,
        imps: imps ?? this.imps,
      );
  @override
  String toString() {
    return (StringBuffer('Bankrecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('branch: $branch, ')
          ..write('code: $code, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('district: $district, ')
          ..write('state: $state, ')
          ..write('ifsc: $ifsc, ')
          ..write('contact: $contact, ')
          ..write('stdCode: $stdCode, ')
          ..write('neft: $neft, ')
          ..write('upi: $upi, ')
          ..write('rtgs: $rtgs, ')
          ..write('imps: $imps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              branch.hashCode,
              $mrjc(
                  code.hashCode,
                  $mrjc(
                      address.hashCode,
                      $mrjc(
                          city.hashCode,
                          $mrjc(
                              district.hashCode,
                              $mrjc(
                                  state.hashCode,
                                  $mrjc(
                                      ifsc.hashCode,
                                      $mrjc(
                                          contact.hashCode,
                                          $mrjc(
                                              stdCode.hashCode,
                                              $mrjc(
                                                  neft.hashCode,
                                                  $mrjc(
                                                      upi.hashCode,
                                                      $mrjc(rtgs.hashCode,
                                                          imps.hashCode)))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Bankrecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.branch == this.branch &&
          other.code == this.code &&
          other.address == this.address &&
          other.city == this.city &&
          other.district == this.district &&
          other.state == this.state &&
          other.ifsc == this.ifsc &&
          other.contact == this.contact &&
          other.stdCode == this.stdCode &&
          other.neft == this.neft &&
          other.upi == this.upi &&
          other.rtgs == this.rtgs &&
          other.imps == this.imps);
}

class BankrecordsCompanion extends UpdateCompanion<Bankrecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> branch;
  final Value<String> code;
  final Value<String> address;
  final Value<String> city;
  final Value<String> district;
  final Value<String> state;
  final Value<String> ifsc;
  final Value<String> contact;
  final Value<String> stdCode;
  final Value<bool> neft;
  final Value<bool> upi;
  final Value<bool> rtgs;
  final Value<bool> imps;
  const BankrecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.branch = const Value.absent(),
    this.code = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.district = const Value.absent(),
    this.state = const Value.absent(),
    this.ifsc = const Value.absent(),
    this.contact = const Value.absent(),
    this.stdCode = const Value.absent(),
    this.neft = const Value.absent(),
    this.upi = const Value.absent(),
    this.rtgs = const Value.absent(),
    this.imps = const Value.absent(),
  });
  BankrecordsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String branch,
    @required String code,
    @required String address,
    @required String city,
    @required String district,
    @required String state,
    @required String ifsc,
    this.contact = const Value.absent(),
    @required String stdCode,
    @required bool neft,
    @required bool upi,
    @required bool rtgs,
    @required bool imps,
  })  : name = Value(name),
        branch = Value(branch),
        code = Value(code),
        address = Value(address),
        city = Value(city),
        district = Value(district),
        state = Value(state),
        ifsc = Value(ifsc),
        stdCode = Value(stdCode),
        neft = Value(neft),
        upi = Value(upi),
        rtgs = Value(rtgs),
        imps = Value(imps);
  static Insertable<Bankrecord> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> branch,
    Expression<String> code,
    Expression<String> address,
    Expression<String> city,
    Expression<String> district,
    Expression<String> state,
    Expression<String> ifsc,
    Expression<String> contact,
    Expression<String> stdCode,
    Expression<bool> neft,
    Expression<bool> upi,
    Expression<bool> rtgs,
    Expression<bool> imps,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (branch != null) 'branch': branch,
      if (code != null) 'code': code,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (district != null) 'district': district,
      if (state != null) 'state': state,
      if (ifsc != null) 'ifsc': ifsc,
      if (contact != null) 'contact': contact,
      if (stdCode != null) 'std_code': stdCode,
      if (neft != null) 'neft': neft,
      if (upi != null) 'upi': upi,
      if (rtgs != null) 'rtgs': rtgs,
      if (imps != null) 'imps': imps,
    });
  }

  BankrecordsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> branch,
      Value<String> code,
      Value<String> address,
      Value<String> city,
      Value<String> district,
      Value<String> state,
      Value<String> ifsc,
      Value<String> contact,
      Value<String> stdCode,
      Value<bool> neft,
      Value<bool> upi,
      Value<bool> rtgs,
      Value<bool> imps}) {
    return BankrecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      branch: branch ?? this.branch,
      code: code ?? this.code,
      address: address ?? this.address,
      city: city ?? this.city,
      district: district ?? this.district,
      state: state ?? this.state,
      ifsc: ifsc ?? this.ifsc,
      contact: contact ?? this.contact,
      stdCode: stdCode ?? this.stdCode,
      neft: neft ?? this.neft,
      upi: upi ?? this.upi,
      rtgs: rtgs ?? this.rtgs,
      imps: imps ?? this.imps,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (branch.present) {
      map['branch'] = Variable<String>(branch.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (ifsc.present) {
      map['ifsc'] = Variable<String>(ifsc.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (stdCode.present) {
      map['std_code'] = Variable<String>(stdCode.value);
    }
    if (neft.present) {
      map['neft'] = Variable<bool>(neft.value);
    }
    if (upi.present) {
      map['upi'] = Variable<bool>(upi.value);
    }
    if (rtgs.present) {
      map['rtgs'] = Variable<bool>(rtgs.value);
    }
    if (imps.present) {
      map['imps'] = Variable<bool>(imps.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BankrecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('branch: $branch, ')
          ..write('code: $code, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('district: $district, ')
          ..write('state: $state, ')
          ..write('ifsc: $ifsc, ')
          ..write('contact: $contact, ')
          ..write('stdCode: $stdCode, ')
          ..write('neft: $neft, ')
          ..write('upi: $upi, ')
          ..write('rtgs: $rtgs, ')
          ..write('imps: $imps')
          ..write(')'))
        .toString();
  }
}

class $BankrecordsTable extends Bankrecords
    with TableInfo<$BankrecordsTable, Bankrecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $BankrecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _branchMeta = const VerificationMeta('branch');
  GeneratedTextColumn _branch;
  @override
  GeneratedTextColumn get branch => _branch ??= _constructBranch();
  GeneratedTextColumn _constructBranch() {
    return GeneratedTextColumn(
      'branch',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn(
      'code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cityMeta = const VerificationMeta('city');
  GeneratedTextColumn _city;
  @override
  GeneratedTextColumn get city => _city ??= _constructCity();
  GeneratedTextColumn _constructCity() {
    return GeneratedTextColumn(
      'city',
      $tableName,
      false,
    );
  }

  final VerificationMeta _districtMeta = const VerificationMeta('district');
  GeneratedTextColumn _district;
  @override
  GeneratedTextColumn get district => _district ??= _constructDistrict();
  GeneratedTextColumn _constructDistrict() {
    return GeneratedTextColumn(
      'district',
      $tableName,
      false,
    );
  }

  final VerificationMeta _stateMeta = const VerificationMeta('state');
  GeneratedTextColumn _state;
  @override
  GeneratedTextColumn get state => _state ??= _constructState();
  GeneratedTextColumn _constructState() {
    return GeneratedTextColumn(
      'state',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ifscMeta = const VerificationMeta('ifsc');
  GeneratedTextColumn _ifsc;
  @override
  GeneratedTextColumn get ifsc => _ifsc ??= _constructIfsc();
  GeneratedTextColumn _constructIfsc() {
    return GeneratedTextColumn('ifsc', $tableName, false,
        $customConstraints: 'NOT NULL UNIQUE');
  }

  final VerificationMeta _contactMeta = const VerificationMeta('contact');
  GeneratedTextColumn _contact;
  @override
  GeneratedTextColumn get contact => _contact ??= _constructContact();
  GeneratedTextColumn _constructContact() {
    return GeneratedTextColumn(
      'contact',
      $tableName,
      true,
    );
  }

  final VerificationMeta _stdCodeMeta = const VerificationMeta('stdCode');
  GeneratedTextColumn _stdCode;
  @override
  GeneratedTextColumn get stdCode => _stdCode ??= _constructStdCode();
  GeneratedTextColumn _constructStdCode() {
    return GeneratedTextColumn(
      'std_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _neftMeta = const VerificationMeta('neft');
  GeneratedBoolColumn _neft;
  @override
  GeneratedBoolColumn get neft => _neft ??= _constructNeft();
  GeneratedBoolColumn _constructNeft() {
    return GeneratedBoolColumn(
      'neft',
      $tableName,
      false,
    );
  }

  final VerificationMeta _upiMeta = const VerificationMeta('upi');
  GeneratedBoolColumn _upi;
  @override
  GeneratedBoolColumn get upi => _upi ??= _constructUpi();
  GeneratedBoolColumn _constructUpi() {
    return GeneratedBoolColumn(
      'upi',
      $tableName,
      false,
    );
  }

  final VerificationMeta _rtgsMeta = const VerificationMeta('rtgs');
  GeneratedBoolColumn _rtgs;
  @override
  GeneratedBoolColumn get rtgs => _rtgs ??= _constructRtgs();
  GeneratedBoolColumn _constructRtgs() {
    return GeneratedBoolColumn(
      'rtgs',
      $tableName,
      false,
    );
  }

  final VerificationMeta _impsMeta = const VerificationMeta('imps');
  GeneratedBoolColumn _imps;
  @override
  GeneratedBoolColumn get imps => _imps ??= _constructImps();
  GeneratedBoolColumn _constructImps() {
    return GeneratedBoolColumn(
      'imps',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        branch,
        code,
        address,
        city,
        district,
        state,
        ifsc,
        contact,
        stdCode,
        neft,
        upi,
        rtgs,
        imps
      ];
  @override
  $BankrecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bankrecords';
  @override
  final String actualTableName = 'bankrecords';
  @override
  VerificationContext validateIntegrity(Insertable<Bankrecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('branch')) {
      context.handle(_branchMeta,
          branch.isAcceptableOrUnknown(data['branch'], _branchMeta));
    } else if (isInserting) {
      context.missing(_branchMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city'], _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('district')) {
      context.handle(_districtMeta,
          district.isAcceptableOrUnknown(data['district'], _districtMeta));
    } else if (isInserting) {
      context.missing(_districtMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state'], _stateMeta));
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('ifsc')) {
      context.handle(
          _ifscMeta, ifsc.isAcceptableOrUnknown(data['ifsc'], _ifscMeta));
    } else if (isInserting) {
      context.missing(_ifscMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact'], _contactMeta));
    }
    if (data.containsKey('std_code')) {
      context.handle(_stdCodeMeta,
          stdCode.isAcceptableOrUnknown(data['std_code'], _stdCodeMeta));
    } else if (isInserting) {
      context.missing(_stdCodeMeta);
    }
    if (data.containsKey('neft')) {
      context.handle(
          _neftMeta, neft.isAcceptableOrUnknown(data['neft'], _neftMeta));
    } else if (isInserting) {
      context.missing(_neftMeta);
    }
    if (data.containsKey('upi')) {
      context.handle(
          _upiMeta, upi.isAcceptableOrUnknown(data['upi'], _upiMeta));
    } else if (isInserting) {
      context.missing(_upiMeta);
    }
    if (data.containsKey('rtgs')) {
      context.handle(
          _rtgsMeta, rtgs.isAcceptableOrUnknown(data['rtgs'], _rtgsMeta));
    } else if (isInserting) {
      context.missing(_rtgsMeta);
    }
    if (data.containsKey('imps')) {
      context.handle(
          _impsMeta, imps.isAcceptableOrUnknown(data['imps'], _impsMeta));
    } else if (isInserting) {
      context.missing(_impsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bankrecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Bankrecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BankrecordsTable createAlias(String alias) {
    return $BankrecordsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BankrecordsTable _bankrecords;
  $BankrecordsTable get bankrecords => _bankrecords ??= $BankrecordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bankrecords];
}
