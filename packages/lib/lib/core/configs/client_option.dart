class ClientOption {
  final String serverUrl;
  final String applicationId;
  final bool routeTracking;
  final bool debug;
  final bool offline;
  final Duration logInterval;
  final Duration actionInterval;
  final Duration actionDelayAfterInit;
  final Duration actionDelayBetween;

  ClientOption(
      {required this.serverUrl,
      required this.applicationId,
      required this.routeTracking,
      this.offline = false,
      this.debug = false,
      this.logInterval = const Duration(seconds: 5),
      this.actionInterval = const Duration(seconds: 1),
      this.actionDelayAfterInit = const Duration(seconds: 0),
      this.actionDelayBetween = const Duration(seconds: 0)});
}
