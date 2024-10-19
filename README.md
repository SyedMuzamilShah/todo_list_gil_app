# To-Do List App

## 📋 Overview
This To-Do List app is a Flutter-based project designed to help users efficiently manage their tasks. It offers functionality for adding tasks with optional location and image attachments, keeping task data organized with Firebase Firestore, and provides a seamless user experience with smooth navigation and state management using Provider.

## 🚀 Features
- **Home Screen**: View your tasks in a clean, organized list format.
- **Add Task**: Easily add tasks with a description, attach location, and images.
- **Task Details**: View full details of tasks, including map locations and full-sized images.
- **Task Management**: Mark tasks as completed, edit details, or delete tasks with a swipe.
- **Persistent Storage**: Stores tasks using Firebase Firestore to keep data safe and accessible.
- **State Management**: Efficient state handling with the Provider package.
- **User-Friendly Design**: Simple, consistent UI for a smooth experience.

## 🛠️ Technologies Used
- **Flutter**: For building the app's user interface.
- **Firebase Firestore**: For storing and managing tasks data.
- **Provider**: State management for handling the app's state.

## 📲 Installation Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/SyedMuzamilShah/todo_list_gil_app.git
   cd todo_list_gil_app
2. **Install Dependencies:**
    ```bash
    flutter pub get
3. **Set up Firebase:**
    - Create a new Firebase project.
    - Add your app's google-services.json to the android/app directory.
    - Enable Firestore in your Firebase console.
4. **Set up Google Map Key:**
    - Create google map key in your Google Maps console.
    - Enable App integration in your Google Maps console
    - Move into credentials section copy key
    - visit to `pub.dev` website search `google_maps_flutter: ^2.9.0` follow instructions to set google map key properly.
4. **Run the App:**
    ```bash
    flutter run

## congratulations you run the app

## 🚀 Usage Guide
- **Add Task**: Use the floating action button (FAB) to quickly add tasks with descriptions, locations, and images.
- **View Details**: Tap on a task to see its full details.
- **Edit and Manage**: Swipe to delete tasks or mark them as completed.

## ⚠️ Troubleshooting
- **Firebase Issues**: Ensure your `google-services.json` is correctly placed and your Firebase project is properly configured.
- **Google Map issues**: Must insert the KEY follow `google_maps_flutter_web: ^0.5.10` and `google_maps_flutter: ^2.9.0` instraction to add properly google maps in your project.
- **Dependencie**: Run `flutter pub get` to resolve any package issues.

## 🤝 Contributions
- We welcome contributions! Feel free to fork the repository, submit issues, or create pull requests to improve the app.

## 📄 License
- This project is licensed under the MIT License.

## 📸 Screenshots
![alt text](<Screenshot 2024-10-19 210400.png>)
![alt text](<Screenshot 2024-10-19 210218.png>)