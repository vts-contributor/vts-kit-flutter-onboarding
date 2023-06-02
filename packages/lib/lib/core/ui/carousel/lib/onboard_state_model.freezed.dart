// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'carousel_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CarouselStateTearOff {
  const _$CarouselStateTearOff();

  _CarouselState call({int page = 0, bool isLastPage = false}) {
    return _CarouselState(
      page: page,
      isLastPage: isLastPage,
    );
  }
}

/// @nodoc
const $CarouselState = _$CarouselStateTearOff();

/// @nodoc
mixin _$CarouselState {
  int get page => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CarouselStateCopyWith<CarouselState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselStateCopyWith<$Res> {
  factory $CarouselStateCopyWith(
      CarouselState value, $Res Function(CarouselState) then) =
      _$CarouselStateCopyWithImpl<$Res>;
  $Res call({int page, bool isLastPage});
}

/// @nodoc
class _$CarouselStateCopyWithImpl<$Res> implements $CarouselStateCopyWith<$Res> {
  _$CarouselStateCopyWithImpl(this._value, this._then);

  final CarouselState _value;
  // ignore: unused_field
  final $Res Function(CarouselState) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$CarouselStateCopyWith<$Res>
    implements $CarouselStateCopyWith<$Res> {
  factory _$CarouselStateCopyWith(
          _CarouselState value, $Res Function(_CarouselState) then) =
      __$CarouselStateCopyWithImpl<$Res>;
  @override
  $Res call({int page, bool isLastPage});
}

/// @nodoc
class __$CarouselStateCopyWithImpl<$Res> extends _$CarouselStateCopyWithImpl<$Res>
    implements _$CarouselStateCopyWith<$Res> {
  __$CarouselStateCopyWithImpl(
      _CarouselState _value, $Res Function(_CarouselState) _then)
      : super(_value, (v) => _then(v as _CarouselState));

  @override
  _CarouselState get _value => super._value as _CarouselState;

  @override
  $Res call({
    Object? page = freezed,
    Object? isLastPage = freezed,
  }) {
    return _then(_CarouselState(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      isLastPage: isLastPage == freezed
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CarouselState implements _CarouselState {
  const _$_CarouselState({this.page = 0, this.isLastPage = false});

  @JsonKey(defaultValue: 0)
  @override
  final int page;
  @JsonKey(defaultValue: false)
  @override
  final bool isLastPage;

  @override
  String toString() {
    return 'CarouselState(page: $page, isLastPage: $isLastPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CarouselState &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, isLastPage);

  @JsonKey(ignore: true)
  @override
  _$CarouselStateCopyWith<_CarouselState> get copyWith =>
      __$CarouselStateCopyWithImpl<_CarouselState>(this, _$identity);
}

abstract class _CarouselState implements CarouselState {
  const factory _CarouselState({int page, bool isLastPage}) = _$_CarouselState;

  @override
  int get page;
  @override
  bool get isLastPage;
  @override
  @JsonKey(ignore: true)
  _$CarouselStateCopyWith<_CarouselState> get copyWith =>
      throw _privateConstructorUsedError;
}
