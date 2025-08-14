import 'package:flutter/material.dart';

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
        elevation: 10,
        title: Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // drawer: Drawer(),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          Todo todo = todoList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: Colors.grey,
            child: ListTile(
              onTap: () {},
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
          );
        },
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                height: 200,
                child: Column(children: [
                  SizedBox(height: 30,),
                  ListTile(
                    leading: Icon(Icons.add_task_outlined),
                    title: Text('Add New Task'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.incomplete_circle_rounded),
                    title: Text('Mark as Complete'),
                    onTap: () {},
                  ),

                ]),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class Todo{
  final String title;
  final String description;
  final DateTime dateCreated;
  bool isComplete;
  Todo({
    required this.title,
    required this.description,
    required this.isComplete,
    required this.dateCreated,
  });
}
