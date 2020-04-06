import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_tabbar.dart';
import 'package:dribbble_clone/core/widgets/measure_size.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/core/widgets/submit_button.dart';
import 'package:dribbble_clone/view/detail_pengajuan_tukar_shift/widgets/dialog_batalkan_tukar_shift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/detail_pengajuan_tukar_shift_stores.dart';

class DetailPengajuanTukarShiftView extends StatelessWidget {

  var _detailStores = locator<DetailPengajuanTukarShiftStores>();

  _showDialogBatalkanTukarShift(context) {
    showDialog(
      context: context,
      child: DialogBatalkanTukarShift()
    );
  }

  Widget _namaContent(context, size, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(buildTranslate(context, title), style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.black.withOpacity(0.5), fontSizeDelta: size.width * 0.03),)
        ),
        SizedBox(width: 5,),
        Expanded(
          flex: 2,
          child: Text(content, style: ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.03),)
        )
      ],
    );
  }

  Widget _dataContent(context, size, String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(buildTranslate(context, title), style: ThemeTextStyle.poppinsRegular.apply(color: ThemeColor.black.withOpacity(0.5), fontSizeDelta: size.width * 0.03),)
        ),
        SizedBox(width: 5,),
        Expanded(
          flex: 2,
          child: Text(content, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03),)
        )
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
                    CustomTabbar(title: 'shift_exchange_submission_details', onItemClick: () {}, image: ''),
                    SizedBox(height: 22,),
                    Expanded(
                      child: Parent(
                        style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                          ..padding(horizontal: 30, top: 4),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: size.width * 0.12,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('SHI.2019.05.000410', style: ThemeTextStyle.poppinsSemiBold.apply(fontSizeDelta: size.width * 0.035, color: ThemeColor.windowsBlue),),
                                        Text('Diajukan pada 3 Februari 2020 18:00:12', style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.027, color: ThemeColor.windowsBlue),),
                                      ],
                                    )
                                  ),
                                  SizedBox(width: 10,),
                                  Parent(
                                    style: ParentStyle()..borderRadius(topLeft: 10, bottomLeft: 10)..linearGradient(colors: [
                                      ThemeColor.peacockBlue, ThemeColor.greyblue
                                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)..padding(horizontal: 12, vertical: 6),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset('assets/images/ic_check.png', width: size.width * 0.04, height: size.width * 0.04,),
                                        SizedBox(width: 6,),
                                        Text('Submitted', style: ThemeTextStyle.poppinsMedium.apply(color: Colors.white, fontSizeDelta: size.width * 0.03),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 19,),
                              Text(buildTranslate(context, 'applicant_employee'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                              Parent(
                                style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..borderRadius(all: 10)
                                  ..margin(top: 13, bottom: 22)..padding(horizontal: 20, bottom: 18, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: PlaceholderNetworkImage(
                                        url: 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg',
                                        size: Size(size.width * 0.15, size.width * 0.15),
                                        borderRadius: Dimens.half_circle
                                      ),
                                    ),
                                    SizedBox(height: 9),
                                    _namaContent(context, size, 'name', 'Sandra Wijaya'),
                                    SizedBox(height: 3,),
                                    _dataContent(context, size, 'work_unit', 'Corporate Business Solution'),
                                    SizedBox(height: 3,),
                                    _dataContent(context, size, 'shift_date', '14 Februari 2020'),
                                    SizedBox(height: 3,),
                                    _dataContent(context, size, 'reason', 'Anak sakit')
                                  ],
                                ),
                              ),
                              Text(buildTranslate(context, 'substitute_employees'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                              Parent(
                                style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..borderRadius(all: 10)
                                  ..margin(top: 13, bottom: 22)..padding(horizontal: 20, bottom: 18, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: PlaceholderNetworkImage(
                                        url: 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg',
                                        size: Size(size.width * 0.15, size.width * 0.15),
                                        borderRadius: Dimens.half_circle
                                      ),
                                    ),
                                    SizedBox(height: 9),
                                    _namaContent(context, size, 'name', 'Sandra Wijaya'),
                                    SizedBox(height: 3,),
                                    _dataContent(context, size, 'work_unit', 'Corporate Business Solution'),
                                    SizedBox(height: 3,),
                                    _dataContent(context, size, 'shift_date', '14 Februari 2020'),
                                  ],
                                ),
                              ),
                              Text(buildTranslate(context, 'status_information'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035)),
                              Parent(
                                style: ParentStyle()..width(double.infinity)..background.color(Colors.white)..borderRadius(all: 10)
                                  ..margin(top: 13)..padding(horizontal: 20, bottom: 18, top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Parent(
                                              style: ParentStyle()..height(8)..width(8)..borderRadius(all: Dimens.half_circle)..background.color(ThemeColor.windowsBlue)
                                                ..margin(top: 2.5),
                                            ),
                                            Container(
                                              height: _detailStores.contentSize - 8,
                                              width: 1, color: ThemeColor.windowsBlue,
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          flex: 4,
                                          child: MeasureSize(
                                            onChange: (size) => _detailStores.changeContentSize(size.height),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('Sandra Wijaya'.toUpperCase(), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03),),
                                                Text('Pengaju', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: ThemeColor.black.withOpacity(0.5)),),
                                                Text('3 Februari 2020 18:00:12', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: ThemeColor.windowsBlue),),
                                                SizedBox(height: 10,)
                                              ],
                                            )
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: <Widget>[
                                              Image.asset('assets/images/ic_border_checked.png', width: size.width * 0.06, height: size.width * 0.06,),
                                              SizedBox(height: 4,),
                                              Text('Submitted', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.023),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 4,
                                              width: 1, color: ThemeColor.windowsBlue,
                                            ),
                                            Parent(
                                              style: ParentStyle()..height(8)..width(8)..borderRadius(all: Dimens.half_circle)..background.color(ThemeColor.dark),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Neni Sukaesih'.toUpperCase(), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.03),),
                                              Text('', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: ThemeColor.black.withOpacity(0.5)),),
                                              Text('', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.027, color: ThemeColor.windowsBlue),),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: <Widget>[
                                              Image.asset('assets/images/ic_alarm.png', width: size.width * 0.06, height: size.width * 0.06,),
                                              SizedBox(height: 4,),
                                              Text('Waiting', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.023),)
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 25,),
                              Visibility(
                                visible: false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(buildTranslate(context, 'note'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035),),
                                    SizedBox(height: 12,),
                                    Text('Gak jadi.', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: ThemeColor.slateGrey),),
                                  ],
                                )
                              ),
                              Visibility(
                                visible: true,
                                child: SubmitButton(
                                  onClick: () => _showDialogBatalkanTukarShift(context),
                                  title: 'cancel2',
                                  customColors: [ThemeColor.rustRed.withOpacity(0.8), ThemeColor.pastelRed.withOpacity(0.8)],
                                ),
                              ),
                              SizedBox(height: 20,)
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
      ),
    );
  }
}
