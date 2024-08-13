

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAnimatedRoutes{

  navigatePush({required BuildContext context,required Widget child,}){
    Navigator.push(context, navigateAnimateRoute(page: child,begin: Offset(0.0, 1.0)));
  }

  slideNavigatePush({required BuildContext context,required Widget child,}){
    Navigator.push(context, navigateAnimateRoute(page: child,begin: Offset(1.0, 0.0)));
  }

  Route navigateAnimateRoute({required Widget page,required Offset begin}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const end = Offset.zero;
        const curve = Curves.linear;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}