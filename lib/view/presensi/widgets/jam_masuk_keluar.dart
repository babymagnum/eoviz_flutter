import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class JamMasukKeluar extends StatelessWidget {

  Widget _jam(String title, String content, Size size) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15,),
        Text(title, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: Color(0xFF253644)),),
        Text(content, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.05, color: Color(0xFF347eb2)),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Parent(
          style: ParentStyle()..border(all: 1, color: Color(0xFF347eb2))..borderRadius(all: 15)..width(double.infinity)
            ..padding(horizontal: 28, bottom: 9)..margin(top: 15)..background.color(Colors.white),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _jam(buildTranslate(context, 'entry_time'), '06:00:00', size)
              ),
              Expanded(
                child: _jam(buildTranslate(context, 'out_time'), '14:00:00', size)
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Parent(
            style: ParentStyle()..background.color(Color(0xFF347eb2))..borderRadius(all: 5)..height(size.width * 0.065)..margin(horizontal: size.width * 0.125),
            child: Center(child: Text('Shift I', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Colors.white),)),
          ),
        ),
        Positioned(
          top: size.width * 0.065, bottom: 1, left: (size.width - (38 * 2)) * 0.5 - 2,
          child: Container(
            width: 2, color: Color(0xFFeaeaea),
          )
        )
      ],
    );
  }
}
