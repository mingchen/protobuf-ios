# protobuf-ios

## Introduction

[![travis-ci build status](https://travis-ci.org/mingchen/protobuf-ios.svg?branch=master)](https://travis-ci.org/mingchen/protobuf-ios)

An **Objective-C** implementation of Google **proto buffer** for **iOS**. 
The orignal code comes from [Booyah Inc](https://github.com/booyah/protobuf-objc). This implemenation add features to support write to / parse from delimited stream. This git repo also support [cocoapods](http://cocoapods.org).

## Supported Platform

* iOS 4.0 and above
* XCode 4 and above


## Features

- Support write to / parse from delimited stream (protobuf 2.3 feature).

## Examples

### Simple Usage

You write a `foo.proto` file like this:

    message Person {
        required int32 id = 1;
        required string name = 2;
        optional string email = 3;
    }
    
Then you compile it with `protoc` to produce code in Objective-C (see below).

Serialize to protobuf format:

    Person* person = [[[[[Person builder] setId:123]
                                        setName:@"Bob"]
                                       setEmail:@"bob@example.com"] build];
    NSData* data = [person data];
    
Unserialize from protobuf format data:

    NSData* raw_data = ...;
    Person* person = [Person parseFromData:raw_data];

### Delimited encode

Sometime is very useful to write multiple protobuf objects into a single file.
This need use delimited format. Here is an example:
    
    // serialize
    NSOutputStream *ouputStream = [NSOutputStream outputStreamToFileAtPath:@"filename.dat" append:YES];
    [ouputStream open];
    for (int i=0; i<count; i++) {
        // create a new Person object and assign value.
        Person* person = ...;
        
        // write to stream use delimited format
        [person writeDelimitedToOutputStream:outputStream];
    }
    
    // unserialize
    NSInputStream* inputStream = ...;
    while(true) {
        // read object one by one from stream.
        Person* person = [Person parseDelimitedFromInputStream:inputStream];
        if (!person) {
            break;
        }
        
        ....
        ....
    }
    
## Xcode integration

### Integrate with CocoaPods

If your project support [cocoapods](http://cocoapods.org), add a line to your **Podfile**:

    pod 'protobuf-ios'

Then update your dependences:

    pod update


### Integrate with source code

Drag `protoc-ios.xcodeproj` to your Xcode project.

That's all.


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

To compile the **proto** definition to **Objective-C**, use following command:

    ./src/protoc --objc_out=. foo.proto


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

