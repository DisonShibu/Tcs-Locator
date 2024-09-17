import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

enum SearchPlaces { NorthAmerica, India, London, Germany, clear }

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
    return Column(
      children: [
        RadioListTile<SearchPlaces>(
          title: const Text('North America'),
          value: SearchPlaces.NorthAmerica,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            _character = value;
            setState(() {});
            widget.onValueChanged(_character);
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
          title: const Text('London'),
          value: SearchPlaces.London,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged(_character.name);
          },
        ),
        RadioListTile<SearchPlaces>(
          title: const Text('Germany'),
          value: SearchPlaces.Germany,
          groupValue: _character,
          onChanged: (SearchPlaces value) {
            setState(() {
              _character = value;
            });
            widget.onValueChanged(_character.name);
          },
        ),
        ElevatedButton(
          onPressed: () {
            _character = SearchPlaces.clear;
            widget.onValueChanged(_character.name);
            pop(widget.sheetContext);
          },
          child: Text('Clear'),
        )
      ],
    );
  }
}
