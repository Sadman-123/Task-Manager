import 'package:flutter/material.dart';
class  ResponsiveMaker extends StatelessWidget{
  Widget desktop;
  Widget? tablet;
  Widget mobile;
  ResponsiveMaker({required this.desktop,required this.tablet,required this.mobile});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<640){
        return mobile;
      }
      else if(constraints.maxWidth>=640 && constraints.maxWidth<1008)
        {
          return tablet??mobile;
        }
      else{
        return desktop;
      }
    },);
  }
}