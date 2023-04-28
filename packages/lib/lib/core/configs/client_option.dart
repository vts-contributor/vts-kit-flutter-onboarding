class ClientOption {
  final String serverUrl;
  final String applicationId;
  final bool debug;
  final Duration logInterval = Duration(seconds: 5);
  final Duration actionInterval = Duration(seconds: 5);

  ClientOption(
      {required this.serverUrl,
      required this.applicationId,
      this.debug = false});
}
