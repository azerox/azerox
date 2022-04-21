import 'package:azerox/app/models/state_model.dart';
import 'package:azerox/app/models/country_model.dart';
import 'package:azerox/app/models/city_model.dart';
import 'package:azerox/app/modules/repositories/ibge_repository.dart';
import 'package:dio/dio.dart';

class IBGERepositoryImp extends IBGERepository {
  final Dio _httpClient;

  IBGERepositoryImp({required Dio httpClient}) : _httpClient = httpClient;

  @override
  Future<List<CityModel>> findAllCities(int stateCode) async {
    final res = await _httpClient.get(
      "/jsonCities.asmx/GetCities?sessionId=wnnvvbsz0k4gvu10wagbdybo&codState=$stateCode",
    );
    final list = res.data as List;
    return list.map<CityModel>((e) => CityModel.fromMap(e)).toList();
  }

  @override
  Future<List<CountryModel>> findAllCountries() async {
    final res = await _httpClient.get(
      "/jsoncountries.asmx/GetCountries",
    );
    final list = res.data as List;
    return list.map<CountryModel>((e) => CountryModel.fromMap(e)).toList();
  }

  @override
  Future<List<StateModel>> findAllStates(int countryCode) async {
    final res = await _httpClient.get(
      "/jsonStates.asmx/GetStates?codCountry=$countryCode",
    );
    final list = res.data as List;
    return list.map<StateModel>((e) => StateModel.fromMap(e)).toList();
  }
}
