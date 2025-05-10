import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_repository.g.dart';

@riverpod
PreferenceRepository preferenceRepository(Ref ref) {
  return PreferenceRepository();
}

class PreferenceRepository {
  static const argUrls = 'urls';
  static const argTodoKeywords = 'todo_keywords';
  static const argDoneKeywords = 'done_keywords';
  static const argFontFace = 'font_face';
  static const argFontSize = 'font_size';

  PreferenceRepository();

  Future<Preference> getPreference() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    final urls = await asyncPrefs.getStringList(argUrls) ?? [];
    final todoKeywords =
        await asyncPrefs.getStringList(argTodoKeywords) ?? ['TODO'];
    final doneKeywords =
        await asyncPrefs.getStringList(argDoneKeywords) ?? ['DONE'];
    final fontFace = await asyncPrefs.getString(argFontFace) ?? 'Myrica';
    final fontSize = await asyncPrefs.getInt(argFontSize) ?? 16;
    return Preference(urls, todoKeywords, doneKeywords, fontFace, fontSize);
  }

  void setUrls(List<String> urls) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setStringList(argUrls, urls);
  }

  void setTodoKeywords(List<String> todoKeywords) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setStringList(argTodoKeywords, todoKeywords);
  }

  void setDoneKeywords(List<String> doneKeywords) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setStringList(argDoneKeywords, doneKeywords);
  }

  void setFontFace(String fontFace) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setString(argFontFace, fontFace);
  }

  void setFontSize(int fontSize) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setInt(argFontSize, fontSize);
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
