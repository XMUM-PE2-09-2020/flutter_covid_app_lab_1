import 'package:flutter/material.dart';

enum AnimationType {
  SCALE, //缩放动画
  SLIDE, //平移动画
  ROTATION, //旋转动画
  FADE, //透明动画
  SIZE //大小动画
}

//动画过场route
Route animationPageRoute<T>(Widget page,
    {bool opaque = true,
    Color barrierColor,
    bool barrierDismissible = false,
    AnimationType type}) {
  return PageRouteBuilder(
    opaque: opaque,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    transitionDuration: Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (type) {
        case AnimationType.SCALE:
          return _scaleTransition(animation, child);
          break;
        case AnimationType.SLIDE:
          return _slideTransition(animation, child);
          break;
        case AnimationType.ROTATION:
          return _rotationTransition(animation, child);
          break;
        case AnimationType.FADE:
          return _fadeTransition(animation, child);
          break;
        case AnimationType.SIZE:
          return _SizeTransition(animation, child);
          break;
        default:
          return child;
          break;
      }
    },
  );
}

Widget _slideTransition(animation, child) {
  var tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.ease));
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

Widget _scaleTransition(animation, child) {
  var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
  var scaleAnimation = animation.drive(tween);
  return ScaleTransition(
    scale: scaleAnimation,
    child: child,
  );
}

Widget _rotationTransition(animation, child) {
  var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
  var rotationAnimation = animation.drive(tween);
  return RotationTransition(
    turns: rotationAnimation,
    child: ScaleTransition(
      scale: rotationAnimation,
      child: child,
    ),
  );
}

Widget _fadeTransition(animation, child) {
  var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
  var fadeAnimation = animation.drive(tween);
  return FadeTransition(
    opacity: fadeAnimation,
    child: child,
  );
}

Widget _SizeTransition(animation, child) {
  return Align(
    child: SizeTransition(
      child: child,
      sizeFactor: animation,
    ),
  );
}
