import 'package:chopper/chopper.dart';

part 'API-service.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class BankApiService extends ChopperService {
  @Get(path: "/{ifsc}")
  Future<Response> getBankDetails(@Path('ifsc') String ifsc);

  static BankApiService create() {
    final ChopperClient client = ChopperClient(
      baseUrl: "https://ifsc.razorpay.com",
      services: [
        _$BankApiService(),
      ],
      converter: JsonConverter(),
    );

    return _$BankApiService(client);
  }
}
