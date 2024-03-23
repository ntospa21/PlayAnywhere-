import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late Stream<Position> _positionStream;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _positionStream = Geolocator.getPositionStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: StreamBuilder<Position>(
        stream: _positionStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final position = snapshot.data!;
            final latLng = LatLng(position.latitude, position.longitude);

            if (_mapController != null) {
              _mapController!.animateCamera(CameraUpdate.newLatLng(latLng));
            }

            return GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: latLng,
                zoom: 15.0,
              ),
              markers: {
                Marker(markerId: MarkerId('current_location'), position: latLng)
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
