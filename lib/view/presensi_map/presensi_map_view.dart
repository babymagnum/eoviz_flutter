import 'dart:async';
import 'dart:ui';
import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/presensi/widgets/jam_masuk_keluar.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import '../beranda/stores/beranda_stores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'stores/presensi_map_stores.dart';

class PresensiMapView extends StatefulWidget {

  PresensiMapView({Key key, this.typePresence}): super(key: key);

  final String typePresence;

  @override
  PresensiMapViewState createState() => PresensiMapViewState();
}

class PresensiMapViewState extends State<PresensiMapView> {

  var _presensiMapStores = locator<PresensiMapStores>();
  var _berandaStores = locator<BerandaStores>();

  Completer<GoogleMapController> _controller = Completer();
  StreamSubscription _listener;

  @override
  void dispose() {
    if (_listener != null) _listener.cancel();

    super.dispose();
  }

  _getCurrentLocation() async {
    try {
      final location = Location();

      var _permissionGranted = await location.hasPermission();
      if (!_permissionGranted) {
        _permissionGranted = await location.requestPermission();
        if (!_permissionGranted) {
          return;
        }
      }

      var _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _presensiMapStores.changeCurrentLocation(await location.getLocation());
      _presensiMapStores.updateCameraAndMarker(_controller);

      _listener = location.onLocationChanged().listen((event) {
        _presensiMapStores.changeCurrentLocation(event);
        _presensiMapStores.updateCameraAndMarker(_controller);
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('error: ${e.toString()}');
      }
    }
  }

  @override
  void initState() {

    _getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    return Observer(
      builder: (_) => Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: GoogleMap(
                markers: _presensiMapStores.markers,
                initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
                circles: _presensiMapStores.circles,
              ),
            ),
            Positioned(
              left: 30, top: 0, right: 30,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).padding.top + size.width * 0.05,),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,),
                      ),
                      Spacer(),
                      Parent(
                        style: ParentStyle()..background.color(Colors.white)..borderRadius(all: Dimens.half_circle)..padding(horizontal: 20, vertical: 5),
                        child: Text(buildTranslate(context, widget.typePresence == 'in' ? 'presence_in' : 'presence_out'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF347eb2)),)
                      ),
                      Spacer(),
                      Opacity(
                        opacity: 0,
                        child: Image.asset('assets/images/back_button_circle.png', width: size.width * 0.08, height: size.width * 0.08,)
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Parent(
                    style: ParentStyle()..background.color(Colors.white)..borderRadius(all: Dimens.half_circle)..padding(horizontal: 32, vertical: 4),
                    child: Text(_berandaStores.currentTime, style: ThemeTextStyle.poppinsBold.apply(color: Color(0xFF347eb2), fontSizeDelta: size.width * 0.063),),
                  )
                ],
              )
            ),
            Positioned(
              left: 26, right: 26, bottom: 0,
              child: Column(
                children: <Widget>[
                  Parent(
                    style: ParentStyle()..background.color(Colors.white)..padding(vertical: 6, horizontal: 23)..borderRadius(all: Dimens.half_circle),
                    child: Text(buildTranslate(context, 'you_are_on_the_zone'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF347eb2)),),
                  ),
                  SizedBox(height: 8,),
                  JamMasukKeluar(),
                  SizedBox(height: _presensiMapStores.isInsideAnyPresence ? 12 : 9,),
                  _presensiMapStores.isInsideAnyPresence ?
                  Parent(
                    gesture: Gestures()..onTap(() {}),
                    style: ParentStyle()..linearGradient(colors: [
                      Color(0xFF005da0).withOpacity(0.8), Color(0xFF67c3ce).withOpacity(0.8),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)..width(double.infinity)..padding(vertical: 13)
                      ..ripple(true)..borderRadius(all: Dimens.half_circle),
                    child: Center(
                      child: Text(buildTranslate(context, 'presence'), style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.04),),
                    ),
                  ) :
                  Parent(
                    style: ParentStyle()..background.color(Colors.white)..borderRadius(all: 15)..padding(horizontal: 19, vertical: 13),
                    child: Row(
                      children: <Widget>[
                        Parent(
                          style: ParentStyle()..width(size.width * 0.14)..height(size.width * 0.14)..borderRadius(all: Dimens.half_circle)
                            ..linearGradient(colors: [Color(0xFF005da0).withOpacity(0.8), Color(0xFF4693cb).withOpacity(0.8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                          child: Center(
                            child: Image.asset('assets/images/ic_working_hours.png', width: size.width * 0.09, height: size.width * 0.09,),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Text(buildTranslate(context, 'hurry_up_you_are_out_of_the_presence_area'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF253644)),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.width * 0.2,)
                ],
              ),
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 0,
              child: Visibility(
                visible: _presensiMapStores.isLoading,
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