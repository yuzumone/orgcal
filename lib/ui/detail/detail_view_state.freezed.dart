// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailViewState implements DiagnosticableTreeMixin {

 int get fontSize;
/// Create a copy of DetailViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailViewStateCopyWith<DetailViewState> get copyWith => _$DetailViewStateCopyWithImpl<DetailViewState>(this as DetailViewState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DetailViewState'))
    ..add(DiagnosticsProperty('fontSize', fontSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailViewState&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize));
}


@override
int get hashCode => Object.hash(runtimeType,fontSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DetailViewState(fontSize: $fontSize)';
}


}

/// @nodoc
abstract mixin class $DetailViewStateCopyWith<$Res>  {
  factory $DetailViewStateCopyWith(DetailViewState value, $Res Function(DetailViewState) _then) = _$DetailViewStateCopyWithImpl;
@useResult
$Res call({
 int fontSize
});




}
/// @nodoc
class _$DetailViewStateCopyWithImpl<$Res>
    implements $DetailViewStateCopyWith<$Res> {
  _$DetailViewStateCopyWithImpl(this._self, this._then);

  final DetailViewState _self;
  final $Res Function(DetailViewState) _then;

/// Create a copy of DetailViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontSize = null,}) {
  return _then(_self.copyWith(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _DetailViewState with DiagnosticableTreeMixin implements DetailViewState {
  const _DetailViewState({this.fontSize = 16});
  

@override@JsonKey() final  int fontSize;

/// Create a copy of DetailViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailViewStateCopyWith<_DetailViewState> get copyWith => __$DetailViewStateCopyWithImpl<_DetailViewState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DetailViewState'))
    ..add(DiagnosticsProperty('fontSize', fontSize));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailViewState&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize));
}


@override
int get hashCode => Object.hash(runtimeType,fontSize);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DetailViewState(fontSize: $fontSize)';
}


}

/// @nodoc
abstract mixin class _$DetailViewStateCopyWith<$Res> implements $DetailViewStateCopyWith<$Res> {
  factory _$DetailViewStateCopyWith(_DetailViewState value, $Res Function(_DetailViewState) _then) = __$DetailViewStateCopyWithImpl;
@override @useResult
$Res call({
 int fontSize
});




}
/// @nodoc
class __$DetailViewStateCopyWithImpl<$Res>
    implements _$DetailViewStateCopyWith<$Res> {
  __$DetailViewStateCopyWithImpl(this._self, this._then);

  final _DetailViewState _self;
  final $Res Function(_DetailViewState) _then;

/// Create a copy of DetailViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontSize = null,}) {
  return _then(_DetailViewState(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
