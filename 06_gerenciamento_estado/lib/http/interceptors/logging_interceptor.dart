import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('REQUEST');
    print('URL: ${data.baseUrl.toString()}');
    print('HEADERS: ${data.headers.toString()}');
    print('BODY: ${data.body.toString()}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE');
    print('STATUS: ${data.statusCode.toString()}');
    print('HEADERS: ${data.headers.toString()}');
    print('BODY: ${data.body.toString()}');
    return data;
  }
}