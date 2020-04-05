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
import 'package:dribbble_clone/view/tukar_shift/widgets/list_shift_item.dart';
import 'package:dribbble_clone/view/tukar_shift/widgets/pick_tanggal_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/tukar_shift_stores.dart';

class TukarShiftView extends StatefulWidget {
  @override
  _TukarShiftViewState createState() => _TukarShiftViewState();
}

class _TukarShiftViewState extends State<TukarShiftView> {

  var _tukarShiftStores = locator<TukarShiftStores>();

  @override
  void initState() {
    super.initState();
  }

  _showDatePicker(context, bool isPickTanggalShiftAwal) {
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
                initialDateTime: isPickTanggalShiftAwal ? _tukarShiftStores.dateTimeShiftAwal : _tukarShiftStores.dateTimeTukarShift,
                minimumYear: int.parse(TextUtil.getCurrentDate('yyyy')) - 10,
                maximumYear: int.parse(TextUtil.getCurrentDate('yyyy')) + 10,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (dateTime) => _tukarShiftStores.changeDateTime(dateTime, isPickTanggalShiftAwal)
              ),
            )
          ],
        ),
      )
    ).then((value) {
      if (isPickTanggalShiftAwal) {
        if (_tukarShiftStores.tanggalShiftAwal == '') _tukarShiftStores.changeDateTime(DateTime.now(), true);
      } else {
        if (_tukarShiftStores.tanggalTukarShift == '') _tukarShiftStores.changeDateTime(DateTime.now(), false);
        _tukarShiftStores.getListShift();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Stack(
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
                    CustomTabbar(title: 'change_shift', onItemClick: () {
                      print('item click');
                    }, image: 'assets/images/ic_history.png'),
                    SizedBox(height: 22,),
                    Expanded(
                      child: Parent(
                        style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                          ..padding(top: 4),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: size.width * 0.1 - 5,),
                                Parent(
                                  style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..padding(horizontal: 23, top: 14, bottom: 19)..borderRadius(all: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(buildTranslate(context, 'employee_pegawai'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03, color: ThemeColor.black.withOpacity(0.5)),),
                                      SizedBox(height: 5,),
                                      Text('Sandra Wijaya', style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                                      SizedBox(height: 18,),
                                      Text(buildTranslate(context, 'work_unit'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03, color: ThemeColor.black.withOpacity(0.5)),),
                                      SizedBox(height: 5,),
                                      Text('Corporate Business Solution', style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                                    ],
                                  ),
                                ),
                                Parent(
                                  style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..padding(horizontal: 23, top: 20, bottom: size.width * 0.073)..borderRadius(all: 20)
                                    ..margin(top: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      PickTanggalItem(
                                        image: 'assets/images/${!_tukarShiftStores.isSameDate ? 'ic_radio_on.png' : 'ic_radio_off.png'}',
                                        title: 'different_date',
                                        onClick: () => _tukarShiftStores.changeIsSameDate(false)
                                      ),
                                      SizedBox(height: size.width * 0.08,),
                                      PickTanggalItem(
                                        image: 'assets/images/${_tukarShiftStores.isSameDate ? 'ic_radio_on.png' : 'ic_radio_off.png'}',
                                        title: 'same_date',
                                        onClick: () => _tukarShiftStores.changeIsSameDate(true)
                                      ),
                                    ],
                                  ),
                                ),
                                Parent(
                                  style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..padding(top: 14, bottom: size.width * 0.071)..borderRadius(all: 20)
                                    ..margin(top: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Visibility(
                                        visible: !_tukarShiftStores.isSameDate,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 23),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(buildTranslate(context, 'start_shift_date'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                                              SizedBox(height: 8,),
                                              Builder(
                                                builder: (_) => Observer(
                                                  builder: (_) => ButtonDropdown(
                                                    onClick: () => _showDatePicker(context, true),
                                                    title: _tukarShiftStores.tanggalShiftAwal,
                                                    image: 'assets/images/ic_calendar.png',
                                                    backgroundColor: ThemeColor.white,
                                                    imageSize: size.width * 0.04,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: !_tukarShiftStores.isSameDate ? 15 : 0,),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 23),
                                        child: Text(buildTranslate(context, 'shift_exchange_date'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                                      ),
                                      SizedBox(height: 8),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 23),
                                        child: Builder(
                                          builder: (_) => Observer(
                                            builder: (_) => ButtonDropdown(
                                              onClick: () => _showDatePicker(context, false),
                                              title: _tukarShiftStores.tanggalTukarShift,
                                              image: 'assets/images/ic_calendar.png',
                                              backgroundColor: ThemeColor.white,
                                              imageSize: size.width * 0.04,
                                            ),
                                          ),
                                        ),
                                      ),
                                      _tukarShiftStores.isLoading ?
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: CupertinoActivityIndicator(radius: 10,),
                                        ),
                                      ) :
                                      _tukarShiftStores.listShift.length > 0 ?
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: _tukarShiftStores.listShift.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (_, index) => ListShiftItem(
                                          onClick: () => _tukarShiftStores.changeListShiftSelected(index),
                                          isFirst: index == 0,
                                          item: _tukarShiftStores.listShift[index]
                                        )
                                      ) :
                                      _tukarShiftStores.tanggalTukarShift == '' ?
                                      Container() :
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: <Widget>[
                                            SizedBox(height: size.width * 0.09,),
                                            Image.asset('assets/images/ic_warning.png', width: size.width * 0.062, height: size.width * 0.062,),
                                            SizedBox(height: 8,),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
                                              child: Text(
                                                'Silahkan pilih tanggal lain, Anda mempunyai shift di tanggal tersebut.',
                                                style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.black.withOpacity(0.5), fontSizeDelta: size.width * 0.027),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(buildTranslate(context, 'reason'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                                Parent(
                                  style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..borderRadius(all: 20)
                                    ..margin(top: 8, bottom: 20)..height(size.width * 0.32),
                                  child: TextField(
                                    onChanged: (value) => _tukarShiftStores.changeAlasan(value),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 10000000,
                                    style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: MediaQuery.of(context).size.width * 0.035, color: ThemeColor.black.withOpacity(0.5)),
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      enabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: SubmitButton(onClick: () {}, title: 'save', customColor: ThemeColor.darkThree,)
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(
                                      child: SubmitButton(onClick: () {}, title: 'submit')
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,)
                              ],
                            ),
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
      ),
    );
  }
}
