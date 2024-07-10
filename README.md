# Flutter Firebase ToDo List

BetterU Take-Home Assignment

A simple and ToDo list application built with Flutter and Firebase, featuring user authentication, task management, and a confetti animation upon task completion.

## Features

- User authentication (register, sign in, sign out)
- Create, Read, Update, Delete tasks
- Mark tasks as complete with a confetti animation
- Real-time task updates with Firebase Firestore

## Screenshots

![Screenshot 1](./lib/imgs/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-07-10%20at%2014.08.10.png)
![Screenshot 2](./lib/imgs/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-07-10%20at%2014.08.39.png)
![Screenshot 2](./lib/imgs/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20Max%20-%202024-07-10%20at%2014.09.30.png)


## Installation

To get a local copy up and running, follow these steps:

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase account: [Create Firebase project](https://firebase.google.com/)
    Currently using a firebase project that I set up, will disappear in 30 days
- My Current Ruby Version(optional, but may not run if not up to date)
    ruby 3.1.2p20

### Setup

1. **Clone the repository**:
    git clone https://github.com/KentTDang/FlutterTodoApp.git

2. **Install dependencies**:
    flutter pub get

3. **Configure Firebase**:

    - (Optional): Current Firebase project will last 30 days 
    - Go to the Firebase Console.
    - Create a new project or use an existing one.
    - Add an Android app and an iOS app to your Firebase project.
    - Download the `google-services.json` file for Android and place it in the `android/app` directory.
    - Download the `GoogleService-Info.plist` file for iOS and place it in the `ios/Runner` directory.
    - Enable Firebase Authentication and Firestore in the Firebase Console.

4. **Run the app**:
    flutter run

## Usage

1. **Register a new account**: Provide an email and password
2. **Sign in**: Log in with your email and password.
3. **Add tasks**: Use the input field to add new tasks.
4. **Mark tasks as complete**: Check the checkbox next to a task to mark it as complete and trigger the confetti animation.
5. **Delete tasks**: Click the delete icon to remove a task.