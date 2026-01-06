background_permission_checker

🚀 A Flutter plugin to check Auto-Start permission and open vendor-specific Auto-Start settings on Android devices.


📌 Overview

Android manufacturers like Xiaomi, Oppo, Vivo, Realme, Huawei, and Samsung often block apps from running background tasks unless Auto-Start is enabled.
This plugin allows you to:
Detect if Auto-Start is enabled
Open the correct Auto-Start settings screen depending on the device brand
Improve reliability for apps requiring background services (GPS, notifications, VoIP, chat, delivery apps, etc.)

✨ Features

✔ Check Auto-Start permission status
🔧 Open Auto-Start settings automatically

📱 Supports:

Xiaomi (MIUI)
Oppo (ColorOS)
Vivo (Funtouch OS)
Realme
Huawei (EMUI)
Samsung
Others (fallback to App Settings)

⚡ Works with Android 6+

🪶 Lightweight & no external dependencies

📦 Installation

Add to your pubspec.yaml:
````
dependencies:
background_permission_checker: ^0.0.1
````
````
Install:

flutter pub get
````

Import:
````
import 'package:background_permission_checker/background_permission_checker.dart';
````
🚀 Quick Usage
✔ Check Auto-Start Permission
````
final bool isEnabled = await BackgroundChecker.isAutoStartEnabled();
print("Auto-start status: $isEnabled");
````
✔ Open Auto-Start Settings
````
await BackgroundChecker.openAutoStartSettings();
````
📱 OEM Behavior Table
Brand	Opens	Notes
Xiaomi	Auto-Start Management	MIUI restricts background apps heavily
Oppo	App Permission Manager	ColorOS has strict autostart control
Vivo	Background Startup Manager	Funtouch OS restrictions
Huawei	Protected Apps	Shows persistent protection options
Realme	Auto Launch	Same as ColorOS
Samsung	App Info → Battery	Limited auto-start APIs
Others	App Settings	Fallback screen
🔧 Dart API Reference
````
1. isAutoStartEnabled()
````
Returns true if Auto-Start permission is enabled.
````
bool enabled = await BackgroundChecker.isAutoStartEnabled();

2. openAutoStartSettings()
````
Opens OEM-specific Auto-Start settings.
````
await BackgroundChecker.openAutoStartSettings();
````
📝 Example
````
import 'package:flutter/material.dart';
import 'package:background_permission_checker/background_permission_checker.dart';

class AutoStartDemo extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text("Auto-Start Checker")),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
onPressed: () async {
bool enabled = await BackgroundChecker.isAutoStartEnabled();
print("Auto-start: $enabled");
},
child: Text("Check Auto-Start"),
),
ElevatedButton(
onPressed: () async {
await BackgroundChecker.openAutoStartSettings();
},
child: Text("Open Auto-Start Settings"),
),
],
),
),
);
}
}
````
🧠 Why Use This Plugin?

Many apps depend on background tasks:

Delivery tracking
Ride-sharing
Messaging
VoIP calling
GPS/location
OTP listeners

Health/fitness trackers

Most Android phones block these apps unless Auto-Start is enabled.
This plugin solves that problem.

🛠️ Roadmap

Battery Optimization Detector
Background Data Restriction Check
Vendor Detection API
Deep Link to Battery Settings
Example app with UI

🤝 Contributing

Contributions are welcome!
Feel free to open an issue or submit a pull request.


⭐ Support the Project

## Example App

Check out the [example](https://github.com/sajibsaha4647/background_permission_checker.git) directory for a complete working app.

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

If you find this package helpful, please give it a ⭐ on [GitHub](https://github.com/sajibsaha4647/background_permission_checker.git)!
EOF