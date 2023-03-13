// To parse this JSON data, do
//
//     final stockmodel = stockmodelFromJson(jsonString);

import 'dart:convert';

Stockmodel stockmodelFromJson(String str) =>
    Stockmodel.fromJson(json.decode(str));

String stockmodelToJson(Stockmodel data) => json.encode(data.toJson());

class Stockmodel {
  Stockmodel({
    this.success,
    this.statusCode,
    this.data,
  });

  bool? success;
  int? statusCode;
  List<Datum>? data;

  factory Stockmodel.fromJson(Map<String, dynamic> json) => Stockmodel(
        success: json["success"],
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.stockName,
    this.price,
    this.dayGain,
    this.lastTrade,
    this.extendedHours,
    this.lastPrice,
  });

  String? id;
  String? stockName;
  double? price;
  double? dayGain;
  String? lastTrade;
  String? extendedHours;
  double? lastPrice;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        stockName: json["stockName"],
        price: json["price"].toDouble(),
        dayGain: json["dayGain"].toDouble(),
        lastTrade: json["lastTrade"],
        extendedHours: json["extendedHours"],
        lastPrice: json["lastPrice"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stockName": stockName,
        "price": price,
        "dayGain": dayGain,
        "lastTrade": lastTrade,
        "extendedHours": extendedHours,
        "lastPrice": lastPrice,
      };
}
