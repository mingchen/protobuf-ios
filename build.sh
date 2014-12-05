#!/bin/sh -x

xctool -project runtime/protobuf-ios/protobuf-ios.xcodeproj  -scheme protobuf-ios build

#xctool -project runtime/protobuf-ios/protobuf-ios.xcodeproj  -scheme protobuf-iosTests build test -sdk iphonesimulator
