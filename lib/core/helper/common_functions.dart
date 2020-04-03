import 'dart:ui';

import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonFunctions {

  static void showCupertinoDialogUnderstand(context, String title, String content, String actionsTitle) {

    final size = MediaQuery.of(context).size;

    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.04)) : null,
      content: Text(content, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035)),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(buildTranslate(context, 'understand'), style: ThemeTextStyle.poppinsMedium.apply(color: CupertinoColors.systemBlue, fontSizeDelta: size.width * 0.04),),
          isDestructiveAction: true,
          onPressed: () => Navigator.pop(context, 'Discard')
        )
      ],
    );

    showDialog(context: context, child: alert);
  }

  static void showCupertinoDialogActions(context, String title, String content, List<Widget> actions) {

    final size = MediaQuery.of(context).size;

    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.04)) : null,
      content: Text(content, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035)),
      actions: actions,
    );

    showDialog(context: context, child: alert);
  }

}