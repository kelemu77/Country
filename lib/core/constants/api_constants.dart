class ApiConstants {
  static const String baseUrl = 'https://restcountries.com/v3.1';
  
  static String getAllCountries() => '$baseUrl/all?fields=name,flags,population,cca2';
  static String searchByName(String name) => '$baseUrl/name/$name?fields=name,flags,population,cca2';
  static String getCountryByCode(String code) => '$baseUrl/alpha/$code?fields=name,flags,population,capital,region,subregion,area,timezones';
}

