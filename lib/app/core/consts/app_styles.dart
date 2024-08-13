
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//boxShadow
class CustomBoxShadows{

  List<BoxShadow>? boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 4,
      offset: Offset(
          0, 4), // changes position of shadow
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 0,
      blurRadius: 8,
      offset: Offset(
          -4, -4), // changes position of shadow
    ),
  ];
}


//textStyle
class CustomTextStyles{
  whiteBoldText(double fontSize){
    return GoogleFonts.openSans(
        color: Colors.white, fontSize:fontSize, fontWeight: FontWeight.bold);
  }
   black700Text(double fontSize){
    return GoogleFonts.openSans(color: Colors.black,
      fontSize: fontSize,fontWeight: FontWeight.w700,);
  }

  blackOpacity600Text(double fontSize){
    return GoogleFonts.openSans(color: Colors.black.withOpacity(0.4),
      fontSize: fontSize,fontWeight: FontWeight.w600,);
  }

  blackOpacityText(double fontSize){
    return GoogleFonts.openSans(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.6));
  }


}

//divide

class CustomDivider{

  showDivider(double width){
    return Container(
      height: 2,
      width: width,
      color: Colors.grey.withOpacity(0.2),
    );
  }
}


class CustomBoxDecoration{
  showBlackOpacityDecoration({required Color color}){
    return BoxDecoration(
        boxShadow: CustomBoxShadows().boxShadow,
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color)
      // border: Border.all(color: Colors.black.withOpacity(0.3))
    );
  }
}