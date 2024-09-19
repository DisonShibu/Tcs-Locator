import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

enum SearchPlaces {NorthAmerica,India,Europe,LatinAmerica,clear,UKIreland,Asiapacific,AustraliaNewzland}

class BottomSheetWidget extends StatefulWidget {
  final ValueChanged onValueChanged;
  BuildContext sheetContext;
  BottomSheetWidget({Key key, this.onValueChanged, this.sheetContext})
      : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  SearchPlaces _character = SearchPlaces.NorthAmerica;
  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: [
        RadioListTile<SearchPlaces>(
          title: const Text('North America'),
          value: SearchPlaces.NorthAmerica,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            _character = value;
            setState(() {});
            widget.onValueChanged("North America");
          },
        ),
        RadioListTile<SearchPlaces>(
          title: const Text('India'),
          value: SearchPlaces.India,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged(_character.name);
          },
        ),
        RadioListTile<SearchPlaces>(
          title: const Text('Europe'),
          value: SearchPlaces.Europe,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged("Europe");
          },
        ),
        RadioListTile<SearchPlaces>(
          title: const Text('Latin America'),
          value: SearchPlaces.LatinAmerica,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged("Latin America");
          },
        ),
        RadioListTile<SearchPlaces>(
          title: const Text('UK & Ireland'),
          value: SearchPlaces.UKIreland,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged("Latin America");
          },
        ),

         RadioListTile<SearchPlaces>(
          title: const Text('Asia Pacific'),
          value: SearchPlaces.Asiapacific,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged("Asia Pacific");
          },
        ),
         RadioListTile<SearchPlaces>(
          title: const Text('Australia & Newzland'),
          value: SearchPlaces.AustraliaNewzland,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged("Australia & Newzland");
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,

          ),
          onPressed: () {
            _character = SearchPlaces.clear;
            widget.onValueChanged(_character.name);
            pop(widget.sheetContext);
          },
          child: Text('Clear',style: TextStyle(color: Colors.black),),
        )
      ],
    );
  }
}
