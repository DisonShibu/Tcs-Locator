import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget {
  final bool isLeadingIcon;
  final TextEditingController searchTextEditingController;
  const CommonAppBar({this.searchTextEditingController, this.isLeadingIcon});
  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isLeadingIcon == true
          ? InkWell(
             onTap : () {
                print("object");
                pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Icon(

              
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            )
          : Container(),
      leadingWidth: 0.0,
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Text(
          'TCS Locator',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      centerTitle: widget.isLeadingIcon != null ? true : false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 30),
          child: Image.asset(
            "assets/images/tcs_logo.png",
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        )
      ],
    );
  }
}
