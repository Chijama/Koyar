import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
 

part 'custom_dropdownsearch_state.dart';

class CustomDropdownsearchCubit extends Cubit<CustomDropdownsearchState> {
  CustomDropdownsearchCubit() : super(const CustomDropdownsearchState(selectedItem: ''));

  void selectItem(String item) {
    emit(CustomDropdownsearchState(selectedItem: item));
  }
}
