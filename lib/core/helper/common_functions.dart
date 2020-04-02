import 'dart:ui';

import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonFunctions {

  static void showCupertinoDialogUnderstand(context, String title, String content, String actionsTitle) {
    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title, style: ThemeTextStyle.poppinsBold.apply()) : null,
      content: Text(content, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: -2)),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(buildTranslate(context, 'understand'), style: ThemeTextStyle.poppinsMedium.apply(color: CupertinoColors.systemBlue),),
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context, 'Discard')
        )
      ],
    );

    showDialog(context: context, child: alert);
  }

  static void showCupertinoDialogActions(context, String title, String content, List<Widget> actions) {
    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title, style: ThemeTextStyle.poppinsBold.apply()) : null,
      content: Text(content, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: -2)),
      actions: actions,
    );

    showDialog(context: context, child: alert);
  }

  static void showLoadingDialog(context) {

    final size = MediaQuery.of(context).size;

    Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, _, __) => Parent(
      style: ParentStyle()..background.color(Colors.black.withOpacity(0.3))..margin(horizontal: size.width * 0.5 - 45, vertical: size.height * 0.5 - 45)
        ..borderRadius(all: 5),
      child: CupertinoActivityIndicator(radius: 20),
    ), opaque: false));
  }

}