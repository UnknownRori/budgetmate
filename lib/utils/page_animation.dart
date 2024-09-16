import 'package:flutter/material.dart';

void changePageAnimation(BuildContext context, Widget target) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => target,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from right
        const end = Offset(0.0, 0.0); // End at center
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // The child is the new screen; SlideTransition defines animation.
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
