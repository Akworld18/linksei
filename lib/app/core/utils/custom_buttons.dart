import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linksei/app/core/consts/app_styles.dart';

class CustomButtons {
  createWorkspaceButton(
      {required double height,
      required,
      required double width,
      required GestureTapCallback? onTap,
      required String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: text.contains("Cancel") ? Colors.white : Colors.black,
            boxShadow:  [
              BoxShadow(
                color: text.contains("Cancel") ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
              BoxShadow(
                color: text.contains("Cancel") ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(-4, -4), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  color: text.contains("Cancel") ? Colors.black : Colors.white,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }


  proButton(){
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.blueAccent.withOpacity(0.2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(FontAwesomeIcons.crown,color: Colors.black.withOpacity(0.4),size: 14,),
          SizedBox(width: 4),
          Text("PRO",style: CustomTextStyles().blackOpacity600Text(14),)
        ],
      ),
    );
  }

  customSwitch({required ValueChanged<bool>? onChanged,required bool value}){
    return CupertinoSwitch(
      // overrides the default green color of the track
      activeColor: Colors.blue,
      // color of the round icon, which moves from right to left
      thumbColor: Colors.white,
      // when the switch is off
      trackColor: Colors.black12,
      // boolean variable value
      value: value,
      // changes the state of the switch
      onChanged: onChanged
    );
  }
}
