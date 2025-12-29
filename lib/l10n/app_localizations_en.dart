// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get locations => 'Locations';

  @override
  String get add => 'Add';

  @override
  String get edit => 'Edit';

  @override
  String get current => 'Current';

  @override
  String get savedLocations => 'SAVED LOCATIONS';

  @override
  String get addNewLocation => 'Add New Location';

  @override
  String get pleaseEnterCity => 'Please enter a city name';

  @override
  String get addLocationTitle => 'Add Location';

  @override
  String get searchHint => 'Enter city name';

  @override
  String get rightNow => 'Right Now';

  @override
  String get wind => 'Wind';

  @override
  String get humidity => 'Humidity';

  @override
  String get rain => 'Rain';

  @override
  String get uvIndex => 'UV INDEX';

  @override
  String get liveUpdates => 'Live Updates';

  @override
  String get language => 'Language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get thisWeek => 'This Week';

  @override
  String dayForecast(Object day) {
    return '$day Forecast';
  }

  @override
  String get maxTemp => 'Max Temp';

  @override
  String get minTemp => 'Min Temp';

  @override
  String get h => 'H';

  @override
  String get l => 'L';

  @override
  String get threeDayForecast => '3-Day Forecast';

  @override
  String get searchToStart => 'Search for a city to start';

  @override
  String get settings => 'Settings';

  @override
  String get findCityOrAirport => 'Find city or airport';
}
