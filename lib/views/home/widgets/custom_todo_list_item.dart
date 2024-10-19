import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
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
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Display the image if available
            if (todoData.imagePath != null)
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  todoData.imagePath!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<HomeProvider>(
                    builder: (_, provider, __) {
                      return ListTile(
                        title: Text(
                          todoData.taskName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: todoData.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        subtitle: ReadMoreText(
                          style: TextStyle(
                            decoration: todoData.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                          todoData.description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          colorClickableText: Colors.red,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        trailing: Checkbox(
                          value: todoData.isCompleted,
                          onChanged: (bool? value) {
                            if (value != null) {
                              provider.updateCompletedStatus(value, todoData.id);
                            }
                          },
                        ),
                      );
                    },
                  ),
                  if (todoData.location != null || time.isNotEmpty)
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
          ],
        ),
      ),
    );
  }
}
