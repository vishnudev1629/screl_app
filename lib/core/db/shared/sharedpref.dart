import 'package:shared_preferences/shared_preferences.dart';

class SetSharedPreferences {
  

  static Future storeCampaign(String campaign) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('campaign', campaign);
  }
  static Future storePreview(String preview) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preview', preview);
  }
  static Future storeName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }
  static Future storeEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
}

class GetSharedPreferences {
 
  static Future<String?> getCampaign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('campaign');
  }
  static Future<String?> getPreview() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preview');
  }
  
  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }
  
  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }
}