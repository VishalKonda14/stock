// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validus/model/stockmodel.dart';
import 'package:validus/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:validus/utils/search.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  State<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  List<Stockmodel>? futuremodel;
  final searchController = TextEditingController();
  String stkName = "";
  var stockmodel, searchStock;



  @override
  void initState() {
    super.initState();
  }

  Future<Stockmodel> fetchstockmodel() async {
    final response = await http.get(Uri.parse(
        "https://run.mocky.io/v3/fc3ddccf-855c-4bb6-861c-cf7896aa963e"));
    // print("?????????");
    // print(response.body);
    // print("???????????");

    if (response.statusCode == 200) {
      setState(() {
        stockmodel = stockmodelFromJson(response.body);
        searchStock = jsonDecode(response.body)["data"];
      });
      // ignore: avoid_print
      // print("?????????");
      // print(response.body);
      // print("???????????");

      return stockmodel;
    } else {
      throw Exception('Failed to Load projectdetails');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 56, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My watchlist',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchCard(searchStock)));
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  )
                ],
              ),
            ),
            FutureBuilder<Stockmodel>(
              future: fetchstockmodel(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  //print()
                  // print(snapShot.data);
                  // print("]]]]]]]]]]]]]]]]]]]]]");
                  // print(snapShot.data!.data!.length);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapShot.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      DateFormat format = new DateFormat('hh:mm a');
                      //last trade conversion
                      int? parseTime =
                          int.parse("${snapShot.data!.data![index].lastTrade}");
                      var lastTradeTime =
                          DateTime.fromMillisecondsSinceEpoch(parseTime);
                      String lastTrade = format.format(lastTradeTime);
                      //Extended hours conversion
                      int? parTime = int.parse(
                          "${snapShot.data!.data![index].extendedHours}");
                      var extHrsTime =
                          DateTime.fromMillisecondsSinceEpoch(parTime);
                      String extHrs = format.format(extHrsTime);

                        // %change calculations
                      double change = 0.0;
                      double last = double.parse("${snapShot.data!.data![index].lastPrice}");
                      double price = double.parse("${snapShot.data!.data![index].price}");
                      
                        change = ((last - price)/price) ;
                        
                        get(){
                        if(change < 0){
                          return Image.asset("Assets/icons/down.png");
                        }else{
                          return Image.asset("Assets/icons/triangle.png");
                        }
                        }

                      return Card(
                        child: Container(
                          height: height / 3.2,
                          width: width,
                          color: cardcolor,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 20, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "${snapShot.data!.data![index].stockName}",
                                      style: const TextStyle(
                                          color: textcolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Price',
                                      style: TextStyle(
                                          color: darktext, fontSize: 18),
                                    ),
                                    Text(
                                      "${snapShot.data!.data![index].price}",
                                      style: const TextStyle(
                                          color: textcolor, fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Day gain',
                                      style: TextStyle(
                                          color: darktext, fontSize: 18),
                                    ),
                                    Text(
                                      "${snapShot.data!.data![index].dayGain}",
                                      style: const TextStyle(
                                          color: textcolor, fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Last trade',
                                      style: TextStyle(
                                          color: darktext, fontSize: 18),
                                    ),
                                    Text(
                                      lastTrade,
                                      style: const TextStyle(
                                          color: textcolor, fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Extended hrs',
                                      style: TextStyle(
                                          color: darktext, fontSize: 18),
                                    ),
                                    Text(
                                      extHrs,
                                      style: const TextStyle(
                                          color: textcolor, fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '%Change',
                                      style: TextStyle(
                                          color: darktext, fontSize: 18),
                                    ),
                                    Container(
                                      height: height / 35,
                                      width: width / 5,
                                      
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        Container(
                                          height: height / 35 ,
                                          width: width / 14,
                                         
                                          child: get(),
                                        ),
                                          Text(
                                            change.toStringAsFixed(2),
                                            style: const TextStyle(
                                                color: textcolor, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
