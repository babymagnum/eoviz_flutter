import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_tabbar.dart';
import 'package:dribbble_clone/view/daftar_presensi/daftar_presensi_view.dart';
import 'package:dribbble_clone/view/presensi/widgets/jam_masuk_keluar.dart';
import 'package:dribbble_clone/view/presensi_map/presensi_map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../beranda/stores/beranda_stores.dart';
import '../splash/stores/splash_stores.dart';

class PresensiView extends StatelessWidget {

  var _berandaStores = locator<BerandaStores>();
  var _splashStores = locator<SplashStores>();

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

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
                  CustomTabbar(title: 'presence', onItemClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DaftarPresensiView()));
                  }, image: 'assets/images/ic_history.png'),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                        ..padding(horizontal: 38, top: 50, bottom: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text('${TextUtil.getDay(_splashStores.preferences)}, ${TextUtil.getCurrentDate('dd MMMM yyyy')}', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035),),
                            SizedBox(height: 3,),
                            Text(_berandaStores.currentTime, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.08, color: Color(0xFF347eb2)),),
                            SizedBox(height: 33,),
                            JamMasukKeluar(),
                            SizedBox(height: 24,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  _buttonPresensi(
                                    context, [Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8)],
                                    'in', () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PresensiMapView(typePresence: 'in',))),
                                    size, 'assets/images/ic_presence_in.png'
                                  ),
                                  SizedBox(width: 22,),
                                  _buttonPresensi(
                                    context, [Color(0xFFb11309).withOpacity(0.8), Color(0xFFd95b5b).withOpacity(0.8)],
                                    'out', () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PresensiMapView(typePresence: 'out',))),
                                    size, 'assets/images/ic_presence_out.png'
                                  ),
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
