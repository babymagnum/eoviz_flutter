import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/beranda/beranda_view.dart';
import 'package:dribbble_clone/view/notifikasi/notifikasi_view.dart';
import 'package:dribbble_clone/view/persetujuan/persetujuan_view.dart';
import 'package:dribbble_clone/view/profil/profil_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/theme/theme_color.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'home_view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var _selectedIndex = 0;
  List<Widget> _listScreen = [BerandaView(), PersetujuanView(), NotifikasiView(), ProfilView()];

  onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        onTap: (index) => onItemTapped(index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/ic_home.png', width: size.width * 0.045, height: size.width * 0.045, color: Color(_selectedIndex == 0 ? 0xFF347eb2 : 0xFF253644)),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(buildTranslate(context, 'home'), style: ThemeTextStyle.poppinsLight.apply(color: Color(_selectedIndex == 0 ? 0xFF347eb2 : 0xFF253644), fontSizeDelta: size.width * 0.027)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in, size: size.width * 0.045, color: _selectedIndex == 1 ? Color(0xFF347eb2) : Color(0xFF253644)),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(buildTranslate(context, 'approval'), style: ThemeTextStyle.poppinsLight.apply(color: Color(_selectedIndex == 1 ? 0xFF347eb2 : 0xFF253644), fontSizeDelta: size.width * 0.027)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/ic_notifikasi.png', width: size.width * 0.045, height: size.width * 0.045, color: Color(_selectedIndex == 2 ? 0xFF347eb2 : 0xFF253644)),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(buildTranslate(context, 'notification'), style: ThemeTextStyle.poppinsLight.apply(color: Color(_selectedIndex == 2 ? 0xFF347eb2 : 0xFF253644), fontSizeDelta: size.width * 0.027)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/ic_profil.png', width: size.width * 0.045, height: size.width * 0.045, color: Color(_selectedIndex == 3 ? 0xFF347eb2 : 0xFF253644)),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(buildTranslate(context, 'profile'), style: ThemeTextStyle.poppinsLight.apply(color: Color(_selectedIndex == 3 ? 0xFF347eb2 : 0xFF253644), fontSizeDelta: size.width * 0.027)),
            ),
          ),
        ]
      ),
      tabBuilder: (context, index) {
        return _listScreen[index];
      }
    );
  }
}
