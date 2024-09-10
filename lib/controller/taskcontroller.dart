import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class Taskcontroller extends GetxController{
  RxList arr=[].obs;
  TextEditingController ct1=TextEditingController();
  TextEditingController ct2=TextEditingController();
  void add_to_task()
  {
    arr.add(
      {
        "title":ct1.text,
        "task":ct2.text
      }
    );
    ct1.clear();
    ct2.clear();
  }
  void delete_task(int index)
  {
    arr.removeAt(index);
  }
}