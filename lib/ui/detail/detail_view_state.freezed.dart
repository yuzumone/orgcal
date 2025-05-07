// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'detail_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods',
);

/// @nodoc
class _$DetailViewStateTearOff {
  const _$DetailViewStateTearOff();

  _DetailViewState call({String fontFace = 'Myrica', int fontSize = 16}) {
    return _DetailViewState(fontFace: fontFace, fontSize: fontSize);
  }
}

/// @nodoc
const $DetailViewState = _$DetailViewStateTearOff();

/// @nodoc
mixin _$DetailViewState {
  String get fontFace => throw _privateConstructorUsedError;
  int get fontSize => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailViewStateCopyWith<DetailViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailViewStateCopyWith<$Res> {
  factory $DetailViewStateCopyWith(
    DetailViewState value,
    $Res Function(DetailViewState) then,
  ) = _$DetailViewStateCopyWithImpl<$Res>;
  $Res call({String fontFace, int fontSize});
}

/// @nodoc
class _$DetailViewStateCopyWithImpl<$Res>
    implements $DetailViewStateCopyWith<$Res> {
  _$DetailViewStateCopyWithImpl(this._value, this._then);

  final DetailViewState _value;
  // ignore: unused_field
  final $Res Function(DetailViewState) _then;

  @override
  $Res call({Object? fontFace = freezed, Object? fontSize = freezed}) {
    return _then(
      _value.copyWith(
        fontFace:
            fontFace == freezed
                ? _value.fontFace
                : fontFace // ignore: cast_nullable_to_non_nullable
                    as String,
        fontSize:
            fontSize == freezed
                ? _value.fontSize
                : fontSize // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
abstract class _$DetailViewStateCopyWith<$Res>
    implements $DetailViewStateCopyWith<$Res> {
  factory _$DetailViewStateCopyWith(
    _DetailViewState value,
    $Res Function(_DetailViewState) then,
  ) = __$DetailViewStateCopyWithImpl<$Res>;
  @override
  $Res call({String fontFace, int fontSize});
}

/// @nodoc
class __$DetailViewStateCopyWithImpl<$Res>
    extends _$DetailViewStateCopyWithImpl<$Res>
    implements _$DetailViewStateCopyWith<$Res> {
  __$DetailViewStateCopyWithImpl(
    _DetailViewState _value,
    $Res Function(_DetailViewState) _then,
  ) : super(_value, (v) => _then(v as _DetailViewState));

  @override
  _DetailViewState get _value => super._value as _DetailViewState;

  @override
  $Res call({Object? fontFace = freezed, Object? fontSize = freezed}) {
    return _then(
      _DetailViewState(
        fontFace:
            fontFace == freezed
                ? _value.fontFace
                : fontFace // ignore: cast_nullable_to_non_nullable
                    as String,
        fontSize:
            fontSize == freezed
                ? _value.fontSize
                : fontSize // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
class _$_DetailViewState
    with DiagnosticableTreeMixin
    implements _DetailViewState {
  const _$_DetailViewState({this.fontFace = 'Myrica', this.fontSize = 16});

  @JsonKey(defaultValue: 'Myrica')
  @override
  final String fontFace;
  @JsonKey(defaultValue: 16)
  @override
  final int fontSize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailViewState(fontFace: $fontFace, fontSize: $fontSize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailViewState'))
      ..add(DiagnosticsProperty('fontFace', fontFace))
      ..add(DiagnosticsProperty('fontSize', fontSize));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DetailViewState &&
            (identical(other.fontFace, fontFace) ||
                const DeepCollectionEquality().equals(
                  other.fontFace,
                  fontFace,
                )) &&
            (identical(other.fontSize, fontSize) ||
                const DeepCollectionEquality().equals(
                  other.fontSize,
                  fontSize,
                )));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fontFace) ^
      const DeepCollectionEquality().hash(fontSize);

  @JsonKey(ignore: true)
  @override
  _$DetailViewStateCopyWith<_DetailViewState> get copyWith =>
      __$DetailViewStateCopyWithImpl<_DetailViewState>(this, _$identity);
}

abstract class _DetailViewState implements DetailViewState {
  const factory _DetailViewState({String fontFace, int fontSize}) =
      _$_DetailViewState;

  @override
  String get fontFace => throw _privateConstructorUsedError;
  @override
  int get fontSize => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DetailViewStateCopyWith<_DetailViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
