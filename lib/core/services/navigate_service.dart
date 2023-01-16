import 'package:flutter/material.dart';



class Navigate {
  static Future<void> to(
    BuildContext context, 
    Widget route, 
    {
      Object? arguments, 
      TypeTransition type = TypeTransition.fade, 
      AxisDirection direction = AxisDirection.left,
      Duration duration = const Duration(milliseconds: 500)
    }) async {
    if(type == TypeTransition.direction){
      await Navigator.push(
        context, 
        CustomPageRouteDirections(
          child: route, 
          direction: direction, 
          duration: duration
        )
      );
    }
    else if(type == TypeTransition.fade){
      await Navigator.push(
        context, 
        CustomPageRouteFade(
          child: route, 
          duration: duration
        )
      );
    }
    else if(type == TypeTransition.scale){
      await Navigator.push(
        context, 
        CustomPageRouteScale(
          child: route
        )
      );
    }
  }
  
  // static Future<void> toReplacement(
  //   BuildContext context, 
  //   Routes route, 
  //   {
  //     Object? arguments, 
  //     TypeTransition type = TypeTransition.fade, 
  //     AxisDirection direction = AxisDirection.left,
  //     Duration duration = const Duration(milliseconds: 500)
  //   }) async {
  //   if(type == TypeTransition.direction){
  //     await Navigator.pushReplacement(
  //       context, 
  //       CustomPageRouteDirections(
  //         child: route.presenter, 
  //         direction: direction, 
  //         duration: duration
  //       )
  //     );
  //   }
  //   else if(type == TypeTransition.fade){
  //     await Navigator.pushReplacement(
  //       context, 
  //       CustomPageRouteFade(
  //         child: route.presenter, 
  //         duration: duration
  //       )
  //     );
  //   }
  //   else if(type == TypeTransition.scale){
  //     await Navigator.pushReplacement(
  //       context, 
  //       CustomPageRouteScale(
  //         child: route.presenter
  //       )
  //     );
  //   }
  // }

  // static Future<void> toAndRemoveUntil(
  //   BuildContext context, 
  //   Routes route, 
  //   {
  //     Object? arguments, 
  //     TypeTransition type = TypeTransition.fade, 
  //     AxisDirection direction = AxisDirection.left,
  //     Duration duration = const Duration(milliseconds: 500)
  //   }) async {
  //   if(type == TypeTransition.direction){
  //     await Navigator.pushAndRemoveUntil(
  //       context, 
  //       CustomPageRouteDirections(
  //         child: route.presenter, 
  //         direction: direction, 
  //         duration: duration
  //       ),
  //       (route) => false
  //     );
  //   }
  //   else if(type == TypeTransition.fade){
  //     await Navigator.pushAndRemoveUntil(
  //       context, 
  //       CustomPageRouteFade(
  //         child: route.presenter, 
  //         duration: duration
  //       ),
  //       (route) => false
  //     );
  //   }
  //   else if(type == TypeTransition.scale){
  //     await Navigator.pushAndRemoveUntil(
  //       context, 
  //       CustomPageRouteScale(
  //         child: route.presenter
  //       ),
  //       (route) => false
  //     );
  //   }
  // }

  // static Future<void> toReplacement(BuildContext context, Routes route, {Object? arguments}) async {
  //   await Navigator.of(context).pushReplacement(route.value, arguments: arguments);
  // }

  // static Future<void> toRemoveUntil(context, Routes route,) async {
  //    await Navigator.of(context).pushAndRemoveUntil(route.value, (route) => false);
  // }
}

enum TypeTransition{
  direction,
  fade,
  scale
}

class CustomPageRouteDirections extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;
  final Duration duration;

  CustomPageRouteDirections(
      {required this.child,
      this.direction = AxisDirection.right,
      this.duration = const Duration(milliseconds: 500)})
      : super(
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
          position: Tween<Offset>(
                  begin: getBeginPosition(direction), end: Offset.zero)
              .animate(animation),
          child: child);
}

getBeginPosition(direction) {
  switch (direction) {
    case AxisDirection.up:
      return const Offset(0, 1);
    case AxisDirection.down:
      return const Offset(0, -1);
    case AxisDirection.right:
      return const Offset(-1, 0);
    case AxisDirection.left:
      return const Offset(1, 0);
  }
}

class CustomPageRouteScale extends PageRouteBuilder {
  final Widget child;

  CustomPageRouteScale({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(scale: animation, child: child);
}

class CustomPageRouteFade extends PageRouteBuilder {
  final Widget child;
  final Duration duration;

  CustomPageRouteFade(
      {required this.child,
      this.duration = const Duration(milliseconds: 500),
      RouteSettings? settings})
      : super(
            transitionDuration: duration,
            reverseTransitionDuration: duration,
            pageBuilder: (context, animation, secondaryAnimation) => child,
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(opacity: animation, child: child);
}