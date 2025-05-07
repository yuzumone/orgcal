import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  static const argUrls = 'urls';
  static const argTodoKeywords = 'todo_keywords';
  static const argDoneKeywords = 'done_keywords';
  static const argFontFace = 'font_face';
  static const argFontSize = 'font_size';

  PreferenceRepository();

  Future<Preference> getPreference() async {
    var prefs = await SharedPreferences.getInstance();
    var urls = prefs.getStringList(argUrls) ?? [];
    var todoKeywords = prefs.getStringList(argTodoKeywords) ?? ['TODO'];
    var doneKeywords = prefs.getStringList(argDoneKeywords) ?? ['DONE'];
    var fontFace = prefs.getString(argFontFace) ?? 'Myrica';
    var fontSize = prefs.getInt(argFontSize) ?? 16;
    return Preference(urls, todoKeywords, doneKeywords, fontFace, fontSize);
  }

  void setUrls(List<String> urls) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(argUrls, urls);
  }

  void setTodoKeywords(List<String> todoKeywords) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(argTodoKeywords, todoKeywords);
  }

  void setDoneKeywords(List<String> doneKeywords) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(argDoneKeywords, doneKeywords);
  }

  void setFontFace(String fontFace) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(argFontFace, fontFace);
  }

  void setFontSize(int fontSize) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(argFontSize, fontSize);
  }
}

class Preference {
  List<String> urls;
  List<String> todoKeywords;
  List<String> doneKeywords;
  String fontFace;
  int fontSize;
  Preference(
    this.urls,
    this.todoKeywords,
    this.doneKeywords,
    this.fontFace,
    this.fontSize,
  );
}
