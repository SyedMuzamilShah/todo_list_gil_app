import 'package:flutter/material.dart';
import 'package:todo_list_gil_app/views/taskadd/task_add_view.dart';
import 'package:todo_list_gil_app/views/home/home_view.dart';

class MainProvider with ChangeNotifier {
    final List<Widget> pages = const [
    HomeView(),
    TaskAddView(),
  ];
  int index = 1;
  changeIndex (currentIndex){
    index = currentIndex;
    notifyListeners();
  }
}