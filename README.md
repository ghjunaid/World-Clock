# World Time App

A Flutter application that displays the current time in various world locations. Users can select a location from a list and view the time with dynamic day/night backgrounds.

## Features

- Choose from multiple global locations (e.g., Kolkata, New York, London, Athens, Cairo, Nairobi, Chicago, Seoul, Jakarta)
- Real-time time fetching using the TimeAPI.io service
- Dynamic background images based on day/night
- Responsive design that adapts to different screen sizes
- Clean and intuitive user interface

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine
- Dart SDK (comes with Flutter)

### Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd world_time
   ```

2. Install dependencies:
   ```
   flutter pub get
   ```

3. Run the app:
   ```
   flutter run
   ```

### Usage

- On launch, the app loads and displays the home screen.
- Tap "Change Location" to select a new location from the list.
- The app will fetch and display the current time for the selected location.
- Background changes based on whether it's daytime or nighttime.

## Dependencies

- `http`: For making API requests to fetch time data
- `intl`: For date and time formatting
- `flutter_spinkit`: For loading animations

## API

This app uses [TimeAPI.io](https://timeapi.io/) to fetch current time data for different timezones.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

For more information on Flutter development, visit the [official Flutter documentation](https://docs.flutter.dev/).
