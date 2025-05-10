import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:org_parser/org_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_view_state.g.dart';
part 'search_view_state.freezed.dart';

@freezed
abstract class SearchViewState with _$SearchViewState {
  const factory SearchViewState({@Default([]) List<Headline> result}) =
      _SearchViewState;
}

@riverpod
class SearchViewStateNotifier extends _$SearchViewStateNotifier {
  SearchViewState build() {
    return SearchViewState();
  }

  void setResult(List<Headline> result) =>
      state = state.copyWith(result: result);
}
