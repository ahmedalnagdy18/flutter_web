# Launcher Icon Generator
flutter pub run flutter_launcher_icons

# Add Update To Git
flutter build web --base-href="/flutter_web/"
flutter pub global run peanut --extra-args "--base-href=/flutter_web/"
git push origin gh-pages --force