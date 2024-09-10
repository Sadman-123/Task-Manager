import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/custom_widgets/Adaption_helper.dart';
import 'package:untitled3/screen/desktopview.dart';
import 'package:untitled3/screen/mobileview.dart';
void main()
{
  runApp(
   Main()
  );
}
class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Adaption_helper(
        desktop: Desktopview(),
        mobile: Mobileview(),
      ),
    );
  }
}