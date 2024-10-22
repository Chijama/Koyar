import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage customTransitionPage(
    {required LocalKey pageKey, required Widget child}) {
  return CustomTransitionPage(
    key: pageKey,
    transitionDuration: const Duration(milliseconds: 700),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
