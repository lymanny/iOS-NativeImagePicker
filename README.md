# iOS Native Image Picker 📷

## Overview 📚
This project demonstrates how to use the **native iOS Camera and Photo Library** to select and manage images inside a `UITableView`. It follows the **MVVM architecture** for clean and modular code.

## Features ✨
- ✅ **Select Images from Camera 📸**
- ✅ **Choose Multiple Images from Photo Library 🏞️**
- ✅ **Display Images in `UITableView` 📋**
- ✅ **Delete Images with Smooth Animation 🗑️**
- ✅ **MVVM Architecture for Better Code Structure 📌**

## Demo 🎥
<img src="https://github.com/user-attachments/assets/93f41f6b-f44d-4a08-b8ca-7b10cf2ee7c7" alt="Demo" width="400"/>

## Installation 🛠️
1. Clone the repository:
   ```bash
   git clone https://github.com/lymanny/iOS-NativeImagePicker.git
   ```
2. Open the project in **Xcode**.
3. Run the app on a **real device** or **simulator**.

## Permissions 📜
Make sure to add the following keys in `Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>We need access to your camera to take photos.</string>

<key>NSPhotoLibraryUsageDescription</key>
<string>We need access to your photo library to select images.</string>

<key>NSPhotoLibraryAddUsageDescription</key>
<string>We need permission to save images to your photo library.</string>
```

## Usage 🚀
- Tap the **➕ button** to choose an image source.
- Select an image from the **Camera** or **Photo Library**.
- The selected images will appear in the **UITableView**.
- Tap the **Delete 🗑️ button** to remove an image.

## Technologies Used 🛠️
- **Swift** (UIKit)
- **UIImagePickerController & PHPickerViewController**
- **MVVM Architecture**
- **UITableView with Dynamic Updates**

## Contributing 🤝
Contributions are welcome! Please feel free to submit issues, fork the repository, and create pull requests.

## License 📄
This project is licensed under the [MIT License](LICENSE).

## Author 👩‍💻
lymanny - iOS Developer  
🌐 [Portfolio](https://lymanny.onrender.com)
