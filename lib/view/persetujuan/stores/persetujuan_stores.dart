import 'package:mobx/mobx.dart';
import '../../../model/tukar_shift/tukar_shift_item.dart';

part 'persetujuan_stores.g.dart';

class PersetujuanStores = _PersetujuanStores with _$PersetujuanStores;

abstract class _PersetujuanStores with Store {

  @observable
  int currentPage = 0;

  @observable
  bool tukarShiftLoading = false;

  @observable
  bool izinCutiLoading = false;

  @observable
  ObservableList<TukarShiftItem> listTukarShift = ObservableList.of([]);

  @observable
  ObservableList<TukarShiftItem> listIzinCuti = ObservableList.of([]);

  @observable
  int tukarShiftPage = 1;

  @observable
  int tukarShiftLastPage = 1;

  @observable
  int izinCutiPage = 1;

  @observable
  int izinCutiLastPage = 1;

  @action
  changeCurrentPage(int value) => currentPage = value;

  @action
  getIzinCuti(bool isFirst) async {
    if (isFirst) {
      listIzinCuti.clear();
      izinCutiPage = 1;
      izinCutiLastPage = 1;
    }

    if (izinCutiPage <= izinCutiLastPage) {
      izinCutiLoading = true;

      Future.delayed(Duration(seconds: 1), () {
        izinCutiLoading = false;

        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listIzinCuti.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));

        izinCutiPage += 1;
        izinCutiLastPage += 1;

      });

//      try {
//        var products = await ProductService().getWishlist(wishlistPage, keyword);
//
//        if (products.data != null) {
//          wishlistPage += 1;
//          wishlistLastPage = products.last_page;
//          listWishlist.addAll(products.data);
//        }
//
//      } catch (e) {
//        // do when error
//      }

//      tukarShiftLoading = false;
    }
  }

  @action
  getTukarShift(bool isFirst) async {
    if (isFirst) {
      listTukarShift.clear();
      tukarShiftPage = 1;
      tukarShiftLastPage = 1;
    }

    if (tukarShiftPage <= tukarShiftLastPage) {
      tukarShiftLoading = true;

      Future.delayed(Duration(seconds: 1), () {
        tukarShiftLoading = false;

        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));
        listTukarShift.add(TukarShiftItem(false, 'Permintaan tukar shift dari Sandra Wijaya.', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', '14/02/2020'));

        tukarShiftPage += 1;
        tukarShiftLastPage += 1;

      });

//      try {
//        var products = await ProductService().getWishlist(wishlistPage, keyword);
//
//        if (products.data != null) {
//          wishlistPage += 1;
//          wishlistLastPage = products.last_page;
//          listWishlist.addAll(products.data);
//        }
//
//      } catch (e) {
//        // do when error
//      }

//      tukarShiftLoading = false;
    }
  }
}