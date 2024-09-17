import 'package:flutter/material.dart';
import 'package:place_picker_migrated/entities/entities.dart';
import 'package:place_picker_migrated/entities/location_result.dart';
import 'package:place_picker_migrated/place_picker.dart';
import 'package:place_picker_migrated/widgets/place_picker.dart';
import 'package:place_picker_migrated/widgets/widgets.dart';

class PickerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PickerDemoState();
}

class PickerDemoState extends State<PickerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picker Example')),
      body: Center(
        child: FlatButton(
          child: Text("Pick Delivery location"),
          onPressed: () {
            showPlacePicker();
          },
        ),
      ),
    );
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PlacePicker("YOUR API KEY")));

    // Handle the result in your way
    print(result);
  }
}
