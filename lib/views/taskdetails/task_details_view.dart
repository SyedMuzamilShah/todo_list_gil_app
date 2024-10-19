import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:todo_list_gil_app/helpers/time_converter.dart';
import 'package:todo_list_gil_app/models/task_model.dart';
import 'package:todo_list_gil_app/providers/task_details_provider.dart';
import 'package:todo_list_gil_app/views/taskdetails/widgets/google_map_view.dart';

class TaskDetailsView extends StatelessWidget {
  final TaskModel todoTask;

  const TaskDetailsView({
    super.key,
    required this.todoTask,
  });

  @override
  Widget build(BuildContext context) {
    final providerInstance = context.read<Detailstaskprovider>();
    String time = getTimeAgo(todoTask.time);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the image if available
              if (todoTask.imagePath != null && todoTask.imagePath!.isNotEmpty)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: providerInstance.imagePreview != null
                          ? Image.memory(providerInstance.imagePreview!)
                          : Image.network(
                              todoTask.imagePath!,
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.scaleDown,
                            ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: InkWell(
                        onTap: () => providerInstance.pickImageFromGallery(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              else
                // Placeholder when no image is available
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              // Display task name
              Text(
                todoTask.taskName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Display task description

              ReadMoreText(
                todoTask.description,
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Display task status
              Row(
                children: [
                  const Text(
                    "Status: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    todoTask.isCompleted ? "Completed" : "Pending",
                    style: TextStyle(
                      fontSize: 16,
                      color: todoTask.isCompleted ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Display task location
              if (todoTask.location != null && todoTask.location!.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.location_pin),
                    const SizedBox(width: 8),
                    Text(
                      todoTask.location!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              // Display task time

              const SizedBox(
                height: 400,
                width: double.infinity,
                child: GoogleMapView(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  Text(
                    "Created at: $time",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
