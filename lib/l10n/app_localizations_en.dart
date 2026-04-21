// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get add => 'Add';

  @override
  String get required => 'Required';

  @override
  String get all => 'All';

  @override
  String get regenerate => 'Regenerate';

  @override
  String get appName => 'Vaultly';

  @override
  String get appTagline =>
      'Vaultly uses a Master PIN instead of a password for total privacy.';

  @override
  String get emailLabel => 'Secure Email Address';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCode => 'Send Verification Code';

  @override
  String get emailRequired => 'Please enter your email';

  @override
  String get emailInvalid => 'Please enter a valid email';

  @override
  String get verifyEmail => 'Verify Email';

  @override
  String get securityCheck => 'Security Check';

  @override
  String get otpSentPrefix => 'We sent a 6-digit code to ';

  @override
  String get otpSentSuffix => '. Please enter it below to continue.';

  @override
  String get didntReceiveIt => 'Didn\'t receive it?';

  @override
  String resendIn(int seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String resendAvailableIn(int seconds) {
    return 'Resend available in $seconds seconds';
  }

  @override
  String get resend => 'Resend';

  @override
  String get incorrectCode => 'Incorrect code, try again';

  @override
  String get createPinTitle => 'Create your PIN';

  @override
  String get createPinSubtitle =>
      'Your PIN encrypts your vault. We never store it.';

  @override
  String get confirmPinTitle => 'Confirm your PIN';

  @override
  String get confirmPinSubtitle => 'Enter your PIN again to confirm.';

  @override
  String get unlockPinTitle => 'Enter your PIN';

  @override
  String get unlockPinSubtitle => 'Unlock your vault to continue.';

  @override
  String get changePinVerifyTitle => 'Enter current PIN';

  @override
  String get changePinVerifySubtitle =>
      'Confirm your identity before changing your PIN.';

  @override
  String get changePinNewTitle => 'Enter new PIN';

  @override
  String get changePinNewSubtitle => 'Choose a new 6-digit PIN for your vault.';

  @override
  String get changePinConfirmTitle => 'Confirm new PIN';

  @override
  String get changePinConfirmSubtitle => 'Enter your new PIN again to confirm.';

  @override
  String get pinChanged => 'PIN changed successfully.';

  @override
  String get hello => 'Hello!';

  @override
  String get settings => 'Settings';

  @override
  String get deletePasswordTitle => 'Delete password?';

  @override
  String deletePasswordConfirmMessage(String name) {
    return 'Remove \"$name\" from your vault?';
  }

  @override
  String get passwordDeleted => 'Password deleted.';

  @override
  String get failedToDelete => 'Failed to delete.';

  @override
  String get couldNotLoadPasswords => 'Could not load passwords.';

  @override
  String get secureVaultTitle => 'Secure your vault';

  @override
  String get secureVaultSubtitle => 'Create a PIN to encrypt your passwords';

  @override
  String get createPin => 'Create\nPIN';

  @override
  String get vaultEmpty => 'Your vault is empty';

  @override
  String get vaultEmptySubtitle =>
      'Tap + to add your first password\nand keep your life organized.';

  @override
  String get createPinToAdd => 'Create a PIN to add passwords to your vault';

  @override
  String get newPassword => 'New Password';

  @override
  String get editPassword => 'Edit Password';

  @override
  String get savePassword => 'Save password';

  @override
  String get selectTagError => 'Please select a tag.';

  @override
  String get siteNameHint => 'e.g. Replit';

  @override
  String get siteNameLabel => 'Site/App Name';

  @override
  String get usernameHint => 'user@example.com';

  @override
  String get usernameLabel => 'Username or Email';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get passwordHint => '•••••••••••';

  @override
  String get passwordLabel => 'Password';

  @override
  String get generateSecureKey => 'Generate Secure Key';

  @override
  String get notesHint => 'Secret questions, ...etc.';

  @override
  String get notesLabel => 'Optional Notes';

  @override
  String get passwordSaved => 'Password saved!';

  @override
  String get failedToSave => 'Failed to save. Please try again.';

  @override
  String get addTagTitle => 'Add Tag';

  @override
  String get tagNameHint => 'e.g. Gaming';

  @override
  String get tagNameLabel => 'Tag Name';

  @override
  String get categoryTags => 'Category Tags';

  @override
  String get addTagButton => 'Add Tag';

  @override
  String get strengthWeak => 'WEAK';

  @override
  String get strengthModerate => 'MODERATE';

  @override
  String get strengthSecure => 'SECURE';

  @override
  String get pageNotFound => 'Page Not Found';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get vaultIdentity => 'VAULT IDENTITY';

  @override
  String get biometricTouchToUnlock => 'TOUCH TO UNLOCK';

  @override
  String get biometricOrUsePin => 'OR USE YOUR PIN';

  @override
  String get biometricPromptReason =>
      'Use your fingerprint to unlock your vault';

  @override
  String get biometricUnlockSemanticLabel => 'Unlock with fingerprint';

  @override
  String get settingsAuthSection => 'Authentication';

  @override
  String get settingsChangeMasterPin => 'Change Master PIN';

  @override
  String get settingsChangeMasterPinSubtitle =>
      'Update your 6-digit access code';

  @override
  String get settingsSetupPinFirst => 'Set up a PIN first';

  @override
  String get settingsBiometricUnlock => 'Biometric Unlock';

  @override
  String get settingsBiometricUnlockSubtitle => 'Use Fingerprint';

  @override
  String get settingsAutoLockSection => 'Auto-lock';

  @override
  String get settingsLockOnBackground => 'Lock on Background';

  @override
  String get settingsLockOnBackgroundSubtitle => 'Lock when app is minimized';

  @override
  String get settingsAppearanceSection => 'Appearance';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeSubtitle => 'Choose light, dark, or system default';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsAppLanguage => 'App Language';

  @override
  String get settingsAppLanguageSubtitle => 'Choose your preferred language';

  @override
  String get settingsDataSection => 'Data';

  @override
  String get settingsWipeAllData => 'Wipe All Data';

  @override
  String get settingsWipeAllDataSubtitle =>
      'Irreversible. Permanent vault deletion.';

  @override
  String get settingsWipeAllDataConfirmTitle => 'Wipe All Data?';

  @override
  String get settingsWipeAllDataConfirmMessage =>
      'This will permanently delete all your vault data. This action cannot be undone.';
}
