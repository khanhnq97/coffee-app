import 'package:coffee_app/ui/about_location/about_location_page.dart';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  LocationPageState createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  // late GoogleMapController mapController;
  //
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // GoogleMap(
          //   onMapCreated: _onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: _center,
          //     zoom: 11.0,
          //   ),
          // ),
          Positioned(
            top: 50,
            right: 15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {},
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Hello Robert !',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Choose your Coffee Shop',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AboutLocationPage.navigateToAboutLocationPage(context);/**/
                      },
                      child: const ListTile(
                        leading: Icon(Icons.star),
                        title: Text('2 Lèman St, Whitechapel'),
                        subtitle: Text('FAVORITE'),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Shewchenka, Idaho 81118'),
                      subtitle: Text('RECENT'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Ivana Tarasa, 18'),
                      subtitle: Text('RECENT'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
