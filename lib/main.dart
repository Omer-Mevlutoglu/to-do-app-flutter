// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:todoapp10_1/pages/card.dart';
import 'package:todoapp10_1/pages/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

// class for tasks
class Tasks {
  String title;
  bool status;
  Tasks({
    required this.title,
    required this.status,
  });
}

// The list that contains tasks
List<Tasks> todotasks = [
  Tasks(title: "DO", status: false),
  Tasks(title: "DOne", status: false),
  Tasks(title: "Down", status: false),
];
// This function represents the completed task number
// and has the counter value
int completedtasknummber() {
  int completed = 0;
  todotasks.forEach((element) {
    element.status ? completed++ : completed;
  });
  return completed;
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // Variable to get the text inside the textfield
  final mycontroller = TextEditingController();
  // Function to add task  when the add button in the dialog clicked
  void addTask() {
    setState(() {
      todotasks.add(Tasks(title: mycontroller.text, status: false));
    });
  }

// function to change the state of the to do when the card is clicked
  void functochangestat(int takseindex) {
    setState(() {
      todotasks[takseindex].status = !todotasks[takseindex].status;
    });
  }

// function to delete taks when the delete icon is clicked
  deletetask(int takseindex) {
    setState(() {
      todotasks.remove(todotasks[takseindex]);
    });
  }

// function to delete all the tasks when the delete icon in the appbar clicked
  clearlist() {
    setState(() {
      todotasks.clear();
      // alt: todotasks.removeRange(0, todotasks.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //  this button when presesed shows the dialog to add a new task
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        maxLength: 15,
                        controller: mycontroller,
                        decoration: InputDecoration(label: Text("Add task")),
                      ),
                      TextButton(
                        onPressed: () {
                          addTask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
        title: Text(
          "TO DO APP",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              clearlist();
            },
            icon: Icon(
              Icons.delete_forever,
              size: 31,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyCounter(
              alltodos: todotasks.length,
              allcompleted: completedtasknummber(),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: todotasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                      vartitle: todotasks[index].title,
                      stat: todotasks[index].status,
                      myfunctochangestat: functochangestat,
                      thetaskindex: index,
                      deletetask: deletetask,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
//   margin: EdgeInsets.only(top: 20),
//   width: double.infinity,
//   child: Column(
//     children: [
//       Container(
//         width: 360,
//         height: 100,
//         decoration: BoxDecoration(
//           color: Colors.blueGrey,
//           borderRadius: BorderRadius.circular(24)
//         ),
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//             Text(
//               "data",
//               style: TextStyle(
//                 fontSize: 22
//               ) ,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.wrong_location),
//             ),
//           ]),
//         ),
//       ),
//     ],
//   ),
// ),

//  ...todotasks
//         .map(
//           (e) => TodoCard(
//             vartitle: e.title,
//             stat: e.status,
//             // color2: e.status,
//           ),
//         )
//         .toList(),
