import 'package:crave_it/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  _LocationAccessScreenState createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  String locationMessage = "Location not accessed yet";
  LatLng? _currentLocation;
  GoogleMapController? _mapController;

  // Method to check location permission and request if necessary
  Future<void> _checkLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    // Request permission if it's denied or permanently denied
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    // If permission is granted, proceed to get the location
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      await _getCurrentLocation(); // Fetch the current location
      // Navigate to AuthScreen after successfully fetching location
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      );
    } else {
      setState(() {
        locationMessage = "Location access denied. Enable permissions in settings.";
      });
    }
  }

  // Method to get the user's current location
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        locationMessage = "Location: Lat: ${position.latitude}, Long: ${position.longitude}";
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
      // Move camera to current location
      _mapController?.animateCamera(CameraUpdate.newLatLng(_currentLocation!));
    } catch (e) {
      setState(() {
        locationMessage = "Failed to get location: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _currentLocation == null
                        ? Center(child: CircularProgressIndicator())
                        : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentLocation!,
                        zoom: 15,
                      ),
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Column(
                        children: [
                          _buildFeatureRow(Icons.delivery_dining_outlined,
                              "Finding the best restaurants and shops nearby"),
                          const SizedBox(height: 16),
                          _buildFeatureRow(
                              Icons.store_outlined, "Faster and more accurate delivery"),
                          const SizedBox(height: 16),
                          // Show the current location status
                          Text(
                            locationMessage,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // "Continue" button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await _checkLocationPermission(); // Check and request location permission
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xDD7A343D),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the feature rows with icons
  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFC2DCE3).withOpacity(0.15),
          ),
          child: Icon(
            icon,
            color: const Color(0xDD7A343D),
            size: 30,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
