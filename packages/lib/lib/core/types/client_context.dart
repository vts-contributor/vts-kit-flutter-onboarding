import 'package:vts_kit_flutter_onboarding/core/services/action_queue.dart';
import 'package:vts_kit_flutter_onboarding/core/services/api.dart';
import 'package:vts_kit_flutter_onboarding/core/services/event_service.dart';
import 'package:vts_kit_flutter_onboarding/core/services/http_client.dart';

class ClientContext {
  final HttpClient httpClient;
  final ApiClient? apiClient;
  final EventService? eventService;
  final ActionQueue? actionQueue;

  ClientContext(
      {required this.httpClient,
      this.apiClient,
      this.eventService,
      this.actionQueue});
}
