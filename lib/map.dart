import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:geocoding/geocoding.dart' as GeocodingPackage;
import 'package:location/location.dart' as LocationPackage;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LocationPackage.Location location = LocationPackage.Location();
  geo.Position? currentPosition;
  String? _currentAddress;

  MapType maptype = MapType.normal;

  List<LatLng> locations = [
    LatLng(12.9796, 80.2097),
    LatLng(13.0068, 80.2579),
    LatLng(13.0024, 80.2004),
    LatLng(13.0375, 80.1536),
    LatLng(13.0339, 80.2492),
    LatLng(13.0472, 80.1747),
    LatLng(13.1067, 80.166),
    LatLng(13.0728, 80.2214),
    LatLng(13.0846, 80.2103),
    LatLng(13.1189, 80.1459),
    LatLng(13.0624, 80.209),
    LatLng(13.0357, 80.2122),
    LatLng(13.1142, 80.1097),
    LatLng(13.0988, 80.2329),
    LatLng(13.1743, 80.2503),
    LatLng(12.9962, 80.2684),
    LatLng(13.1033, 80.2694),
    LatLng(13.0629, 80.2829),
    LatLng(13.0646, 80.2444),
    LatLng(13.0681, 80.2717),
    LatLng(12.9356, 80.1411),
    LatLng(13.0924, 80.2656),
    LatLng(13.0608, 80.2257),
    LatLng(12.9402, 80.1398),
    LatLng(13.0766, 80.261),
    LatLng(13.0213, 80.2124),
    LatLng(13.2009, 80.3074),
    LatLng(13.219, 80.3186),
    LatLng(13.0082, 80.2823),
    LatLng(13.0758, 80.2868),
    LatLng(13.0926, 80.2897),
    LatLng(13.0478, 80.2601),
    LatLng(13.0801, 80.2814),
    LatLng(13.0088, 80.2206),
    LatLng(12.8412, 80.0607),
    LatLng(12.99, 80.2345),
    LatLng(12.9279, 80.2516),
    LatLng(13.1073, 80.2231),
    LatLng(13.0404, 80.1238),
    LatLng(13.0247, 80.197),
    LatLng(12.9032, 80.2309),
    LatLng(13.2214, 80.3166),
    LatLng(13.0444, 80.1093),
    LatLng(12.8116, 80.2254),
    LatLng(13.0343, 80.215),
    LatLng(12.9582, 80.1969),
    LatLng(13.081, 80.235),
    LatLng(13.0514, 80.2247),
    LatLng(13.1425, 80.2392),
    LatLng(13.1258, 80.2034),
    LatLng(13.0859, 80.1839),
    LatLng(13.1191, 80.2765),
    LatLng(12.9679, 80.2593),
    LatLng(13.012, 80.2442),
    LatLng(12.9716, 80.2098),
    LatLng(12.9309, 80.1904),
    LatLng(13.0734, 80.1939),
    LatLng(12.9694, 80.0897),
    LatLng(13.1464, 80.2328),
    LatLng(13.16, 80.2492),
    LatLng(12.9611, 80.2036),
    LatLng(12.911, 80.1478),
    LatLng(13.05, 80.1636),
    LatLng(13.2206, 80.2746),
    LatLng(13.233, 80.2569),
    LatLng(13.0097, 80.1846),
    LatLng(13.0255, 80.2603),
    LatLng(13.0483, 80.1059),
    LatLng(13.0858, 80.2745),
    LatLng(13.0935, 80.2906),
    LatLng(13.1407, 80.0787),
    LatLng(13.1371, 80.2029),
    LatLng(12.9835, 80.1984),
    LatLng(12.9186, 80.1256),
    LatLng(13.1179, 80.2325),
    LatLng(13.1276, 80.2326),
    LatLng(12.8918, 80.1933),
    LatLng(12.893, 80.0784),
    LatLng(12.9716, 80.2419),
    LatLng(12.9786, 80.1589),
    LatLng(13.0511, 80.114),
    LatLng(13.0329, 80.1533),
    LatLng(13.0587, 80.2682),
    LatLng(13.1072, 80.2575),
    LatLng(13.0881, 80.2354),
    LatLng(13.0686, 80.2203),
    LatLng(13.1597, 80.1929),
    LatLng(12.9447, 80.2034),
    LatLng(13.015, 80.2376),
    LatLng(13.0459, 80.2274),
    LatLng(13.1861, 80.181),
    LatLng(13.0587, 80.2655),
    LatLng(13.1099, 80.2897),
    LatLng(13.0208, 80.2247),
    LatLng(13.0522, 80.2015),
    LatLng(13.0307, 80.2742),
    LatLng(12.9306, 80.1527),
    LatLng(13.0796, 80.2168),
    LatLng(13.218, 80.1501),
    LatLng(12.9006, 80.2279),
    LatLng(12.9153, 80.2119),
    LatLng(13.0902, 80.2772),
    LatLng(13.0076, 80.1973),
    LatLng(13.1475, 80.1612),
    LatLng(12.9242, 80.1275),
    LatLng(13.0434, 80.2433),
    LatLng(12.9896, 80.2424),
    LatLng(13.0385, 80.2343),
    LatLng(13.08, 80.2003),
    LatLng(13.1419, 80.1158),
    LatLng(12.9849, 80.1364),
    LatLng(13.1507, 80.0349),
    LatLng(12.9865, 80.2592),
    LatLng(13.094, 80.0863),
    LatLng(13.1517, 80.2926),
    LatLng(12.9106, 80.2271),
    LatLng(12.9817, 80.1651),
    LatLng(13.0573, 80.2712),
    LatLng(13.1313, 80.2792),
    LatLng(13.0211, 80.2232),
    LatLng(12.8919, 80.0835),
    LatLng(13.0513, 80.2128),
    LatLng(13.0402, 80.1673),
    LatLng(13.059, 80.2567),
    LatLng(13.0487, 80.135),
    LatLng(12.9716, 80.2211),
    LatLng(13.0504, 80.1179),
    LatLng(13.1081, 80.2079),
    LatLng(13.0471, 80.1764),
    LatLng(13.1181, 80.2513),
    LatLng(13.1128, 80.2715),
    LatLng(13.0416, 80.2259),
    LatLng(19.1286, 72.8492),
    LatLng(19.1121, 72.8663),
    LatLng(19.13, 72.8293),
    LatLng(19.127, 72.8216),
    LatLng(19.1409, 72.8295),
    LatLng(19.1155, 72.8821),
    LatLng(19.1025, 72.8682),
    LatLng(19.1291, 72.8169),
    LatLng(19.1354, 72.8142),
    LatLng(19.2807, 72.8615),
    LatLng(19.3074, 72.8511),
    LatLng(26.8734, 80.9143),
    LatLng(19.0556, 72.8153),
    LatLng(19.0607, 72.8541),
    LatLng(19.0635, 72.8263),
    LatLng(19.2193, 72.8261),
    LatLng(19.2303, 72.78),
    LatLng(19.2502, 72.8592),
    LatLng(19.1556, 72.8706),
    LatLng(19.1692, 72.8347),
    LatLng(19.1347, 72.8484),
    LatLng(19.107, 72.8279),
    LatLng(19.2174, 72.8269),
    LatLng(19.2066, 72.8362),
    LatLng(12.974, 77.6069),
    LatLng(12.9719, 77.6094),
    LatLng(12.9507, 77.5848),
    LatLng(12.9763, 77.5929),
    LatLng(12.9985, 77.5929),
    LatLng(12.8, 77.577),
    LatLng(13.0092, 77.5511),
    LatLng(12.9716, 77.5956),
    LatLng(12.9793, 77.5919),
    LatLng(12.8342, 77.401),
    LatLng(13.3665, 77.6837),
    LatLng(12.7757, 77.411),
    LatLng(13.0054, 77.5692),
    LatLng(12.9738, 77.6406),
    LatLng(12.9352, 77.6245),
    LatLng(12.9299, 77.5823),
    LatLng(12.9767, 77.752),
    LatLng(12.8456, 77.6604),
    LatLng(12.9569, 77.7011),
    LatLng(13.1, 77.5967),
    LatLng(12.9716, 77.5956),
    LatLng(12.9765, 77.5929),
    LatLng(12.9926, 77.5704),
    LatLng(12.9696, 77.5963),
    LatLng(12.9754, 77.5905),
    LatLng(12.9845, 77.5894),
    LatLng(12.9425, 77.5704),
    LatLng(13.0017, 77.5735),
    LatLng(12.9723, 77.595),
    LatLng(12.9822, 77.6081),
    LatLng(12.9863, 77.6955),
    LatLng(13.0116, 77.5556),
    LatLng(12.935, 77.5578),
    LatLng(12.9785, 77.5998),
    LatLng(12.9507, 77.5848),
    LatLng(12.9727, 77.6108),
    LatLng(12.9779, 77.6267),
    LatLng(12.8006, 77.577),
    LatLng(12.9761, 77.6052),
    LatLng(13.0587, 77.519),
    LatLng(12.9512, 77.5873),
    LatLng(12.9918, 77.5713),
    LatLng(13.005, 77.5779),
    LatLng(12.9908, 77.5847),
    LatLng(12.9151, 77.6449),
    LatLng(12.9175, 77.4975),
    LatLng(12.9427, 77.585),
    LatLng(12.9896, 77.57),
    LatLng(12.9757, 77.5964),
    LatLng(12.9067, 77.5059),
    LatLng(12.9278, 77.5469),
    LatLng(12.9353, 77.5357),
    LatLng(12.9187, 77.5572),
    LatLng(12.9066, 77.5528),
    LatLng(12.927, 77.5575),
    LatLng(12.8, 77.577),
    LatLng(12.9287, 77.5828),
    LatLng(12.9072, 77.5789),
    LatLng(12.9507, 77.5848),
    LatLng(12.9416, 77.5741),
    LatLng(12.9425, 77.5704),
    LatLng(12.943, 77.5669),
    LatLng(12.9386, 77.5686),
    LatLng(12.9339, 77.5695),
    LatLng(12.9395, 77.5276),
    LatLng(12.9079, 77.4838),
    LatLng(12.8924, 77.4779),
    LatLng(12.9224, 77.5439),
    LatLng(12.9256, 77.5195),

    // Example location 3
  ];

  static const _intialCameraPosition = CameraPosition(
    target: LatLng(12.907480446916093, 77.56616413602141), //ssn lat long
    // LatLng(12.9602, 80.0574),(sairam lat,lon)
    zoom: double.infinity,
  );

  Set<Marker> markers = {};
  List<LatLng> pathPoints = [];
  TextEditingController searchController = TextEditingController();
  LatLng? searchedLocation;
  LatLng? searchLocation;
  LatLng? destinationLocation;
  @override
  void initState() {
    super.initState();

    _getCurrentPosition();
    _setMarkers();
    markers.add(
      Marker(
        markerId: MarkerId("currentLocation"),
        position: LatLng(12.907684522706822, 77.56606606680413),
        infoWindow: InfoWindow(title: "Current Location"),
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.AlreadySubscribedException) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == geo.LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high)
        .then((geo.Position position) {
      setState(() => currentPosition = position);
      _getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
    print(
      currentPosition!.latitude,
    );
  }

  Future<void> _getAddressFromLatLng(geo.Position position) async {
    await GeocodingPackage.placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<GeocodingPackage.Placemark> placemarks) {
      GeocodingPackage.Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _setMarkers() async {
    setState(() {
      markers = locations.map((location) {
        return Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Danger Location"),
        );
      }).toSet();
    });
  }

  void _updateLocation(geo.Position position) {
    setState(() {
      currentPosition = position;
      markers
          .removeWhere((marker) => marker.markerId.value == "currentLocation");
      markers.add(
        Marker(
          markerId: MarkerId("currentLocation"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: InfoWindow(title: "Current Location"),
        ),
      );
      // mapController.animateCamera(
      //   CameraUpdate.newLatLng(
      //     LatLng(position.latitude, position.longitude),
      //   ),
      // );
    });
  }

  void _searchLocation(String searchQuery) async {
    List<GeocodingPackage.Location> locations =
        await GeocodingPackage.locationFromAddress(searchQuery);
    if (locations.isNotEmpty) {
      setState(() {
        searchedLocation = LatLng(
          locations.first.latitude,
          locations.first.longitude,
        );
        // mapController.animateCamera(CameraUpdate.newLatLng(searchedLocation!));
        markers.add(
          Marker(
            markerId: MarkerId("searchedLocation"),
            position: searchedLocation!,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(title: "Searched Location"),
          ),
        );
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Location Not Found"),
            content: Text("No results found for the given search query."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TextFormField(
          //   controller: searchController,
          //   decoration: InputDecoration(
          //     hintText: 'Search location',
          //     suffixIcon: IconButton(
          //       icon: Icon(Icons.search),
          //       onPressed: () {
          //         _searchLocation(searchController.text);
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
            child: GoogleMap(
              mapType: maptype,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                if (currentPosition != null) {
                  _updateLocation(currentPosition!);
                }
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(12.907480446916093, 77.56616413602141),
                // currentPosition != null
                //     ? LatLng(
                //         currentPosition!.latitude, currentPosition!.longitude)
                //     : LatLng(0, 0),
                zoom: 8,
              ),
              markers: markers,
              polylines: {
                Polyline(
                  polylineId: PolylineId('path'),
                  points: pathPoints,
                  color: Colors.blue,
                  width: 3,
                ),
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => mapController.animateCamera(
            CameraUpdate.newCameraPosition(_intialCameraPosition)),
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }
}
