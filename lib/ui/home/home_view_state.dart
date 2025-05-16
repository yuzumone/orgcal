import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:org_parser/org_parser.dart';
import 'package:orgcal/data/model/file.dart';
import 'package:orgcal/data/repository/file_repository.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

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
    if (files.isNotEmpty) {
      syncCalendar(files[0]); //TODO
    }
  }

  Future<void> syncCalendar(File file) async {
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

      final orgcal = await retrieveOrgCalendar(deviceCalendarPlugin);
      if (orgcal == null) {
        final calId = await createCalendar(deviceCalendarPlugin);
        if (calId == null) {
          return;
        }
        updateEvents(deviceCalendarPlugin, calId, file);
      } else {
        updateEvents(deviceCalendarPlugin, orgcal.id!, file);
      }
    } catch (e) {
      // TODO
    }
  }

  Future<Calendar?> retrieveOrgCalendar(DeviceCalendarPlugin plugin) async {
    final calendarsResult = await plugin.retrieveCalendars();
    if (!calendarsResult.isSuccess || calendarsResult.data == null) {
      return null;
    }
    return calendarsResult.data?.firstWhereOrNull(
      (e) => e.accountName == 'orgcal',
    );
  }

  Future<String?> createCalendar(DeviceCalendarPlugin plugin) async {
    final result = await plugin.createCalendar(
      'orgcal',
      localAccountName: 'orgcal',
    );
    if (result.isSuccess && result.data != null) {
      return result.data;
    }
    return null;
  }

  Future<void> updateEvents(
    DeviceCalendarPlugin plugin,
    String id,
    File file,
  ) async {
    final params = RetrieveEventsParams(
      startDate: DateTime(2020),
      endDate: DateTime(2050),
    );
    final events = await plugin.retrieveEvents(id, params);
    if (events.isSuccess) {
      for (var e in events.data as List<Event>) {
        await plugin.deleteEvent(id, e.eventId);
      }
    }

    for (final h in file.org.headlines) {
      if (h.scheduledDateTime == null) continue;
      await plugin.createOrUpdateEvent(createEvent(id, h));
    }
  }

  Event createEvent(String id, Headline headline) {
    final location = getLocation('Asia/Tokyo'); // TODO
    final start = TZDateTime.from(headline.scheduledDateTime!, location);
    final end = TZDateTime.from(
      headline.scheduledDateTime!.add(Duration(hours: 1)),
      location,
    ); //TODO
    final status = EventStatus.Confirmed;
    return Event(
      id,
      title: headline.title,
      description: headline.raw,
      start: start,
      end: end,
      status: status,
      allDay: false,
    );
  }

  void setIndex(int index) => state = state.copyWith(pageIndex: index);

  void addWeekDiff() => state = state.copyWith(weekDiff: state.weekDiff + 1);

  void subtractWeekDiff() =>
      state = state.copyWith(weekDiff: state.weekDiff - 1);
}
