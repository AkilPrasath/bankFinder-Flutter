// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'API-service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$BankApiService extends BankApiService {
  _$BankApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BankApiService;

  @override
  Future<Response<dynamic>> getBankDetails(String ifsc) {
    final $url = '/$ifsc';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
