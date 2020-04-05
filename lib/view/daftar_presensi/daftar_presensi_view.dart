import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_tabbar.dart';
import 'package:dribbble_clone/core/widgets/positioned_loading.dart';
import 'package:dribbble_clone/view/daftar_presensi/widgets/list_presensi_item.dart';
import 'package:dribbble_clone/view/filter_presensi/filter_presensi_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/daftar_presensi_stores.dart';

class DaftarPresensiView extends StatefulWidget {
  @override
  _DaftarPresensiViewState createState() => _DaftarPresensiViewState();
}

class _DaftarPresensiViewState extends State<DaftarPresensiView> {
  var _daftarPresensiStores = locator<DaftarPresensiStores>();

  @override
  void initState() {

    Future.delayed(Duration.zero, () {
      _daftarPresensiStores.getListPresensi();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

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
                  CustomTabbar(title: 'presence_list', onItemClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => FilterPresensiView()));
                  }, image: 'assets/images/ic_filter.png'),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5)),
                      child: Stack(
                        children: <Widget>[
                          !_daftarPresensiStores.isLoading && _daftarPresensiStores.listPresensi.length == 0 ?
                          Positioned(
                            left: 0, right: 0, top: 0, bottom: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/images/ic_empty_notif.png', width: size.width * 0.62, height: size.width * 0.49,),
                                SizedBox(height: 45,),
                                Text('Data Kosong', style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF636569)),)
                              ],
                            )
                          ) :
                          Positioned(
                            left: 0, right: 0, top: 3, bottom: 0,
                            child: NotificationListener(
                              child: ListView.builder(
                                itemBuilder: (_, index) => ListPresensiItem(
                                  isLast: index == _daftarPresensiStores.listPresensi.length - 1,
                                  item: _daftarPresensiStores.listPresensi[index],
                                  isFirst: index == 0,
                                ),
                                itemCount: _daftarPresensiStores.listPresensi.length,
                              )
                            )
                          )
                        ],
                      ),
                    )
                  )
                ],
              )
            ),
            PositionedLoading(visible: _daftarPresensiStores.isLoading)
          ],
        ),
      ),
    );
  }
}
