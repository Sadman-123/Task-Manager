import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/screen/sub_screen/mobile_related/mobile_tasks.dart';
class Mobileview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(child: Image.asset("assets/task.png",height: mdh*0.30,width: mdw*0.8,),),
          Container(
            child: Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Task Manager",style: TextStyle(fontWeight: FontWeight.bold,fontSize: mdw*0.127),),
                          SizedBox(height: mdh*0.001,),
                          Text("Stay on Track, Stay Productive",style: TextStyle(color: Colors.black54,fontSize: mdw*0.045),),
                        ],
                      ),
                    ),
                    SizedBox(height: mdh*0.1,),
                    Container(
                      child: ElevatedButton(onPressed: (){Get.offAll(MobileTasks(),transition: Transition.cupertino);}, child: Text("Get Started!",style: TextStyle(color: Colors.white,fontSize: mdw*0.05),),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 70, vertical: 10)), // Adjust padding
                          minimumSize: MaterialStateProperty.all(Size(150, 50)), //
                        backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade400)
                      ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}