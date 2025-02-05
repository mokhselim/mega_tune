# mega_tune

A Flutter radio station app for LABHOUSE, used an API to get the radio channels

## ✨ Features

- Get a list of Radio stations channels
- Stream Radio stations
- Control volume
- Stop / Play the stream
- Save favourite stations locally
- Could add more features like categories / search / change depends on Country but since the
  deadline is 8 hours, it's hard to deliver

## 📂 Project Structure

📦 mega_tune
┣ 📂 lib

┃ ┣ 📂 models ➝ Contains data models

┃ ┣ 📂 presentation ➝ Contains all screens

┃ ┣ 📂 shared ➝ Reusable UI components

┃ ┣ 📂 controllers ➝ State management classes

┃ ┣ 📂 helpers ➝ Helper classes like Dio

┃ ┣ 📂 sty;e ➝ App colors, theme, font

┃ ┗ main.dart ➝ Main entry point

┣ 📂 assets ➝ Images, fonts, etc.

┣ 📂 test ➝ Unit & widget tests

┗ pubspec.yaml ➝ Dependencies & configurations

## 🛠 Installation & Setup

The App is very simple and there is no special setup

1. Clone the repo
   ```sh
   git clone https://github.com/mokhselim/mega_tune.git
   ```
2. Navigate to the project folder
   ```sh
   cd mega_tune
   ```
3. Install dependencies
   ```sh
   flutter pub get
   ```
4. Run the app
   ```sh
   flutter run
   ```

## Please Note, the 8 hours task was very tight, supposed to add Onboarding and Paywall and more feature with the api, but since there is a deadline there is some compromise, also I wanted to build with Bloc but it needs more time to plan and build, at the end it depends to the business, also I didn't want make thinks more complicated and overengineering the task, but it was fun to plan and design and build radio station app in this tight time.  
