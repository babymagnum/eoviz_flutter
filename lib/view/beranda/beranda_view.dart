import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/view/beranda/widgets/beranda_menu_item.dart';
import 'package:dribbble_clone/view/presensi/presensi_view.dart';
import 'package:dribbble_clone/view/tukar_shift/tukar_shift_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'stores/beranda_stores.dart';

class BerandaView extends StatefulWidget {
  @override
  _BerandaViewState createState() => _BerandaViewState();
}

class _BerandaViewState extends State<BerandaView> {

  var _berandaStores = locator<BerandaStores>();

  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      if (_berandaStores.currentTime == '') _berandaStores.startTimerAndSetView();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: double.infinity, height: MediaQuery.of(context).padding.top + size.width * 0.07,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.078),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${buildTranslate(context, 'halo')} Sandra.', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),),
                        Expanded(
                          child: Text(_berandaStores.currentTime, textAlign: TextAlign.right, style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.05, color: Colors.white),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.width * 0.027,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.078),
                    child: Text('Shift I', style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.04),),
                  ),
                  SizedBox(height: 8,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.078),
                    child: Text('Terlambat & Tidak Memenuhi', style: ThemeTextStyle.poppinsBold.apply(color: Colors.white, fontSizeDelta: size.width * 0.04),),
                  ),
                  SizedBox(height: 26,),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Parent(
                          style: ParentStyle()..background.color(Color(0xFFf0f2f5))..width(double.infinity)..height(size.height * 0.697)..borderRadius(topLeft: 50, topRight: 50)
                            ..margin(top: 38),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 68,),
                                Container(
                                  height: size.width * 0.31, width: double.infinity,
                                  child: PageView(
                                    controller: PageController(viewportFraction: 0.84),
                                    children: <Widget>[
                                      Parent(
                                        style: ParentStyle()..width(double.infinity)..height(size.width * 0.29)..borderRadius(all: 15)
                                          ..linearGradient(colors: [Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8)], begin: Alignment.topLeft, end: Alignment.bottomRight)
                                          ..margin(right: 14)..padding(left: 20, right: 24, top: 16),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Image.asset('assets/images/ic_clock.png', width: size.width * 0.08, height: size.width * 0.08,),
                                                  SizedBox(height: 12,),
                                                  Text(buildTranslate(context, 'percentage_npresence'), maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Colors.white),)
                                                ],
                                              )
                                            ),
                                            SizedBox(width: 10,),
                                            CircularPercentIndicator(
                                              radius: size.width * 0.2,
                                              lineWidth: 8,
                                              percent: 0.7,
                                              animation: true,
                                              animationDuration: 500,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              progressColor: Color(0xFF245076),
                                              backgroundColor: Colors.white,
                                              center: Text("71%", style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.05, color: Colors.white),),
                                            )
                                          ],
                                        ),
                                      ),
                                      Parent(
                                        style: ParentStyle()..width(double.infinity)..height(size.width * 0.29)..borderRadius(all: 15)
                                          ..linearGradient(colors: [Color(0xFF04aaa0).withOpacity(0.8), Color(0xFF73e4dd).withOpacity(0.8)], begin: Alignment.topLeft, end: Alignment.bottomRight)
                                          ..padding(left: 20, right: 24, top: 16),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Image.asset('assets/images/ic_koper.png', width: size.width * 0.08, height: size.width * 0.08,),
                                                  SizedBox(height: 12,),
                                                  Text(buildTranslate(context, 'leave_nquota'), maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Colors.white),)
                                                ],
                                              )
                                            ),
                                            SizedBox(width: 10,),
                                            CircularPercentIndicator(
                                              radius: size.width * 0.2,
                                              lineWidth: 8,
                                              percent: 12/16,
                                              animation: true,
                                              animationDuration: 500,
                                              circularStrokeCap: CircularStrokeCap.round,
                                              progressColor: Color(0xFF046b65),
                                              //arcType: ArcType.FULL,
                                              //arcBackgroundColor: Colors.white,
                                              backgroundColor: Colors.white,
                                              center: Text('12', style: ThemeTextStyle.poppinsBold.apply(fontSizeDelta: size.width * 0.05, color: Colors.white),),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 32),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: BerandaMenuItem(
                                          title: 'presence',
                                          image: 'assets/images/ic_presensi.png',
                                          onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PresensiView())),
                                        )
                                      ),
                                      SizedBox(width: 23,),
                                      Expanded(
                                        child: BerandaMenuItem(
                                          title: 'exchange_shift',
                                          image: 'assets/images/ic_tukar_shift.png',
                                          onClick: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => TukarShiftView())),
                                        )
                                      ),
                                      SizedBox(width: 23,),
                                      Expanded(
                                        child: BerandaMenuItem(
                                          title: 'permission_and_leave',
                                          image: 'assets/images/ic_izin_cuti.png',
                                          onClick: () => print('izin cuti click'),
                                        )
                                      ),
                                      SizedBox(width: 23,),
                                      Expanded(
                                        child: BerandaMenuItem(
                                          title: 'team_working_hours',
                                          image: 'assets/images/ic_jam_kerja.png',
                                          onClick: () => print('jam kerja click'),
                                        )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 32,
                          child: PlaceholderNetworkImage(
                            url: 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg',
                            size: Size(size.width * 0.2, size.width * 0.2),
                            borderRadius: Dimens.half_circle
                          ),
                        )
                      ],
                    )
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
