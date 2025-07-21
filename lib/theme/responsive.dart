import 'package:flutter/widgets.dart';
import 'package:flutter_template_provider/theme/esponsive_breakpoints.dart';

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width < ResponsiveBreakpoints.mobile;
}

bool isTablet(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width >= ResponsiveBreakpoints.mobile && width < ResponsiveBreakpoints.tablet;
}

bool isDesktop(BuildContext context) {
  return MediaQuery.of(context).size.width >= ResponsiveBreakpoints.desktop;
}

bool isDisplayLarge(BuildContext context) {
  return MediaQuery.of(context).size.width >= ResponsiveBreakpoints.desktop;
}

bool isDisplayMedium(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return width >= ResponsiveBreakpoints.tablet && width < ResponsiveBreakpoints.desktop;
}

bool isDisplaySmall(BuildContext context) {
  return MediaQuery.of(context).size.width < ResponsiveBreakpoints.tablet;
}