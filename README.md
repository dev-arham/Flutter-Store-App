# Store App

## Overview

Store App is a Flutter-based e-commerce application designed to showcase a variety of clothing items. The app allows users to browse products, view details, manage a wishlist, and add items to the cart. It also includes user authentication and a splash screen for a polished user experience.

## Features

- **Product Categories**: View items categorized into Shirts, Pants, Jackets, and Shorts.
- **Product Details**: Explore detailed information about each product.
- **Wishlist**: Save favorite products to a wishlist.
- **Shopping Cart**: Add and manage items in the cart.
- **User Authentication**: Sign in to access the full range of app features.
- **Splash Screen**: An immersive introduction to the app.

## Screenshots

![intro screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/intro.jpg)
![signin screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/signin.jpg)
![home screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/home.jpg)
![shop screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/shop.jpg)
![product screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/product.jpg)
![cart screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/cart.jpg)
![profile screenshot](https://github.com/dev-arham/Flutter-Store-App/blob/main/assets/screenshots/profile.jpg)

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- A code editor like Visual Studio Code or Android Studio

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/dev-arham/Flutter-Store-App.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd Flutter-Store-App
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

### Folder Structure

- `lib/`: Contains the main application code.
  - `models/`: Includes data models like `Product` and `Shop`.
  - `pages/`: Contains different app pages like `SigninPage`, `WishlistPage`, etc.
  - `components/`: Reusable UI components like `ItemCard`, `LargeButton`, etc.
  - `main.dart`: Entry point of the application.
- `assets/`: Contains image assets used in the app.

## Usage

1. **Sign In**: Users can sign in to access personalized features.
2. **Browse Products**: Navigate through various categories and view products.
3. **View Product Details**: Tap on any product to see more details.
4. **Manage Wishlist**: Add or remove items from the wishlist.
5. **Add to Cart**: Manage the shopping cart and proceed to checkout.

## Contributing

Feel free to contribute to this project by submitting issues, feature requests, or pull requests. Please ensure your changes align with the project's coding standards and include appropriate tests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Flutter for the framework
- Provider package for state management
- Material Design guidelines for UI components
