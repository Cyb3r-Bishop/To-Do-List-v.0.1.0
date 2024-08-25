import 'package:flutter/material.dart';
import 'package:to_do_list_v_0_1_0/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['Cleaning face', false],
    ['Making coffee', false],
    ['Drink coffee', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB59DD1),
      appBar: AppBar(
        title: const Text('To Do App'),
        backgroundColor: const Color(0xFF8A7EA4),
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new task',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF8A7EA4),
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF8A7EA4),
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: saveNewTask,
              backgroundColor: const Color(0xFF8A7EA4),
              foregroundColor: Colors.black,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}


/*
  F9BBAE
  F3ACB4
  C794B0
  8A7EA4
  B59DD1
*/
