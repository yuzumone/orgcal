import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_state.g.dart';
part 'detail_view_state.freezed.dart';

@freezed
abstract class DetailViewState with _$DetailViewState {
  const factory DetailViewState({@Default(16) int fontSize}) = _DetailViewState;
}

@riverpod
class DetailViewStateNotifier extends _$DetailViewStateNotifier {
  @override
  DetailViewState build() {
    init();
    return const DetailViewState();
  }

  Future<void> init() async {
    final repository = ref.read(preferenceRepositoryProvider);
    final pref = await repository.getPreference();
    state = state.copyWith(fontSize: pref.fontSize);
  }
}
