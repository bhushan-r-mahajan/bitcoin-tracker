class Bpi {
  CurrenyInfo usd;
  CurrenyInfo gbp;
  CurrenyInfo eur;

  Bpi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: CurrenyInfo.fromJson(json["USD"]),
        gbp: CurrenyInfo.fromJson(json["GBP"]),
        eur: CurrenyInfo.fromJson(json["EUR"]),
      );
}

class CurrenyInfo {
  String code;
  String symbol;
  String rate;
  String description;
  double rateFloat;

  CurrenyInfo({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory CurrenyInfo.fromJson(Map<String, dynamic> json) => CurrenyInfo(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]?.toDouble(),
      );
}
