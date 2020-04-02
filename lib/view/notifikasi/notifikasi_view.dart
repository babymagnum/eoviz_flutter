import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/notifikasi/widgets/list_notifikasi_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/notifikasi_stores.dart';

class NotifikasiView extends StatefulWidget {
  @override
  _NotifikasiViewState createState() => _NotifikasiViewState();
}

class _NotifikasiViewState extends State<NotifikasiView> {

  var _notifikasiStores = locator<NotifikasiStores>();

  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      _notifikasiStores.getNotifikasi();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (context) => Scaffold(
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
                  Text(buildTranslate(context, 'notification'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5)),
                      child: Stack(
                        children: <Widget>[
                          _notifikasiStores.isLoading ?
                          Positioned(
                            left: 0, right: 0, top: 0, bottom: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CupertinoActivityIndicator()
                              ],
                            )
                          ) :
                          _notifikasiStores.listNotifikasi.length == 0 ?
                          Positioned(
                            left: 0, right: 0, top: 0, bottom: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/ic_empty_notif.png', width: size.width * 0.62, height: size.width * 0.49,),
                                SizedBox(height: 45,),
                                Text(buildTranslate(context, 'there_are_no_notifications_yet'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF636569)),)
                              ],
                            )
                          ) :
                          Positioned(
                            left: 0, right: 0, top: 0, bottom: 0,
                            child: NotificationListener(
                              child: ListView.builder(
                                itemBuilder: (_, index) => ListNotifikasiItem(
                                  isLast: index == _notifikasiStores.listNotifikasi.length - 1,
                                  item: _notifikasiStores.listNotifikasi[index],
                                  isFirst: index == 0,
                                ),
                                itemCount: _notifikasiStores.listNotifikasi.length,
                              )
                            )
                          )
                        ],
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
