import 'dart:io';
import 'package:camera/camera.dart';
import 'package:division/division.dart';
import 'package:dribbble_clone/core/helper/app_localizations.dart';
import 'package:dribbble_clone/core/helper/common_functions.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/view/profil/widgets/bottom_sheet_ubah_foto.dart';
import 'package:dribbble_clone/view/settings/settings_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'stores/profil_stores.dart';

class ProfilView extends StatefulWidget {
  @override
  _ProfilViewState createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {

  var _profilStores = locator<ProfilStores>();
  CameraDescription _cameraDescription;
  CameraController _cameraController;
  List<CameraDescription> cameras;

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _initializeCamera();

    super.initState();
  }

  _takePicture(context) async {
    try {
      final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png',);

      if (path != null && path == '') {
        return;
      }

      await _cameraController.takePicture(path);
      _profilStores.changeFile(File(path));
      _profilStores.changeShowCamera(false);
    } catch (e) {
      CommonFunctions.showCupertinoDialogUnderstand(context, null, e.toString(), buildTranslate(context, 'understand'));
      print(e);
    }
  }

  _initializeCamera() async {
    cameras = await availableCameras();
    _cameraDescription = cameras.first;
    _cameraController = CameraController(_cameraDescription, ResolutionPreset.veryHigh);
    await _cameraController.initialize();
  }

  _showBottomSheetUbahFoto(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetUbahFoto(
        onClickCamera: () async {
          Navigator.of(context).pop();
          _profilStores.changeShowCamera(true);
        },
        onClickGallery: () async {
          Navigator.of(context).pop();
          File file = await FilePicker.getFile(type: FileType.image);
          if (file != null) _profilStores.changeFile(file);
        }
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {

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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      children: <Widget>[
                        Opacity(
                          opacity: 0,
                          child: Image.asset('assets/images/ic_settings.png', width: size.width * 0.06, height: size.width * 0.06,)
                        ),
                        Expanded(
                          child: Text(buildTranslate(context, 'profile'), textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Colors.white),)
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsView())),
                          child: Image.asset('assets/images/ic_settings.png', width: size.width * 0.06, height: size.width * 0.06,)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.width * 0.12,),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 0, right: 0, top: 0, bottom: 0,
                          child: Parent(
                            style: ParentStyle()..width(double.infinity)..borderRadius(topLeft: 50, topRight: 50)..background.color(Color(0xFFf0f2f5))
                              ..margin(top: 45),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: size.width * 0.19,),
                                    Text('Sandra Wijaya', style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Color(0xFF347eb2)),),
                                    SizedBox(height: 30,),
                                    Text(buildTranslate(context, 'nip'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Color(0xFF253644)),),
                                    SizedBox(height: 6,),
                                    CustomTextField(
                                      onEditingComplete: () {},
                                      onChanged: (value) {},
                                      focusNode: FocusNode(),
                                      inputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      isObsecure: false,
                                      borderRadius: Dimens.half_circle,
                                      isEnabled: false,
                                      hintStyle: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFFbdbdbd)),
                                      hint: '123.456789.10111',
                                    ),
                                    SizedBox(height: 20,),
                                    Text(buildTranslate(context, 'position'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Color(0xFF253644)),),
                                    SizedBox(height: 6,),
                                    CustomTextField(
                                      onEditingComplete: () {},
                                      onChanged: (value) {},
                                      focusNode: FocusNode(),
                                      inputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      isObsecure: false,
                                      borderRadius: Dimens.half_circle,
                                      isEnabled: false,
                                      hintStyle: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFFbdbdbd)),
                                      hint: 'Perawat',
                                    ),
                                    SizedBox(height: 20,),
                                    Text(buildTranslate(context, 'unit'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Color(0xFF253644)),),
                                    SizedBox(height: 6,),
                                    CustomTextField(
                                      onEditingComplete: () {},
                                      onChanged: (value) {},
                                      focusNode: FocusNode(),
                                      inputType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                      isObsecure: false,
                                      borderRadius: Dimens.half_circle,
                                      isEnabled: false,
                                      hintStyle: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.035, color: Color(0xFFbdbdbd)),
                                      hint: 'Corporate Business Solution',
                                    ),
                                    SizedBox(height: 13,),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Parent(
                                        style: ParentStyle()..ripple(true)..borderRadius(all: 5)..padding(vertical: 7, horizontal: 7),
                                        child: Text(buildTranslate(context, 'logout'), style: ThemeTextStyle.poppinsMedium.apply(fontSizeDelta: size.width * 0.04, color: Color(0xFFf4584e)),),
                                      ),
                                    ),
                                    SizedBox(height: 13,)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ),
                        Positioned(
                          left: 32,
                          child: GestureDetector(
                            onTap: () => _showBottomSheetUbahFoto(context),
                            child: Stack(
                              children: <Widget>[
                                _profilStores.file == null ?
                                PlaceholderNetworkImage(
                                  url: 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg',
                                  size: Size(size.width * 0.245, size.width * 0.245),
                                  borderRadius: Dimens.half_circle
                                ) :
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle)),
                                  child: Container(
                                    height: size.width * 0.245,
                                    width: size.width * 0.245,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(_profilStores.file),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 2.5, bottom: 2.5,
                                  child: Image.asset('assets/images/ic_change_image.png', width: size.width * 0.06, height: size.width * 0.06,)
                                )
                              ],
                            ),
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            ),
            Positioned(
              left: 0, right: 0, top: 0, bottom: 50,
              child: IgnorePointer(
                ignoring: !_profilStores.isShowCamera,
                child: Visibility(
                  visible: _profilStores.isShowCamera,
                  child: Stack(
                    children: <Widget>[
                      CameraPreview(_cameraController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 20, right: 20),
                              child: FloatingActionButton(
                                backgroundColor: Colors.white.withOpacity(0.8),
                                child: Icon(Icons.camera, size: 30, color: Colors.black,),
                                onPressed: () => _takePicture(context)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: FloatingActionButton(
                                backgroundColor: Colors.white.withOpacity(0.8),
                                child: Icon(Icons.close, size: 30, color: Colors.black,),
                                onPressed: () => _profilStores.changeShowCamera(false)
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
