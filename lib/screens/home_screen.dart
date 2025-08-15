import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_new_todo_screen.dart';

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
        backgroundColor: Colors.orange,
        title: Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: todoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/noTasks.png',scale: 6,),
                  SizedBox(height: 5,),
                  Text(
                    'No tasks',
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
                          Icons.check_box_outline_blank_outlined,
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
                          style: TextStyle(color: Colors.orange, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      drawer: Drawer(
        child: Column(
          children: [
            Stack(
              children: [
                  
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                width: double.infinity,
                height: 120,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Image.asset('assets/icons/addNewTask.png',scale: 16,),
                        title: Text('Add New Task',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
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
