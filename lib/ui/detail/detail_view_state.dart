import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orgcal/data/repository/preference_repository.dart';
import 'package:state_notifier/state_notifier.dart';

part 'detail_view_state.freezed.dart';

@freezed
abstract class DetailViewState with _$DetailViewState {
  const factory DetailViewState({
    @Default('Myrica') String fontFace,
    @Default(16) int fontSize,
  }) = _DetailViewState;
}

class DetailViewStateNotifier extends StateNotifier<DetailViewState>
    with LocatorMixin {
  PreferenceRepository get _preferenceRepository =>
      read<PreferenceRepository>();

  DetailViewStateNotifier() : super(const DetailViewState());

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    var _pref = await _preferenceRepository.getPreference();
    state = state.copyWith(fontFace: _pref.fontFace, fontSize: _pref.fontSize);
  }
}
