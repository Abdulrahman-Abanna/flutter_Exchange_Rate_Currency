import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../../core/error/exceptions.dart';
import '../model/currencies_model.dart';

abstract class CurrenciesRemoteDataSources {
  Future<List<CurrenciesModel>> getCurrenies();
  String UpdateTimeLast();
}

DateTime dateTime = DateTime.now();
DateTime lastdate = dateTime.subtract(Duration(days: 2));

String date = DateFormat('yyyy-MM-dd').format(lastdate);
final url = "https://api.metalpriceapi.com/v1/" +
    date +
    "?base=USD&api_key=dfeaa7c353b80f811c654ccbbd9290dd";

class CurrenciesRemoteDataSourcesImp extends CurrenciesRemoteDataSources {
  final http.Client client;
  CurrenciesRemoteDataSourcesImp({required this.client});

  @override
  Future<List<CurrenciesModel>> getCurrenies() async {
    final response1 = await client
        .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print(date);
    if (response1.statusCode == 200 &&
        json.decode(response1.body)['success'] == true) {
      print(response1.body);
      final decodedJson = jsonDecode(response1.body)['rates'];
      decodedJson["USD"] = 1.0;
      // this list to convert Map<String,dynamic> decodedJson To List<Map<String,dynamic>> listCurrenies;
      List<Map<String, dynamic>> listCurrenies = [];
      listCurrenies.add(decodedJson);
      print(listCurrenies);
      final List<CurrenciesModel> currenciesModel = listCurrenies
          .map((value) => CurrenciesModel.fromJson(value))
          .toList();
      print(currenciesModel);
      return currenciesModel;
    } else {
      print('ERROR');
      throw ServerException();
    }
  }

  @override
  String UpdateTimeLast() {
    var date = lastdate.add(Duration(days: 1));
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
