import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class BottomSheetUbahFoto extends StatelessWidget {

  BottomSheetUbahFoto({Key key, @required this.onClickCamera, @required this.onClickGallery}): super(key: key);

  final Function() onClickCamera;
  final Function() onClickGallery;

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return Parent(
      style: ParentStyle()..borderRadius(topLeft: 30, topRight: 30)..background.color(Colors.white)..padding(top: 8, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Parent(
              style: ParentStyle()..borderRadius(all: Dimens.half_circle)..height(5)..width(37)..background.color(Color(0xFFf2f2f2)),
            ),
          ),
          SizedBox(height: 28,),
          Padding(
            padding: EdgeInsets.only(left: 32),
            child: Text(buildTranslate(context, 'change_profile_photo'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF262c36)),),
          ),
          Parent(
            gesture: Gestures()..onTap(onClickCamera),
            style: ParentStyle()..ripple(true)..padding(horizontal: 32, vertical: 10)..margin(top: 13),
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/ic_camera.png', height: 16, width: 16),
                SizedBox(width: 11,),
                Expanded(
                  child: Text(buildTranslate(context, 'take_photo'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF818181)),)
                )
              ],
            ),
          ),
          Parent(
            gesture: Gestures()..onTap(onClickGallery),
            style: ParentStyle()..ripple(true)..padding(horizontal: 32, vertical: 10)..margin(top: 3),
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/ic_photo_library.png', height: 16, width: 16),
                SizedBox(width: 11,),
                Expanded(
                  child: Text(buildTranslate(context, 'take_gallery'), style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFF818181)),)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
