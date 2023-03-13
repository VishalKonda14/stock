import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validus/Authentications/LoginPage.dart';

import 'package:validus/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final _addrresscontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();

  Future<String>? _buildprofile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //shared.SharedPreferenceHelper.init();
    ProfilePage();
    setDetails();
  }

  setDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      namecontroller.text = preferences.getString("name").toString();
      emailcontroller.text = preferences.getString("email").toString();
      _addrresscontroller.text = preferences.getString("address").toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundcolor,
        body: (namecontroller.text.isEmpty)
            ? const CircularProgressIndicator()
            : SafeArea(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 56, 0, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 36),
                        ),
                        // IconButton(
                        //   onPressed: () async {
                        //     SharedPreferences preferences =
                        //         await SharedPreferences.getInstance();
                        //     preferences.clear();
                        //     Navigator.pushAndRemoveUntil(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => const LoginPage()),
                        //         (route) => false);
                        //   },
                        //   icon: const Icon(Icons.logout, color: Colors.white),
                        // )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
                      child: Container(
                        height: height / 2.3,
                        width: width,
                        color: cardcolor,
                        child: Column(
                          children: [
                            Container(
                              height: height / 7,
                              width: width,
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 35, 15, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Name',
                                          style: TextStyle(
                                              color: protext, fontSize: 16),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              showModalBottomSheet<void>(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                isScrollControlled: true,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: height / 1.1,
                                                    decoration: const BoxDecoration(
                                                        color: backgroundcolor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10))),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    child: Center(
                                                      child: Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,

                                                          // mainAxisSize: MainAxisSize.min,
                                                          children: <Widget>[
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          0,
                                                                          24,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 16.0),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              Image.asset("Assets/icons/back.png"),
                                                                        ),
                                                                      ),
                                                                      const Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 90.0),
                                                                        child:
                                                                            Text(
                                                                          "Edit Name",
                                                                          style: TextStyle(
                                                                              color: protext,
                                                                              fontSize: 18),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          24,
                                                                          24,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        const Text(
                                                                      'Please enter your Name',
                                                                      maxLines:
                                                                          2,
                                                                      style: TextStyle(
                                                                          color:
                                                                              protext,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          24,
                                                                          24,
                                                                          24,
                                                                          0),
                                                                  child:
                                                                      TextFormField(
                                                                    style: const TextStyle(
                                                                        color:
                                                                            textcolor),
                                                                    controller:
                                                                        namecontroller,
                                                                    decoration: const InputDecoration(
                                                                        hintText:
                                                                            'Name',
                                                                        hintStyle: TextStyle(
                                                                            color:
                                                                                inputfield),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            filledcolor,
                                                                        border:
                                                                            OutlineInputBorder()),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      24,
                                                                      0,
                                                                      24,
                                                                      0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  SharedPreferences
                                                                      preferences =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  preferences.setString(
                                                                      'name',
                                                                      namecontroller
                                                                          .text);
                                                                  setState(() {
                                                                    namecontroller
                                                                            .text =
                                                                        preferences
                                                                            .getString("name")
                                                                            .toString();
                                                                  });
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height /
                                                                          14,
                                                                  width: width,
                                                                  color:
                                                                      buttoncolor,
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'Save',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: protext,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          namecontroller.text,
                                          style: const TextStyle(
                                              color: darktext, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: height / 7,
                              width: width,
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 25, 15, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Email',
                                          style: TextStyle(
                                              color: protext, fontSize: 16),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              showModalBottomSheet<void>(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                isScrollControlled: true,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: height / 1.1,
                                                    decoration: const BoxDecoration(
                                                        color: backgroundcolor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Center(
                                                        child: Form(
                                                          key: _formKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            // mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            24,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 29.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Image.asset("Assets/icons/back.png"),
                                                                          ),
                                                                        ),
                                                                        const Padding(
                                                                          padding:
                                                                              EdgeInsets.only(left: 90.0),
                                                                          child:
                                                                              Text(
                                                                            "Edit Email",
                                                                            style:
                                                                                TextStyle(color: protext, fontSize: 18),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            24,
                                                                            41,
                                                                            38,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          const Text(
                                                                        'We\'ll send you an email to confirm your new email address',
                                                                        maxLines:
                                                                            2,
                                                                        style: TextStyle(
                                                                            color:
                                                                                protext,
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            24,
                                                                            24,
                                                                            24,
                                                                            0),
                                                                    child:
                                                                        TextFormField(
                                                                      style: const TextStyle(
                                                                          color:
                                                                              textcolor),
                                                                      controller:
                                                                          emailcontroller,
                                                                      decoration: const InputDecoration(
                                                                          hintText:
                                                                              'Email',
                                                                          hintStyle: TextStyle(
                                                                              color:
                                                                                  inputfield),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              filledcolor,
                                                                          border:
                                                                              OutlineInputBorder()),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        24,
                                                                        0,
                                                                        24,
                                                                        0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    SharedPreferences
                                                                        preferences =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    preferences.setString(
                                                                        'email',
                                                                        emailcontroller
                                                                            .text);
                                                                    setState(
                                                                        () {
                                                                      emailcontroller.text = preferences
                                                                          .getString(
                                                                              "email")
                                                                          .toString();

                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height /
                                                                            14,
                                                                    width:
                                                                        width,
                                                                    color:
                                                                        buttoncolor,
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        'Save',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 20),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: protext,
                                                  // fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          emailcontroller.text,
                                          style: const TextStyle(
                                              color: darktext, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: height / 7,
                              width: width,
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 25, 15, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Address',
                                          style: TextStyle(
                                              color: protext,
                                              //fontWeight: FontWeight.w700,
                                              fontSize: 16),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              showModalBottomSheet<void>(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                isScrollControlled: true,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: height / 1.1,
                                                    decoration: const BoxDecoration(
                                                        color: backgroundcolor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      child: Center(
                                                        child: Form(
                                                          key: _formKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            // mainAxisSize: MainAxisSize.min,
                                                            children: <Widget>[
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            24,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 29.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Image.asset("Assets/icons/back.png"),
                                                                          ),
                                                                        ),
                                                                        const Padding(
                                                                          padding:
                                                                              EdgeInsets.only(left: 90.0),
                                                                          child:
                                                                              Text(
                                                                            "Edit Address",
                                                                            style:
                                                                                TextStyle(color: protext, fontSize: 18),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            24,
                                                                            41,
                                                                            38,
                                                                            0),
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          const Text(
                                                                        'Please enter your address',
                                                                        maxLines:
                                                                            2,
                                                                        style: TextStyle(
                                                                            color:
                                                                                protext,
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            24,
                                                                            24,
                                                                            24,
                                                                            0),
                                                                    child:
                                                                        TextFormField(
                                                                      style: const TextStyle(
                                                                          color:
                                                                              textcolor),
                                                                      controller:
                                                                          _addrresscontroller,
                                                                      decoration: const InputDecoration(
                                                                          hintText:
                                                                              'Address',
                                                                          hintStyle: TextStyle(
                                                                              color:
                                                                                  inputfield),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              filledcolor,
                                                                          border:
                                                                              OutlineInputBorder()),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        24,
                                                                        0,
                                                                        24,
                                                                        0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    SharedPreferences
                                                                        preferences =
                                                                        await SharedPreferences
                                                                            .getInstance();
                                                                    preferences.setString(
                                                                        'address',
                                                                        _addrresscontroller
                                                                            .text);
                                                                    setState(
                                                                        () {
                                                                      _addrresscontroller.text = preferences
                                                                          .getString(
                                                                              "address")
                                                                          .toString();
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        height /
                                                                            14,
                                                                    width:
                                                                        width,
                                                                    color:
                                                                        buttoncolor,
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        'Save',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize: 20),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: protext,
                                                  //fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          _addrresscontroller.text,
                                          style: const TextStyle(
                                              color: darktext, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ]),
              ));
  }
}
