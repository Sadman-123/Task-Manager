import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/taskcontroller.dart';
import 'package:untitled3/screen/desktopview.dart';
class DesktopTasks extends StatelessWidget{
  Taskcontroller controller=Get.put(Taskcontroller());
  @override
  Widget build(BuildContext context) {
    var mdh=MediaQuery.of(context).size.height;
    var mdw=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Container(
            child: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/panda.png"),
                      radius: 30,
                    ),
                    accountName: Text("Person"),
                    accountEmail: Text("person123@gmail.com"),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade200
                  ),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.cloud),
                    title: Text("Storage"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.archive),
                    title: Text("Archieve"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.delete_forever_outlined),
                    title: Text("Trash"),
                  ),
                  ListTile(
                    onTap: (){},
                    leading: Icon(Icons.event),
                    title: Text("Upcoming Event"),
                    subtitle: Text("Iphone SE4 Launch"),
                  ),
                  ListTile(
                    onTap: (){
                      Get.to(Desktopview(),transition: Transition.cupertino);
                    },
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: mdw*0.20,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      top: 20,
                      right: 384,
                      bottom: 40
                    ),
                    child: Text("My Tasks",style: TextStyle(fontSize: mdw*0.04,fontWeight: FontWeight.bold),),
                  ),
                 Obx(()=> Expanded(
                   child: controller.arr.isEmpty?Container(
                     child: Column(
                       children: [
                         Container(
                           child: Image.asset("assets/people.png",height: mdh*0.4,width: mdw*0.5,),
                         ),
                         SizedBox(height: mdh*0.02),
                         Container(
                           child: Text("Relax! You have no Task Today!",style: TextStyle(fontSize: mdw*0.027,fontWeight: FontWeight.bold),),
                         )
                       ],
                     ),
                   ): Container(
                       width: mdw*0.51,
                       child: Obx(()=>ListView.separated(
                         itemCount: controller.arr.length,
                         itemBuilder: (context, index) {
                           return Obx(()=>ListTile(
                             title: RichText(
                               text: TextSpan(
                                 children: [
                                   TextSpan(text: "${controller.arr[index]['title']}",style: TextStyle(fontSize: mdw*0.016,fontWeight: FontWeight.bold)),
                                   TextSpan(text: " "),
                                   TextSpan(text: "(${controller.arr[index]['time']})")
                                 ]
                               ),
                             ),
                             subtitle: Text("${controller.arr[index]['task']}"),
                            trailing: IconButton(onPressed: (){controller.delete_task(controller.arr[index]['_id']);}, icon: Icon(Icons.delete)),
                           ));
                         },
                         separatorBuilder: (context, index) {
                           return Divider();
                         },
                       ))
                   ),
                 ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.mail)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.attach_file)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.notification_add)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.library_add_check_outlined)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent.shade400,
          onPressed: (){
        showDialog<void>(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text('Add to Task',style: TextStyle(fontWeight: FontWeight.bold),),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      TextField(
                        controller: controller.ct1,
                        decoration: InputDecoration(
                          label: Text("Title"),
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: mdh*0.028,),
                      TextField(
                        controller: controller.ct2,
                        decoration: InputDecoration(
                          label: Text("Task"),
                            border: OutlineInputBorder()
                        ),
                      )
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(onPressed: (){
                        if(controller.ct1.text.isEmpty || controller.ct2.text.isEmpty)
                          {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: Text('Warning'),
                                    content: Text('Please Insert both of them'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('close'),
                                        onPressed: () {
                                          Navigator.of(dialogContext)
                                              .pop(); // Dismiss alert dialog
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                              return;
                          }
                        controller.add_dat();
                        Navigator.of(context).pop();
                      }, child: Text("Add to Task")),
                      TextButton(
                        child: Text('close'),
                        onPressed: () {
                          Navigator.of(dialogContext)
                              .pop(); // Dismiss alert dialog
                        },
                      ),
                    ],
                  );
                },
              );
            }, label: Text("Add a Task",style: TextStyle(color: Colors.white),))
    );
  }
}