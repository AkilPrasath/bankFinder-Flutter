import 'dart:convert';

import 'package:bank_finder/data/API-service.dart';
import 'package:bank_finder/getit_service.dart';
import 'package:bank_finder/model/bank.dart';
import 'package:chopper/chopper.dart';

class Client {
  BankApiService client;
  Client() {
    client = locator<BankApiService>();
  }
  Future<Bank> sendRequest(String code) async {
    Response response = await client.getBankDetails(code);
    if (response.statusCode == 404) {
      return null;
    }
    var json = jsonDecode(response.bodyString);
    Bank bank = Bank.fromJson(json);
    return bank;
  }
}
