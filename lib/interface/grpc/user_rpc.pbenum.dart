///
//  Generated code. Do not modify.
//  source: user_rpc.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Result extends $pb.ProtobufEnum {
  static const Result SUCCESS = const Result._(0, 'SUCCESS');
  static const Result FAILED = const Result._(1, 'FAILED');

  static const List<Result> values = const <Result> [
    SUCCESS,
    FAILED,
  ];

  static final Map<int, Result> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Result valueOf(int value) => _byValue[value];

  const Result._(int v, String n) : super(v, n);
}

