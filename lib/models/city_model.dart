class CityModel {
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String cityName;
  final String date;
  final String condition;
  final String icon;

  CityModel({required this.temp,required this.maxTemp,
    required this.minTemp,required this.condition,
    required this.icon, required this.date, required this.cityName});
  factory CityModel.fromJson(json, img)
  {
return CityModel(
    temp: json['current']['temp_c'],
    maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
    minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    condition: json['current']['condition']['text'],
    icon: img,
    date: json['current']['last_updated'],
    cityName: json['location']['name']);
  }

}
