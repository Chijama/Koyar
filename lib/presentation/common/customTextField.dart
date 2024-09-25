import 'dart:async';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyar/presentation/cubit/custom_dropdown_search_cubit.dart'  ;
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.keyboardType,
  });
  final String? hintText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      cursorColor: AppColors.appBlack,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlign: TextAlign.center,
      style: getPlusJakartaSans(
        textColor: AppColors.appBlack.withOpacity(0.5),
        fontsize: 16,
        fontweight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: getPlusJakartaSans(
          textColor: AppColors.appBlack.withOpacity(0.5),
          fontsize: 16,
          fontweight: FontWeight.w600,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class CustomBoxTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? errorWidget;
  final void Function(String)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final bool readOnly;
  final double? bottomInset;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Color? fillColor;
  final Color? hintColor;
  final Color? textColor;
  final String? label;
  const CustomBoxTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.errorWidget,
    this.onChanged,
    this.maxLines = 1,
    this.maxLength,
    this.onFieldSubmitted,
    this.onTap,
    this.readOnly = false,
    this.bottomInset,
    this.focusNode,
    this.prefix,
    this.fillColor,
    this.hintColor,
    this.textColor,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomInset ?? 16),
      // height: 52,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? "",
            style: getPlusJakartaSans(
                textColor: AppColors.appBlack,
                fontsize: 14,
                fontweight: FontWeight.w500),
          ),
          const SizedBox(height: 9),
          TextFormField(
            validator: validator ??
                (value) {
                  if (value!.isEmpty) {
                    return 'Invalid input';
                  } else {
                    return null;
                  }
                },
            onTap: onTap,
            readOnly: readOnly,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
            focusNode: focusNode,
            style: getPlusJakartaSans(
                textColor: AppColors.appBlack,
                fontsize: 14,
                fontweight: FontWeight.w500),
            maxLines: maxLines,
            maxLength: maxLength,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: getPlusJakartaSans(
                  textColor: const Color(0xffB0BEC5),
                  fontsize: 12,
                  fontweight: FontWeight.w500),
              error: errorWidget,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              prefixIcon: prefixIcon,
              suffix: suffixIcon,
              prefix: prefix,
              filled: true,
              fillColor: fillColor ?? Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.appGreen,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color(0xffE0E0E0),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color(0xffE0E0E0),
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.appDangerButtonRed,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropDownSearch extends StatelessWidget {
  const CustomDropDownSearch({
    super.key,
    required this.itemSelected,
    this.onChanged,
    this.items,
    this.label,
    this.hintText,
    this.searchHintText,
  });

  final String itemSelected;
  final String? label;
  final String? hintText;
  final String? searchHintText;
  final void Function(String?)? onChanged;
  final FutureOr<List<String>> Function(String, LoadProps?)? items;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownSearchCubit, DropdownSearchxState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label!,
              style: getPlusJakartaSans(
                  textColor: AppColors.appBlack,
                  fontsize: 14,
                  fontweight: FontWeight.w500),
            ),
            const SizedBox(height: 9),
            DropdownSearch<String>(
              items: items,
              mode: Mode.form,
              popupProps: PopupProps.menu(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.transparent,
                      hintText: searchHintText,
                      hintStyle: getPlusJakartaSans(
                          textColor: const Color(0xffB0BEC5),
                          fontsize: 12,
                          fontweight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: AppColors.appGreen,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Color(0xffE0E0E0),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                          color: Color(0xffE0E0E0),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: AppColors.appDangerButtonRed,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  itemBuilder: (context, item, isDisabled, isSelected) {
                    return ListTile(
                      title: Text(item,
                          style: getPlusJakartaSans(
                              textColor: AppColors.appPrimaryTextDarkGray,
                              fontsize: 14,
                              fontweight: FontWeight.w500)),
                    );
                  },
                  menuProps: MenuProps(
                    backgroundColor: AppColors.appBackgroundColor,
                  )),
              // dropdownBuilder: (context, selectedItem) => Icon(
              //   Icons.keyboard_arrow_down_rounded,
              //   color: AppColors.appBlack,
              //   size: 10,
              // ),

              suffixProps: const DropdownSuffixProps(
                dropdownButtonProps: DropdownButtonProps(
                  iconClosed: Icon(Icons.keyboard_arrow_down_rounded),
                  iconOpened: Icon(Icons.keyboard_arrow_up_rounded),
                ),
              ),
              decoratorProps: DropDownDecoratorProps(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: Colors.transparent,
                  hintText: hintText,
                  hintStyle: getPlusJakartaSans(
                      textColor: const Color(0xffB0BEC5),
                      fontsize: 12,
                      fontweight: FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: AppColors.appGreen,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                      width: 1,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: AppColors.appDangerButtonRed,
                      width: 1,
                    ),
                  ),
                ),
              ),
              onChanged: (value) {
                if (value != null) {
                  context.read<DropdownSearchCubit>().selectItem(value);
                }
              },
              selectedItem: state.selectedItem,
            ),
            const SizedBox(height: 16)
          ],
        );
      },
    );
  }
}
