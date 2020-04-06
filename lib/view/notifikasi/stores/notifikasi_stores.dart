import 'package:mobx/mobx.dart';
import '../../../model/notifikasi/item_notifikasi.dart';
part 'notifikasi_stores.g.dart';

class NotifikasiStores = _NotifikasiStores with _$NotifikasiStores;

abstract class _NotifikasiStores with Store {

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ItemNotifikasi> listNotifikasi = ObservableList.of([]);

  @observable
  int notifikasiPage = 1;

  @observable
  int notifikasiLastPage = 1;

  @action
  getNotifikasi(bool isFirst) {
    if (isFirst) {
      listNotifikasi.clear();
      notifikasiPage = 1;
      notifikasiLastPage = 1;
    }

    if (notifikasiPage <= notifikasiLastPage) {
      isLoading = true;

      Future.delayed(Duration(seconds: 1), () {
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '0'));
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '1'));
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '1'));
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '0'));
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '0'));
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '1'));
        listNotifikasi.add(ItemNotifikasi('Pengajuan Tukar Shift', 'Pengajuan tukar shift Anda sedang diproses.', '14/02/2020', '1'));

        notifikasiPage += 1;
        notifikasiLastPage += 1;

        isLoading = false;
      });
    }
  }
}