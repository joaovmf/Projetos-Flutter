import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import '../models/transaction.dart';
import '../models/contact.dart';


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

 Future<List<Transaction>> findAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get(Uri.parse('http://192.168.0.197:8080/transactions')).timeout(const Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];
  for (Map<String, dynamic> element in decodedJson) {
    final Transaction transaction = Transaction(
        element['value'],
        Contact(0, element['contact']['name'],
            element['contact']['accountNumber']));
            transactions.add(transaction);
  }
  return transactions;
}
