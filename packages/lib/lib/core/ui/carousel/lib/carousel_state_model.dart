import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_state_model.freezed.dart';

@freezed
class CarouselState with _$CarouselState {
  const factory CarouselState({
    @Default(0) int page,
    @Default(false) bool isLastPage,
  }) = _CarouselState;
}
