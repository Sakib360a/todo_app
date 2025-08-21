import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:todo_app/screens/add_new_todo_screen.dart';
import 'package:todo_app/zen_focus_theme.dart';

import '../classes/todo.dart';

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


        title: Text(
          'Todo List',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: todoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/no_task.png', scale: 8),
                  SizedBox(height: 5),
                  Text(
                    'No tasks   ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                  color: ZenFocusTheme.primary,
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
                    child: Text("Abu Bakkar Sakib",style: TextStyle(color: ZenFocusTheme.textPrimary,
                      fontSize: 22,fontWeight: FontWeight.w600,wordSpacing: -2,
                    ),),
                  ),
                ]
                ),

              ),
              SizedBox(height: 10,),
              Card(
                clipBehavior: Clip.antiAlias,

                child: ListTile(
                  onTap: (){},
                  title: Text('All Tasks',),
                 // subtitle: Text('Test'),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  onTap: (){},
                  title: Text('Pending Tasks',),
                 // subtitle: Text('Test'),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //backgroundColor: Colors.orange.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
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
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
