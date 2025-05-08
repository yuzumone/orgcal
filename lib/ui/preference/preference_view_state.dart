import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orgcal/data/model/preference_view_type.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:state_notifier/state_notifier.dart';

part 'preference_view_state.freezed.dart';

@freezed
abstract class PreferenceViewState with _$PreferenceViewState {
  const factory PreferenceViewState({
    @Default(PreferenceViewType.main) viewType,
    @Default([]) List<String> urls,
    @Default([]) List<String> todoKeywords,
    @Default([]) List<String> doneKeywords,
    @Default('Myrica') String fontFace,
    @Default(16) int fontSize,
  }) = _PreferenceViewState;
}

class PreferenceViewStateNotifier extends StateNotifier<PreferenceViewState>
    with LocatorMixin {
  PreferenceRepository get _preferenceRepository =>
      read<PreferenceRepository>();

  PreferenceViewStateNotifier() : super(const PreferenceViewState());

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    var pref = await _preferenceRepository.getPreference();
    state = state.copyWith(
      urls: pref.urls,
      todoKeywords: pref.todoKeywords,
      doneKeywords: pref.doneKeywords,
      fontFace: pref.fontFace,
      fontSize: pref.fontSize,
    );
  }

  void setViewType(PreferenceViewType viewType) {
    state = state.copyWith(viewType: viewType);
  }

  void setUrls(List<String> urls) {
    state = state.copyWith(urls: urls);
    _preferenceRepository.setUrls(urls);
  }

  void setTodoKeywords(List<String> keywords) {
    state = state.copyWith(todoKeywords: keywords);
    _preferenceRepository.setTodoKeywords(keywords);
  }

  void setDoneKeywords(List<String> keywords) {
    state = state.copyWith(doneKeywords: keywords);
    _preferenceRepository.setDoneKeywords(keywords);
  }

  void setFontFace(String fontFace) {
    state = state.copyWith(fontFace: fontFace);
    _preferenceRepository.setFontFace(fontFace);
  }

  void setFontSize(int fontSize) {
    state = state.copyWith(fontSize: fontSize);
    _preferenceRepository.setFontSize(fontSize);
  }
}
