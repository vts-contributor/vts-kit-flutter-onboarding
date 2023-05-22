import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'carousel.dart';

class CarouselStateNotifier extends StateNotifier<CarouselState> {
  CarouselStateNotifier() : super(const CarouselState());

  void onPageChanged(int page, int dataLength) {
    final isLastPage = page == dataLength - 1;
    state = state.copyWith(page: page, isLastPage: isLastPage);
  }
}
