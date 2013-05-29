protobuf-ios
============


# Introduction

This is a protobuf iOS library.


## Supported Platform

* iOS 4.0 and above


# Features

- Support write to / parse from delimited stream (protobuf 2.3 feature).

# How to use

## Get the compiler

    cd compiler
    ./autogen.sh
    ./configure
    make
    make install (optional)

The compiler is genrated at `src/protoc`.

## Usage

    ./src/protoc --objc_out=. foo.proto

## Xcode integration

Drap `protoc-ios.xcodeproj` to your Xcode project.

That's all.


# Credits

- Booyah Inc (https://github.com/booyah/protobuf-objc)
- Cyrus Najmabadi (http://code.google.com/p/metasyntactic/wiki/ProtocolBuffers)


# References

- https://developers.google.com/protocol-buffers/
- https://developers.google.com/protocol-buffers/docs/encoding

