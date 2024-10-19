import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_gil_app/providers/task_add_provider.dart';
import 'package:todo_list_gil_app/styles/task_add_view_style.dart';
import 'package:todo_list_gil_app/views/taskadd/widgets/address_show.dart';
import 'package:todo_list_gil_app/views/taskadd/widgets/custom_button.dart';
import 'package:todo_list_gil_app/views/taskadd/widgets/image_show.dart';

class TaskAddView extends StatefulWidget {
  const TaskAddView({super.key});

  @override
  State<TaskAddView> createState() => _TaskAddViewState();
}

class _TaskAddViewState extends State<TaskAddView> {
  late final TextEditingController taskTitle;
  late final TextEditingController taskDescription;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    taskTitle = TextEditingController();
    taskDescription = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    taskTitle.dispose();
    taskDescription.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A d d  T a s k"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TaskAddViewStyle.sideBorder),
            child: Consumer<TaskAddProvider>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: TaskAddViewStyle.spaceing),
          
                      // Task Description Section
                      Text(
                        "Task Description",
                        style: TaskAddViewStyle.textStyle(context)
                      ),
                      SizedBox(height: TaskAddViewStyle.spaceing),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: taskDescription,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a task description.';
                            }
                            return null;
                          },
                          minLines: 5,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            hintText: 'Enter task description',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 12.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: TaskAddViewStyle.spaceing),
                      
                      // Location Section
                      Text(
                        "Location",
                        style: TaskAddViewStyle.textStyle(context)),
                      const SizedBox(height: 10),
                      provider.isLocationAdded
                          ? const AddressShow(address: "provider.locationAddress!")
                          : 
                          CustomButton(
                              loading: provider.locationLoading,
                              buttonText: "Add Location",
                              buttonIcon: Icons.location_on_sharp,
                              buttonFunction: provider.fetchLocation,
                            ),
                      SizedBox(height: TaskAddViewStyle.spaceing),
                      
          
                      // Image Section
                      Text(
                        "Image",
                        style: TaskAddViewStyle.textStyle(context)
                        
                      ),
                      const SizedBox(height: 10),
                      provider.isImageAdded
                          ? ImageShow(imageFile: provider.imagePreview)
                          : 
                      CustomButton(
                              buttonText: "Add Image",
                              buttonIcon: Icons.image,
                              buttonFunction: provider.pickImageFromGallery,
                            ),
                      SizedBox(height: TaskAddViewStyle.spaceing),
          
                      // Save Task Button
                      Center(
                        child: CustomButton(
                          loading: provider.savingData,
                          buttonText: "Save Task",
                          buttonFunction: () {
                            if (_formKey.currentState!.validate()) {
                              provider.saveTaskToFirebase(context: context, taskDescription: taskDescription.text);
                              taskDescription.clear();
                              FocusScope.of(context).unfocus();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}