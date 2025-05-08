// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchViewState implements DiagnosticableTreeMixin {

 List<Headline> get result;
/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchViewStateCopyWith<SearchViewState> get copyWith => _$SearchViewStateCopyWithImpl<SearchViewState>(this as SearchViewState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SearchViewState'))
    ..add(DiagnosticsProperty('result', result));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchViewState&&const DeepCollectionEquality().equals(other.result, result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(result));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SearchViewState(result: $result)';
}


}

/// @nodoc
abstract mixin class $SearchViewStateCopyWith<$Res>  {
  factory $SearchViewStateCopyWith(SearchViewState value, $Res Function(SearchViewState) _then) = _$SearchViewStateCopyWithImpl;
@useResult
$Res call({
 List<Headline> result
});




}
/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._self, this._then);

  final SearchViewState _self;
  final $Res Function(SearchViewState) _then;

/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Headline>,
  ));
}

}


/// @nodoc


class _SearchViewState with DiagnosticableTreeMixin implements SearchViewState {
  const _SearchViewState({final  List<Headline> result = const []}): _result = result;
  

 final  List<Headline> _result;
@override@JsonKey() List<Headline> get result {
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_result);
}


/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchViewStateCopyWith<_SearchViewState> get copyWith => __$SearchViewStateCopyWithImpl<_SearchViewState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SearchViewState'))
    ..add(DiagnosticsProperty('result', result));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchViewState&&const DeepCollectionEquality().equals(other._result, _result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_result));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SearchViewState(result: $result)';
}


}

/// @nodoc
abstract mixin class _$SearchViewStateCopyWith<$Res> implements $SearchViewStateCopyWith<$Res> {
  factory _$SearchViewStateCopyWith(_SearchViewState value, $Res Function(_SearchViewState) _then) = __$SearchViewStateCopyWithImpl;
@override @useResult
$Res call({
 List<Headline> result
});




}
/// @nodoc
class __$SearchViewStateCopyWithImpl<$Res>
    implements _$SearchViewStateCopyWith<$Res> {
  __$SearchViewStateCopyWithImpl(this._self, this._then);

  final _SearchViewState _self;
  final $Res Function(_SearchViewState) _then;

/// Create a copy of SearchViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(_SearchViewState(
result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Headline>,
  ));
}


}

// dart format on
