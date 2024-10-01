import 'package:flutter/material.dart';
import 'package:koyar/presentation/manager/styleManager.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.semanticsLabel,
    this.actions, this.bottom,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);
  final String title;
  final String semanticsLabel;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
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
      actions: widget.actions,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 70, bottom: widget.bottom,
      leading: Semantics(
        label: "Go back to the previous screen.",
        child: GestureDetector(
          onTap: () {
            // pop
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.only(left: 34, right: 8),
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Semantics(
        label: widget.semanticsLabel,
        child: Text(
          "  ${widget.title}",
          style: getBlackZodiak(fontsize: 20, fontweight: FontWeight.w500),
        ),
      ),
    );
  }
}
