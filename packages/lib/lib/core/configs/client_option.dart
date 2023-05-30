class ClientOption {
  final String serverUrl;
  final String applicationId;
  final bool debug;
  final bool offline;
  final Duration logInterval = Duration(seconds: 5);
  final Duration actionInterval = Duration(seconds: 5);
  final Duration actionDelayAfterInit = Duration(seconds: 0);
  final Duration actionDelayBetween = Duration(seconds: 0);

  ClientOption(
      {required this.serverUrl,
      required this.applicationId,
      this.offline = false,
      this.debug = false});
}
