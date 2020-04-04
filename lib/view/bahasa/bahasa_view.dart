import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/bahasa/widgets/bahasa_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class BahasaView extends StatefulWidget {

  @override
  _BahasaViewState createState() => _BahasaViewState();
}

class _BahasaViewState extends State<BahasaView> {

  var _language = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SharedPreferences.getInstance().then((preference) {
        if (preference.getString(Constant.LANGUANGE_CODE) == Constant.ENGLISH) _language = Constant.ENGLISH;
        else _language = Constant.INDONESIAN;
        setState(() {});
      });
    });

    super.initState();
  }

  _changeLanguage(String languageCode, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constant.LANGUANGE_CODE, languageCode);
    Locale locale;
    switch (languageCode) {
      case Constant.ENGLISH:
        locale = Locale(languageCode);
        break;
      case Constant.INDONESIAN:
        locale = Locale(languageCode);
    }
    MyApp.setLocale(context, locale);
    _language = prefs.getString(Constant.LANGUANGE_CODE);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,),
                      ),
                      Expanded(
                        child: Text(buildTranslate(context, 'language'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),)
                      ),
                      Opacity(
                        opacity: 0,
                        child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,)
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22,),
                Expanded(
                  child: Parent(
                    style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5)),
                    child: Column(
                      children: <Widget>[
                        BahasaItem(
                          onClick: () => _changeLanguage(Constant.INDONESIAN, context),
                          image: 'assets/images/ic_indonesia.png',
                          isFirst: true,
                          title: 'Bahasa Indonesia (ID)',
                          isPicked: _language == Constant.INDONESIAN,
                        ),
                        BahasaItem(
                          onClick: () => _changeLanguage(Constant.ENGLISH, context),
                          image: 'assets/images/ic_english.png',
                          isFirst: false,
                          isPicked: _language == Constant.ENGLISH,
                          title: 'English (EN)'
                        )
                      ],
                    ),
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
