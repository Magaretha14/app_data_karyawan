import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key, required this.onLocationSelected});
  final Function(String) onLocationSelected;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;
  LatLng? lastMapPosition;
  final searchController = TextEditingController();

  // Request location permissions
  // Fetch the current location
  Future getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });

    // Get the current position
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lastMapPosition = LatLng(position.latitude, position.longitude);
    });
    mapController.animateCamera(CameraUpdate.newLatLng(lastMapPosition!));
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (lastMapPosition != null) {
      setState(() {
        mapController.animateCamera(CameraUpdate.newLatLng(lastMapPosition!));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: true,
        // on below line setting compass enabled.
        compassEnabled: true,
        onMapCreated: onMapCreated,
        //mapType: MapType.normal,),
        initialCameraPosition: CameraPosition(
          target: lastMapPosition ?? const LatLng(0.0, 0.0),
          zoom: 15.0,
        ),
        markers: {
          if (lastMapPosition != null)
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: lastMapPosition!,
            )
        },
        onTap: (position) {
          setState(() {
            lastMapPosition = position;
          });
        },
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {
              if (lastMapPosition != null) {
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  lastMapPosition!.latitude,
                  lastMapPosition!.longitude,
                );

                if (placemarks.isNotEmpty) {
                  Placemark place = placemarks[0];
                  String fullAddress =
                      "${place.name},${place.street},${place.subLocality},${place.locality},${place.postalCode},${place.country}";
                  widget.onLocationSelected(fullAddress);
                  print(
                      "${place.name},${place.street},${place.subLocality},${place.locality},${place.postalCode},${place.country}");
                } else {
                  widget.onLocationSelected("No address found");
                }

                Navigator.pop(context);
              }
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
