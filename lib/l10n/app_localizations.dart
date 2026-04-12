import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @regenerate.
  ///
  /// In en, this message translates to:
  /// **'Regenerate'**
  String get regenerate;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Vaultly'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Vaultly uses a Master PIN instead of a password for total privacy.'**
  String get appTagline;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Secure Email Address'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get emailHint;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Verification Code'**
  String get sendCode;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailInvalid;

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify Email'**
  String get verifyEmail;

  /// No description provided for @securityCheck.
  ///
  /// In en, this message translates to:
  /// **'Security Check'**
  String get securityCheck;

  /// No description provided for @otpSentPrefix.
  ///
  /// In en, this message translates to:
  /// **'We sent a 6-digit code to '**
  String get otpSentPrefix;

  /// No description provided for @otpSentSuffix.
  ///
  /// In en, this message translates to:
  /// **'. Please enter it below to continue.'**
  String get otpSentSuffix;

  /// No description provided for @didntReceiveIt.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive it?'**
  String get didntReceiveIt;

  /// No description provided for @resendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String resendIn(int seconds);

  /// No description provided for @resendAvailableIn.
  ///
  /// In en, this message translates to:
  /// **'Resend available in {seconds} seconds'**
  String resendAvailableIn(int seconds);

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @incorrectCode.
  ///
  /// In en, this message translates to:
  /// **'Incorrect code, try again'**
  String get incorrectCode;

  /// No description provided for @createPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your PIN'**
  String get createPinTitle;

  /// No description provided for @createPinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your PIN encrypts your vault. We never store it.'**
  String get createPinSubtitle;

  /// No description provided for @confirmPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm your PIN'**
  String get confirmPinTitle;

  /// No description provided for @confirmPinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN again to confirm.'**
  String get confirmPinSubtitle;

  /// No description provided for @unlockPinTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN'**
  String get unlockPinTitle;

  /// No description provided for @unlockPinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock your vault to continue.'**
  String get unlockPinSubtitle;

  /// No description provided for @changePinVerifyTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter current PIN'**
  String get changePinVerifyTitle;

  /// No description provided for @changePinVerifySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm your identity before changing your PIN.'**
  String get changePinVerifySubtitle;

  /// No description provided for @changePinNewTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter new PIN'**
  String get changePinNewTitle;

  /// No description provided for @changePinNewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a new 6-digit PIN for your vault.'**
  String get changePinNewSubtitle;

  /// No description provided for @changePinConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm new PIN'**
  String get changePinConfirmTitle;

  /// No description provided for @changePinConfirmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your new PIN again to confirm.'**
  String get changePinConfirmSubtitle;

  /// No description provided for @pinChanged.
  ///
  /// In en, this message translates to:
  /// **'PIN changed successfully.'**
  String get pinChanged;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get hello;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @deletePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete password?'**
  String get deletePasswordTitle;

  /// No description provided for @deletePasswordConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your vault?'**
  String deletePasswordConfirmMessage(String name);

  /// No description provided for @passwordDeleted.
  ///
  /// In en, this message translates to:
  /// **'Password deleted.'**
  String get passwordDeleted;

  /// No description provided for @failedToDelete.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete.'**
  String get failedToDelete;

  /// No description provided for @couldNotLoadPasswords.
  ///
  /// In en, this message translates to:
  /// **'Could not load passwords.'**
  String get couldNotLoadPasswords;

  /// No description provided for @secureVaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Secure your vault'**
  String get secureVaultTitle;

  /// No description provided for @secureVaultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create a PIN to encrypt your passwords'**
  String get secureVaultSubtitle;

  /// No description provided for @createPin.
  ///
  /// In en, this message translates to:
  /// **'Create\nPIN'**
  String get createPin;

  /// No description provided for @vaultEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your vault is empty'**
  String get vaultEmpty;

  /// No description provided for @vaultEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first password\nand keep your life organized.'**
  String get vaultEmptySubtitle;

  /// No description provided for @createPinToAdd.
  ///
  /// In en, this message translates to:
  /// **'Create a PIN to add passwords to your vault'**
  String get createPinToAdd;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @editPassword.
  ///
  /// In en, this message translates to:
  /// **'Edit Password'**
  String get editPassword;

  /// No description provided for @savePassword.
  ///
  /// In en, this message translates to:
  /// **'Save password'**
  String get savePassword;

  /// No description provided for @selectTagError.
  ///
  /// In en, this message translates to:
  /// **'Please select a tag.'**
  String get selectTagError;

  /// No description provided for @siteNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Replit'**
  String get siteNameHint;

  /// No description provided for @siteNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Site/App Name'**
  String get siteNameLabel;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'user@example.com'**
  String get usernameHint;

  /// No description provided for @usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username or Email'**
  String get usernameLabel;

  /// No description provided for @showPassword.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'•••••••••••'**
  String get passwordHint;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @generateSecureKey.
  ///
  /// In en, this message translates to:
  /// **'Generate Secure Key'**
  String get generateSecureKey;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Secret questions, ...etc.'**
  String get notesHint;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Optional Notes'**
  String get notesLabel;

  /// No description provided for @passwordSaved.
  ///
  /// In en, this message translates to:
  /// **'Password saved!'**
  String get passwordSaved;

  /// No description provided for @failedToSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save. Please try again.'**
  String get failedToSave;

  /// No description provided for @addTagTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Tag'**
  String get addTagTitle;

  /// No description provided for @tagNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Gaming'**
  String get tagNameHint;

  /// No description provided for @tagNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Tag Name'**
  String get tagNameLabel;

  /// No description provided for @categoryTags.
  ///
  /// In en, this message translates to:
  /// **'Category Tags'**
  String get categoryTags;

  /// No description provided for @addTagButton.
  ///
  /// In en, this message translates to:
  /// **'Add Tag'**
  String get addTagButton;

  /// No description provided for @strengthWeak.
  ///
  /// In en, this message translates to:
  /// **'WEAK'**
  String get strengthWeak;

  /// No description provided for @strengthModerate.
  ///
  /// In en, this message translates to:
  /// **'MODERATE'**
  String get strengthModerate;

  /// No description provided for @strengthSecure.
  ///
  /// In en, this message translates to:
  /// **'SECURE'**
  String get strengthSecure;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get pageNotFound;

  /// No description provided for @goToHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// No description provided for @vaultIdentity.
  ///
  /// In en, this message translates to:
  /// **'VAULT IDENTITY'**
  String get vaultIdentity;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
