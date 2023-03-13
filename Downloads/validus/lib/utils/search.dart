import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:validus/model/stockmodel.dart';
import 'package:validus/utils/colors.dart';

class SearchCard extends StatefulWidget {
  var snapShot;
  SearchCard(this.snapShot, {Key? key}) : super(key: key);

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  String stkName = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // print("[[[[[[[[[[[[[[[[[[[[[[[[[");
    // print(widget.snapShot.length);
    // for (int index = 0; index < widget.snapShot.length; index++) {
    //   // print(widget.snapShot[index]);
    //   if (widget.snapShot[index]["stockName"]
    //       .toString()
    //       .toLowerCase()
    //       .contains(stkName)) {
    //     print("\\\\\\\\\\\\\\\\");
    //     print(widget.snapShot[index]["stockName"]);
    //   }
    // }
    return Scaffold(
      backgroundColor: backgroundcolor,
      // appBar: AppBar(
      //   backgroundColor: backgroundcolor,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.close,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.fromLTRB(4.0, 0, 4, 0),
      //       child: Container(
      //         width: width / 1.5,
      //         height: height / 15,
      //         alignment: Alignment.center,
      //         padding: const EdgeInsets.all(4.0),
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.all(Radius.circular(25)),
      //         ),
      //         child: TextField(
      //           textCapitalization: TextCapitalization.none,
      //           decoration: const InputDecoration(
      //             border: InputBorder.none,
      //             focusedBorder: InputBorder.none,
      //             enabledBorder: InputBorder.none,
      //           ),
      //           onChanged: (String value) {
      //             setState(() {
      //               stkName = value;
      //               print(stkName);
      //             });
      //           },
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 0, 4, 0),
                    child: Container(
                      width: width / 1.4,
                      height: height / 20,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(16.0, 4, 8, 4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: TextField(
                        textCapitalization: TextCapitalization.none,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search...",
                        ),
                        onChanged: (String value) {
                          setState(() {
                            stkName = value;
                            //print(stkName);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 1.2,
                width: width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (stkName.isNotEmpty)
                        for (int index = 0;
                            index < widget.snapShot.length;
                            index++)
                          if (widget.snapShot[index]["stockName"]
                              .toString()
                              .toLowerCase()
                              .contains(stkName))
                            Card(
                              child: Container(
                                height: height / 3.2,
                                width: width,
                                color: cardcolor,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "${widget.snapShot[index]["stockName"]}",
                                            style: const TextStyle(
                                                color: textcolor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 0),
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
                                            "${widget.snapShot[index]["price"]}",
                                            style: const TextStyle(
                                                color: textcolor, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 0),
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
                                            "${widget.snapShot[index]["dayGain"]}",
                                            style: const TextStyle(
                                                color: textcolor, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 0),
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
                                            DateFormat('hh:mm a').format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    int.parse(
                                                        "${widget.snapShot[index]["lastTrade"]}"))),
                                            style: const TextStyle(
                                                color: textcolor, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 0),
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
                                            DateFormat('hh:mm a').format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    int.parse(
                                                        "${widget.snapShot[index]["extendedHours"]}"))),
                                            style: const TextStyle(
                                                color: textcolor, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            '%Change',
                                            style: TextStyle(
                                                color: darktext, fontSize: 18),
                                          ),
                                          Text(
                                            "${widget.snapShot[index]["lastPrice"]}",
                                            style: const TextStyle(
                                                color: textcolor, fontSize: 18),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );

    // ListView.builder(
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: widget.snapShot.data!.data!.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     DateFormat format = DateFormat('hh:mm a');
    //     //last trade conversion
    //     int? parseTime =
    //         int.parse("${widget.snapShot.data!.data![index].lastTrade}");
    //     var lastTradeTime = DateTime.fromMillisecondsSinceEpoch(parseTime);
    //     String lastTrade = format.format(lastTradeTime);
    //     //Extended hours conversion
    //     int? parTime =
    //         int.parse("${widget.snapShot.data!.data![index].extendedHours}");
    //     var extHrsTime = DateTime.fromMillisecondsSinceEpoch(parTime);
    //     String extHrs = format.format(extHrsTime);

    //     // var min = DateFormat.jm(date).toString();
    //     // print(min);
    //     return;
    //   },
    // );
  }
}
