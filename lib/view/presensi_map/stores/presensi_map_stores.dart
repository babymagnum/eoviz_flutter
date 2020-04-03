import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Set<Marker> markers = Set();

  @observable
  Set<Circle> circles = Set();

  @observable
  LocationData currentLocation;

  @observable
  String checkpointId = '';

  @observable
  bool isInsideAnyPresence = false;

  var location = Location();
  BitmapDescriptor icon;

  Future<double> getDistance(LatLng current, LatLng destination) async {
    return await Geolocator().distanceBetween(current.latitude, current.longitude, destination.latitude, destination.longitude);
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
  positionChangeListener(Function() onUpdate) {
    location.onLocationChanged().listen((LocationData mCurrentLocation) {
      currentLocation = mCurrentLocation;
      updateMarker(currentLocation);
      onUpdate();
      // populate circle
      //checkCoordinate();
    });
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

  @action
  getCurrentLocation(Function() onSuccess) async {
    isLoading = true;

    try {
      icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(28, 35)), 'assets/images/ic_blue_marker.png');
      currentLocation = await location.getLocation();
      isLoading = false;
      updateMarker(currentLocation);
      onSuccess();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('permission denied');
      }
    }
  }

  @action
  updateMarker(LocationData location) {
    markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(location.latitude, location.longitude),
        icon: icon
      )
    );
  }
}