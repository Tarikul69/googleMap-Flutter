import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyMapApp());
}

 class MyMapApp extends StatelessWidget {
  const MyMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  Home(),
    );
  }
} 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController googleMapController ; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          googleMapController.animateCamera(CameraUpdate.newCameraPosition(const CameraPosition(
            zoom: 15,
            target: LatLng(23.80560326575505, 90.3745761108481),),),);
        },
        child: Icon(Icons.location_on_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled:true,
        onMapCreated: (GoogleMapController? controller){
          googleMapController = controller!;
        },

        initialCameraPosition: const CameraPosition(
          target: LatLng(23.80560326575505, 90.3745761108481),
          zoom: 16,
        ),
      ),
    );
  }
}