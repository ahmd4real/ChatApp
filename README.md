
# Chat App

![Chat App Screenshot](path_to_your_screenshot.png)

A robust chat application built with Flutter, featuring login and sign-up screens connected to Firebase for authentication. This project includes email and password authentication, along with first name and last name fields, and comprehensive field validation.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
  - [Setting Dart as the Primary Language](#setting-dart-as-the-primary-language)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- Firebase authentication
- Login and sign-up screens
- Email and password authentication
- First name and last name fields
- Field validation for empty inputs

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Flutter and Dart on your local machine. [Install Flutter](https://flutter.dev/docs/get-started/install)
- You have a Firebase project set up. [Firebase Console](https://console.firebase.google.com/)
- You have a code editor such as Visual Studio Code or Android Studio.

### Installation

1. Clone this repository to your local machine:

    ```sh
    git clone https://github.com/ahmd4real/Chat_App.git
    ```

2. Navigate to the project directory:

    ```sh
    cd Chat_App
    ```

3. Fetch the required dependencies:

    ```sh
    flutter pub get
    ```

4. Set up Firebase:

    - Follow the official FlutterFire setup instructions: [FlutterFire Setup](https://firebase.flutter.dev/docs/overview)
    - Add your `google-services.json` file to the `android/app` directory.
    - Add your `GoogleService-Info.plist` file to the `ios/Runner` directory.

### Running the App

Run the following command to start the app in debug mode:

```dart
flutter run
```

### Setting Dart as the Primary Language

1. Create a `.gitattributes` file in the root of your repository.
2. Add the following line to the `.gitattributes` file:

    ```text
    *.dart linguist-language=Dart
    ```

This will help GitHub recognize Dart as the primary language of your repository.

## Usage

- **Login Screen**: Enter your email and password to log in.
- **Sign-Up Screen**: Enter your first name, last name, email, and password to create a new account.
- **Field Validation**: Ensure all fields are filled before submission.

## Screenshots

![Login Screen](path_to_login_screenshot.png)
*Login Screen*

![Sign-Up Screen](path_to_signup_screenshot.png)
*Sign-Up Screen*

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/yourFeature`)
3. Commit your Changes (`git commit -m 'Add yourFeature'`)
4. Push to the Branch (`git push origin feature/yourFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Ahmed Alaa - [ahmedal011605@gmail.com](mailto:ahmedal011605@gmail.com)

Project Link: [https://github.com/ahmd4real/Chat_App](https://github.com/ahmd4real/Chat_App)

