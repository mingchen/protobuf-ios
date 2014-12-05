# protobuf-ios

## Introduction

[![travis-ci build status](https://travis-ci.org/mingchen/protobuf-ios.svg?branch=master)](https://travis-ci.org/mingchen/protobuf-ios)

Google proto buffer for **iOS** written in **Objective-C**

### Supported Platform

* iOS 4.0 and above
* XCode 4 and above


## Features

- Support write to / parse from delimited stream (protobuf 2.3 feature).

## How to use

### Get the compiler

Run following command to compile and install the project.

    $ cd compiler
    $ ./autogen.sh
    $ ./configure
    $ make
    $ make install (optional)

The compiler is genrated at `src/protoc`.

*Note:*

You need `autoconf` to compile from source code. If your system is not install autoconf, you can install it by brew:

    $ brew install autoconf

If you system already install autoconf but linked, you can link it, here is an example:

    $ brew install autoconf
    Warning: autoconf-2.69 already installed, it's just not linked    
    $ brew link autoconf
    Linking /usr/local/Cellar/autoconf/2.69... 28 symlinks created

### Usage

    ./src/protoc --objc_out=. foo.proto

### Xcode integration

#### Integrate with CocoaPods

If your project support [cocoapods](http://cocoapods.org), add a line to your **Podfile**:

    pod 'protobuf-ios'

Then update your dependences:

    pod update


#### Integrate with source code

Drag `protoc-ios.xcodeproj` to your Xcode project.

That's all.


## Contribution

Contributions are welcome!

If you would like to contribute this project,
please feel free to [fork](https://github.com/mingchen/protobuf-ios/fork) and send **pull** request.


# Credits

- [Booyah Inc](https://github.com/booyah/protobuf-objc)
- [Cyrus Najmabadi](http://code.google.com/p/metasyntactic/wiki/ProtocolBuffers)


# References

- https://developers.google.com/protocol-buffers/
- https://developers.google.com/protocol-buffers/docs/encoding

