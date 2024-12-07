import 'package:attack_mode_app/config/themes/constants.dart';
import 'package:attack_mode_app/core/util/global_utilities.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final List<IconData> items;
  final int? initialIndex;
  const BottomNavBar({super.key, required this.items, this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.initialIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80 * widget.items.length.toDouble(),
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: ColorManager().black,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: mapIndexed(
              widget.items,
              (index, item) => BottomNavbarItem(
                icon: item,
                isSelected: index == currentIndex,
                onPresssed: () {
                  setState(() {
                    currentIndex = index;
                  });
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
