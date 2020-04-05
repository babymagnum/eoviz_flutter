import 'dart:math';
import 'package:dribbble_clone/core/helper/text_util.dart';
import 'package:mobx/mobx.dart';
import '../../../model/shift/shift_item.dart';

part 'tukar_shift_stores.g.dart';

class TukarShiftStores = _TukarShiftStores with _$TukarShiftStores;

abstract class _TukarShiftStores with Store {

  @observable
  bool isLoading = false;

  @observable
  bool isSameDate = false;

  @observable
  String tanggalShiftAwal = '';

  @observable
  String tanggalTukarShift = '';

  @observable
  String alasan = '';

  @observable
  ObservableList<ShiftItem> listShift = ObservableList.of([]);

  @observable
  DateTime dateTimeShiftAwal = DateTime.now();

  @observable
  DateTime dateTimeTukarShift = DateTime.now();

  @action
  changeDateTime(DateTime value, bool isPickTanggalShiftAwal) {
    if (isPickTanggalShiftAwal) {
      dateTimeShiftAwal = value;
      tanggalShiftAwal = TextUtil.convertDateStringToAnotherFormat(dateTimeShiftAwal.toString().substring(0, 10), 'dd/MM/yyyy', 'yyyy-MM-dd');
    } else {
      dateTimeTukarShift = value;
      tanggalTukarShift = TextUtil.convertDateStringToAnotherFormat(dateTimeTukarShift.toString().substring(0, 10), 'dd/MM/yyyy', 'yyyy-MM-dd');
    }
  }

  @action
  changeIsSameDate(bool value) => isSameDate = value;

  @action
  changeAlasan(String value) => alasan = value;

  @action
  getListShift() {
    listShift.clear();

    isLoading = true;

    Future.delayed(Duration(seconds: 1), () {
      isLoading = false;

      if (Random().nextBool()) {
        listShift.add(ShiftItem(false, 'Hendra Samudra', '18/02/2020 14:00:00', '18/02/2020 06:00:00', 'Shift I', 'Perawat'));
        listShift.add(ShiftItem(false, 'Neni Sukaesih', '18/02/2020 22:00:00', '18/02/2020 14:00:00', 'Shift I', 'Perawat'));
        listShift.add(ShiftItem(false, 'Baskoro Yudhoyono', '18/02/2020 14:00:00', '18/02/2020 06:00:00', 'Shift I', 'Perawat'));
      }
    });
  }

  @action
  changeListShiftSelected(int index) {
    final newItem = listShift[index];
    newItem.selected = !newItem.selected;

    listShift.removeAt(index);
    listShift.insert(index, newItem);
  }
}