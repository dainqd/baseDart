// File header_interceptor
// @project flutter-base-bloc-localization-dio
// @author dainq on 13-07-2021
part of 'interceptor.dart';

class HeaderInterceptor extends Interceptor {
  final HeaderAuthorized? headerAuthorized;

  HeaderInterceptor(this.headerAuthorized);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (headerAuthorized?.accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] =
          headerAuthorized?.token;
    }
    options.contentType = Headers.jsonContentType;
    super.onRequest(options, handler);
  }
}
