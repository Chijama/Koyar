import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyar/presentation/manager/assetManager.dart';
import 'package:koyar/presentation/manager/colorManager.dart';
import 'package:koyar/presentation/manager/routeManager.dart';

import '../../common/navbarSvgIcon.dart';
import 'package:go_router/go_router.dart';
import '../../cubit/bottomNavigation/bottom_navigation_cubit.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.child,
    required this.location,
  });

  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: child),
      bottomNavigationBar: Semantics(
        label: "Bottom Navigation Bar",
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          margin: const EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.appBlack.withOpacity(0.05),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
          ),
          child: BlocBuilder<BottomNavigationCubit, int>(
            builder: (context, bottomNavstate) {
              final bottomnavcubit = context.watch<BottomNavigationCubit>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //!Home
                  InkWell(
                    onTap: () {
                      bottomnavcubit.navigateHome();
                      context.go(BaseRouteName.home);
                    },
                    child: NavBarWidget(
                      navName: "Home",
                      svgicon: SvgAssetManager.homepage,
                      isSvgIconSelected: bottomNavstate == 0,
                    ),
                  ),
                  //!Candidates
                  InkWell(
                    onTap: () {
                      bottomnavcubit.navigateToScreen(pageNumber: 1);
                      context.go(BaseRouteName.candidatesSelectionPage);
                    },
                    child: NavBarWidget(
                      navName: "Candidates",
                      svgicon: SvgAssetManager.candidatespage,
                      isSvgIconSelected: bottomNavstate == 1,
                    ),
                  ),
                  //!Educaton
                  InkWell(
                    onTap: () {
                      bottomnavcubit.navigateToScreen(pageNumber: 2);
                      context.go(BaseRouteName.education);
                    },
                    child: NavBarWidget(
                      navName: "Education",
                      svgicon: SvgAssetManager.educationpage,
                      isSvgIconSelected: bottomNavstate == 2,
                    ),
                  ),
                  //!Profile
                  InkWell(
                    onTap: () {
                      bottomnavcubit.navigateToScreen(pageNumber: 3);
                      context.go(BaseRouteName.profile);
                    },
                    child: NavBarWidget(
                      navName: "Profile",
                      svgicon: SvgAssetManager.profilepage,
                      isSvgIconSelected: bottomNavstate == 3,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
