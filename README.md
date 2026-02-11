# Social Sample App

A Twitter-like social media sample application demonstrating the integration of [Tolgee](https://tolgee.io) localization platform with SwiftUI.

## Overview

This sample app showcases how to implement dynamic localization in a SwiftUI application using the Tolgee Mobile Swift SDK. The app features a familiar social media interface with multiple tabs and demonstrates best practices for organizing translations across different namespaces.

## Features

- **Home Feed**: Browse tweets from various users with interaction capabilities
- **Tweet Composition**: Create new tweets with a clean compose interface
- **Interactions**: Like and retweet functionality
- **Search**: Dedicated search interface
- **Notifications**: Notification center view
- **Profile**: User profile section
- **Multi-Language Support**: Dynamic localization using Tolgee with organized namespace separation

## Localization Architecture

The app demonstrates advanced localization organization using multiple namespace files:

- **Localizable.xcstrings**: Default translations
- **Notifications.xcstrings**: Notification-specific strings
- **Profile.xcstrings**: User profile related translations
- **Search.xcstrings**: Search interface strings
- **Tweets.xcstrings**: Tweet feed and composition translations

This namespace separation provides better organization and maintainability for large-scale applications.

## Dependencies

- [Tolgee Mobile Swift SDK](https://github.com/tolgee/tolgee-mobile-swift-sdk) (v1.1.0)

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd SocialSampleApp
   ```

2. **Open the project**
   ```bash
   open SocialSampleApp.xcodeproj
   ```

3. **Build and run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run

## Tolgee Integration

### Initialization

The app initializes Tolgee in [SocialSampleAppApp.swift](SocialSampleApp/SocialSampleAppApp.swift) with a CDN URL and multiple namespaces:

```swift
Tolgee.shared.initialize(
    cdn: URL(string: "https://cdn.tolg.ee/478eeb6ee60ff83f6865b0d3f4f4651c")!,
    namespaces: ["Notifications", "Profile", "Search", "Tweets"]
)
```

### Usage Examples

**Using TolgeeText in SwiftUI views:**
```swift
TolgeeText(.Tweets.title)
```

**Programmatic translation:**
```swift
Tolgee.shared.translate(.Tweets.title, locale: locale)
```

### Custom Extensions

The app includes custom extensions in [Tolgee+LocalizedStringResource.swift](SocialSampleApp/Tolgee/Tolgee+LocalizedStringResource.swift) that enable seamless integration between SwiftUI's `LocalizedStringResource` and Tolgee's translation system.

## Learning Resources

This sample app demonstrates:

- ✅ SwiftUI app architecture with multiple views
- ✅ Integration of Tolgee SDK in SwiftUI applications
- ✅ Namespace-based translation organization
- ✅ Dynamic locale switching
- ✅ Custom localization extensions
- ✅ Modern Swift concurrency with async/await
- ✅ SwiftUI navigation and tab patterns

## About Tolgee

Tolgee is a modern localization platform that enables developers to:

- Manage translations efficiently
- Support multiple languages and namespaces
- Update translations dynamically without app updates
- Collaborate with translators in real-time

Learn more at [tolgee.io](https://tolgee.io)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For issues related to:
- **Tolgee SDK**: Visit the [Tolgee Mobile Swift SDK repository](https://github.com/tolgee/tolgee-mobile-swift-sdk)
- **This sample app**: Open an issue in this repository
