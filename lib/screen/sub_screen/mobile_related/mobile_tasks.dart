import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/taskcontroller.dart';
import 'package:untitled3/screen/mobileview.dart';
class MobileTasks extends StatelessWidget{
  Taskcontroller controller=Get.put(Taskcontroller());
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
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
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
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
                Get.offAll(Mobileview(),transition: Transition.cupertino);
              },
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
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
        }, label: Text("Add a Task",style: TextStyle(color: Colors.white),)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text("My Tasks",style: TextStyle(fontSize: mdw*0.11,fontWeight: FontWeight.bold),),
          ),
          Obx(()=>Expanded(
            child: controller.arr.isEmpty?Container(
              margin: EdgeInsets.only(
                top: 33
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset("assets/people.png",
                      height: mdh*0.27,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text("Relax! You have no Task Today!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: mdw*0.06),),
                  )
                ],
              ),
            ):Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child:  Obx(()=>ListView.separated(
                  itemCount: controller.arr.length,
                  itemBuilder: (context, index) {
                    return Obx(()=>ListTile(
                      title: Text("${controller.arr[index]['title']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: mdw*0.05),),
                      subtitle: Text("${controller.arr[index]['task']}",style: TextStyle(fontSize: mdw*0.0556),),
                      trailing: Text("${controller.arr[index]['time']}"),
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
    );
  }
}