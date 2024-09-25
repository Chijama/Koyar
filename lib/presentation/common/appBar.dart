
import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);
  final String title;

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // foregroundColor: kcBackgroundColor,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 70,
      leading: GestureDetector(
        onTap: () {
          // pop
           
        },
        child: Container(
          margin: const EdgeInsets.only(left: 34, right: 8),
          child: const Icon(Icons.arrow_back_ios_new_rounded)
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: Text(
        "  ${widget.title}",
        style:getBlackZodiak(fontsize: 20, fontweight: FontWeight.w500),
      ),
    );
  }
}
