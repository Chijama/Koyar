import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class Filterwidget extends StatefulWidget {
  final String text;
  final String itemSelected;
  final List<String> itemsList;final void Function(String?)? onChanged;
  const Filterwidget(
      {super.key,
      required this.text,
      required this.itemSelected,
      required this.itemsList, this.onChanged});

  @override
  State<Filterwidget> createState() => _FilterwidgetState();
}

class _FilterwidgetState extends State<Filterwidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: DropdownSearch<String>(onChanged: widget.onChanged,popupProps: const PopupProps.menu(fit: FlexFit.tight),
          decoratorProps: const DropDownDecoratorProps(
            decoration:
                InputDecoration(border: InputBorder.none, filled: false),
          ),
          clickProps: const ClickProps(
            containedInkWell: false,
          ),
          selectedItem: widget.itemSelected,
          items: (f, cs) => widget.itemsList, 
          dropdownBuilder: (c, s) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors
                    .appSecondaryBackgroundLightGray, // Light grey background
                borderRadius: BorderRadius.circular(4), // Rounded corners
              ),
              child: Text(
                "${widget.text} : $s",
                style: getBlackZodiak(
                  fontsize: 14,
                  fontweight: FontWeight.w500,
                ),
              ),
            );
          },
        ),
      ),
    );

  }
}
