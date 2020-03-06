import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_routes/StaticPageRoute.dart';
import 'dart:io';

bool isStatic;

void navigatorQuickPush(BuildContext context, Widget page, {RouteSettings settings}) {
  if (isStatic == null) {
    isStatic = kIsWeb == true || Platform.isMacOS || Platform.isWindows || Platform.isFuchsia;
  }

  if (isStatic) {
    Navigator.push(context, StaticPageRoute(builder: (ctx) => page, settings: settings));
  } else {
    Navigator.push(context, CupertinoPageRoute(builder: (ctx) => page, settings: settings));
  }
}

void navigatorQuickPushReplacement(BuildContext context, Widget page, {RouteSettings settings}) {
  if (isStatic == null) {
    isStatic = kIsWeb == true || Platform.isMacOS || Platform.isWindows || Platform.isFuchsia;
  }

  if (isStatic) {
    Navigator.pushReplacement(context, StaticPageRoute(builder: (ctx) => page, settings: settings));
  } else {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (ctx) => page, settings: settings));
  }
}
