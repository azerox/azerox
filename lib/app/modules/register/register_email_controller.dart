import 'package:azerox/app/models/city_model.dart';
import 'package:azerox/app/models/country_model.dart';
import 'package:azerox/app/models/state_model.dart';
import 'package:azerox/app/modules/register/register_email_repository.dart';
import 'package:azerox/app/modules/repositories/ibge_repository.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';

class CadastroEmailController extends GetxController {
  final CadastroEmailRepository _loginRepository;
  final IBGERepository _ibgeRepository;
  CadastroEmailController({
    required CadastroEmailRepository loginRepository,
    required IBGERepository ibgeRepository,
  })  : _loginRepository = loginRepository,
        _ibgeRepository = ibgeRepository;

  final nomeEC = TextEditingController();
  final nickNameEC = TextEditingController();
  final publicProfileEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final _countries = <CountryModel>[].obs;
  final selectedDay = "Dia".obs;
  final selectedMonth = "Mês".obs;
  final selectedYear = "Ano".obs;

  final _selectedCountry = CountryModel.empty().obs;
  final _selectedState = StateModel().obs;
  final _selectedCity = CityModel().obs;
  final _states = <StateModel>[].obs;
  final _cities = <CityModel>[].obs;
  final politicPrivacies = false.obs;

  CountryModel get selectedCountry => _selectedCountry.value;
  set selectedCountry(CountryModel value) => _selectedCountry.value = value;

  StateModel get selectedState => _selectedState.value;
  set selectedState(StateModel value) => _selectedState(value);

  CityModel get selectedCity => _selectedCity.value;
  set selectedCity(CityModel value) => _selectedCity(value);

  List<CountryModel> get countries => _countries;
  List<StateModel> get states => _states;
  List<CityModel> get cities => _cities;

  _initializeController() {
    ever<CountryModel>(_selectedCountry, (country) {
      findAllStates();
    });
    ever<StateModel>(_selectedState, (state) {
      findAllCities();
    });
  }

  @override
  void onInit() {
    findAllCountries();
    _initializeController();
    super.onInit();
  }

  @override
  void onClose() {
    emailEC.dispose();
    nomeEC.dispose();
    passwordEC.dispose();
    publicProfileEC.dispose();
    nickNameEC.dispose();
    cityEC.dispose();
    stateEC.dispose();
    confirmPasswordEC.dispose();
    super.onClose();
  }

  Future<void> findAllCountries() async {
    var res = await _ibgeRepository.findAllCountries();
    _countries.assignAll(res);
  }

  Future<void> findAllStates() async {
    if (_selectedCountry.value.codCountry == 1) {
      var res = await _ibgeRepository.findAllStates(selectedCountry.codCountry);
      _states.assignAll(res);
    }
  }

  Future<void> findAllCities() async {
    if (_selectedCountry.value.codCountry == 1) {
      var res = await _ibgeRepository.findAllCities(selectedState.codeState);
      cities.assignAll(res);
    }
  }

  Future loginWithEmail() async {
    if ((formKey.currentState?.validate() ?? false) &&
        validCity.value &&
        validCountry.value &&
        validDate.value &&
        politicPrivacies.value &&
        validState.value) {
      try {
        isLoading(true);
        var res = await _loginRepository.validCreateAccount(
          email: emailEC.text,
          profile: publicProfileEC.text,
        );
        if (res.isNotEmpty) {
          Get.snackbar(
            "Ops",
            res.map((e) => "$e\n").join(),
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          var state = selectedState.state;
          var city = selectedCity.city;
          if (selectedCountry.codCountry > 1) {
            city = cityEC.text;
            state = stateEC.text.substring(0, 2);
          }
          final user = await _loginRepository.cadastroWithEmail(
            country: selectedCountry.country,
            state: state,
            city: city,
            day: selectedDay.value,
            month: selectedMonth.value,
            year: selectedYear.value,
            email: emailEC.text,
            name: nomeEC.text,
            nickName: nickNameEC.text,
            profile: publicProfileEC.text,
            password: passwordEC.text,
           );
          Get.find<AppController>().currentUser.value = user;
          isLoading.value = false;
          Get.snackbar(
            "Sucesso",
            "Sua conta foi cadastrada",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {

        Get.snackbar(
          "Ops",
          "Não foi possível criar sua conta",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading(false);
      }
    }
  }

  final validDate = true.obs;
  final validCountry = true.obs;
  final validState = true.obs;
  final validCity = true.obs;
  final validPolitics = true.obs;
  void validForm() {
    if (selectedDay.value == "Dia" ||
        selectedMonth.value == "Mês" ||
        selectedYear.value == "Ano") {
      validDate(false);
    } else {
      validDate(true);
    }
    if (selectedCity.city.isEmpty && cityEC.text.isEmpty) {
      validCity(false);
    } else {
      validCity(true);
    }
    if (selectedState.state.isEmpty && stateEC.text.isEmpty) {
      validState(false);
    } else {
      validState(true);
    }
    if (selectedCountry.country.isEmpty) {
      validCountry(false);
    } else {
      validCountry(true);
    }
    if (!politicPrivacies.value) {
      validPolitics(false);
    } else {
      validPolitics(true);
    }
    formKey.currentState?.validate();
    loginWithEmail();
  }
}
