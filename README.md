# Payment App

A Flutter application demonstrating a simple payment integration using the `pay` plugin for Google Pay and Apple Pay. Built with Clean Architecture for modularity and maintainability, this project serves as a starting point for developers implementing in-app payments in Flutter.

## Features

- Integration with Google Pay (Android) and Apple Pay (iOS) using the `pay` plugin.
- Clean Architecture with separation of concerns (Presentation, Domain, Data layers).
- Dependency injection using `get_it` for loose coupling.
- Simple UI with payment buttons for initiating transactions.
- Error handling and success feedback using `setState` for lightweight state management.
- Configurable payment profiles stored in JSON assets.

## Project Structure

The project follows Clean Architecture principles to ensure scalability and testability. Below is the folder structure:

```
payment_app/
├── assets/
│   ├── apple_pay_config.json        # Apple Pay configuration
│   └── google_pay_config.json       # Google Pay configuration
├── lib/
│   ├── core/
│   │   ├── constants/               # App-wide constants
│   │   ├── di/                      # Dependency injection setup
│   │   └── utils/                   # Utility classes (e.g., Failure)
│   ├── features/
│   │   └── payment/
│   │       ├── data/                # Data layer (datasources, models, repositories)
│   │       ├── domain/              # Domain layer (entities, use cases, repositories)
│   │       └── presentation/        # UI layer (pages, widgets)
│   ├── app.dart                     # App widget configuration
│   └── main.dart                    # Entry point
├── android/                         # Android-specific configurations
├── ios/                             # iOS-specific configurations
├── test/                            # Unit and widget tests
└── pubspec.yaml                     # Dependencies and project metadata
```

## Prerequisites

- **Flutter SDK**: Version 3.0.0 or higher.
- **Dart SDK**: Included with Flutter.
- **IDE**: Android Studio, VS Code, or any Flutter-compatible IDE.
- **Emulator/Simulator**: Android Emulator, iOS Simulator, or a physical device.
- **Payment Gateway Account**: A merchant account with a supported gateway (e.g., Stripe, Square) for production use.

## Setup Instructions

### Clone the Repository

```bash
git clone https://github.com/your-username/payment_app.git
cd payment_app
```

### Install Dependencies

Run the following command to install all required packages:

```bash
flutter pub get
```

### Configure Platform-Specific Settings

#### Android

1. Update `android/app/build.gradle` to ensure `minSdkVersion` is at least 21:

    ```gradle
    android {
         defaultConfig {
              minSdkVersion 21
              targetSdkVersion 33
              ...
         }
    }
    ```

2. Add internet permission in `android/app/src/main/AndroidManifest.xml`:

    ```xml
    <uses-permission android:name="android.permission.INTERNET"/>
    ```

#### iOS

1. Add Apple Pay capability in `ios/Runner/Info.plist`:

    ```xml
    <key>com.apple.developer.in-app-payments</key>
    <array>
         <string>merchant.com.example.payment</string>
    </array>
    ```

2. Set up a Merchant ID in the Apple Developer Console and enable Apple Pay.

### Configure Payment Profiles

Modify `assets/google_pay_config.json` and `assets/apple_pay_config.json` with your payment gateway details (e.g., `gateway`, `gatewayMerchantId`, `merchantIdentifier`). Ensure the environment in `google_pay_config.json` is set to `TEST` for development or `PRODUCTION` for release.

### Run the Application

Connect an emulator/simulator or physical device and run:

```bash
flutter run
```

## Usage

1. Launch the app to see the payment screen.
2. Click the **Google Pay** button (Android) or **Apple Pay** button (iOS) to initiate a payment.
3. The app processes a sample transaction of $99.99 (USD) and displays success or error messages.

## Notes

- **Testing**: Use test cards or sandbox accounts provided by your payment gateway for testing. Ensure the environment is set to `TEST` in `google_pay_config.json`.
- **Platform-Specific UI**: Google Pay is only available on Android, and Apple Pay is only available on iOS. Enhance the UI to conditionally display buttons using `Platform.isAndroid` or `Platform.isIOS`.
- **Production**: Update payment configurations with production credentials and test thoroughly before deployment.
- **Extensibility**: The Clean Architecture setup makes it easy to add new features or integrate additional payment providers.

## Dependencies

- `pay_android`: ^3.1.1 - Google Pay integration for Android.
- `pay_ios`: ^1.1.0 - Apple Pay integration for iOS.
- `pay_platform_interface`: ^2.0.0 - Platform interface for the `pay` plugin.
- `meta`: ^1.10.0 - Annotations for Dart code.
- `get_it`: ^7.6.0 - Dependency injection.
- `dartz`: ^0.10.1 - Functional programming utilities (Either type).

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:

    ```bash
    git checkout -b feature/your-feature
    ```

3. Make your changes and commit:

    ```bash
    git commit -m 'Add your feature'
    ```

4. Push to the branch:

    ```bash
    git push origin feature/your-feature
    ```

5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, please contact `praaji12@gmail.com` or open an issue on GitHub.

---

Built with 💙 using Flutter.
