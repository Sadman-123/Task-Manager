import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/screen/sub_screen/desktop_related/desktop_tasks.dart';
class Desktopview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: mdh*0.18,),
                Text("Task Manager",style: TextStyle(fontSize: mdw*0.053,fontWeight: FontWeight.bold),),
                Text("Stay on Track, Stay Productive",style: TextStyle(fontSize: mdw*0.02,color: Colors.black54),),
                SizedBox(height: mdh*0.09,),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(DesktopTasks(),transition: Transition.cupertino);
                  },
                  child: Text(
                    "Get Started!",
                    style: TextStyle(fontSize: mdh*0.03,color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueAccent.shade400),
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 40, vertical: 25)), // Adjust padding
                    minimumSize: MaterialStateProperty.all(Size(150, 50)), // Set minimum button size
                  ),
                ),
              ],
            ),
          ),
         Container(
           child: Image.asset("assets/task.png",
           height: mdh*0.7,
             width: mdw*0.5,
           ),
         )
        ],
      )
    );
  }
}
