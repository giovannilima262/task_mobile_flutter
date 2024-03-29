# task_mobile_giovanni

A project for task management
## Getting Started

To run this project, you will need to have Flutter installed. If you haven't installed Flutter yet, you can follow the installation guide [here](https://flutter.dev/docs/get-started/install).

### Running the App

1. Clone the repository:
2. Navigate to the project directory:
```bash
 cd task_mobile_flutter
```
3. Run the App
```bash
  flutter pub get
```
```bash
  flutter run
```
* This will launch the app on your connected device or emulator.

## API
To access the laravel project click [here](https://github.com/giovannilima262/task-api-laravel).<br/>
By default, the application performs a fictitious login to request the API access token.
If you want to use another endpoint address or test it with a local application, you must make the change in the following  ```BaseStringHelper``` file.

```dart
  factory BaseStringHelper.staging() {
    const staging = Constants.baseUrlApi;
    return BaseStringHelper(baseUrl: staging);
  }
```
to

```dart
  factory BaseStringHelper.staging() {
    const staging = "localhost:8000/api/";
    return BaseStringHelper(baseUrl: staging);
  }
```