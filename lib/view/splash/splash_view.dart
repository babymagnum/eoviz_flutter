import 'package:dribbble_clone/view/login/login_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {

  static const routeName = 'splash_view';

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
                    Color(0xFF005da0),
                    Color(0xFF67c3ce),
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
