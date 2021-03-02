import 'package:biocheck/models/local/result.dart';

import 'exception_codes_messages.dart';

class Generic{

  static Result waitResult()
  {
    var res = Result();
    res.code = Exceptions.WAITING;
    res.message = Exceptions.WAITING_MESSAGE;
    return res;
  }

}