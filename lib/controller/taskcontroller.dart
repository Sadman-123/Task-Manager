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
  void get_dat()
  async{
    var url=Uri.parse("https://task-api-wine.vercel.app/api");
    var res=await http.get(url);
    var dat=jsonDecode(res.body);
    arr.assignAll(dat);
  }
  void add_dat() async
  {
    var mydatas={
      "title":ct1.text,
      "task":ct2.text
    };
    var url=Uri.parse("https://task-api-wine.vercel.app/insert");
    var res=await http.post(url,headers:<String, String>{'Content-Type': 'application/json; charset=UTF-8',},body: json.encode(mydatas));
    if(res.statusCode==200)
      {
        get_dat();
        clrTextField();
      }
    else{
      print("Something wrong");
    }
  }
  void delete_task(String idd)
  async{
    var mydatas={
      "idx":idd,
    };
    var url=Uri.parse("https://task-api-wine.vercel.app/delete");
    var res=await http.delete(url,headers:<String, String>{'Content-Type': 'application/json; charset=UTF-8',},body: json.encode(mydatas));
    if(res.statusCode==200)
    {
      get_dat();
    }
    else{
      print("Something wrong");
    }
  }
  void clrTextField()
  {
    ct1.clear();
    ct2.clear();
  }
}