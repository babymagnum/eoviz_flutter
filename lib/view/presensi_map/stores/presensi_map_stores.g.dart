// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presensi_map_stores.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PresensiMapStores on _PresensiMapStores, Store {
  final _$isLoadingAtom = Atom(name: '_PresensiMapStores.isLoading');

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

  final _$emailAtom = Atom(name: '_PresensiMapStores.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_PresensiMapStores.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$markersAtom = Atom(name: '_PresensiMapStores.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.context.enforceReadPolicy(_$markersAtom);
    _$markersAtom.reportObserved();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.context.conditionallyRunInAction(() {
      super.markers = value;
      _$markersAtom.reportChanged();
    }, _$markersAtom, name: '${_$markersAtom.name}_set');
  }

  final _$circlesAtom = Atom(name: '_PresensiMapStores.circles');

  @override
  Set<Circle> get circles {
    _$circlesAtom.context.enforceReadPolicy(_$circlesAtom);
    _$circlesAtom.reportObserved();
    return super.circles;
  }

  @override
  set circles(Set<Circle> value) {
    _$circlesAtom.context.conditionallyRunInAction(() {
      super.circles = value;
      _$circlesAtom.reportChanged();
    }, _$circlesAtom, name: '${_$circlesAtom.name}_set');
  }

  final _$currentLocationAtom =
      Atom(name: '_PresensiMapStores.currentLocation');

  @override
  LocationData get currentLocation {
    _$currentLocationAtom.context.enforceReadPolicy(_$currentLocationAtom);
    _$currentLocationAtom.reportObserved();
    return super.currentLocation;
  }

  @override
  set currentLocation(LocationData value) {
    _$currentLocationAtom.context.conditionallyRunInAction(() {
      super.currentLocation = value;
      _$currentLocationAtom.reportChanged();
    }, _$currentLocationAtom, name: '${_$currentLocationAtom.name}_set');
  }

  final _$checkpointIdAtom = Atom(name: '_PresensiMapStores.checkpointId');

  @override
  String get checkpointId {
    _$checkpointIdAtom.context.enforceReadPolicy(_$checkpointIdAtom);
    _$checkpointIdAtom.reportObserved();
    return super.checkpointId;
  }

  @override
  set checkpointId(String value) {
    _$checkpointIdAtom.context.conditionallyRunInAction(() {
      super.checkpointId = value;
      _$checkpointIdAtom.reportChanged();
    }, _$checkpointIdAtom, name: '${_$checkpointIdAtom.name}_set');
  }

  final _$isInsideAnyPresenceAtom =
      Atom(name: '_PresensiMapStores.isInsideAnyPresence');

  @override
  bool get isInsideAnyPresence {
    _$isInsideAnyPresenceAtom.context
        .enforceReadPolicy(_$isInsideAnyPresenceAtom);
    _$isInsideAnyPresenceAtom.reportObserved();
    return super.isInsideAnyPresence;
  }

  @override
  set isInsideAnyPresence(bool value) {
    _$isInsideAnyPresenceAtom.context.conditionallyRunInAction(() {
      super.isInsideAnyPresence = value;
      _$isInsideAnyPresenceAtom.reportChanged();
    }, _$isInsideAnyPresenceAtom,
        name: '${_$isInsideAnyPresenceAtom.name}_set');
  }

  final _$getCurrentLocationAsyncAction = AsyncAction('getCurrentLocation');

  @override
  Future getCurrentLocation(Function() onSuccess) {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation(onSuccess));
  }

  final _$_PresensiMapStoresActionController =
      ActionController(name: '_PresensiMapStores');

  @override
  dynamic checkCoordinate() {
    final _$actionInfo = _$_PresensiMapStoresActionController.startAction();
    try {
      return super.checkCoordinate();
    } finally {
      _$_PresensiMapStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic positionChangeListener(Function() onUpdate) {
    final _$actionInfo = _$_PresensiMapStoresActionController.startAction();
    try {
      return super.positionChangeListener(onUpdate);
    } finally {
      _$_PresensiMapStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic drawSingleCircle(
      String id, int solidColor, int strokeColor, LatLng latLng) {
    final _$actionInfo = _$_PresensiMapStoresActionController.startAction();
    try {
      return super.drawSingleCircle(id, solidColor, strokeColor, latLng);
    } finally {
      _$_PresensiMapStoresActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateMarker(LocationData location) {
    final _$actionInfo = _$_PresensiMapStoresActionController.startAction();
    try {
      return super.updateMarker(location);
    } finally {
      _$_PresensiMapStoresActionController.endAction(_$actionInfo);
    }
  }
}
