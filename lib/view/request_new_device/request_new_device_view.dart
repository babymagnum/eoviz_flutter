import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'stores/request_new_device_stores.dart';

class RequestNewDeviceView extends StatelessWidget {
  var _emailFocus = FocusNode(), _passwordFocus = FocusNode();
  var _requestNewDeviceStores = locator<RequestNewDeviceStores>();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFf0f2f5),
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top + 36),
          Stack(
            children: <Widget>[
              Positioned(
                left: 30,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset('assets/images/back_button_circle.png', width: 30, height: 30,)
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3),
                  child: Text(buildTranslate(context, 'request_new_device'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644))),
                )
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: size.width * 0.15,),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/logo.png', width: size.width * 0.6, height: size.width * 0.15,)
                    ),
                    SizedBox(height: size.width * 0.16,),
                    Text(buildTranslate(context, 'username_email'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644)),),
                    SizedBox(height: 6,),
                    CustomTextField(
                      borderRadius: Dimens.half_circle,
                      onChanged: (value) => _requestNewDeviceStores.changeEmail(value),
                      focusNode: _emailFocus,
                      onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocus),
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      isObsecure: true
                    ),
                    SizedBox(height: 14,),
                    Text(buildTranslate(context, 'password'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644)),),
                    SizedBox(height: 6,),
                    CustomTextField(
                      borderRadius: Dimens.half_circle,
                      onChanged: (value) => _requestNewDeviceStores.changePassword(value),
                      focusNode: _passwordFocus,
                      onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      isObsecure: true
                    ),
                    SizedBox(height: size.width * 0.4,),
                    Parent(
                      gesture: Gestures()..onTap(() {}),
                      style: ParentStyle()..linearGradient(colors: [
                        Color(0xFF005da0), Color(0xFF67c3ce),
                      ], begin: Alignment.centerLeft, end: Alignment.centerRight)..width(double.infinity)..padding(vertical: 13)
                        ..ripple(true)..borderRadius(all: Dimens.half_circle),
                      child: Center(
                        child: Text(buildTranslate(context, 'request'), style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
