import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../stores/detail_pengajuan_tukar_shift_stores.dart';

class DialogBatalkanTukarShift extends StatelessWidget {

  var _detailStores = locator<DetailPengajuanTukarShiftStores>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Parent(
          style: ParentStyle()..borderRadius(all: 20)..background.color(Colors.white)..padding(horizontal: 20, bottom: 20, top: 12)
            ..margin(horizontal: 44),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/ic_alert_error.png', width: size.width * 0.12, height: size.width * 0.12,),
              SizedBox(height: 12,),
              Text(buildTranslate(context, 'confirm_cancel_exchange'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, decoration: TextDecoration.none),),
              SizedBox(height: 13,),
              Material(
                child: Parent(
                  style: ParentStyle()..width(double.infinity)..background.color(ThemeColor.veryLightPinkSeven)..borderRadius(all: 20)..height(size.width * 0.25),
                  child: TextField(
                    onChanged: (value) => _detailStores.changeAlasanPembatalan(value),
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
              ),
              SizedBox(height: 23,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SubmitButton(
                      customVerticalPadding: 8,
                      customButtonSize: size.width * 0.035,
                      onClick: () => Navigator.of(context).pop(),
                      title: 'back',
                      customColors: [ThemeColor.darkThree.withOpacity(0.8), ThemeColor.darkThree.withOpacity(0.8)],
                    )
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: SubmitButton(
                      customVerticalPadding: 8,
                      customButtonSize: size.width * 0.035,
                      onClick: () {},
                      title: 'cancel2',
                      customColors: [ThemeColor.rustRed.withOpacity(0.8), ThemeColor.pastelRed.withOpacity(0.8)],
                    )
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
