import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'custom_dropdownsearch_state.dart';

class CustomDropdownsearchCubit extends Cubit<CustomDropdownsearchState> {
  CustomDropdownsearchCubit() : super(CustomDropdownsearchState(selectedItem: ''));

  void selectItem(String item) {
    emit(CustomDropdownsearchState(selectedItem: item));
  }
}
