// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClientApi implements RestClientApi {
  _RestClientApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://mijn.biocheck.nl/api/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<CommonResponse> validateUser(user) async {
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'authentication/authorize',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<CommonResponse> getFranchises() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('franchise/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CommonResponse.fromJson(_result.data);
    return value;
  }
}
