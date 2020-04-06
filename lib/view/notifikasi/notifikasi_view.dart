import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/no_image_content.dart';
import 'package:dribbble_clone/view/notifikasi/widgets/list_notifikasi_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/notifikasi_stores.dart';

class NotifikasiView extends StatelessWidget {

  var _notifikasiStores = locator<NotifikasiStores>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>(debugLabel: 'persetujuan_view');

  Future<dynamic> _refresh() {
    return _notifikasiStores.getNotifikasi(true);
  }
  @override
  Widget build(BuildContext context) {

    _notifikasiStores.getNotifikasi(true);

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
                  Text(buildTranslate(context, 'notification'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5)),
                      child: Stack(
                        children: <Widget>[
                          _notifikasiStores.isLoading && _notifikasiStores.listNotifikasi.length == 0 ?
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
                          NoImageContent(content: 'there_are_no_notifications_yet') :
                          Positioned(
                            left: 0, right: 0, top: 3, bottom: 0,
                            child: RefreshIndicator(
                              key: _refreshIndicatorKey,
                              onRefresh: _refresh,
                              child: NotificationListener(
                                onNotification: (ScrollNotification scrollInfo) {
                                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_notifikasiStores.isLoading) _notifikasiStores.getNotifikasi(false);
                                  return;
                                },
                                child: ListView.builder(
                                  itemCount: _notifikasiStores.notifikasiPage > _notifikasiStores.notifikasiLastPage ? _notifikasiStores.listNotifikasi.length : _notifikasiStores.listNotifikasi.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == _notifikasiStores.listNotifikasi.length) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 15),
                                            child: CupertinoActivityIndicator(radius: 10,),
                                          )
                                        ],
                                      );
                                    } else {
                                      return ListNotifikasiItem(
                                        isFirst: index == 0,
                                        item: _notifikasiStores.listNotifikasi[index],
                                        isLast: index == _notifikasiStores.listNotifikasi.length - 1,
                                      );
                                    }
                                  }
                                )
                              ),
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
