import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/bahasa/bahasa_view.dart';
import 'package:dribbble_clone/view/change_password/change_password_view.dart';
import 'package:dribbble_clone/view/settings/widgets/pengaturan_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var _language = '';

  @override
  void initState() {

    _getLanguage();

    super.initState();
  }

  _getLanguage() async {
    final preference = await SharedPreferences.getInstance();
    if (preference.getString(Constant.LANGUANGE_CODE) == Constant.ENGLISH) _language = 'English';
    else _language = 'Bahasa Indonesia';
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
                        child: Text(buildTranslate(context, 'settings'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),)
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
                        PengaturanMenuItem(
                          onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangePasswordView())),
                          image: 'assets/images/ic_change_password.png',
                          isFirst: true,
                          content: null,
                          title: 'change_password'
                        ),
                        PengaturanMenuItem(
                          onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => BahasaView())),
                          image: 'assets/images/ic_change_language.png',
                          isFirst: false,
                          content: _language,
                          title: 'language'
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
