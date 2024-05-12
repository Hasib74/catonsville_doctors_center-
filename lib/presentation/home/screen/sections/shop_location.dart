import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:schedule/core/utils/app_spaces.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimension.dart';


class ShopLocation extends StatefulWidget {
  ShopLocation({Key? key}) : super(key: key);

  Set<Marker> markers = {};

  @override
  State<ShopLocation> createState() => _ShopLocationState();
}

class _ShopLocationState extends State<ShopLocation> {
  @override
  // ignore: must_call_super
  initState() {
    // ignore: avoid_print
    print("initState Called");

    final GoogleMapsFlutterPlatform mapsImplementation =
        GoogleMapsFlutterPlatform.instance;
    if (mapsImplementation is GoogleMapsFlutterAndroid) {
      mapsImplementation.useAndroidViewSurface = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.markers.add(new Marker(
        markerId: MarkerId("shop"),
        position: LatLng(39.2803185, -76.8624573),
        icon: BitmapDescriptor.defaultMarker));
    return Container(
      color: AppColors.white,
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              "Our Location",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppDimension.h1 * 1.4,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8, top: 0),
            child: Text(
              "10132 Baltimore National Pike",
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  markers: widget.markers,
                  initialCameraPosition: const CameraPosition(target: LatLng(39.291453,-76.7136594), zoom: 16),
                  // onMapCreated: (con),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: InkWell(
                    onTap: () async {
                      final availableMaps = await MapLauncher.installedMaps;
                      print(
                          availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]
                      await availableMaps.first.showMarker(
                          coords: Coords(39.291453,-76.7136594),
                          title: "230 Baltimore National Pike Baltimore MD 21229"
                      );
                    },
                    child: Icon(
                      Icons.directions,
                      size: 50,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          AppSpaces.spaces_height_15,
          AppSpaces.spaces_height_15,
        ],
      ),
    );
  }
}
