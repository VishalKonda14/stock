// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validus/Screens/HomePage.dart';
import 'package:validus/utils/colors.dart';
import '../utils/Shared_pref.dart' as shared;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isloggedin = false;
  final _addrresscontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckLoggedin();
  }

  void CheckLoggedin() async {
    setState(() {
      isloggedin = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString('email');
    if (data != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      setState(() {
        isloggedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: isloggedin
          ? const CircularProgressIndicator(
              strokeWidth: 2,
            )
          : Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      style: const TextStyle(color: textcolor),
                      controller: namecontroller,
                      decoration: const InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: inputfield),
                          filled: true,
                          fillColor: filledcolor,
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextFormField(
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val!)
                            ? null
                            : "Please Enter Correct Email";
                      },
                      style: const TextStyle(color: textcolor),
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: inputfield),
                          filled: true,
                          fillColor: filledcolor,
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Address';
                        }
                        return null;
                      },
                      style: const TextStyle(color: textcolor),
                      controller: _addrresscontroller,
                      decoration: const InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(color: inputfield),
                          filled: true,
                          fillColor: filledcolor,
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 15, 24, 0),
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();

                          preferences.setString("name", namecontroller.text);
                          preferences.setString("email", emailcontroller.text);
                          preferences.setString(
                              "address", _addrresscontroller.text);

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      },
                      child: Container(
                        height: height / 14,
                        width: width,
                        color: buttoncolor,
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
