import 'package:grpc/grpc.dart';
import "package:clasick_flutter/interface/grpc/user_rpc.pbgrpc.dart";

class UserClient {
  // Create Singleton Object
  static UserClient _instance;

  factory UserClient() {
    if (_instance == null) _instance = new UserClient._internal();
    return _instance;
  }


  final client = new UserRpcClient(
      new ClientChannel(
          'localhost',
          port: 50051,
          options: const ChannelOptions(
              credentials: const ChannelCredentials.insecure()
          )
      )
  );

  UserClient._internal();

}