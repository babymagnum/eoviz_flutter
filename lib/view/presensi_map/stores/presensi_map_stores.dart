import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';

part 'presensi_map_stores.g.dart';

class PresensiMapStores = _PresensiMapStores with _$PresensiMapStores;

abstract class _PresensiMapStores with Store {

  @observable
  bool isLoading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  ObservableSet<Marker> markers = ObservableSet.of([]);

  @observable
  ObservableSet<Circle> circles = ObservableSet.of([]);

  @observable
  LocationData currentLocation;

  @observable
  String checkpointId = '';

  @observable
  bool isInsideAnyPresence = false;

  BitmapDescriptor icon;

  @action
  changeCurrentLocation(LocationData value) => currentLocation = value;

  Future<double> getDistance(LatLng current, LatLng destination) async {
    return await Geolocator().distanceBetween(current.latitude, current.longitude, destination.latitude, destination.longitude);
  }

  animateCamera(Completer<GoogleMapController> completer) async {
    GoogleMapController mapController = await completer.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude), zoom: double.parse('17'))));
  }

  @action
  checkCoordinate() {
    circles.clear();
//    presence.data_checkpoint.forEach((checkpoint) {
//      getDistance(LatLng(currentLocation.latitude, currentLocation.longitude), LatLng(double.parse(checkpoint.checkpoint_latitude), double.parse(checkpoint.checkpoint_longitude))).then((userDistance) {
//        if (userDistance < 50) {
//          checkpointId = checkpoint.checkpoint_id;
//          isInsideAnyPresence = true;
//          drawSingleCircle(checkpoint.checkpoint_id, 0xFF005da0, 0xFF005da0, LatLng(double.parse(checkpoint.checkpoint_latitude), double.parse(checkpoint.checkpoint_longitude)));
//        } else {
//          isInsideAnyPresence = false;
//          drawSingleCircle(checkpoint.checkpoint_id, 0xFFb11309, 0xFFb11309, LatLng(double.parse(checkpoint.checkpoint_latitude), double.parse(checkpoint.checkpoint_longitude)));
//        }
//      });
//    });
  }

  @action
  drawSingleCircle(String id, int solidColor, int strokeColor, LatLng latLng) {
    circles.add(
      Circle(
        circleId: CircleId(id),
        fillColor: Color(solidColor).withOpacity(0.6),
        strokeColor: Color(strokeColor).withOpacity(0.6),
        strokeWidth: 3,
        radius: 50,
        center: latLng
      )
    );
  }

  updateCameraAndMarker(Completer<GoogleMapController> completer) {
    updateMarker();
    animateCamera(completer);
  }

  @action
  updateMarker() async {
    //if (icon == null) icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(28, 35)), 'assets/images/ic_blue_marker.png');
    if (icon == null) icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(15, 15)), 'assets/images/ic_blue_marker.png');
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        icon: icon
      )
    );
  }
}