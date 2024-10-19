import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_gil_app/providers/google_map_provider.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});



  @override
  Widget build(BuildContext context) {
    
    return Consumer<GoogleMapProvider>(
      builder: (_, provider, __){
        provider.addMarker();
      return  GoogleMap(
        markers: Set<Marker>.of(provider.markers),
        initialCameraPosition: provider.kLake,
        onMapCreated: (GoogleMapController controller){
          provider.controller.complete(controller);
        },
        ); 
      });
    
  }
}