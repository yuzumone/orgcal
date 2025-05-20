import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orgcal/data/model/preference_view_type.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_view_state.g.dart';
part 'preference_view_state.freezed.dart';

@freezed
abstract class PreferenceViewState with _$PreferenceViewState {
  const factory PreferenceViewState({
    @Default(PreferenceViewType.main) viewType,
    @Default([]) List<String> urls,
    @Default([]) List<String> todoKeywords,
    @Default([]) List<String> doneKeywords,
    @Default(16) int fontSize,
  }) = _PreferenceViewState;
}

@riverpod
class PreferenceViewStateNotifier extends _$PreferenceViewStateNotifier {
  @override
  PreferenceViewState build() {
    init();
    return const PreferenceViewState();
  }

  Future<void> init() async {
    final repository = ref.read(preferenceRepositoryProvider);
    final pref = await repository.getPreference();
    state = state.copyWith(
      urls: pref.urls,
      todoKeywords: pref.todoKeywords,
      doneKeywords: pref.doneKeywords,
      fontSize: pref.fontSize,
    );
  }

  void setViewType(PreferenceViewType viewType) {
    state = state.copyWith(viewType: viewType);
  }

  void setUrls(List<String> urls) {
    final repository = ref.read(preferenceRepositoryProvider);
    state = state.copyWith(urls: urls);
    repository.setUrls(urls);
  }

  void setTodoKeywords(List<String> keywords) {
    final repository = ref.read(preferenceRepositoryProvider);
    state = state.copyWith(todoKeywords: keywords);
    repository.setTodoKeywords(keywords);
  }

  void setDoneKeywords(List<String> keywords) {
    final repository = ref.read(preferenceRepositoryProvider);
    state = state.copyWith(doneKeywords: keywords);
    repository.setDoneKeywords(keywords);
  }

  void setFontSize(int fontSize) {
    final repository = ref.read(preferenceRepositoryProvider);
    state = state.copyWith(fontSize: fontSize);
    repository.setFontSize(fontSize);
  }
}
