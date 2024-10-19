import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_gil_app/firebase_options.dart';
import 'package:todo_list_gil_app/providers/home_provider.dart';
import 'package:todo_list_gil_app/providers/main_provider.dart';
import 'package:todo_list_gil_app/providers/task_add_provider.dart';
import 'package:todo_list_gil_app/providers/task_details_provider.dart';
import 'package:todo_list_gil_app/providers/theme_provider.dart';
import 'package:todo_list_gil_app/widgets/my_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Theme provider
        ChangeNotifierProvider(create: (_) => ThemeProvider()),

        // Main View provider on which show other views
        ChangeNotifierProvider(create: (_) => MainProvider()),

        // Other views
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => TaskAddProvider()),
        ChangeNotifierProvider(create: (_) => Detailstaskprovider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (_, provider, __) {
          return provider.pages[provider.index];
        },
      ),
      appBar: AppBar(),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<MainProvider>().index,
        onTap: (value) => context.read<MainProvider>().changeIndex(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Add Task',
          ),
        ],
      ),
    );
  }
}
