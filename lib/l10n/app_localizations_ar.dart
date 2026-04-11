// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get delete => 'حذف';

  @override
  String get add => 'إضافة';

  @override
  String get required => 'مطلوب';

  @override
  String get all => 'الكل';

  @override
  String get regenerate => 'إعادة توليد';

  @override
  String get appName => 'Vaultly';

  @override
  String get appTagline =>
      'يستخدم Vaultly رقم دخول بدلاً من كلمة المرور لضمان الخصوصية التامة.';

  @override
  String get emailLabel => 'البريد الإلكتروني الآمن';

  @override
  String get emailHint => 'name@example.com';

  @override
  String get sendCode => 'إرسال رمز التحقق';

  @override
  String get emailRequired => 'الرجاء إدخال البريد الإلكتروني';

  @override
  String get emailInvalid => 'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get verifyEmail => 'تحقق من البريد';

  @override
  String get securityCheck => 'التحقق الأمني';

  @override
  String get otpSentPrefix => 'أرسلنا رمزاً من 6 أرقام إلى ';

  @override
  String get otpSentSuffix => '. الرجاء إدخاله أدناه للمتابعة.';

  @override
  String get didntReceiveIt => 'لم تستلمه؟';

  @override
  String resendIn(int seconds) {
    return 'إعادة الإرسال خلال $secondsث';
  }

  @override
  String resendAvailableIn(int seconds) {
    return 'إعادة الإرسال متاحة خلال $seconds ثانية';
  }

  @override
  String get resend => 'إعادة الإرسال';

  @override
  String get incorrectCode => 'رمز غير صحيح، حاول مجدداً';

  @override
  String get createPinTitle => 'أنشئ رمز الدخول';

  @override
  String get createPinSubtitle =>
      'يقوم رمز دخول بتشفير قبو كلماتك. لا نقوم بتخزينه أبداً.';

  @override
  String get confirmPinTitle => 'أكّد رمز الدخول';

  @override
  String get confirmPinSubtitle => 'أدخل رمز الدخول مرة أخرى للتأكيد.';

  @override
  String get unlockPinTitle => 'أدخل رمز الدخول';

  @override
  String get unlockPinSubtitle => 'افتح الخزنة للمتابعة.';

  @override
  String get hello => 'مرحباً!';

  @override
  String get settings => 'الإعدادات';

  @override
  String get deletePasswordTitle => 'حذف كلمة المرور؟';

  @override
  String deletePasswordConfirmMessage(String name) {
    return 'إزالة \"$name\" من الخزنة؟';
  }

  @override
  String get passwordDeleted => 'تم حذف كلمة المرور.';

  @override
  String get failedToDelete => 'فشل الحذف.';

  @override
  String get couldNotLoadPasswords => 'تعذّر تحميل كلمات المرور.';

  @override
  String get secureVaultTitle => 'أمّن خزنتك';

  @override
  String get secureVaultSubtitle => 'أنشئ رمز الدخول لتشفير كلمات مرورك';

  @override
  String get createPin => 'إنشاء\nرمز الدخول';

  @override
  String get vaultEmpty => 'الخزنة فارغة';

  @override
  String get vaultEmptySubtitle => 'اضغط + لإضافة أول كلمة مرور\nونظّم حياتك.';

  @override
  String get createPinToAdd => 'أنشئ رمز الدخول لإضافة كلمات مرور إلى الخزنة';

  @override
  String get newPassword => 'كلمة مرور جديدة';

  @override
  String get editPassword => 'تعديل كلمة المرور';

  @override
  String get savePassword => 'حفظ كلمة المرور';

  @override
  String get selectTagError => 'الرجاء اختيار وسم.';

  @override
  String get siteNameHint => 'مثال: Replit';

  @override
  String get siteNameLabel => 'اسم الموقع / التطبيق';

  @override
  String get usernameHint => 'user@example.com';

  @override
  String get usernameLabel => 'اسم المستخدم أو البريد';

  @override
  String get showPassword => 'إظهار كلمة المرور';

  @override
  String get hidePassword => 'إخفاء كلمة المرور';

  @override
  String get passwordHint => '•••••••••••';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get generateSecureKey => 'توليد مفتاح آمن';

  @override
  String get notesHint => 'أسئلة سرية، إلخ.';

  @override
  String get notesLabel => 'ملاحظات اختيارية';

  @override
  String get passwordSaved => 'تم حفظ كلمة المرور!';

  @override
  String get failedToSave => 'فشل الحفظ. الرجاء المحاولة مجدداً.';

  @override
  String get addTagTitle => 'إضافة وسم';

  @override
  String get tagNameHint => 'مثال: الألعاب';

  @override
  String get tagNameLabel => 'اسم الوسم';

  @override
  String get categoryTags => 'وسوم الفئة';

  @override
  String get addTagButton => 'إضافة وسم';

  @override
  String get strengthWeak => 'ضعيف';

  @override
  String get strengthModerate => 'متوسط';

  @override
  String get strengthSecure => 'آمن';

  @override
  String get pageNotFound => 'الصفحة غير موجودة';

  @override
  String get goToHome => 'العودة للرئيسية';

  @override
  String get vaultIdentity => 'هوية الخزنة';
}
