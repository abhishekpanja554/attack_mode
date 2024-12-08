import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_screen_provider.g.dart';

class PageState {
  final int currentPageIndex;
  final PageController controller;
  PageState(
    this.currentPageIndex,
    this.controller,
  );

  PageState copyWith({
    int? currentPageIndex,
    PageController? controller,
  }) {
    return PageState(
      currentPageIndex ?? this.currentPageIndex,
      controller ?? this.controller,
    );
  }
}

@riverpod
class PageStateNotifier extends _$PageStateNotifier {
  @override
  PageState build() {
    return PageState(
      0,
      PageController(initialPage: 0),
    ); // Initial state
  }

  void changePageIndex(int newIndex) {
    state = state.copyWith(currentPageIndex: newIndex);
  }
}
