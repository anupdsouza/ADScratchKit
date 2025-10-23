# ADScratchKit

![Swift](https://img.shields.io/badge/Swift-5.9+-orange)
![Platform](https://img.shields.io/badge/Platform-iOS%2017.0+-blue)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

A highly customizable and performant SwiftUI library for creating interactive scratch-off card experiences.

ADScratchKit allows you to layer a scratchable surface over a hidden prize view, providing real-time progress updates, haptic feedback, and a configurable shimmer effect to deliver a polished user experience.

## Features

- **Fully Customizable:** Use any SwiftUI `View` for both the scratchable surface and the hidden prize.
- **Real-Time Progress Tracking:** Get continuous updates on the percentage of the card that has been scratched.
- **Configurable Brush:** Define the brush size with absolute points or relative to the card's dimensions.
- **Haptic Feedback:** Enhance the user experience with built-in haptic options.
- **Elegant Shimmer Effect:** An optional, configurable metallic shimmer that plays when the card is idle.
- **Performance Optimized:** Uses an efficient analysis engine with adaptive rendering to ensure smooth performance on any device.
- **Simple Integration:** Get a basic scratch card running with just a few lines of code.

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

You can add ADScratchKit to your project using the Swift Package Manager.

1.  In Xcode, open your project and navigate to **File > Add Packages...**
2.  In the search bar, paste the repository URL: `https://github.com/anupdsouza/ADScratchKit.git`
3.  Click **Add Package**.
4.  Select the `ADScratchKit` library and add it to your app's target.

## Usage

Integrating a scratch card involves three main steps: importing the library, setting up the `ScratchCard` view, and handling the interaction events.

### Step 1: Import the Library

First, import `ADScratchKit` into the SwiftUI view where you want to display the scratch card.

```swift
import SwiftUI
import ADScratchKit
```

### Step 2: Set Up the ScratchCard View

The `ScratchCard` view requires two main content closures: `surface` and `prize`.

-   `surface`: The view that the user scratches away.
-   `prize`: The view that is revealed underneath.

```swift
struct MyCustomView: View {
    var body: some View {
        ScratchCard(
            surface: {
                // Any view can be a surface. A simple gradient is a great start.
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(colors: [.gray, .gray.opacity(0.8)], startPoint: .top, endPoint: .bottom))
            },
            prize: {
                // The content you want to reveal.
                Text("You Won!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
        )
        .frame(width: 300, height: 300) // Give the card a defined frame.
    }
}
```

### Step 3: Configure Behavior

Use the `ScratchCardConfig` object to customize the card's behavior, such as the completion threshold, brush size, haptics, and shimmer effect.

```swift
struct MyCustomView: View {
    private func makeScratchCardConfig() -> ScratchCardConfig {
        return ScratchCardConfig(
            completionThreshold: 0.5,           // Reveal at 50% scratched
            brush: .absolute(50),               // A fixed 50pt brush size
            haptic: .soft,                      // Use a soft haptic feedback
            shimmer: .default,                  // Use the default shimmer effect
            cornerRadius: 20
        )
    }

    var body: some View {
        ScratchCard(
            surface: { /* ... */ },
            prize: { /* ... */ },
            config: makeScratchCardConfig() // Apply the custom configuration
        )
        .frame(width: 300, height: 300)
    }
}
```

### Step 4: Handle Events

You can respond to user interaction using the `onProgress` and `onCompletion` closures. This is useful for triggering sounds, animations, or other state changes in your application.

```swift
struct MyCustomView: View {
    // ... config function ...
    
    private func handleScratchProgress(progress: Double) {
        print("Scratch progress: \(Int(progress * 100))%")
        // Example: Start a scratching sound effect and reset a timer.
    }
    
    private func handleCompletion() {
        print("Prize revealed!")
        // Example: Stop sound effects and trigger a celebration animation.
    }

    var body: some View {
        ScratchCard(
            surface: { /* ... */ },
            prize: { /* ... */ },
            config: makeScratchCardConfig(),
            onProgress: handleScratchProgress,
            onCompletion: handleCompletion
        )
        .frame(width: 300, height: 300)
    }
}
```

## Configuration

The `ScratchCard` is configured through the `ScratchCardConfig` object.

| Parameter | Type | Description | Default |
|---|---|---|---|
| `completionThreshold` | `Double` | The percentage (0.0 to 1.0) of the surface that must be cleared to trigger `onCompletion`. | `0.5` |
| `brush` | `Brush` | The sizing strategy for the scratch brush. See **Brush Sizing**. | `.relativeToShortestSide(0.15)` |
| `haptic` | `ScratchCardHaptic` | The haptic feedback style to use while scratching. See **Haptic Feedback**. | `.soft` |
| `shimmer` | `ScratchShimmerConfig?` | The configuration for the shimmer effect. Set to `nil` to disable. | `.default` |
| `adaptiveRendering` | `Bool` | If `true`, downscales the analysis image for better performance on large views. | `true` |
| `targetAnalysisPixels` | `Int` | The target number of pixels for analysis when `adaptiveRendering` is enabled. | `10_000` |
| `showDebugOverlay` | `Bool` | If `true`, shows a small overlay with the live scratched percentage. | `false` |
| `progressThrottle` | `TimeInterval` | The minimum time interval (in seconds) between `onProgress` callbacks during a drag. | `0.15` |
| `cornerRadius` | `CGFloat` | The corner radius to apply to the entire scratch card view. | `20` |
| `surfaceBackgroundColor` | `Color` | An opaque background color placed behind the surface to prevent the prize from showing through. | `.gray` |

### Brush Sizing (`ScratchCardConfig.Brush`)

The `brush` property determines the size of the user's "scratcher."

| Case | Description |
|---|---|
| `.absolute(CGFloat)` | A fixed width in points. |
| `.relativeToShortestSide(CGFloat)` | A width relative to the smallest dimension (width or height) of the card. |
| `.relativeToArea(CGFloat)` | A width relative to the card's area, which is more consistent across different aspect ratios. |

### Haptic Feedback (`ScratchCardHaptic`)

The `haptic` property provides physical feedback during scratching.

| Case | Description |
|---|---|
| `.none` | No haptic feedback. |
| `.soft` | A soft impact feedback. |
| `.rigid` | A rigid impact feedback. |
| `.light` | A light impact feedback. |
| `.medium`| A medium impact feedback. |
| `.heavy` | A heavy impact feedback. |

## Contributing

Feedback, bug reports, and feature requests are welcome! Please create an issue in the **Issues** tab on the GitHub repository for any problems you find or improvements you would like to suggest.

## License

ADScratchKit is available under the MIT license. See the [LICENSE](LICENSE) file for more info.