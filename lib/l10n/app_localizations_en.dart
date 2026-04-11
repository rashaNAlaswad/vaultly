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
}
