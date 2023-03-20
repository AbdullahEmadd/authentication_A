import 'dart:developer';
const Map<String, String> apiHeaders = {
  "Content-Type":"application/json",
  "Accept": "application/json, text/plain, */*",
};

void debugApi({
  required String methodName,
  required int statusCode,
  required response,
  required data,
  required String endPoint,
  headers,
}) {
  log(
    "methode: $methodName\n"
        "URL: $endPoint\n "
        "statusCode: $statusCode\n"
        "${response != null ? 'Response: $response\n' : ''}"
        "${data != null ? 'data: $data\n' : ''}"
        "${headers != null ? 'headers: $headers\n' : ''}"
        "--------------------",
  );
}

Uri getUri(String endpoint, {Map<String, String>? params}) {
  Uri uri = Uri.parse(endpoint);
  if (params != null) uri = uri.replace(queryParameters: params);
  return uri;
}

