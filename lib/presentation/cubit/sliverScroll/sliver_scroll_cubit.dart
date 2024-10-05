import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'sliver_scroll_state.dart';

class SliverScrollCubit extends Cubit<SliverScrollState> {
  SliverScrollCubit() : super(SliverScrollState(isCollapsed: false));

  final ScrollController scrollController = ScrollController();
  final double expandedBarHeight = 450.0;
  final double collapsedBarHeight = 80.0;

  void initialize() {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!isClosed) {
      final isCollapsed = scrollController.hasClients &&
          scrollController.offset > (expandedBarHeight - collapsedBarHeight);
      emit(SliverScrollState(isCollapsed: isCollapsed));
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
