import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget {
  final TextEditingController searchTextEditingController;
  const CommonAppBar({this.searchTextEditingController});
  @override


  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Colors.black,
      title: Padding(
        padding:const  EdgeInsets.only(top: 20,bottom: 0,left: 0,right: 0),
        child: Text('TCS Locator',style: TextStyle(color: Colors.white,fontSize: 30),),
      ),


      
      
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10,right:30 ),
          child: Image.asset("assets/images/tcs_logo.png",fit: BoxFit.contain,
          alignment: Alignment.center,),
        )
      ],
     
    );
  }
}
