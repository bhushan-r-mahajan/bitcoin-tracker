import 'dart:convert';
import 'package:bitcoin_tracker/models/api_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIManager extends ChangeNotifier {
  late Bpi bpi;
  List<String> currencyArray = ["EUR", "GBP", "USD"];
  String seletedCurrency = "USD";
  double currentPrice = 0.0;

  Future<void> getCurrentPrice() async {
    try {
      var url = Uri.parse(dotenv.get("API_URL"));
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        bpi = Bpi.fromJson(result['bpi']);
        selectPriceToDisplay(seletedCurrency);
        notifyListeners();
      }
    } catch (_) {}
  }

  void selectPriceToDisplay(String selectedCurrency) {
    switch (selectedCurrency) {
      case 'USD':
        seletedCurrency = selectedCurrency;
        currentPrice = bpi.usd.rateFloat;
        notifyListeners();
        break;
      case 'GBP':
        seletedCurrency = selectedCurrency;
        currentPrice = bpi.gbp.rateFloat;
        notifyListeners();
        break;
      case 'EUR':
        seletedCurrency = selectedCurrency;
        currentPrice = bpi.eur.rateFloat;
        notifyListeners();
        break;
      default:
    }
  }
}
