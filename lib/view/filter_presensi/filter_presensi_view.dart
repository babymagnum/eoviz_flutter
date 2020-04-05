import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/button_dropdown.dart';
import 'package:dribbble_clone/core/widgets/custom_tabbar.dart';
import 'package:dribbble_clone/core/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/filter_presensi_stores.dart';

class FilterPresensiView extends StatefulWidget {
  @override
  _FilterPresensiViewState createState() => _FilterPresensiViewState();
}

class _FilterPresensiViewState extends State<FilterPresensiView> {

  var _filterPresensiStores = locator<FilterPresensiStores>();

  @override
  void initState() {

    _filterPresensiStores.getCurrentMonthYear();

    super.initState();
  }

  _showDatePicker(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Parent(
        style: ParentStyle()..borderRadius(topLeft: 10, topRight: 10)..background.color(Colors.white)..padding(horizontal: 20, vertical: 10)..height(250),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Parent(
              style: ParentStyle()..borderRadius(all: Dimens.half_circle)..height(5)..width(37)..background.color(Color(0xFFf2f2f2)),
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: _filterPresensiStores.dateTime,
                minimumYear: int.parse(TextUtil.getCurrentDate('yyyy')) - 20,
                maximumYear: int.parse(TextUtil.getCurrentDate('yyyy')) + 20,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (dateTime) {
                  _filterPresensiStores.changeDateTime(dateTime);
                }
              ),
            )
          ],
        ),
      )
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
                  CustomTabbar(title: 'filter', onItemClick: () {}, image: ''),
                  SizedBox(height: 22,),
                  Expanded(
                    child: Parent(
                      style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                        ..padding(horizontal: 32, top: 30),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(buildTranslate(context, 'month'), style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.black, fontSizeDelta: size.width * 0.035),),
                                SizedBox(height: 2,),
                                ButtonDropdown(
                                  onClick: () => _showDatePicker(context),
                                  title: _filterPresensiStores.month
                                ),
                                SizedBox(height: 19,),
                                Text(buildTranslate(context, 'year'), style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.black, fontSizeDelta: size.width * 0.035),),
                                SizedBox(height: 2,),
                                ButtonDropdown(
                                  onClick: () => _showDatePicker(context),
                                  title: '${_filterPresensiStores.year}'
                                ),
                              ],
                            )
                          ),
                          SubmitButton(onClick: () => print('terapkan click'), title: 'apply',),
                          SizedBox(height: size.width * 0.16,)
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
