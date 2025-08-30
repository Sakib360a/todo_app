import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:todo_app/screens/add_new_todo_screen.dart';
import 'package:todo_app/screens/settings_screen.dart';
import 'package:todo_app/zen_focus_theme.dart';

import '../classes/todo.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        title: Text('All tasks')
      ),
      body: todoList.isEmpty
               ? Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 Image.asset('assets/icons/no-task.png', scale: 5),
                 // SizedBox(height: 5),
                 Text(
                   'No tasks',
                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                 ),
               ],
             ),
           )
               : ListView.builder(
             itemCount: todoList.length,
             itemBuilder: (context, index) {
               Todo todo = todoList[index];
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16),
                   ),
                   clipBehavior: Clip.antiAlias,
                   shadowColor: Colors.grey,
                   child: Material(
                     color: Colors.transparent,
                     borderRadius: BorderRadius.circular(16),
                     child: ListTile(
                       onLongPress: () {
                         setState(() {
                           todoList.remove(todo);
                         });
                       },
                       contentPadding: EdgeInsets.symmetric(horizontal: 20),
                       leading: Icon(
                         Icons.circle_outlined,
                         color: Colors.black,
                       ),
                       title: Text(todo.title),
                       subtitle: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(todo.description),
                           Text('Create Date: ${todo.dateCreated}'),
                         ],
                       ),
                       trailing: Text(
                         'Pending',
                         style: TextStyle(color: ZenFocusTheme.error, fontSize: 14),
                       ),
                     ),
                   ),
                 ),
               );
             },
           ),



      drawer: Drawer(
        backgroundColor: ZenFocusTheme.background ,
        child: Column(
          children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                alignment: Alignment.center,
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                  //color: ZenFocusTheme.primary,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF64B5F6),
                      Color(0xFF0D47A1),
                    ],
                    stops: [0, .9],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                  ,
                ),
                child: Stack(children: [
                  Center(
                    child: CircleAvatar(radius: 40,
                            backgroundImage: AssetImage('assets/images/SakibAvatar.jpeg'),
                ),

                ),
                  Positioned(
                    top: 140,
                    left: 70,right: 55,
                    child: Text("Abu Bakkar Sakib",style: TextStyle(color: ZenFocusTheme.background,
                      fontSize: 22,fontWeight: FontWeight.w600,wordSpacing: -2,
                    ),),
                  ),
                ]
                ),

              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      color: Color(0xFFe3f2fd),
                      child: ListTile(
                        onTap: (){},
                        //contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        leading: Image.asset('assets/icons/all_tasks.png',scale: 20,),
                        title: Text('All Tasks',style: TextStyle(fontWeight: FontWeight.w500),),
                        // subtitle: Text('Test'),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                       color:  Color(0xFFe3f2fd),
                      child: ListTile(
                        onTap: (){},
                        leading: Image.asset('assets/icons/pending_tasks.png',scale: 20,),
                        title: Text('Pending Tasks',style: TextStyle(fontWeight: FontWeight.w500),),
                        // subtitle: Text('Test'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.lightBlueAccent.withOpacity(0.2),
                        height: 20,
                        thickness: 2,
                        radius: BorderRadius.circular(30),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      color: Color(0xFFe3f2fd),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen()));
                        },
                        leading: Image.asset('assets/icons/about_.png',scale: 22,),
                        title: Text('About',style: TextStyle(fontWeight: FontWeight.w600),),
                        // subtitle: Text('Test'),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      color: Color(0xFFe3f2fd),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                        },
                        leading: Image.asset('assets/icons/settings.png',scale: 22,),
                        title: Text('Settings',style: TextStyle(fontWeight: FontWeight.w600),),
                        // subtitle: Text('Test'),
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAlias,
                      color: Color(0xFFe3f2fd),
                      child: ListTile(
                        onTap: (){
                          showDialog(context: context, builder: (context)=>AlertDialog(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/logout.png',scale: 10,),
                                Text('Logout',style: TextStyle(fontSize: 12),),
                                SizedBox(height: 30,),
                                Text('Are you sure ?'),
                                SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: 100,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor: ZenFocusTheme.primary,      // Button background
                                            foregroundColor: Colors.white,    // Text/Icon color
                                          ),child: Text('Go back',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                                    ),
                                    SizedBox(
                                      height: 45,
                                      width: 100,
                                      child: ElevatedButton(
                                          onPressed: (){},
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor: Colors.red,      // Button background
                                            foregroundColor: Colors.white,    // Text/Icon color
                                          ),child: Text('Logout',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ));
                        },
                        leading: Image.asset('assets/icons/logout.png',scale: 15,),
                        title: Text('Logout',style: TextStyle(fontWeight: FontWeight.w600),),
                        // subtitle: Text('Test'),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 120,
        child: FloatingActionButton(
          backgroundColor: ZenFocusTheme.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: ZenFocusTheme.background,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          //color: Colors.orange,
                          color: ZenFocusTheme.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/addNewTask.png',
                            scale: 16,
                          ),
                          title: Text(
                            'Add New Task',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () async {
                            Navigator.pop(context);
                            Todo? todo = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddNewTodoScreen(),
                              ),
                            );
                            if (todo != null) {
                              setState(() {
                                todoList.add(todo);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset('assets/icons/add_task.png',scale: 17,),
              const SizedBox(width: 5,),
              Text('Add task'),
            ],
          ),
        ),
      ),
    );
  }
}
