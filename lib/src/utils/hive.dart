import 'package:hive/hive.dart';
import 'constants.dart';

class AppHive {
  // void main (){}

  // void openBox()async{
  //   await Hive.openBox(Constants.BOX_NAME);
  //
  // }
  static const String _USER_ID = "user_id";
  static const String _NAME = "name";
  static const String _TOKEN = "token";
  static const String _EMAIL = "email";
  static const String _PREFERENCE = "preferenceid";
  static const String _LATITUDE = "longitude";
  static const String _XUSER = "newuserid";
  static const String _PASSWORD = "userpassword";

  void hivePut({String key, String value}) async {
    await Hive.box(Constants.BOX_NAME).put(key, value);
  }

  String hiveGet({String key}) {
    // openBox();
    return Hive.box(Constants.BOX_NAME).get(key);
  }


  putUserId({String userId}) {
    hivePut(key: _USER_ID, value: userId);
  }

  String getUserId() {
    return hiveGet(key: _USER_ID);
  }


  putUserPassword({String email}) {
    hivePut(key: _PASSWORD, value: email);
  }

  String getUserPassword() {
    return hiveGet(key: _PASSWORD);
  }

  putName({String name}) {
    hivePut(key: _NAME, value: name);
  }

  String getName() {
    return hiveGet(key: _NAME);
  }

  putToken({String token}) {
    hivePut(key: _TOKEN, value: token);
  }

  String getToken() {
    return hiveGet(key: _TOKEN);
  }

  String getEmail() {
    return hiveGet(key: _EMAIL);
  }

  putEmail(String value) {
    return hivePut(key: _EMAIL, value: value);
  }

  putPreference(String value) {
    return hivePut(key: _PREFERENCE, value: value);
  }

  String getPreferenceId() {
    return hiveGet(key: _PREFERENCE);
  }

  putXUser(String value) {
    return hivePut(key: _XUSER, value: value);
  }

  getXUser() {
    return hiveGet(key: _XUSER,);
  }


  AppHive();


}