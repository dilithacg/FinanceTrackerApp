# finance_tracker_app
A simple Flutter app for managing personal finances using Firebase for authentication and data storage. Track income, expenses, budgets, and view transaction history in a clean, user-friendly interface.

internship task - Dilitha Ganegama

## Features
User registration and login using Firebase Authentication

Add, edit, and view income and expense transactions

Set and manage monthly budgets

View transaction history with details

Responsive and clean UI built with Flutter

State management using Provider package

Data persistence using Cloud Firestore

## Screenshots
<img src="https://github.com/user-attachments/assets/1c4f97d3-2205-4ce9-946e-c6cff650b2a9" width="250" /> <img src="https://github.com/user-attachments/assets/52012f85-7393-4a59-b21a-9ce18741308e" width="250" /> <img src="https://github.com/user-attachments/assets/0f4d74ff-9beb-4758-bd55-3e017ba714c4" width="250" /> <img src="https://github.com/user-attachments/assets/67d3fb98-8d35-476f-8c7f-51d13194c4ca" width="250" /> <img src="https://github.com/user-attachments/assets/a57869bb-2641-4819-bc4f-928f59ef1330" width="250" /> <img src="https://github.com/user-attachments/assets/51080076-d6a3-4800-8f3f-76694226220a" width="250" /> <img src="https://github.com/user-attachments/assets/6e4606ec-5c60-4e01-97e4-56a363d6a3be" width="250" /> <img src="https://github.com/user-attachments/assets/4ae46a61-11da-4714-9d57-5389e068edd2" width="250" />

## Screen Video
https://vimeo.com/1091125692?share=copy

[Watch Demo on Vimeo](https://vimeo.com/1091125692)


## Getting Started

Prerequisites
Flutter SDK installed (flutter.dev)

Firebase project setup with Authentication and Firestore enabled

Android/iOS emulator or physical device

## Installation
Clone this repository:
git clone https://github.com/dilithacg/FinanceTrackerApp.git

# Install dependencies:
flutter pub get

# Configure Firebase:
Download your google-services.json (Android) and GoogleService-Info.plist (iOS) files from the Firebase console.

Place them in your Flutter project as per Firebase Flutter setup instructions.

# Run the app:
flutter run

# Project Structure:
lib/
├── main.dart                  # Entry point
├── models/                    # Data models (User, Transaction, Budget)
├── providers/                 # State management providers
├── screens/                   # UI screens (Login, Register, Dashboard, etc.)
│   ├── auth/
│   └── home/
├── services/                  # Firebase service wrappers
├── const/                     # constants colors

# Usage:
Register or login using your email and password.

Add income or expense transactions with categories.

View your transaction history.

Manage monthly budgets.

Logout when finished.

