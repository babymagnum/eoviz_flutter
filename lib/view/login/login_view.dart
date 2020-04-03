import 'dart:ui';

import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:dribbble_clone/main.dart';
import 'package:dribbble_clone/view/forgot_password/forgot_password_view.dart';
import 'package:dribbble_clone/view/request_new_device/request_new_device_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'stores/login_stores.dart';
import '../../core/helper/app_localizations.dart';

class LoginView extends StatelessWidget {

  FocusNode _emailFocus = FocusNode(), _passwordFocus = FocusNode();
  var _loginStores = locator<LoginStores>();

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
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Color(0xFFf0f2f5),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 130,),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/logo.png', width: size.width * 0.6, height: size.width * 0.15,)
                      ),
                      SizedBox(height: size.width * 0.17),
                      Text(buildTranslate(context, 'username_email'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644), fontSizeDelta: size.width * 0.04),),
                      SizedBox(height: 6,),
                      CustomTextField(
                        borderRadius: Dimens.half_circle,
                        onChanged: (value) => _loginStores.changeEmail(value),
                        focusNode: _emailFocus,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocus),
                        inputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        isObsecure: false
                      ),
                      SizedBox(height: 14,),
                      Text(buildTranslate(context, 'password'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644), fontSizeDelta: size.width * 0.04),),
                      SizedBox(height: 6,),
                      CustomTextField(
                        borderRadius: Dimens.half_circle,
                        onChanged: (value) => _loginStores.changePassword(value),
                        focusNode: _passwordFocus,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                        inputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        isObsecure: true
                      ),
                      SizedBox(height: 44),
                      Builder(
                        builder: (context) => Parent(
                          gesture: Gestures()..onTap(() => _loginStores.login(context)),
                          style: ParentStyle()..linearGradient(colors: [
                            Color(0xFF005da0), Color(0xFF67c3ce),
                          ], begin: Alignment.centerLeft, end: Alignment.centerRight)..width(double.infinity)..padding(vertical: 13)
                            ..ripple(true)..borderRadius(all: Dimens.half_circle),
                          child: Center(
                            child: Text(buildTranslate(context, 'login'), style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.04),),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Align(
                        alignment: Alignment.center,
                        child: Parent(
                          gesture: Gestures()..onTap(() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ForgotPasswordView()))),
                          style: ParentStyle()..padding(vertical: 5, horizontal: 5)..borderRadius(all: 5)..ripple(true),
                          child: Text(buildTranslate(context, 'forgot_password'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF347eb2)),),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Parent(
                          gesture: Gestures()..onTap(() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RequestNewDeviceView()))),
                          style: ParentStyle()..padding(vertical: 5, horizontal: 5)..borderRadius(all: 5)..ripple(true),
                          child: Text(buildTranslate(context, 'new_device'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF347eb2)),),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Visibility(
                visible: _loginStores.isLoading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Parent(
                          style: ParentStyle()..height(100)..width(100)..borderRadius(all: 10),
                          child: Center(
                            child: CupertinoActivityIndicator(radius: 20,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
