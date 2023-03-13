// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferenceHelper {
//   static const String NAME = 'name';
//   static const String EMAIL = 'email';
//   static const String ADDRESS = 'address';

//   static  SharedPreferences ?preferences;

//   static Future<SharedPreferences> init() async {
//     preferences = await SharedPreferences.getInstance();
//     return preferences!;
//   }

//   static Future<bool> setName(String value) async =>
//       preferences!.setString(NAME, value);

//    static String getName() => preferences!.getString(NAME) ?? '';

//   static Future<bool> setEmail(String value) async =>
//       preferences!.setString(EMAIL, value);

//   static String getEmail() => preferences!.getString(EMAIL) ?? '';

//   static Future<bool> setAddress(String value) async =>
//       preferences!.setString(ADDRESS, value);

//   static String getAddress() => preferences!.getString(ADDRESS) ?? '';
// }
