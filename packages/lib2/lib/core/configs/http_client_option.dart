class HttpClientOption {
  final String serverUrl;
  final Duration connectionTimeout = Duration(seconds: 60);
  final Duration receiveTimeout = Duration(seconds: 60);
  final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
  final bool debug;

  HttpClientOption({required this.serverUrl, this.debug = false});
}