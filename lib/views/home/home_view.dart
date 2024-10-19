import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_gil_app/helpers/snack_bar_show.dart';
import 'package:todo_list_gil_app/models/task_model.dart';
import 'package:todo_list_gil_app/providers/home_provider.dart';
import 'package:todo_list_gil_app/views/home/widgets/custom_todo_list_item.dart';
import 'package:todo_list_gil_app/views/taskadd/task_add_view.dart';
import 'package:todo_list_gil_app/views/taskdetails/task_details_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T O D O"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return StreamBuilder<QuerySnapshot>(
                stream: provider.firestore,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong. Please try again."),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No tasks available. Add a new task to get started!",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  } else {
                    return ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        TaskModel todoData = TaskModel.fromJson(data);
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> TaskDetailsView(todoTask: todoData)));
                          },
                          onHorizontalDragEnd: (details) {
                            // Check if the swipe was to the left or right
                            if (details.velocity.pixelsPerSecond.dx > 0) {
                              // Swiped right
                              Dialogs.showSnakBar(context: context, message: "Swiped right to delete");

                            } else if (details.velocity.pixelsPerSecond.dx < 0) {
                              // Swiped left
                              provider.deleteTask(todoData.id);
                              Dialogs.showSnakBar(context: context, message: "Task deleted!");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CustomTodoListItem(todoData: todoData),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              );
            },
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const TaskAddView()));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
