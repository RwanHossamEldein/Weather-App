class Model {
  final Location location;
  final Current current;
  final Forecast forecast;

  Model({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'current': current.toJson(),
      'forecast': forecast.toJson(),
    };
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      localtime: json['localtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'localtime': localtime,
    };
  }
}

class Current {
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windKph;
  final int humidity;
  final double feelslikeC;
  final double feelslikeF;
  final double uv;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      uv: json['uv'],
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'].toDouble(),
      tempF: json['temp_f'].toDouble(),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      humidity: json['humidity'],
      feelslikeC: json['feelslike_c'].toDouble(),
      feelslikeF: json['feelslike_f'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_updated': lastUpdated,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_kph': windKph,
      'humidity': humidity,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      'uv': uv,
    };
  }
}

class Condition {
  final String text;
  final String icon;

  Condition({required this.text, required this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(text: json['text'], icon: json['icon']);
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon};
  }
}

class Forecast {
  final List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: (json['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'forecastday': forecastday.map((day) => day.toJson()).toList()};
  }
}

class ForecastDay {
  final String date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: (json['hour'] as List).map((h) => Hour.fromJson(h)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': day.toJson(),
      'astro': astro.toJson(),
      'hour': hour.map((h) => h.toJson()).toList(),
    };
  }
}

class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final int avghumidity;
  final Condition condition;
  final int dailyChanceOfRain;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.avghumidity,
    required this.condition,
    required this.dailyChanceOfRain,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json['maxtemp_c'].toDouble(),
      maxtempF: json['maxtemp_f'].toDouble(),
      mintempC: json['mintemp_c'].toDouble(),
      mintempF: json['mintemp_f'].toDouble(),
      avgtempC: json['avgtemp_c'].toDouble(),
      avgtempF: json['avgtemp_f'].toDouble(),
      avghumidity: json['avghumidity'],
      condition: Condition.fromJson(json['condition']),
      dailyChanceOfRain: json['daily_chance_of_rain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maxtemp_c': maxtempC,
      'maxtemp_f': maxtempF,
      'mintemp_c': mintempC,
      'mintemp_f': mintempF,
      'avgtemp_c': avgtempC,
      'avgtemp_f': avgtempF,
      'avghumidity': avghumidity,
      'condition': condition.toJson(),
      'daily_chance_of_rain': dailyChanceOfRain,
    };
  }
}

class Astro {
  final String sunrise;
  final String sunset;

  Astro({required this.sunrise, required this.sunset});

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(sunrise: json['sunrise'], sunset: json['sunset']);
  }

  Map<String, dynamic> toJson() {
    return {'sunrise': sunrise, 'sunset': sunset};
  }
}

class Hour {
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windKph;
  final int humidity;
  final double feelslikeC;
  final double feelslikeF;
  final int chanceOfRain;

  Hour({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.chanceOfRain,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      tempC: json['temp_c'].toDouble(),
      tempF: json['temp_f'].toDouble(),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      humidity: json['humidity'],
      feelslikeC: json['feelslike_c'].toDouble(),
      feelslikeF: json['feelslike_f'].toDouble(),
      chanceOfRain: json['chance_of_rain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_kph': windKph,
      'humidity': humidity,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      'chance_of_rain': chanceOfRain,
    };
  }
}
