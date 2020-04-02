import 'dart:io';

import 'package:mobx/mobx.dart';

part 'profil_stores.g.dart';

class ProfilStores = _ProfilStores with _$ProfilStores;

abstract class _ProfilStores with Store {

  @observable
  File file;

  @observable
  bool isShowCamera = false;

  @action
  changeFile(File file) => this.file = file;

  @action
  changeShowCamera(bool value) => this.isShowCamera = value;
}