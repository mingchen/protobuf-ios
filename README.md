# Intro

# Features

- Support write to / parse from delimited stream.

# How to use

## Get the compiler

    cd compiler
    ./autogen.sh
    ./configure
    make
    make install (optional)

The compiler is genrated at `src/protoc`.

## Usage

    src/protoc --objc_out=. foo.proto

## Xcode setup

Drap `protoc-ios.xcodeproj` to your Xcode project.
That's all.


# Credits

- Booyah Inc (https://github.com/booyah/protobuf-objc)
- Cyrus Najmabadi (http://code.google.com/p/metasyntactic/wiki/ProtocolBuffers)


# References

- https://developers.google.com/protocol-buffers/
- https://developers.google.com/protocol-buffers/docs/encoding

