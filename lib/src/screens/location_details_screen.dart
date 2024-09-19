import 'package:app_template/src/models/get_tcs_location_model.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/common_app_bar.dart';
import 'package:app_template/src/widgets/location_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class LocationDetailsScrren extends StatefulWidget {
  Location location;
  LocationDetailsScrren({Key key, this.location}) : super(key: key);

  @override
  State<LocationDetailsScrren> createState() => _LocationDetailsScrrenState();
}

class _LocationDetailsScrrenState extends State<LocationDetailsScrren> {
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight(context, dividedBy: 10)),
        child: CommonAppBar(
          isLeadingIcon: true,
          searchTextEditingController: textEditingController,
          
        ),
      ),
      body: Column(
        children: [
          locationDetaislTile(
            heading: "TCS center Name",
            title: widget.location.location,
            icon: Icons.local_post_office,
            onPressed: () {},
          ),
          locationDetaislTile(
            heading: "Location",
            title: widget.location.area,
            icon: Icons.landscape,
            onPressed: () async{

              MapsLauncher.launchCoordinates(widget.location.geometry.lat, widget.location.geometry.lng);

              

            },
          ),
          locationDetaislTile(
            heading: "Email",
            title: widget.location.email,
            icon: Icons.email,
            onPressed: () {},
          ),
          locationDetaislTile(
            heading: "Phone No",
            title: widget.location.phone,
            icon: Icons.phone,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
