import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linksei/app/core/consts/app_styles.dart';
import 'package:linksei/app/core/utils/custom_buttons.dart';

class CreateWorkspace extends StatefulWidget {
  final Size pageSize;
  const CreateWorkspace({super.key, required this.pageSize});

  @override
  State<CreateWorkspace> createState() => _CreateWorkspaceState();
}

class _CreateWorkspaceState extends State<CreateWorkspace> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  TextEditingController name = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    controller?.addListener(() {
      setState(() {});
    });

    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Container(
            height: widget.pageSize.height * 43/100,
            width:widget.pageSize.width * 85/100,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(height: 100,width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
                ),),
                SizedBox(height: 10),
                Text("Create a new workspace",style: CustomTextStyles().black700Text(22),),
                SizedBox(height: 5),
                Text("What is a workspace?",style: GoogleFonts.openSans(
                  decoration: TextDecoration.underline,
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14,fontWeight: FontWeight.w600,),),
                SizedBox(height: 25),
                Expanded(
                  child:Container(
                    width:widget.pageSize.width * 85/100,
                    color: Colors.blueAccent.withOpacity(0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Workspace Name",style: CustomTextStyles().black700Text(18),),
                              SizedBox(height: 10),
                              Container(
                                height: 45,
                                width:widget.pageSize.width * 75/100 ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                                  color: Colors.white
                                ),
                              ),
                              SizedBox(height: 25),
                            ],
                          ),
                        ),
                        SizedBox(
                          width:widget.pageSize.width * 75/100 ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButtons().createWorkspaceButton(text:"Cancel" ,
                                  height: 50, width: widget.pageSize.width * 35/100, onTap: (){
                                controller?.reverse().then((data){
                                  Navigator.pop(context);
                                });
                                  }),
                              CustomButtons().createWorkspaceButton(text: "Create",
                                  height: 50, width: widget.pageSize.width * 35/100, onTap: (){}),

                            ],
                          ),
                        )
                      ],

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
