import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:org_parser/org_parser.dart';
import 'package:state_notifier/state_notifier.dart';

part 'search_view_state.freezed.dart';

@freezed
abstract class SearchViewState with _$SearchViewState {
  const factory SearchViewState({
    @Default([]) List<Headline> result,
  }) = _SearchViewState;
}

class SearchViewStateNotifier extends StateNotifier<SearchViewState> {
  SearchViewStateNotifier() : super(const SearchViewState());

  void setResult(List<Headline> result) =>
      state = state.copyWith(result: result);
}
