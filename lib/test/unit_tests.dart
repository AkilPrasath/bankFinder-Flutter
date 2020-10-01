import 'package:bank_finder/data/moor_database.dart';
import 'package:bank_finder/model/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bank to bankRecord check', () {
    Bank bank = Bank(
      name: "ABC Bank",
      branch: "XYZ city",
      code: "ABCD",
      address: "45, W Street,India",
      city: "Sivakasi",
      district: "VNR",
      state: "TamilNadu",
      ifsc: "TMBL0000001",
      contact: "1234544",
      stdCode: "12345",
      neft: false,
      upi: true,
      rtgs: false,
      imps: true,
    );
    Bankrecord record = bank.toBankRecord();
    expect(record.name, "ABC Bank");
  });

  test('response json to bank class', () async {
    String ifsc = "TMBL0000002"; //sent to the client
    Map<String, dynamic> json = {
      //mock json response
      'BANK': 'TMB',
      'BANKCODE': '45',
      'ADDRESS': '90,Wall Street,Chennai',
      'CITY': 'Chennai',
      'DISTRICT': 'VNR',
      'STATE': 'Tamilnadu',
      'IFSC': '$ifsc',
      'CONTACT': '123456',
      'STD CODE': '04562',
      'NEFT': true,
      'UPI': true,
      'RTGS': true,
      'IMPS': false
    };
    Bank bank = Bank.fromJson(json);
    expect(bank.ifsc, ifsc);
  });
}
