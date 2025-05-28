// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferenceViewState implements DiagnosticableTreeMixin {

 dynamic get viewType; List<String> get urls; List<String> get todoKeywords; List<String> get doneKeywords; int get fontSize; int get calendarColor; String get timezone;
/// Create a copy of PreferenceViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferenceViewStateCopyWith<PreferenceViewState> get copyWith => _$PreferenceViewStateCopyWithImpl<PreferenceViewState>(this as PreferenceViewState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PreferenceViewState'))
    ..add(DiagnosticsProperty('viewType', viewType))..add(DiagnosticsProperty('urls', urls))..add(DiagnosticsProperty('todoKeywords', todoKeywords))..add(DiagnosticsProperty('doneKeywords', doneKeywords))..add(DiagnosticsProperty('fontSize', fontSize))..add(DiagnosticsProperty('calendarColor', calendarColor))..add(DiagnosticsProperty('timezone', timezone));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferenceViewState&&const DeepCollectionEquality().equals(other.viewType, viewType)&&const DeepCollectionEquality().equals(other.urls, urls)&&const DeepCollectionEquality().equals(other.todoKeywords, todoKeywords)&&const DeepCollectionEquality().equals(other.doneKeywords, doneKeywords)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.calendarColor, calendarColor) || other.calendarColor == calendarColor)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(viewType),const DeepCollectionEquality().hash(urls),const DeepCollectionEquality().hash(todoKeywords),const DeepCollectionEquality().hash(doneKeywords),fontSize,calendarColor,timezone);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PreferenceViewState(viewType: $viewType, urls: $urls, todoKeywords: $todoKeywords, doneKeywords: $doneKeywords, fontSize: $fontSize, calendarColor: $calendarColor, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class $PreferenceViewStateCopyWith<$Res>  {
  factory $PreferenceViewStateCopyWith(PreferenceViewState value, $Res Function(PreferenceViewState) _then) = _$PreferenceViewStateCopyWithImpl;
@useResult
$Res call({
 dynamic viewType, List<String> urls, List<String> todoKeywords, List<String> doneKeywords, int fontSize, int calendarColor, String timezone
});




}
/// @nodoc
class _$PreferenceViewStateCopyWithImpl<$Res>
    implements $PreferenceViewStateCopyWith<$Res> {
  _$PreferenceViewStateCopyWithImpl(this._self, this._then);

  final PreferenceViewState _self;
  final $Res Function(PreferenceViewState) _then;

/// Create a copy of PreferenceViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewType = freezed,Object? urls = null,Object? todoKeywords = null,Object? doneKeywords = null,Object? fontSize = null,Object? calendarColor = null,Object? timezone = null,}) {
  return _then(_self.copyWith(
viewType: freezed == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as dynamic,urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,todoKeywords: null == todoKeywords ? _self.todoKeywords : todoKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,doneKeywords: null == doneKeywords ? _self.doneKeywords : doneKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,calendarColor: null == calendarColor ? _self.calendarColor : calendarColor // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _PreferenceViewState with DiagnosticableTreeMixin implements PreferenceViewState {
  const _PreferenceViewState({this.viewType = PreferenceViewType.main, final  List<String> urls = const [], final  List<String> todoKeywords = const [], final  List<String> doneKeywords = const [], this.fontSize = 16, this.calendarColor = 0, this.timezone = 'Asia/Tokyo'}): _urls = urls,_todoKeywords = todoKeywords,_doneKeywords = doneKeywords;
  

@override@JsonKey() final  dynamic viewType;
 final  List<String> _urls;
@override@JsonKey() List<String> get urls {
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_urls);
}

 final  List<String> _todoKeywords;
@override@JsonKey() List<String> get todoKeywords {
  if (_todoKeywords is EqualUnmodifiableListView) return _todoKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todoKeywords);
}

 final  List<String> _doneKeywords;
@override@JsonKey() List<String> get doneKeywords {
  if (_doneKeywords is EqualUnmodifiableListView) return _doneKeywords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doneKeywords);
}

@override@JsonKey() final  int fontSize;
@override@JsonKey() final  int calendarColor;
@override@JsonKey() final  String timezone;

/// Create a copy of PreferenceViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferenceViewStateCopyWith<_PreferenceViewState> get copyWith => __$PreferenceViewStateCopyWithImpl<_PreferenceViewState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PreferenceViewState'))
    ..add(DiagnosticsProperty('viewType', viewType))..add(DiagnosticsProperty('urls', urls))..add(DiagnosticsProperty('todoKeywords', todoKeywords))..add(DiagnosticsProperty('doneKeywords', doneKeywords))..add(DiagnosticsProperty('fontSize', fontSize))..add(DiagnosticsProperty('calendarColor', calendarColor))..add(DiagnosticsProperty('timezone', timezone));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferenceViewState&&const DeepCollectionEquality().equals(other.viewType, viewType)&&const DeepCollectionEquality().equals(other._urls, _urls)&&const DeepCollectionEquality().equals(other._todoKeywords, _todoKeywords)&&const DeepCollectionEquality().equals(other._doneKeywords, _doneKeywords)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.calendarColor, calendarColor) || other.calendarColor == calendarColor)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(viewType),const DeepCollectionEquality().hash(_urls),const DeepCollectionEquality().hash(_todoKeywords),const DeepCollectionEquality().hash(_doneKeywords),fontSize,calendarColor,timezone);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PreferenceViewState(viewType: $viewType, urls: $urls, todoKeywords: $todoKeywords, doneKeywords: $doneKeywords, fontSize: $fontSize, calendarColor: $calendarColor, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$PreferenceViewStateCopyWith<$Res> implements $PreferenceViewStateCopyWith<$Res> {
  factory _$PreferenceViewStateCopyWith(_PreferenceViewState value, $Res Function(_PreferenceViewState) _then) = __$PreferenceViewStateCopyWithImpl;
@override @useResult
$Res call({
 dynamic viewType, List<String> urls, List<String> todoKeywords, List<String> doneKeywords, int fontSize, int calendarColor, String timezone
});




}
/// @nodoc
class __$PreferenceViewStateCopyWithImpl<$Res>
    implements _$PreferenceViewStateCopyWith<$Res> {
  __$PreferenceViewStateCopyWithImpl(this._self, this._then);

  final _PreferenceViewState _self;
  final $Res Function(_PreferenceViewState) _then;

/// Create a copy of PreferenceViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewType = freezed,Object? urls = null,Object? todoKeywords = null,Object? doneKeywords = null,Object? fontSize = null,Object? calendarColor = null,Object? timezone = null,}) {
  return _then(_PreferenceViewState(
viewType: freezed == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as dynamic,urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,todoKeywords: null == todoKeywords ? _self._todoKeywords : todoKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,doneKeywords: null == doneKeywords ? _self._doneKeywords : doneKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,calendarColor: null == calendarColor ? _self.calendarColor : calendarColor // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
