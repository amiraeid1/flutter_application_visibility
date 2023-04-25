import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
setdata() async {
  SharedPreferences savedata = await SharedPreferences.getInstance();
  savedata.setString("name", "username");
  savedata.setString("password", " my password");
}

getdata() async {
  SharedPreferences getdata = await SharedPreferences.getInstance();
  var username = getdata.get("name");
  var mypassword = getdata.get("password");
}

cleardata() async {
  SharedPreferences clear = await SharedPreferences.getInstance();
  clear.clear();
}
