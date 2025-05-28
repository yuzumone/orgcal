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
  static const argFontSize = 'font_size';
  static const argCalendarColor = 'calendar_color';
  static const argTimezone = 'timezone';

  PreferenceRepository();

  Future<Preference> getPreference() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    final urls = await asyncPrefs.getStringList(argUrls) ?? [];
    final todoKeywords =
        await asyncPrefs.getStringList(argTodoKeywords) ?? ['TODO'];
    final doneKeywords =
        await asyncPrefs.getStringList(argDoneKeywords) ?? ['DONE'];
    final fontSize = await asyncPrefs.getInt(argFontSize) ?? 16;
    final calendarColor =
        await asyncPrefs.getInt(argCalendarColor) ?? 4280391411;
    final timezone = await asyncPrefs.getString(argTimezone) ?? 'Asia/Tokyo';
    return Preference(urls, todoKeywords, doneKeywords, fontSize, calendarColor, timezone);
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

  void setFontSize(int fontSize) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setInt(argFontSize, fontSize);
  }

  void setCalendarColor(int color) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setInt(argCalendarColor, color);
  }

  void setTimezone(String timezone) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setString(argTimezone, timezone);
  }
}

class Preference {
  List<String> urls;
  List<String> todoKeywords;
  List<String> doneKeywords;
  int fontSize;
  int calendartColor;
  String timezone;
  Preference(
    this.urls,
    this.todoKeywords,
    this.doneKeywords,
    this.fontSize,
    this.calendartColor,
    this.timezone,
  );
}
