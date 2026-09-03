# VangtiChai

VangtiChai is a Flutter application for calculating change in Bangladeshi Taka. Enter an amount with the on-screen keypad and the app immediately shows how many notes are needed for each supported denomination.

The interface adapts to the device orientation, keeping the amount display, change breakdown, keypad, and clear action easy to access in both portrait and landscape layouts.

## Screenshots

<table>
   <tr>
      <td align="center">
         <strong>Portrait layout</strong><br>
         <img src="Images/Portrait%20view.png" alt="VangtiChai portrait layout" width="300">
      </td>
      <td align="center">
         <strong>Landscape layout</strong><br>
         <img src="Images/Landscape%20view.png" alt="VangtiChai landscape layout" width="600">
      </td>
   </tr>
</table>

## Features

- Calculates change using Bangladeshi Taka denominations: 500, 100, 50, 20, 10, 5, 2, and 1.
- Displays the number of notes required for each denomination.
- Provides an on-screen numeric keypad for quick amount entry.
- Prevents amounts longer than six digits.
- Clears the current amount and calculated breakdown with one action.
- Uses a responsive layout for portrait and landscape orientations.

## Technology

- **Framework:** Flutter
- **Language:** Dart
- **SDK constraint:** Dart `^3.12.2`
- **UI:** Material Design widgets
- **Testing:** `flutter_test`

## Getting Started

### Prerequisites

- Flutter SDK installed and available on your `PATH`
- A configured Android, iOS, desktop, or web development target

### Installation

1. Clone or download this repository.
2. Open the project directory:

   ```bash
   cd VangtiChai
   ```

3. Install the Flutter dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application on a connected device or emulator:

   ```bash
   flutter run
   ```

## How It Works

The app accepts digits from the keypad and updates the calculated result after every entry. Change is calculated from the largest denomination to the smallest using integer division and remainder operations. For example, an amount of `234` is represented as two 100 Taka notes, one 20 Taka note, one 10 Taka note, and two 2 Taka notes.

Press **CLEAR** to reset the amount and set every denomination count back to zero.

## Project Structure

```text
lib/
├── constants/       Shared layout and input limits
├── screens/         Application screens and orientation layouts
├── utils/           Change calculation logic
├── widgets/         Reusable display, keypad, and table widgets
└── main.dart        Application entry point and theme
test/
├── change_calculator_test.dart
└── widget_test.dart
Images/
├── Landscape view.png
└── Portrait view.png
```

## Testing

Run the complete test suite with:

```bash
flutter test
```

The tests cover denomination calculations, zero-value reset behavior, keypad input, and clearing the displayed amount.
