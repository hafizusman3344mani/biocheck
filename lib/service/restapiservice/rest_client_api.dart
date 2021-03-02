
import 'package:biocheck/common/constants.dart';
import 'package:biocheck/models/apimodels/authorization/user.dart';
import 'package:biocheck/models/apimodels/common_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_api.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class RestClientApi {
  factory RestClientApi(Dio dio) = _RestClientApi;

  @POST("authentication/authorize")
  Future<CommonResponse> validateUser(@Body() User user);

  @GET("franchise/list")
  Future<CommonResponse> getFranchises();
}