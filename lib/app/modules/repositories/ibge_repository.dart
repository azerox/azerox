import 'package:azerox/app/models/city_model.dart';
import 'package:azerox/app/models/country_model.dart';
import 'package:azerox/app/models/state_model.dart';

abstract class IBGERepository {
  Future<List<CountryModel>> findAllCountries();
  Future<List<StateModel>> findAllStates(int countryCode);
  Future<List<CityModel>> findAllCities(int stateCode);
}
