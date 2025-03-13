# ScaleUp_Task_2-3-

A **Flutter** application that integrates with the [Fake Store API](https://fakestoreapi.com/) to **fetch, display, and manage products**. It also supports **offline storage** using **Hive** so that users can access product data even when they are offline.

## Features

- **Fetch Product Data from API:** Retrieves product information from the Fake Store API.
- **Store Data in Hive:** Saves API data locally for offline access.
- **Offline Support:** If the device is offline, previously stored data is displayed from Hive.
- **Detailed Product View:** Users can view full details of each product.
- **State Management:** Uses `setState` for basic state management.
- **Network Connectivity Detection:** Uses `connectivity_plus` to check internet status.

## Screenshots

| Product List | Product Details |
|-------------|----------------|
| ![Product List](screenshots/product_list.png) | ![Product Details](screenshots/product_details.png) |

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE like **Android Studio** or **VS Code**

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MKhalidHossain/ScaleUp_Task_2-3-.git
   cd ScaleUp_Task_2-3-
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

## Project Structure

```
ScaleUp_Task_2-3-/
├── android/                # Android-specific files
├── ios/                    # iOS-specific files
├── lib/                    # Main source code
│   ├── main.dart           # Entry point of the application
│   ├── product_model.dart  # Model class for storing product data
│   ├── api_service.dart    # Handles API requests and Hive storage
│   ├── product_screen.dart # Displays product list
│   ├── product_detail_screen.dart # Shows detailed product info
│   └── utils/              # Utility files (e.g., network checker)
├── test/                   # Unit and widget tests
├── pubspec.yaml            # Project metadata and dependencies
└── README.md               # Project overview and instructions
```

## Dependencies

| Package Name      | Usage |
|------------------|-----------------------------|
| `flutter`        | Core Flutter framework      |
| `http`           | API requests                |
| `hive`           | Local storage (NoSQL DB)    |
| `hive_flutter`   | Hive database integration   |
| `connectivity_plus` | Detects internet status |

## API Reference

This project uses the [Fake Store API](https://fakestoreapi.com/) to retrieve product information. The main API endpoints:

- **Fetch All Products:** `https://fakestoreapi.com/products`
- **Fetch Single Product:** `https://fakestoreapi.com/products/{id}`

Example response:
```json
[
  {
    "id": 1,
    "title": "Product Name",
    "price": 29.99,
    "description": "Product description here",
    "image": "https://example.com/product.jpg"
  }
]
```

## How the App Works

1. **Check Internet Connection:**
   - If **online**, fetch product data from API and store it in Hive.
   - If **offline**, load product data from Hive.

2. **Display Products:**
   - The product list is shown with images, titles, and prices.

3. **Product Details:**
   - Clicking a product opens a detailed view with more information.

## Future Improvements

- Implement **provider/bloc for state management**.
- Add **search and filtering options**.
- Improve **UI design with animations**.

## Contributing

1. **Fork the repo**
2. **Create a feature branch** (`git checkout -b feature-branch`)
3. **Commit your changes** (`git commit -m "Add new feature"`)
4. **Push to the branch** (`git push origin feature-branch`)
5. **Submit a pull request**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- **[Fake Store API](https://fakestoreapi.com/)** for providing the product data.
- **Flutter & Dart** for making mobile development easy.

