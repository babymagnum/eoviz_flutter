import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'detail_pengajuan_tukar_shift_stores.g.dart';

class DetailPengajuanTukarShiftStores = _DetailPengajuanTukarShiftStores with _$DetailPengajuanTukarShiftStores;

abstract class _DetailPengajuanTukarShiftStores with Store {

  @observable
  SharedPreferences preferences;

  @observable
  double contentSize = 0;

  @observable
  String alasanPembatalan = '';

  @action
  changeAlasanPembatalan(String value) => alasanPembatalan = value;

  @action
  changeContentSize(double value) => contentSize = value;
}