// Protocol Buffers - Google's data interchange format
// Copyright 2008 Google Inc.
// http://code.google.com/p/protobuf/
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// Author: cyrusn@google.com (Cyrus Najmabadi)
//  Based on original Protocol Buffers design by
//  Sanjay Ghemawat, Jeff Dean, and others.

#include <google/protobuf/compiler/objectivec/objectivec_generator.h>
#include <google/protobuf/compiler/objectivec/objectivec_file.h>
#include <google/protobuf/compiler/objectivec/objectivec_helpers.h>
#include <google/protobuf/io/printer.h>
#include <google/protobuf/io/zero_copy_stream.h>
#include <google/protobuf/descriptor.pb.h>
#include <google/protobuf/stubs/strutil.h>

namespace google { namespace protobuf { namespace compiler { namespace objectivec {
  namespace {

    // Parses a set of comma-delimited name/value pairs, e.g.:
    //   "foo=bar,baz,qux=corge"
    // parses to the pairs:
    //   ("foo", "bar"), ("baz", ""), ("qux", "corge")
    void ParseOptions(const string& text, vector<pair<string, string> >* output) {
      vector<string> parts;
      SplitStringUsing(text, ",", &parts);

      for (int i = 0; i < parts.size(); i++) {
        string::size_type equals_pos = parts[i].find_first_of('=');
        pair<string, string> value;
        if (equals_pos == string::npos) {
          value.first = parts[i];
          value.second = "";
        } else {
          value.first = parts[i].substr(0, equals_pos);
          value.second = parts[i].substr(equals_pos + 1);
        }
        output->push_back(value);
      }
    }
  }  // namespace


  ObjectiveCGenerator::ObjectiveCGenerator() {
  }


  ObjectiveCGenerator::~ObjectiveCGenerator() {
  }


  bool ObjectiveCGenerator::Generate(const FileDescriptor* file,
    const string& parameter,
    OutputDirectory* output_directory,
    string* error) const {
      vector<pair<string, string> > options;
      ParseOptions(parameter, &options);

      string output_list_file;

      for (int i = 0; i < options.size(); i++) {
        if (options[i].first == "output_list_file") {
          output_list_file = options[i].second;
        } else {
          *error = "Unknown generator option: " + options[i].first;
          return false;
        }
      }

      FileGenerator file_generator(file);

      string filepath = FilePath(file);

      // Generate header.
      {
        scoped_ptr<io::ZeroCopyOutputStream> output(
          output_directory->Open(filepath + ".pb.h"));
        io::Printer printer(output.get(), '$');
        file_generator.GenerateHeader(&printer);
      }

      // Generate m file.
      {
        scoped_ptr<io::ZeroCopyOutputStream> output(
          output_directory->Open(filepath + ".pb.m"));
        io::Printer printer(output.get(), '$');
        file_generator.GenerateSource(&printer);
      }

      return true;
  }

}  // namespace objectivec
}  // namespace compiler
}  // namespace protobuf
}  // namespace google