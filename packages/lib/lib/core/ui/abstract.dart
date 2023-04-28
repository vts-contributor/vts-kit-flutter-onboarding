import 'package:vts_kit_flutter_onboarding/core/types/action.dart' as Type;

abstract class UIAbstract {
  String getName();

  // Validate function to validate payload before making it display
  Future<bool> validate(Type.Action action);

  // Call before validating to clear or prepare context (if needed)
  Future<void> initialize(Type.Action action);

  // Call on default showing flow
  Future<void> show(Type.Action action);

  // Call on force hiding (manually)
  Future<void> dismiss(Type.Action action);

  // Call after `show` successfully or `hide` successfully
  Future<void> destroy(Type.Action action);
}
