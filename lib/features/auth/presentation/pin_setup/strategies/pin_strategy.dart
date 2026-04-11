import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';

/// The state held by [PinNotifier].
class PinState {
  const PinState({this.digits = const [], this.result});

  final List<int> digits;

  /// Null until the PIN is complete and strategy execution has been attempted.
  final AsyncValue<void>? result;

  int get length => digits.length;

  PinState copyWith({List<int>? digits, AsyncValue<void>? result}) {
    return PinState(
      digits: digits ?? this.digits,
      result: result ?? this.result,
    );
  }
}

enum PinAction { create, confirm, unlock }

abstract interface class PinStrategy {
  const PinStrategy();

  String title(AppLocalizations l10n);
  String subtitle(AppLocalizations l10n);
  PinAction get action;
  Future<void> execute(String pin);
}
