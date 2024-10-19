import 'package:flutter/material.dart';
import 'package:todo_list_gil_app/views/taskadd/task_add_view.dart';
import 'package:todo_list_gil_app/views/home/home_view.dart';

class MainProvider with ChangeNotifier {
  String _appBarTitle = "T O D O";
    final List<Widget> pages = const [
    HomeView(),
    TaskAddView(),
  ];

  String get appBarTitle => _appBarTitle;

  titleGet (int index){
    if (index == 0) _appBarTitle = "T O D O";
    if (index == 1) _appBarTitle = "A d d  T a s k";
  } 
  int index = 0;
  changeIndex (currentIndex){
    index = currentIndex;
    titleGet(index);
    notifyListeners();
  }
}