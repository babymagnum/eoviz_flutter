import 'dart:ui';

import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/change_password_stores.dart';

class ChangePasswordView extends StatelessWidget {

  var _passwordLamaFocus = FocusNode(), _passwordBaruFocus = FocusNode(), _konfirmasiPasswordBaruFocus = FocusNode();
  var _changePasswordStores = locator<ChangePasswordStores>();

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
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,),
                        ),
                        Expanded(
                          child: Text(buildTranslate(context, 'change_password'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),)
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
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Column(
                                  children: <Widget>[
                                    Parent(
                                      style: ParentStyle()..borderRadius(all: 20)..padding(horizontal: 25, top: 14, bottom: 25)
                                        ..margin(top: 45)..background.color(Colors.white),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(buildTranslate(context, 'old_password'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF253644)),),
                                          SizedBox(height: 8,),
                                          CustomTextField(
                                            onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordBaruFocus),
                                            onChanged: (value) => _changePasswordStores.changePasswordLama(value),
                                            focusNode: _passwordLamaFocus,
                                            inputType: TextInputType.text,
                                            textInputAction: TextInputAction.next,
                                            isObsecure: true,
                                            borderRadius: Dimens.half_circle,
                                            fillColor: Color(0xFFf6f6f6),
                                            textColor: Color(0xFFc4c4c4),
                                            horizontalPadding: 21,
                                          )
                                        ],
                                      ),
                                    ),
                                    Parent(
                                      style: ParentStyle()..borderRadius(all: 20)..padding(horizontal: 25, top: 14, bottom: 25)
                                        ..margin(top: 20, bottom: 20)..background.color(Colors.white),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(buildTranslate(context, 'new_password'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF253644)),),
                                          SizedBox(height: 8,),
                                          CustomTextField(
                                            onEditingComplete: () => FocusScope.of(context).requestFocus(_konfirmasiPasswordBaruFocus),
                                            onChanged: (value) => _changePasswordStores.changePasswordBaru(value),
                                            focusNode: _passwordBaruFocus,
                                            inputType: TextInputType.text,
                                            textInputAction: TextInputAction.next,
                                            isObsecure: true,
                                            borderRadius: Dimens.half_circle,
                                            fillColor: Color(0xFFf6f6f6),
                                            textColor: Color(0xFFc4c4c4),
                                            horizontalPadding: 21,
                                          ),
                                          SizedBox(height: 15,),
                                          Text(buildTranslate(context, 'repeat_new_password'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF253644)),),
                                          SizedBox(height: 8,),
                                          CustomTextField(
                                            onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                                            onChanged: (value) => _changePasswordStores.changeKonfirmasiPasswordBaru(value),
                                            focusNode: _konfirmasiPasswordBaruFocus,
                                            inputType: TextInputType.text,
                                            textInputAction: TextInputAction.done,
                                            isObsecure: true,
                                            borderRadius: Dimens.half_circle,
                                            fillColor: Color(0xFFf6f6f6),
                                            textColor: Color(0xFFc4c4c4),
                                            horizontalPadding: 21,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Parent(
                            gesture: Gestures()..onTap(() {
                              if (!_changePasswordStores.isLoading) _changePasswordStores.changePassword(context);
                            }),
                            style: ParentStyle()..linearGradient(colors: [
                              Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8),
                            ], begin: Alignment.topLeft, end: Alignment.bottomRight)..width(double.infinity)..padding(vertical: 13)
                              ..ripple(true)..borderRadius(all: Dimens.half_circle)..margin(horizontal: 32, bottom: 28),
                            child: Center(
                              child: Text(buildTranslate(context, 'change_password2'), style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.04),),
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ],
              )
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Visibility(
                visible: _changePasswordStores.isLoading,
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
