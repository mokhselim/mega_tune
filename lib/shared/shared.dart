import 'package:haptic_feedback/haptic_feedback.dart';

Future<void> addHaptic({
  bool error = false,
}) async {
  final canVibrate = await Haptics.canVibrate();
  if (canVibrate) {
    await Haptics.vibrate(error ? HapticsType.error : HapticsType.selection,);
  }
}
