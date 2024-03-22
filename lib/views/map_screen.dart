import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _markerPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: GoogleMap(
        onTap: _handleTap,
        markers: _markerPosition == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId("1"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _markerPosition!,
                  onTap: () {
                    print("Marker tapped at: $_markerPosition");
                  },
                ),
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.4223, -122.084),
          zoom: 15,
        ),
      ),
    );
  }

  void _handleTap(LatLng tappedPoint) {
    setState(() {
      _markerPosition = tappedPoint;
      print("Tapped at: $tappedPoint");
    });
  }
}
