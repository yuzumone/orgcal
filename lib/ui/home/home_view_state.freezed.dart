// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeViewState implements DiagnosticableTreeMixin {

 int get pageIndex; List<File> get files; List<String> get urls; List<String> get todoKeywords; List<String> get doneKeywords; int get weekDiff;
/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeViewStateCopyWith<HomeViewState> get copyWith => _$HomeViewStateCopyWithImpl<HomeViewState>(this as HomeViewState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeViewState'))
    ..add(DiagnosticsProperty('pageIndex', pageIndex))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('urls', urls))..add(DiagnosticsProperty('todoKeywords', todoKeywords))..add(DiagnosticsProperty('doneKeywords', doneKeywords))..add(DiagnosticsProperty('weekDiff', weekDiff));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeViewState&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&const DeepCollectionEquality().equals(other.files, files)&&const DeepCollectionEquality().equals(other.urls, urls)&&const DeepCollectionEquality().equals(other.todoKeywords, todoKeywords)&&const DeepCollectionEquality().equals(other.doneKeywords, doneKeywords)&&(identical(other.weekDiff, weekDiff) || other.weekDiff == weekDiff));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex,const DeepCollectionEquality().hash(files),const DeepCollectionEquality().hash(urls),const DeepCollectionEquality().hash(todoKeywords),const DeepCollectionEquality().hash(doneKeywords),weekDiff);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeViewState(pageIndex: $pageIndex, files: $files, urls: $urls, todoKeywords: $todoKeywords, doneKeywords: $doneKeywords, weekDiff: $weekDiff)';
}


}

/// @nodoc
abstract mixin class $HomeViewStateCopyWith<$Res>  {
  factory $HomeViewStateCopyWith(HomeViewState value, $Res Function(HomeViewState) _then) = _$HomeViewStateCopyWithImpl;
@useResult
$Res call({
 int pageIndex, List<File> files, List<String> urls, List<String> todoKeywords, List<String> doneKeywords, int weekDiff
});




}
/// @nodoc
class _$HomeViewStateCopyWithImpl<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._self, this._then);

  final HomeViewState _self;
  final $Res Function(HomeViewState) _then;

/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageIndex = null,Object? files = null,Object? urls = null,Object? todoKeywords = null,Object? doneKeywords = null,Object? weekDiff = null,}) {
  return _then(_self.copyWith(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<File>,urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,todoKeywords: null == todoKeywords ? _self.todoKeywords : todoKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,doneKeywords: null == doneKeywords ? _self.doneKeywords : doneKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,weekDiff: null == weekDiff ? _self.weekDiff : weekDiff // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _HomeViewState with DiagnosticableTreeMixin implements HomeViewState {
  const _HomeViewState({this.pageIndex = 0, final  List<File> files = const [], final  List<String> urls = const [], final  List<String> todoKeywords = const [], final  List<String> doneKeywords = const [], this.weekDiff = 0}): _files = files,_urls = urls,_todoKeywords = todoKeywords,_doneKeywords = doneKeywords;
  

@override@JsonKey() final  int pageIndex;
 final  List<File> _files;
@override@JsonKey() List<File> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}

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

@override@JsonKey() final  int weekDiff;

/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeViewStateCopyWith<_HomeViewState> get copyWith => __$HomeViewStateCopyWithImpl<_HomeViewState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeViewState'))
    ..add(DiagnosticsProperty('pageIndex', pageIndex))..add(DiagnosticsProperty('files', files))..add(DiagnosticsProperty('urls', urls))..add(DiagnosticsProperty('todoKeywords', todoKeywords))..add(DiagnosticsProperty('doneKeywords', doneKeywords))..add(DiagnosticsProperty('weekDiff', weekDiff));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeViewState&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&const DeepCollectionEquality().equals(other._files, _files)&&const DeepCollectionEquality().equals(other._urls, _urls)&&const DeepCollectionEquality().equals(other._todoKeywords, _todoKeywords)&&const DeepCollectionEquality().equals(other._doneKeywords, _doneKeywords)&&(identical(other.weekDiff, weekDiff) || other.weekDiff == weekDiff));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex,const DeepCollectionEquality().hash(_files),const DeepCollectionEquality().hash(_urls),const DeepCollectionEquality().hash(_todoKeywords),const DeepCollectionEquality().hash(_doneKeywords),weekDiff);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeViewState(pageIndex: $pageIndex, files: $files, urls: $urls, todoKeywords: $todoKeywords, doneKeywords: $doneKeywords, weekDiff: $weekDiff)';
}


}

/// @nodoc
abstract mixin class _$HomeViewStateCopyWith<$Res> implements $HomeViewStateCopyWith<$Res> {
  factory _$HomeViewStateCopyWith(_HomeViewState value, $Res Function(_HomeViewState) _then) = __$HomeViewStateCopyWithImpl;
@override @useResult
$Res call({
 int pageIndex, List<File> files, List<String> urls, List<String> todoKeywords, List<String> doneKeywords, int weekDiff
});




}
/// @nodoc
class __$HomeViewStateCopyWithImpl<$Res>
    implements _$HomeViewStateCopyWith<$Res> {
  __$HomeViewStateCopyWithImpl(this._self, this._then);

  final _HomeViewState _self;
  final $Res Function(_HomeViewState) _then;

/// Create a copy of HomeViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,Object? files = null,Object? urls = null,Object? todoKeywords = null,Object? doneKeywords = null,Object? weekDiff = null,}) {
  return _then(_HomeViewState(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<File>,urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,todoKeywords: null == todoKeywords ? _self._todoKeywords : todoKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,doneKeywords: null == doneKeywords ? _self._doneKeywords : doneKeywords // ignore: cast_nullable_to_non_nullable
as List<String>,weekDiff: null == weekDiff ? _self.weekDiff : weekDiff // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
