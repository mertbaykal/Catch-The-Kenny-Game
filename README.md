# Catch the Kenny

Catch the Kenny is a simple iOS game where players need to tap on images of Kenny from South Park as they appear on the screen within a limited time. Each successful tap earns the player a point. The game challenges the player's speed and reflexes.

## Features

- Tapping on images of Kenny from South Park.
- Earn points for each successful tap.
- Timer-based gameplay.

## Screenshots

[Add screenshots of your app here if available]

## Technologies Used

- Swift
- UIKit

## Installation

1. Clone the project repository to your local machine.
2. Open the project in Xcode.
3. Build and run the application on a simulator or your iOS device.

## How to Play

- Launch the application on your iOS device.
- Tap on the images of Kenny as they appear on the screen.
- Earn points for each successful tap.
- The game ends when the timer runs out.

## Implementation Details

This application is implemented using Swift and UIKit. It utilizes a timer-based mechanism for the game's duration and randomizes the appearance of Kenny images on the screen.

The game consists of 9 image views representing different positions where Kenny can appear. The `hideKenny` function randomly selects one of these image views to reveal Kenny to the player. When the player taps on Kenny, the `increaseScore` function increments the score. The game ends when the timer runs out, and the player is prompted to either replay or exit the game.

## Contributing

Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
