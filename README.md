# Kylipp - Social Networking App

Kylipp is a social networking app inspired by Instagram, showcasing clean architecture and Bloc pattern implementation.

## Features

- Authentication: Sign in, sign up, and sign out functionality.
- User Profile: View and interact with user profiles.
- Social Interactions: Follow, unfollow, like, and upload posts.
- Graph Visualization: Explore user networks in a graph.

## Getting Started

1. Ensure Firebase is set up for both web and mobile in `firebase_options.dart`.
2. Run the app using `flutter run`.

## Project Structure

- **core**: Core functionalities and shared elements.

  - **constants**: Constants used throughout the app.
  - **error**: Definition of application-specific errors.
  - **shared**: Shared entities and models.
  - **usecase**: Definition of use case abstraction.

- **features**:
  - **authentication**: User authentication feature.
  - **user**: User-related functionalities.
- **previous**: Legacy code from the MVC architecture.

## Prerequisites

- Flutter
- Firebase account with web and mobile configurations

## Contributing

Contributions are welcome! Please check our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE.md).

## Acknowledgments

- Firebase for providing a reliable backend infrastructure.
- The Flutter and Bloc communities for valuable resources.
