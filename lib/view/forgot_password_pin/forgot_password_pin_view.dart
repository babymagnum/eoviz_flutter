import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/forgot_password_pin_stores.dart';

class ForgotPasswordPinView extends StatefulWidget {

  @override
  _ForgotPasswordPinViewState createState() => _ForgotPasswordPinViewState();
}

class _ForgotPasswordPinViewState extends State<ForgotPasswordPinView> {

  var _input1Focus = FocusNode(), _input2Focus = FocusNode(), _input3Focus = FocusNode(), _input4Focus = FocusNode();
  var _forgotPasswordPinStores = locator<ForgotPasswordPinStores>();

  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      _forgotPasswordPinStores.resetTimer();
      _forgotPasswordPinStores.startTimer();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Observer(
        builder: (_) => Scaffold(
          backgroundColor: Color(0xFFf0f2f5),
          body: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top + 36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset('assets/images/back_button_circle.png', width: 30, height: 30,)
                    ),
                    Expanded(
                      child: Text(buildTranslate(context, 'forgot_password_title'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644), fontSizeDelta: size.width * 0.04))
                    ),
                    Opacity(
                      opacity: 0,
                      child: Image.asset('assets/images/back_button_circle.png', width: 30, height: 30,),
                    )
                  ],
                ),
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
                        Text(buildTranslate(context, 'please_check_your_email_to_get_the_code'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644), fontSizeDelta: -2),),
                        SizedBox(height: 13,),
                        Text(buildTranslate(context, 'code_verification'), style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644), fontSizeDelta: size.width * 0.04),),
                        SizedBox(height: 19,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomTextField(
                                onEditingComplete: () {},
                                onChanged: (value) {
                                  _forgotPasswordPinStores.changeInput1(value);
                                  FocusScope.of(context).requestFocus(_input2Focus);
                                },
                                focusNode: _input1Focus,
                                inputType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                isObsecure: false,
                                borderRadius: 7,
                                isCenter: true,
                                maxLength: 1,
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: CustomTextField(
                                onEditingComplete: () {},
                                onChanged: (value) {
                                  _forgotPasswordPinStores.changeInput2(value);
                                  FocusScope.of(context).requestFocus(_input3Focus);
                                },
                                focusNode: _input2Focus,
                                inputType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                isObsecure: false,
                                borderRadius: 7,
                                isCenter: true,
                                maxLength: 1,
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: CustomTextField(
                                onEditingComplete: () {},
                                onChanged: (value) {
                                  _forgotPasswordPinStores.changeInput3(value);
                                  FocusScope.of(context).requestFocus(_input4Focus);
                                },
                                focusNode: _input3Focus,
                                inputType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                isObsecure: false,
                                borderRadius: 7,
                                isCenter: true,
                                maxLength: 1,
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: CustomTextField(
                                onEditingComplete: () {},
                                onChanged: (value) {
                                  _forgotPasswordPinStores.changeInput4(value);
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                focusNode: _input4Focus,
                                inputType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                isObsecure: false,
                                borderRadius: 7,
                                isCenter: true,
                                maxLength: 1,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8,),
                        Align(
                          alignment: Alignment.center,
                          child: Text('${_forgotPasswordPinStores.minutes.toString().length == 1 ? '0${_forgotPasswordPinStores.minutes}' : '${_forgotPasswordPinStores.minutes}'}:${_forgotPasswordPinStores.seconds.toString().length == 1 ? '0${_forgotPasswordPinStores.seconds}' : '${_forgotPasswordPinStores.seconds}'}', style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF253644), fontSizeDelta: size.width * 0.035),)
                        ),
                        SizedBox(height: size.width * 0.39,),
                        Parent(
                          gesture: Gestures()..onTap(() {}),
                          style: ParentStyle()..linearGradient(colors: [
                            Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8),
                          ], begin: Alignment.topLeft, end: Alignment.bottomRight)..width(double.infinity)..padding(vertical: 13)
                            ..ripple(true)..borderRadius(all: Dimens.half_circle),
                          child: Center(
                            child: Text(buildTranslate(context, 'submit'), style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.04),),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}