import 'package:flutter/widgets.dart';
import 'package:flutter_template_provider/theme/esponsive_breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget? tabletBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.tabletBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= ResponsiveBreakpoints.desktop) {
      return desktopBody;
    } else if (width >= ResponsiveBreakpoints.tablet && tabletBody != null) {
      return tabletBody!;
    } else {
      return mobileBody;
    }
  }
}