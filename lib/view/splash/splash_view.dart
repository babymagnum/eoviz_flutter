import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:dribbble_clone/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {

  static const routeName = 'splash_view';

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 1), () {

      SharedPreferences.getInstance().then((preference) {
        final isLogin = preference.getBool(Constant.IS_LOGIN) ?? false;
        if (isLogin) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
        }
      });
    });

    super.initState();
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF005da0).withOpacity(0.8),
                    Color(0xFF67c3ce).withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/logo.png', color: Colors.white, width: size.width * 0.6, height: size.width * 0.15,),
          )
        ],
      ),
    );
  }
}
