import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CommonSearchbar extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  final ValueChanged onChanged;
  final Function onIconPressed;
  const CommonSearchbar(
      {Key key, this.searchTextEditingController, this.onChanged,this.onIconPressed})
      : super(key: key);

  @override
  State<CommonSearchbar> createState() => _CommonSearchbarState();
}

class _CommonSearchbarState extends State<CommonSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth(context, dividedBy: 1.4),
            child: TextFormField(
              onChanged: (value) {
                widget.onChanged(value);
              },
              controller: widget.searchTextEditingController,
              decoration: InputDecoration(
                label: const Text('Search here'),
                hintText: 'Search here',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onIconPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.sort,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
