// import 'package:attack_mode_app/features/home/presentation/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_provider.g.dart';

class HomePageState {
  int currentCategoryCarouselIndex;
  List<CategoryIcon> categories;

  HomePageState({
    required this.currentCategoryCarouselIndex,
    required this.categories,
  });

  factory HomePageState.init() {
    debugPrint("HomePageState.init()");
    return HomePageState(
      currentCategoryCarouselIndex: 1,
      categories: [
        CategoryIcon(title: "Muscular", icon: FontAwesome.dumbbell_solid),
        CategoryIcon(title: "Rich", icon: FontAwesome.sack_dollar_solid),
        CategoryIcon(title: "Discipline", icon: FontAwesome.brain_solid),
      ],
    );
  }

  HomePageState copyWith(
      {int? currentCategoryCarouselIndex, List<CategoryIcon>? categories}) {
    return HomePageState(
      currentCategoryCarouselIndex:
          currentCategoryCarouselIndex ?? this.currentCategoryCarouselIndex,
      categories: categories ?? this.categories,
    );
  }
}

class CategoryIcon {
  final String title;
  final IconData icon;

  CategoryIcon({required this.title, required this.icon});
}

@riverpod
class HomePageStateNotifier extends _$HomePageStateNotifier {
  @override
  HomePageState build() {
    return HomePageState.init(); // Initial state
  }

  void changeCurrentCategoryIndex(int newIndex) {
    state = state.copyWith(currentCategoryCarouselIndex: newIndex);
  }
}
