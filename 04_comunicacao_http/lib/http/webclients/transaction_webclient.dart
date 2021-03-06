import 'dart:convert';
import '../web_client.dart';
import '../../models/transaction.dart';
import 'package:http/http.dart';
import '../../models/contact.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(Uri.parse(baseUrl));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }

   String? _getMessage(int statusCode) {
    if(_statusCodeResponses.containsKey(statusCode)){
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submiting transaction',
    401: 'authentication failed',
    409: 'transaction always exist'
  };
}

class HttpException implements Exception {
  final String? message; 

  HttpException(this.message);

}
