class Exceptions {
  //waiting
  static const int WAITING = 0;
  static const String WAITING_MESSAGE = "Please wait";

  //unknown
  static const int UNKNOWN = 113;
  static const String UNKNOWN_MESSAGE =
      "Unknown exception occured. Please try again.";

  //success
  static const int SUCCESS = 200;
  static const String SUCCESS_MESSAGE = "Operation completed successfully";

  //success
  static const int FAILURE = 198;
  static const String FAILURE_MESSAGE = "Operation didnt complete successfully";

  //Register success
  static const int REGISTER_SUCCESS_CODE = 200;
  static const String REGISTER_SUCCESS_MESSAGE = "Operation successfully completed";

  //logout
  static const String SUCCESS_LOUGOUT_MESSAGE = "Operation successfully completed";
  static const int ERROR_LOGOUT = 6;
  static const String ERROR_LOGOUT_MESSAGE = "Could'nt logout. Try again";


  static const int BAD_REQUEST_CODE = 400;
  static const String BAD_REQUEST_MESSAGE = message;

  static const int UNATHORIZED_CODE = 401;
  static const String UNATHORIZED_MESSAGE = 'Username or password is incorrect';


  static const int FORBIDDEN_CODE = 403;
  static const String FORBIDDEN_CODE_MESSAGE = 'Access Denied';

  static const int NOT_FOUND_CODE = 404;
  static const String NOT_FOUND_MESSAGE = 'Our servers are busy. Please try again later';

  static const int REQUEST_TIMEOUT_CODE = 408;
  static const String REQUEST_TIMEOUT_MESSAGE = 'Please Try again';

  static const String message = 'Some error occured. Please try again';
  static const String HTTP_401 = 'Http status error [401]';

  static const String NO_INTERNET = 'No internet access';
  static const int CODE_NO_INTERNET = 7;


  static const String NO_link = 'No link provied to use this app';


  /////////Cart Operations////////////////////
  static const int CART_ADDED_SUCCESS = 1;
  static const int CART_ADDED_SUCCESS_COMPLETE = 2;
  static const int CART_ADDED_ERROR = 3;
  static const int CART_REMOVE_SUCCESS = 4;
  static const int CART_REMOVE_ERROR = 5;
  static const int CART_REMOVE_SUCCESS_COMPLETE = 6;
  static const int CART_UPDATE_SUCCESS = 7;
  static const int CART_UPDATE_ERROR = 8;
  static const int CART_FETCH = 9;
  static const int CART_INITIATE = 10;
  static const int ORDER_PLACED_SUCCESS = 11;
  static const int ORDER_PLACED_ERROR = 12;
  static const int USER_NULL_ERROR = 13;


}
