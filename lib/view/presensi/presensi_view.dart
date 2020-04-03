import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../beranda/stores/beranda_stores.dart';

class PresensiView extends StatelessWidget {

  var _berandaStores = locator<BerandaStores>();

  Widget _jam(String title, String content, Size size) {
    return Column(
      children: <Widget>[
        SizedBox(height: 15,),
        Text(title, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: Color(0xFF253644)),),
        Text(content, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.05, color: Color(0xFF347eb2)),)
      ],
    );
  }

  Widget _buttonPresensi(context, List<Color> colors, String title, Function() onClick, Size size, image) {
    return Column(
      children: <Widget>[
        Parent(
          gesture: Gestures()..onTap(onClick),
          style: ParentStyle()..borderRadius(all: 15)..linearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight)..ripple(true)..height(size.width * 0.28)..width(size.width * 0.28),
          child: Center(
            child: Image.asset(image, width: size.width * 0.15, height: size.width * 0.15,),
          ),
        ),
        SizedBox(height: 11,),
        Text(buildTranslate(context, title), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Color(0xFF253644)),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Container(
                color: Color(0xFF347eb2),
              ),
            ),
            Positioned(
              right: 0, top: 0,
              child: Image.asset('assets/images/image_background_2circle.png', width: size.width * 0.53, height: size.width * 0.53,)
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).padding.top + 26,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,),
                        ),
                        Expanded(
                          child: Text(buildTranslate(context, 'presence'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),)
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/images/ic_history.png', width: size.width * 0.06, height: size.width * 0.06,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                        ..padding(horizontal: 38, top: 50, bottom: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text('${TextUtil.getDay()}, ${TextUtil.getCurrentDate('dd MMMM yyyy')}', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035),),
                            SizedBox(height: 3,),
                            Text(_berandaStores.currentTime, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.08, color: Color(0xFF347eb2)),),
                            SizedBox(height: 33,),
                            Stack(
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
                            ),
                            SizedBox(height: 24,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  _buttonPresensi(context, [Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8)], 'in', () {}, size, 'assets/images/ic_presence_in.png'),
                                  SizedBox(width: 22,),
                                  _buttonPresensi(context, [Color(0xFFb11309).withOpacity(0.8), Color(0xFFd95b5b).withOpacity(0.8)], 'out', () {}, size, 'assets/images/ic_presence_out.png'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
