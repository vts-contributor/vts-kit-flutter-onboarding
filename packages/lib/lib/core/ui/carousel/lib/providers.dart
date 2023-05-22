

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'carousel.dart';
import 'carousel_state.dart';


final carouselStateProvider =
    StateNotifierProvider<CarouselStateNotifier, CarouselState>(
  (ref) {
    final carouselStateNotifier = CarouselStateNotifier();
    return carouselStateNotifier;
  },
);
