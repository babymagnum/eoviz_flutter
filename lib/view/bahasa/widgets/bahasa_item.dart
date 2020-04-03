import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class BahasaItem extends StatelessWidget {

  BahasaItem({Key key, @required this.onClick, @required this.image, @required this.isFirst, @required this.isPicked, @required this.title}): super(key: key);

  final Function() onClick;
  final bool isFirst;
  final String image;
  final String title;
  final bool isPicked;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..ripple(true)..padding(horizontal: 17, vertical: 12)..background.color(Colors.white)..borderRadius(all: 10)
        ..margin(top: isFirst ? 50 : 10, horizontal: 32),
      child: Row(
        children: <Widget>[
          Image.asset(image, width: size.width * 0.05, height: size.width * 0.05,),
          SizedBox(width: 15,),
          Expanded(
            child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.poppinsRegular.apply(fontSizeDelta: size.width * 0.03, color: Color(0xFF347eb2)),)
          ),
          SizedBox(width: 10,),
          isPicked ?
          Image.asset('assets/images/ic_success.png', width: size.width * 0.04, height: size.width * 0.04,) :
          Container()
        ],
      ),
    );
  }
}
