import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersetujuanView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Color(0xFFf0f2f5),
    ));

    return Scaffold(
      body: Center(
        child: Text('Persetujuan'),
      ),
    );
  }
}
