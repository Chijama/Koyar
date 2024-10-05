import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koyar/presentation/manager/assetManager.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.itemSelected,
    required this.label,
    this.searchHintText,
    required this.onChanged,
    required this.items,
  });

  final String itemSelected;
  final String label;
  final String? searchHintText;
  final void Function(String?) onChanged;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: (c,s)=>items,
      selectedItem: itemSelected,
      popupProps: PopupProps.menu(
        showSearchBox: false,
        itemBuilder: (context, item, isDisabled, isSelected) {
          return ListTile(
            title: Text(
              item,
              style: getPlusJakartaSans(
                textColor: AppColors.appPrimaryTextDarkGray,
                fontsize: 14,
                fontweight: FontWeight.w500,
              ),
            ),
          );
        },
        menuProps: MenuProps(
          backgroundColor: AppColors.appBackgroundColor,
        ),
      ),
       decoratorProps: const DropDownDecoratorProps(
        decoration: InputDecoration(border: InputBorder.none),
      ),
      dropdownBuilder: (context, selectedItem) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(SvgAssetManager.chevronSelectorVertical),
              const SizedBox(width: 4),
              Text(
                selectedItem?.isNotEmpty == true ? selectedItem! : label,
                style: getPlusJakartaSans(
                  textColor: AppColors.appSecondaryTextMediumGray,
                  fontsize: 16,
                  fontweight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
      onChanged: onChanged,
    );
  }
}
