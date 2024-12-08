import 'package:attack_mode_app/config/themes/constants.dart';
import 'package:attack_mode_app/core/util/global_utilities.dart';
import 'package:attack_mode_app/features/base/presentation/providers/base_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  final List<IconData> items;
  final int? initialIndex;
  final Function(int)? onItemTap;
  const BottomNavBar(
      {super.key, required this.items, this.initialIndex, this.onItemTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageState pageState = ref.watch(pageStateNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80 * items.length.toDouble(),
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: ColorManager().black,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: mapIndexed(
              items,
              (index, item) => BottomNavbarItem(
                icon: item,
                isSelected: index == pageState.currentPageIndex,
                onPresssed: () {
                  if (onItemTap != null) {
                    onItemTap!(index);
                  }
                },
              ),
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class BottomNavbarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function() onPresssed;
  const BottomNavbarItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onPresssed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresssed,
      borderRadius: BorderRadius.circular(40),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color:
              isSelected ? ColorManager().lemonGreen : ColorManager().darkGrey,
          border: isSelected
              ? Border.all(color: ColorManager().lemonGreen)
              : Border.all(color: ColorManager().lemonGreen),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected
                  ? ColorManager().veryDarkblue
                  : ColorManager().white,
            ),
          ],
        ),
      ),
    );
  }
}
