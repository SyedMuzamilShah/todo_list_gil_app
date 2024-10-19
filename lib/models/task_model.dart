class TaskModel {
  late final String? id;
  late final String? imagePath;
  late final String description;
  late final String taskName;
  late final String? location;
  late final String time;
  late final bool isCompleted;
  TaskModel({
    this.id,
    this.imagePath,
    required this.description,
    required this.taskName,
    required this.time,
    this.location,
    this.isCompleted = false,
  });
  
  TaskModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    imagePath = json['image_path'];
    description = json['description'];
    taskName = json['task_name'];
    location = json['location'];
    time = json['time'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image_path'] = imagePath;
    data['description'] = description;
    data['task_name'] = taskName;
    data['location'] = location;
    data['time'] = time;
    data['isCompleted'] = isCompleted;
    return data;
  }
}