// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get locations => 'المواقع';

  @override
  String get add => 'إضافة';

  @override
  String get edit => 'تعديل';

  @override
  String get current => 'الحالي';

  @override
  String get savedLocations => 'المواقع المحفوظة';

  @override
  String get addNewLocation => 'إضافة موقع جديد';

  @override
  String get pleaseEnterCity => 'من فضلك أدخل اسم المدينة';

  @override
  String get addLocationTitle => 'إضافة موقع';

  @override
  String get searchHint => 'أدخل اسم المدينة';

  @override
  String get rightNow => 'الآن';

  @override
  String get wind => 'الرياح';

  @override
  String get humidity => 'الرطوبة';

  @override
  String get rain => 'الأمطار';

  @override
  String get uvIndex => 'مؤشر الأشعة فوق البنفسجية';

  @override
  String get liveUpdates => 'تحديثات مباشرة';

  @override
  String get language => 'اللغة';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الفاتح';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String dayForecast(Object day) {
    return 'توقعات $day';
  }

  @override
  String get maxTemp => 'أعلى درجة';

  @override
  String get minTemp => 'أقل درجة';

  @override
  String get h => 'ع';

  @override
  String get l => 'ص';

  @override
  String get threeDayForecast => 'توقعات 3 أيام';

  @override
  String get searchToStart => 'ابحث عن مدينة للبدء';

  @override
  String get settings => 'الإعدادات';

  @override
  String get findCityOrAirport => 'ابحث عن مدينة أو مطار';
}
