# Quizly App 

## Project Overview
QuizlyApp is an interactive quiz application built with Flutter, designed to help users enhance their general knowledge through multiple-choice questions.
Users can select quiz categories provided by the developer, answer questions one by one, view their final scores, and review each question to see the correct answers.

The app also includes login, sign-up, and forgot password features, along with support for both dark
mode and light mode for a more personalized experience.With its responsive design, QuizlyApp can be used on various devices, including smartphones, tablets, and other screen sizes.

With a clean and functional interface, QuizlyApp offers a practical solution for anyone who wants to learn and practice answering questions interactively on their mobile device.

## Author
Nama  : Susan Jong 

NIM   : 231401014

Lab   : Lab asli saya (3) tetapi pindah ke lab (1)

Matkul: Praktikum Pemrograman Mobile


## (## Features)

1. Answer Tracking: Keeps track of correct, incorrect, unanswered, and doubtful answers.

2. Score & Grade Display: Calculates and displays the user’s score along with the corresponding grade.

3. Question Review: Shows which questions were answered correctly, incorrectly, marked as doubtful, or left unanswered.

4. Countdown Timer: Displays the remaining time to complete the quiz, helping users manage their time effectively.

5. oubt Marking: Allows users to mark questions they are unsure about for easy review.

6. Result Sharing: Provides a simple, shareable summary of results that can be screenshotted to show overall performance.

## Tech Stack

• Framework: Flutter

• Language: Dart

• State management: Provider (or your chosen solution)

• IDE: Android Studio / Visual Studio Code

## Prerequisites

1. Flutter SDK — stable channel. Install from https://flutter.dev

2. Dart SDK (bundled with Flutter)

3. Android SDK (Android Studio) for Android builds

4. Xcode (macOS only) for iOS builds

5. Device or Emulator (Android Emulator / iOS Simulator / physical device)

6. Recommended: git, bash or terminal

## Setup & Installation

Follow the steps below to run QuizlyApp using Android Studio or VSCode:

1. Clone the Repository

Open your terminal and run:

-> git clone https://github.com/susanjong/QuizlyApp.git

-> cd QuizlyApp

2. Open the Project in Android Studio or VSCode

- Launch Android Studio or Visual Studio Code

- If you just cloned the repository, a new folder named QuizlyApp will appear in your directory.

If it’s not there, you can manually create a new folder and place your project files inside it.

- Click Open → select the QuizlyApp folder

Wait for Android Studio to finish indexing the project and detecting Flutter plugins


3. Install Dependencies

In Android Studio’s terminal (or any terminal in the project directory), run:

-> flutter pub get

This command downloads and installs all the packages listed in pubspec.yaml.

4. Set Up a Device Emulator or Physical Device

You can run the app on either:

- Android Emulator — Open AVD Manager in Android Studio → create or start a virtual device

- Physical Device — Connect your Android phone via USB and enable USB Debugging under Developer Options

Verify that the device is detected:

-> adb devices

5. Run the Application

🔹From Android Studio:

Select your target device from the device dropdown

Click the Run ▶ button

Or use the command line:

-> Flutter run

🔹From VS Code

Open the project folder:

File → Open Folder → select QuizlyApp

Press Ctrl + Shift + P, then choose:

Flutter: Select Device

Select the available device or emulator.

Run the application on terminal VSCode:

-> flutter run

Or press F5 to run the app directly from VS Code.

The app will build and launch automatically.

6. Use Hot Reload / Hot Restart

Hot Reload: Instantly update UI after saving code changes (click ⚡ in Android Studio or press r in the terminal)

Hot Restart: Restart the app without a full rebuild (press R in the terminal)

7. Verify Flutter Environment

Check your setup on terminal with:

-> flutter doctor

If any issues appear, follow the suggestions shown in the output before rerunning the project.

✅ Tip:
For a clean rebuild, you can run:

-> flutter clean

-> flutter pub get

-> flutter run  

## Design Credit 
The UI design for the multiple-choice quiz screens in QuizlyApp was inspired by Ruangguru’s educational platform.
All design elements are original implementations based on publicly available references for educational purposes and have been adapted to fit the app’s Flutter framework.
(https://www.ruangguru.com)

**This credit acknowledges the reference source for UI inspiration and does not imply any official affiliation with Ruangguru.**

## UI/UX Design
Explore the design prototype on Figma:
👉 (https://www.figma.com/design/gKKJVRhqFl2c2GcAUB9gqP/MultipleChoice_QuizlyApp-Design?node-id=0-1&t=KO0BdWOa27Ig0eCk-1)

## Demo Video
Watch the Quizly App in action:
▶️ (https://youtu.be/ab3PiyHt2YI)

## Project Structure 
lib/
├── main.dart
├── data/
     └── quiz_questions.dart
├── models/
     └── education_categories.dart
     └── programming_challenge.dart
     └── question_model.dart
     └── quiz_result.dart 
     └── user_models.dart
     └── user_session.dart
└── routes/
    └── app_routes.dart
├── screens/
│    ├── forgot_password.dart
│    ├── homepage.dart
│    ├── login.dart
│    ├── quiz_review_screen.dart
│    ├── reset_password.dart
│    ├── quiz_screen.dart
│    ├── result_screen.dart
     ├── signup.dart
     └── splashscreen.dart
├── widgets/
    ├── quiz/
│    ├── answer_option_list.dart
│    └── doubt_checkbox.dart
│    └── question_card.dart
│    └── question-number_bar.dart
│    └── quiz_bottom_bar.dart
│    └── quiz_header.dart
├── category_card.dart
├── daily_challenge_card.dart
├── darkmode_theme.dart
├── days_indicator.dart
├── gradient_background.dart
├── navbar_widget.dart
├── programming_card.dart
├── social_button.dart
