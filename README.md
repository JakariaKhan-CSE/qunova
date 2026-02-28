# qunova

# Setup Steps
Clone the project:
git clone https://github.com/JakariaKhan-CSE/qunova.git or git clone git@github.com:JakariaKhan-CSE/qunova.git

Install dependencies:
flutter pub get

# Flutter version
Flutter 3.41.2

# How to run the app
flutter run

# assumptions made
Asset Paths: icons are stored in assests/icon/.

API Response: The BackendResModel the server returns a standard JSON structure with status, message, and data fields.

Debounce: A 500ms delay is assumed for search inputs to optimize API/filtering performance.

# Libraries used & why
Provider: Efficient state management and dependency injection.

http: Handles REST API communication with the backend.

flutter_animate: Adds polished, "pro-level" animations to the UI.

google_fonts: Access to high-quality typography without manual font loading.


