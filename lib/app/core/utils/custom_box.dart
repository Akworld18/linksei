import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBox{

  showShortLinkBox({required double width,required Widget child}){
    return Container(
      height: 45,
      width:width,
      decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4)),
          border: Border(right: BorderSide(color: Colors.grey.withOpacity(0.5)))
        // border: Border.all(color: Colors.black.withOpacity(0.3))
      ),
      child: child,
    );
  }
}