// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank(
    name: json['BANK'] as String,
    branch: json['BRANCH'] as String,
    code: json['BANKCODE'] as String,
    address: json['ADDRESS'] as String,
    city: json['CITY'] as String,
    district: json['DISTRICT'] as String,
    state: json['STATE'] as String,
    ifsc: json['IFSC'] as String,
    contact: json['CONTACT'] as String,
    stdCode: json['STD CODE'] as String,
    neft: json['NEFT'] as bool,
    upi: json['UPI'] as bool,
    rtgs: json['RTGS'] as bool,
    imps: json['IMPS'] as bool,
  );
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'BANK': instance.name,
      'BRANCH': instance.branch,
      'BANKCODE': instance.code,
      'ADDRESS': instance.address,
      'CITY': instance.city,
      'DISTRICT': instance.district,
      'STATE': instance.state,
      'IFSC': instance.ifsc,
      'CONTACT': instance.contact,
      'STD CODE': instance.stdCode,
      'NEFT': instance.neft,
      'UPI': instance.upi,
      'RTGS': instance.rtgs,
      'IMPS': instance.imps,
    };
