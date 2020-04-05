// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tukar_shift_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TukarShiftStores on _TukarShiftStores, Store {
  final _$isLoadingAtom = Atom(name: '_TukarShiftStores.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$isSameDateAtom = Atom(name: '_TukarShiftStores.isSameDate');

  @override
  bool get isSameDate {
    _$isSameDateAtom.context.enforceReadPolicy(_$isSameDateAtom);
    _$isSameDateAtom.reportObserved();
    return super.isSameDate;
  }

  @override
  set isSameDate(bool value) {
    _$isSameDateAtom.context.conditionallyRunInAction(() {
      super.isSameDate = value;
      _$isSameDateAtom.reportChanged();
    }, _$isSameDateAtom, name: '${_$isSameDateAtom.name}_set');
  }

  final _$tanggalShiftAwalAtom =
      Atom(name: '_TukarShiftStores.tanggalShiftAwal');

  @override
  String get tanggalShiftAwal {
    _$tanggalShiftAwalAtom.context.enforceReadPolicy(_$tanggalShiftAwalAtom);
    _$tanggalShiftAwalAtom.reportObserved();
    return super.tanggalShiftAwal;
  }

  @override
  set tanggalShiftAwal(String value) {
    _$tanggalShiftAwalAtom.context.conditionallyRunInAction(() {
      super.tanggalShiftAwal = value;
      _$tanggalShiftAwalAtom.reportChanged();
    }, _$tanggalShiftAwalAtom, name: '${_$tanggalShiftAwalAtom.name}_set');
  }

  final _$tanggalTukarShiftAtom =
      Atom(name: '_TukarShiftStores.tanggalTukarShift');

  @override
  String get tanggalTukarShift {
    _$tanggalTukarShiftAtom.context.enforceReadPolicy(_$tanggalTukarShiftAtom);
    _$tanggalTukarShiftAtom.reportObserved();
    return super.tanggalTukarShift;
  }

  @override
  set tanggalTukarShift(String value) {
    _$tanggalTukarShiftAtom.context.conditionallyRunInAction(() {
      super.tanggalTukarShift = value;
      _$tanggalTukarShiftAtom.reportChanged();
    }, _$tanggalTukarShiftAtom, name: '${_$tanggalTukarShiftAtom.name}_set');
  }

  final _$alasanAtom = Atom(name: '_TukarShiftStores.alasan');

  @override
  String get alasan {
    _$alasanAtom.context.enforceReadPolicy(_$alasanAtom);
    _$alasanAtom.reportObserved();
    return super.alasan;
  }

  @override
  set alasan(String value) {
    _$alasanAtom.context.conditionallyRunInAction(() {
      super.alasan = value;
      _$alasanAtom.reportChanged();
    }, _$alasanAtom, name: '${_$alasanAtom.name}_set');
  }

  final _$listShiftAtom = Atom(name: '_TukarShiftStores.listShift');

  @override
  ObservableList<ShiftItem> get listShift {
    _$listShiftAtom.context.enforceReadPolicy(_$listShiftAtom);
    _$listShiftAtom.reportObserved();
    return super.listShift;
  }

  @override
  set listShift(ObservableList<ShiftItem> value) {
    _$listShiftAtom.context.conditionallyRunInAction(() {
      super.listShift = value;
      _$listShiftAtom.reportChanged();
    }, _$listShiftAtom, name: '${_$listShiftAtom.name}_set');
  }

  final _$dateTimeShiftAwalAtom =
      Atom(name: '_TukarShiftStores.dateTimeShiftAwal');

  @override
  DateTime get dateTimeShiftAwal {
    _$dateTimeShiftAwalAtom.context.enforceReadPolicy(_$dateTimeShiftAwalAtom);
    _$dateTimeShiftAwalAtom.reportObserved();
    return super.dateTimeShiftAwal;
  }

  @override
  set dateTimeShiftAwal(DateTime value) {
    _$dateTimeShiftAwalAtom.context.conditionallyRunInAction(() {
      super.dateTimeShiftAwal = value;
      _$dateTimeShiftAwalAtom.reportChanged();
    }, _$dateTimeShiftAwalAtom, name: '${_$dateTimeShiftAwalAtom.name}_set');
  }

  final _$dateTimeTukarShiftAtom =
      Atom(name: '_TukarShiftStores.dateTimeTukarShift');

  @override
  DateTime get dateTimeTukarShift {
    _$dateTimeTukarShiftAtom.context
        .enforceReadPolicy(_$dateTimeTukarShiftAtom);
    _$dateTimeTukarShiftAtom.reportObserved();
    return super.dateTimeTukarShift;
  }

  @override
  set dateTimeTukarShift(DateTime value) {
    _$dateTimeTukarShiftAtom.context.conditionallyRunInAction(() {
      super.dateTimeTukarShift = value;
      _$dateTimeTukarShiftAtom.reportChanged();
    }, _$dateTimeTukarShiftAtom, name: '${_$dateTimeTukarShiftAtom.name}_set');
  }

  final _$_TukarShiftStoresActionController =
      ActionController(name: '_TukarShiftStores');

  @override
  dynamic changeDateTime(DateTime value, bool isPickTanggalShiftAwal) {
    final _$actionInfo = _$_TukarShiftStoresActionController.startAction();
    try {
      return super.changeDateTime(value, isPickTanggalShiftAwal);
    } finally {
      _$_TukarShiftStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIsSameDate(bool value) {
    final _$actionInfo = _$_TukarShiftStoresActionController.startAction();
    try {
      return super.changeIsSameDate(value);
    } finally {
      _$_TukarShiftStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAlasan(String value) {
    final _$actionInfo = _$_TukarShiftStoresActionController.startAction();
    try {
      return super.changeAlasan(value);
    } finally {
      _$_TukarShiftStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getListShift() {
    final _$actionInfo = _$_TukarShiftStoresActionController.startAction();
    try {
      return super.getListShift();
    } finally {
      _$_TukarShiftStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeListShiftSelected(int index) {
    final _$actionInfo = _$_TukarShiftStoresActionController.startAction();
    try {
      return super.changeListShiftSelected(index);
    } finally {
      _$_TukarShiftStoresActionController.endAction(_$actionInfo);
    }
  }
}
