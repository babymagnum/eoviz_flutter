import 'package:mobx/mobx.dart';
import '../../../model/daftar_presensi/daftar_presensi_item.dart';

part 'daftar_presensi_stores.g.dart';

class DaftarPresensiStores = _DaftarPresensiStores with _$DaftarPresensiStores;

abstract class _DaftarPresensiStores with Store {

  @observable
  bool isLoading = false;

  @observable
  ObservableList<DaftarPresensiItem> listPresensi = ObservableList.of([]);

  @action
  getListPresensi() {
    isLoading = true;

    Future.delayed(Duration(seconds: 1), () {
      isLoading = false;

      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 1 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 2 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 3 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 4 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 5 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 6 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 7 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 8 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 9 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));
      listPresensi.add(DaftarPresensiItem('On Time', '9ccc65', 'Senin, 10 Februari 2020', '14:00:00', '14:10:00', '08:00:00', '07:55:00'));

    });
  }

}