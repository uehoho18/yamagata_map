import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  @override
  void initState() {
    //位置情報が許可されていない時に許可をリクエストする
    Future(() async {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    });
    super.initState();
  }

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(35.681236, 139.767125), // 東京駅
    zoom: 16.0,
  );

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 現在地を取得
          final Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          // 現在地を中心にカメラを移動
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 16.0,
              ),
            ),
          );
        },
        tooltip: 'current position',
        child: const Icon(Icons.add),
      ),
    );
  }
}
