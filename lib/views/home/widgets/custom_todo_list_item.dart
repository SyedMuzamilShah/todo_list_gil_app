import 'package:flutter/material.dart';
import 'package:todo_list_gil_app/helpers/time_converter.dart';
import 'package:todo_list_gil_app/models/task_model.dart';
import 'package:todo_list_gil_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CustomTodoListItem extends StatelessWidget {
  final TaskModel todoData;

  const CustomTodoListItem({super.key, required this.todoData});

  @override
  Widget build(BuildContext context) {
    String time = getTimeAgo(todoData.time);
    Color? containerColor = todoData.isCompleted
        ? Colors.grey.shade300
        : Theme.of(context).appBarTheme.backgroundColor;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: todoData.imagePath != null ? 250 : 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image if available
            if (todoData.imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  todoData.imagePath!,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
            if (todoData.isCompleted) // Overlay for completed tasks
              Container(
                decoration: BoxDecoration(
                  color:
                      Colors.white.withOpacity(0.7), // Semi-transparent black
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Consumer<HomeProvider>(
                          builder: (_, provider, __) {
                            return ListTile(
                              title: Text(
                                todoData.taskName,
                                style: TextStyle(
                                  decoration: todoData.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              subtitle: Text(
                                todoData.description,
                                style: TextStyle(
                                  decoration: todoData.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              trailing: Checkbox(
                                value: todoData.isCompleted,
                                onChanged: (bool? value) {
                                  if (value != null) {
                                    provider.updateCompletedStatus(
                                        value, todoData.id);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: todoData.location != null
                              ? const Icon(Icons.location_pin)
                              : null,
                          title: Text(todoData.location ?? ""),
                          trailing: Text(time),
                        ),
                      ],
                    ),
                  ),
                  if (todoData.isCompleted)
                    Positioned.fill(
                      child: Center(
                        child: Container(
                          height: 5,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
