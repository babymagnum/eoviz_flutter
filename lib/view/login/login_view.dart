import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/main.dart';
import 'package:flutter/material.dart';
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

  Widget _textField({@required Function(String) onChanged, @required focusNode, @required Function() onEditingComplete,
    @required inputType, @required textInputAction, @required isObsecure}) {
    return TextField(
      onChanged: onChanged,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      keyboardType: inputType,
      maxLines: 1,
      textInputAction: textInputAction,
      style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644)),
      obscureText: isObsecure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0,),
          borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0),
          borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: null,
        backgroundColor: Color(0xFFf0f2f5),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFf0f2f5),
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 74,),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/logo.png', width: size.width * 0.6, height: size.width * 0.15,)
              ),
              SizedBox(height: size.width * 0.17),
              Text(buildTranslate(context, 'username_email'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644)),),
              SizedBox(height: 6,),
              _textField(
                onChanged: (value) => _loginStores.changeEmail(value),
                focusNode: _emailFocus,
                onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocus),
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                isObsecure: false
              ),
              SizedBox(height: 14,),
              Text('Password', style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644)),),
              SizedBox(height: 6,),
              _textField(
                onChanged: (value) => _loginStores.changePassword(value),
                focusNode: _passwordFocus,
                onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                inputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                isObsecure: true
              ),
              SizedBox(height: 44,),
              Parent(
                gesture: Gestures()..onTap(() {}),
                style: ParentStyle()..linearGradient(colors: [
                  Color(0xFF005da0), Color(0xFF67c3ce),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)..width(double.infinity)..padding(vertical: 13)
                  ..ripple(true)..borderRadius(all: Dimens.half_circle),
                child: Center(
                  child: Text('Login', style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white),),
                ),
              ),
              SizedBox(height: 24,),
              Align(
                alignment: Alignment.center,
                child: Parent(
                  gesture: Gestures()..onTap(() => _changeLanguage(Constant.INDONESIAN, context)),
                  style: ParentStyle()..padding(vertical: 5, horizontal: 5)..borderRadius(all: 5)..ripple(true),
                  child: Text(buildTranslate(context, 'forgot_password'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: -2, color: Color(0xFF347eb2)),),
                ),
              ),
              SizedBox(height: 8,),
              Align(
                alignment: Alignment.center,
                child: Parent(
                  gesture: Gestures()..onTap(() => _changeLanguage(Constant.ENGLISH, context)),
                  style: ParentStyle()..padding(vertical: 5, horizontal: 5)..borderRadius(all: 5)..ripple(true),
                  child: Text(buildTranslate(context, 'new_device'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: -2, color: Color(0xFF347eb2)),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
