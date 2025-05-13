import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orgcal/data/model/file.dart';
import 'package:orgcal/data/repository/file_repository.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_state.g.dart';
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

@riverpod
class HomeViewStateNotifier extends _$HomeViewStateNotifier {
  @override
  HomeViewState build() {
    init();
    requestPermissions();
    return const HomeViewState();
  }

  Future<void> init() async {
    final preferenceRepository = ref.read(preferenceRepositoryProvider);
    final fileRepository = ref.read(fileRepositoryProvider);
    final pref = await preferenceRepository.getPreference();
    final keywords = pref.todoKeywords + pref.doneKeywords;
    final files = await fileRepository.getWebFiles(pref.urls, keywords);
    state = state.copyWith(
      files: files,
      todoKeywords: pref.todoKeywords,
      doneKeywords: pref.doneKeywords,
    );
  }

  void requestPermissions() async {
    final deviceCalendarPlugin = DeviceCalendarPlugin();
    try {
      var permissionsGranted = await deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess &&
          (permissionsGranted.data == null ||
              permissionsGranted.data == false)) {
        permissionsGranted = await deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess ||
            permissionsGranted.data == null ||
            permissionsGranted.data == false) {
          return;
        }
      }
    } catch (e) {
      // TODO
    }
  }

  void setIndex(int index) => state = state.copyWith(pageIndex: index);

  void addWeekDiff() => state = state.copyWith(weekDiff: state.weekDiff + 1);

  void subtractWeekDiff() =>
      state = state.copyWith(weekDiff: state.weekDiff - 1);
}
