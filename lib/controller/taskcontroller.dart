import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Taskcontroller extends GetxController{
  RxList arr=[].obs;
  TextEditingController ct1=TextEditingController();
  TextEditingController ct2=TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get_dat();
  }
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
  void get_dat()
  async{
    var url=Uri.parse("https://task-api-wine.vercel.app/api");
    var res=await http.get(url);
    var dat=jsonDecode(res.body);
    arr.assignAll(dat);
  }
}