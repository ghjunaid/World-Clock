import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';

/// A widget that returns either the normal MaterialApp for small devices
/// or a constrained "mobile" sized view centered on large screens.
class ResponsiveApp extends StatelessWidget {
  // When width is greater than this, force the mobile view inside a
  // centered ConstrainedBox. You can tweak this threshold as needed.
  static const double mobileMaxWidth = 480.0;

  const ResponsiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build the MaterialApp normally, but use its `builder` callback to
    // access MediaQuery (which MaterialApp provides) and wrap the
    // generated navigator/content in a constrained mobile view when the
    // width is large.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
      builder: (context, child) {
        // Now MediaQuery is available on the context.
        final width = MediaQuery.of(context).size.width;
        if (width > mobileMaxWidth) {
          return ForcedMobileAppView(
            child: child ?? const SizedBox.shrink(),
            maxWidth: mobileMaxWidth,
          );
        }
        return child ?? const SizedBox.shrink();
      },
    );
  }
}

/// An alternative helper widget. If you prefer to embed the MaterialApp
/// inside a forced mobile shell from elsewhere, use this widget. It
/// simply centers and constrains its child to a mobile width.
class ForcedMobileAppView extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ForcedMobileAppView({
    Key? key,
    required this.child,
    this.maxWidth = 480.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(width: maxWidth, child: child),
      ),
    );
  }
}
