import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:org_parser_example/data/repository/file_repository.dart';
import 'package:org_parser_example/data/repository/preference_repository.dart';
import 'package:org_parser_example/data/model/file.dart';
import 'package:state_notifier/state_notifier.dart';

part 'home_view_state.freezed.dart';

@freezed
abstract class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default(0) int pageIndex,
    @Default([]) List<File> files,
    @Default([]) List<String> urls,
    @Default([]) List<String> todoKeywords,
    @Default([]) List<String> doneKeywords,
    @Default(0) int weekDiff,
  }) = _HomeViewState;
}

class HomeViewStateNotifier extends StateNotifier<HomeViewState>
    with LocatorMixin {
  PreferenceRepository get _preferenceRepository =>
      read<PreferenceRepository>();
  FileRepository get _fileRepository => read<FileRepository>();

  HomeViewStateNotifier() : super(const HomeViewState());

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    var _pref = await _preferenceRepository.getPreference();
    var _keywords = _pref.todoKeywords + _pref.doneKeywords;
    var _files = await _fileRepository.getWebFiles(_pref.urls, _keywords);
    state = state.copyWith(
      files: _files,
      todoKeywords: _pref.todoKeywords,
      doneKeywords: _pref.doneKeywords,
    );
  }

  void setIndex(int index) => state = state.copyWith(pageIndex: index);

  void addWeekDiff() => state = state.copyWith(weekDiff: state.weekDiff + 1);

  void subtractWeekDiff() =>
      state = state.copyWith(weekDiff: state.weekDiff - 1);
}
