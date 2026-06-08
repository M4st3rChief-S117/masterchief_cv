#!/bin/bash

# Run the flutter build web
flutter clean

flutter pub get

flutter build web

# Update the base href
sed -i 's|<base href="/">|<base href="/masterchief_cv/">|' build/web/index.html

echo "Updated base href in index.html"

cp -r build/web/* docs/

echo "Copied web dir in prod"