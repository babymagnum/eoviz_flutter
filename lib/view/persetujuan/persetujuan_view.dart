import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/no_image_content.dart';
import 'package:dribbble_clone/view/persetujuan/widgets/list_tukar_shift_item.dart';
import 'package:dribbble_clone/view/persetujuan/widgets/persetujuan_tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/persetujuan_stores.dart';

class PersetujuanView extends StatelessWidget {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>(debugLabel: 'persetujuan_view');
  var _persetujuanStores = locator<PersetujuanStores>();

  Future<dynamic> _refresh() {
    if (_persetujuanStores.currentPage == 0) {
      return _persetujuanStores.getIzinCuti(true);
    } else {
      return _persetujuanStores.getTukarShift(true);
    }
  }

  Widget _loading() {
    return Positioned(
      left: 0, right: 0, top: 0, bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoActivityIndicator(radius: 10)
        ],
      )
    );
  }

  Widget _izinCutiView(context, size) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          _persetujuanStores.izinCutiLoading && _persetujuanStores.listIzinCuti.length == 0 ?
          _loading() :
          _persetujuanStores.listIzinCuti.length == 0 ?
          NoImageContent(content: 'no_leave_permission_submission_yet') :
          Positioned(
            left: 0, right: 0, top: 0, bottom: 0,
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: NotificationListener(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_persetujuanStores.izinCutiLoading) _persetujuanStores.getIzinCuti(false);
                  return;
                },
                child: ListView.builder(
                  itemCount: _persetujuanStores.izinCutiPage > _persetujuanStores.izinCutiLastPage ? _persetujuanStores.listIzinCuti.length : _persetujuanStores.listIzinCuti.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _persetujuanStores.listIzinCuti.length) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CupertinoActivityIndicator(radius: 10,)
                        ],
                      );
                    } else {
                      return ListTukarShiftItem(
                        isFirst: index == 0,
                        item: _persetujuanStores.listIzinCuti[index],
                        isLast: index == _persetujuanStores.listIzinCuti.length - 1,
                      );
                    }
                  }
                )
              ),
            )
          )
        ],
      )
    );
  }

  Widget _tukarShiftView(context, size) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          _persetujuanStores.tukarShiftLoading && _persetujuanStores.listTukarShift.length == 0 ?
          _loading() :
          _persetujuanStores.listTukarShift.length == 0 ?
          NoImageContent(content: 'no_shift_exchange_submission_yet') :
          Positioned(
            left: 0, right: 0, top: 0, bottom: 0,
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: NotificationListener(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !_persetujuanStores.tukarShiftLoading) _persetujuanStores.getTukarShift(false);
                  return;
                },
                child: ListView.builder(
                  itemCount: _persetujuanStores.tukarShiftPage > _persetujuanStores.tukarShiftLastPage ? _persetujuanStores.listTukarShift.length : _persetujuanStores.listTukarShift.length + 1,
                  itemBuilder: (context, index) {
                    if (index == _persetujuanStores.listTukarShift.length) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CupertinoActivityIndicator(radius: 10,)
                        ],
                      );
                    } else {
                      return ListTukarShiftItem(
                        isFirst: index == 0,
                        item: _persetujuanStores.listTukarShift[index],
                        isLast: index == _persetujuanStores.listTukarShift.length - 1,
                      );
                    }
                  }
                )
              ),
            )
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    _persetujuanStores.getIzinCuti(true);
    _persetujuanStores.getTukarShift(true);

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
                  Text(buildTranslate(context, 'approval'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                        ..padding(horizontal: 32),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: size.width * 0.09,),
                          Row(
                            children: <Widget>[
                              PersetujuanTabItem(
                                title: 'permission_and_leave',
                                selected: _persetujuanStores.currentPage == 0,
                                onClick: () => _persetujuanStores.changeCurrentPage(0)
                              ),
                              SizedBox(width: 14,),
                              PersetujuanTabItem(
                                title: 'change_shift',
                                selected: _persetujuanStores.currentPage == 1,
                                onClick: () => _persetujuanStores.changeCurrentPage(1)
                              ),
                            ],
                          ),
                          _persetujuanStores.currentPage == 0 ?
                          _izinCutiView(context, size) :
                          _tukarShiftView(context, size)
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
