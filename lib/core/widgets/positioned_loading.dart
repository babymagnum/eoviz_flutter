import 'dart:ui';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PositionedLoading extends StatelessWidget {

  PositionedLoading({Key key, @required this.visible}): super(key: key);

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0, right: 0, top: 0, bottom: 0,
      child: Visibility(
        visible: visible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Parent(
                  style: ParentStyle()..height(100)..width(100)..borderRadius(all: 10),
                  child: Center(
                    child: CupertinoActivityIndicator(radius: 20,),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
