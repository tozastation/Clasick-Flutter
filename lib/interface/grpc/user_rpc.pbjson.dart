///
//  Generated code. Do not modify.
//  source: user_rpc.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'FAILED', '2': 1},
  ],
};

const RequestSignIn$json = const {
  '1': 'RequestSignIn',
  '2': const [
    const {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

const ResponseSignIn$json = const {
  '1': 'ResponseSignIn',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'result', '3': 2, '4': 1, '5': 14, '6': '.user.Result', '10': 'result'},
  ],
};

const RequestSignUp$json = const {
  '1': 'RequestSignUp',
  '2': const [
    const {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'result', '3': 3, '4': 1, '5': 14, '6': '.user.Result', '10': 'result'},
  ],
};

const ResponseSignUp$json = const {
  '1': 'ResponseSignUp',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'result', '3': 2, '4': 1, '5': 14, '6': '.user.Result', '10': 'result'},
  ],
};

const ResponseUser$json = const {
  '1': 'ResponseUser',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const RequestGetSingleUser$json = const {
  '1': 'RequestGetSingleUser',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

const ResponseGetSingleUser$json = const {
  '1': 'ResponseGetSingleUser',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.user.ResponseUser', '10': 'user'},
    const {'1': 'result', '3': 2, '4': 1, '5': 14, '6': '.user.Result', '10': 'result'},
  ],
};

