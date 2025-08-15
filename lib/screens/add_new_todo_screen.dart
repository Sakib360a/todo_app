import 'package:flutter/material.dart';
import 'package:todo_app/classes/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController _titleTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 10,
        title: Text(
          'Add new task',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            TextField(
              controller: _titleTEcontroller,
              decoration: InputDecoration(
                label: Text('Task Title'),
                floatingLabelStyle: TextStyle(
                  color: Color(0xFFFF9800), // Focused
                  fontWeight: FontWeight.w600,
                ),
                hintText: 'e.g. Buy groceries',
                hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
                filled: true,
                fillColor: Color(0xFFFDF3E7),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFF9800)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionTEcontroller,
              decoration: InputDecoration(
                label: Text('Description'),
                floatingLabelStyle: TextStyle(
                  color: Color(0xFFFF9800), // Focused
                  fontWeight: FontWeight.w600,
                ),
                hintText: 'Add more details about this task',
                hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
                filled: true,
                fillColor: Color(0xFFFDF3E7),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFF9800)),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  if (_titleTEcontroller.text.isNotEmpty &&
                      _descriptionTEcontroller.text.isNotEmpty) {
                    Todo todo = Todo(
                      false,
                      title: _titleTEcontroller.text.trim(),
                      description: _descriptionTEcontroller.text.trim(),
                      dateCreated: DateTime.now(),
                    );
                    Navigator.pop(context, todo);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..clearSnackBars()
                      ..showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orange,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          content: Text(
                            'Title and Description cannot be empty!',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                  }
                },
                child: Text('Create Task', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
