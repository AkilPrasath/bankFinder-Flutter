import 'package:bank_finder/data/moor_database.dart';
import 'package:bank_finder/getit_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank {
  @JsonKey(name: 'BANK')
  String name;
  @JsonKey(name: 'BRANCH')
  String branch;
  @JsonKey(name: 'BANKCODE')
  String code;
  @JsonKey(name: 'ADDRESS')
  String address;
  @JsonKey(name: 'CITY')
  String city;
  @JsonKey(name: 'DISTRICT')
  String district;
  @JsonKey(name: 'STATE')
  String state;
  @JsonKey(name: 'IFSC')
  String ifsc;
  @JsonKey(name: 'CONTACT', nullable: true)
  String contact;
  @JsonKey(name: 'STD CODE')
  String stdCode;
  @JsonKey(name: 'NEFT')
  bool neft;
  @JsonKey(name: 'UPI')
  bool upi;
  @JsonKey(name: 'RTGS')
  bool rtgs;
  @JsonKey(name: 'IMPS')
  bool imps;

  Bank({
    this.name,
    this.branch,
    this.code,
    this.address,
    this.city,
    this.district,
    this.state,
    this.ifsc,
    this.contact,
    this.stdCode,
    this.neft,
    this.upi,
    this.rtgs,
    this.imps,
  });
  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);

  Bankrecord toBankRecord() {
    Bankrecord record = Bankrecord(
      id: null,
      name: this.name,
      branch: this.branch,
      code: this.code,
      address: this.address,
      city: this.city,
      district: this.district,
      state: this.state,
      ifsc: this.ifsc,
      stdCode: this.stdCode,
      neft: this.neft,
      upi: this.upi,
      rtgs: this.rtgs,
      imps: this.imps,
    );
    return record;
  }

  Future<bool> saveToFavourites() async {
    Bankrecord record = this.toBankRecord();
    try {
      await locator<AppDatabase>().insertBank(record);
    } catch (exception) {
      print(exception);
      return false;
    }
    return true;
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.name;
  }
}
