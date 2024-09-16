import 'package:bloc/bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void navigateHome() {
    emit(0);
  }

  void navigateToScreen({required int pageNumber}) {
    emit(pageNumber);
  }
}
