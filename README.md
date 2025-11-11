# Countries App

A Flutter mobile application that allows users to browse, search, and learn about the world's countries. Built with clean architecture principles and BLoC/Cubit state management.

## Features

- **Browse Countries**: View a scrollable list of all countries with flags, names, and population
- **Search**: Real-time search functionality with debouncing to find countries by name
- **Country Details**: View detailed information about each country including:
  - High-quality flag images
  - Key statistics (Area, Population, Region, Sub Region, Capital)
  - Timezones
- **Favorites**: Mark countries as favorites and persist them locally
- **Offline Support**: Cached API responses for offline viewing
- **Hero Animations**: Smooth flag transitions between list and detail screens
- **Dark Mode**: Automatic theme switching based on system preferences
- **Pull-to-Refresh**: Refresh the country list by pulling down

## Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                    # Core utilities and constants
│   ├── constants/          # API endpoints and app constants
│   ├── theme/              # App themes (light/dark)
│   └── utils/              # Utility functions (formatters, etc.)
├── data/                   # Data layer
│   ├── datasources/       # Data sources (remote & local)
│   │   ├── remote/        # API data source
│   │   └── local/         # Local storage (SharedPreferences)
│   ├── models/             # Data models (Freezed)
│   └── repositories/      # Repository implementations
├── domain/                 # Domain layer (business logic)
│   ├── entities/          # Domain entities
│   ├── repositories/      # Repository interfaces
│   └── usecases/          # Use cases
├── presentation/          # Presentation layer
│   ├── bloc/              # BLoC/Cubit state management
│   ├── pages/             # Screen widgets
│   └── widgets/           # Reusable UI components
└── injection/             # Dependency injection setup
```

## Technology Stack

### State Management
- **BLoC/Cubit**: Chosen for its predictable state management, testability, and separation of business logic from UI. Uses `flutter_bloc` package with Cubits for managing application state.

### Networking
- **Dio**: Robust HTTP client with interceptors
- **Dio Cache Interceptor**: HTTP caching for offline support
- **Hive Cache Store**: Persistent cache storage

### Local Storage
- **SharedPreferences**: For storing favorite country codes

### Code Generation
- **Freezed**: Immutable data classes with union types support
- **Json Serializable**: JSON serialization/deserialization

### Dependency Injection
- **GetIt**: Service locator for dependency injection

### UI/UX
- **Shimmer**: Loading skeleton effects
- **Material Design 3**: Modern Material Design components
- **Google Fonts**: Plus Jakarta Sans font family
- **Flutter ScreenUtil**: Responsive sizing for different screen sizes

## Setup Instructions

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd a2sv
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (Freezed models)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Building APK

For Android:
```bash
flutter build apk --release
```

The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

## API Integration

The app uses the [REST Countries API](https://restcountries.com/):

- **Minimal Data Endpoint**: Used for list views
  - `GET /v3.1/all?fields=name,flags,population,cca2`
  - `GET /v3.1/name/{name}?fields=name,flags,population,cca2`

- **Full Data Endpoint**: Used for detail screens
  - `GET /v3.1/alpha/{code}?fields=name,flags,population,capital,region,subregion,area,timezones`

The app implements a two-step fetching strategy:
1. Fetch minimal data for lists (faster loading)
2. Fetch full details only when a country is selected (reduces initial load time)

## Key Implementation Details

### State Management with BLoC/Cubit

BLoC/Cubit was chosen for:
- **Predictable State Management**: Clear unidirectional data flow
- **Testability**: Easy to unit test business logic independently
- **Separation of Concerns**: Business logic separated from UI layer
- **Reactive Updates**: UI automatically rebuilds when state changes via `BlocBuilder`
- **Scalability**: Easy to add new features and manage complex state

The app uses three main Cubits:
- **HomeCubit**: Manages country list, search, and favorites on the home page
- **DetailCubit**: Manages country detail information and favorite status
- **FavoritesCubit**: Manages the favorites list with capital information

### Caching Strategy

- **HTTP Caching**: API responses are cached for 7 days
- **Offline Support**: Previously visited detail pages are available offline
- **Cache Policy**: Uses `CachePolicy.request` with error fallback

### Search Debouncing

Search input is debounced by 500ms to prevent excessive API calls while typing.

### Local Persistence

Favorite countries are stored using SharedPreferences and persist across app restarts.

## Project Structure Explanation

### Why Clean Architecture?

1. **Separation of Concerns**: Each layer has a single responsibility
2. **Testability**: Easy to unit test each layer independently
3. **Maintainability**: Changes in one layer don't affect others
4. **Scalability**: Easy to add new features without breaking existing code

### Data Flow

1. **UI** → Calls Cubit methods via `context.read<Cubit>().method()`
2. **Cubit** → Calls repository methods
3. **Repository** → Coordinates between remote and local data sources
4. **Data Source** → Fetches data from API or local storage
5. **Model** → Parses JSON to Dart objects
6. **Cubit** → Emits new state using `emit(newState)`
7. **UI** → Rebuilds automatically via `BlocBuilder` or `BlocListener`

## Bonus Features Implemented

✅ **Hero Animation**: Smooth flag transitions  
✅ **Dark Mode**: System-based theme switching  
✅ **Pull-to-Refresh**: Refresh functionality on home screen  
✅ **Search Debouncing**: 500ms debounce on search input  
✅ **Data Caching**: HTTP response caching with Hive  
✅ **Dependency Injection**: GetIt service locator  
✅ **Code Generation**: Freezed for immutable models  

## Testing

To run tests:
```bash
flutter test
```

## Future Enhancements

- Unit and integration tests
- Sorting functionality (by name, population)
- Tablet/Web responsive layouts
- Country comparison feature
- Map integration showing country locations

## License

This project is created for A2SV technical interview.

## Author

Built with ❤️ using Flutter and BLoC/Cubit
