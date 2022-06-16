import 'package:azerox/app/config/app_routes.dart';
import 'package:azerox/app/core/ui/widgets/app_field.dart';
import 'package:azerox/app/core/ui/widgets/app_drop.dart';
import 'package:azerox/app/models/city_model.dart';
import 'package:azerox/app/models/country_model.dart';
import 'package:azerox/app/models/state_model.dart';
import 'package:azerox/app/modules/register/register_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask/mask.dart';


class CadastroEmailPage extends GetView<CadastroEmailController> {
  CadastroEmailPage({Key? key}) : super(key: key);

  List<String> items = ['Item1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Novo Cadastro"),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Get.offAllNamed(Routes.login);
          }
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(maxWidth: 600),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              AppField(
                label: "Nome",
                controller: controller.nomeEC,
                validation: Mask.validations.generic,
              ),
              AppField(
                label: "Apelido",
                controller: controller.apelidoEC,
                validation: Mask.validations.generic,
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Obx(
                        () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data de nascimento",
                          style: TextStyle(
                            color:
                            controller.validDate.value ? Colors.black : Colors.red,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppDrop<String>(
                                items: _itemsDays(),
                                label: controller.selectedDay.value,
                                onChanged: (value) {
                                  controller.selectedDay.value = value ?? "Dia";
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: AppDrop<String>(
                                items: _itemsMonths(),
                                label: controller.selectedMonth.value,
                                onChanged: (value) {
                                  controller.selectedMonth.value =
                                      value ?? "Mês";
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: AppDrop<String>(
                                items: _itemsYears(),
                                label: controller.selectedYear.value,
                                onChanged: (value) {
                                  controller.selectedYear.value =
                                      value ?? "Ano";
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "@",
                      style: context.textTheme.bodyText2
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Expanded(
                    child: AppField(
                      label: "Perfil público",
                      validation: (value) => Mask.validations.generic(
                        value,
                        min: 4,
                      ),
                      controller: controller.nickNameEC,
                    ),
                  ),
                ],
              ),
              AppField(
                label: "Email",
                controller: controller.emailEC,
                validation: Mask.validations.email,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(() => Text(
                      "País",
                      style: TextStyle(
                          color: controller.validCountry.value
                              ? Colors.black
                              : Colors.red),
                    )),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Obx(() => AppDrop<CountryModel>(
                          onChanged: (value) =>
                          controller.selectedCountry = value!,
                          items: _itemsCountry(),
                          label: controller.selectedCountry.country,
                        ))),
                  ),
                ],
              ),
              Obx(() {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Estado",
                        style: TextStyle(
                          color:
                          controller.validState.value ? Colors.black : Colors.red,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Visibility(
                          visible: controller.selectedCountry.codCountry <= 1,
                          child: AppDrop<StateModel>(
                            onChanged: (value) {
                              controller.selectedState = value!;
                            },
                            items: _itemsState(),
                            label: controller.selectedState.state,
                          ),
                          replacement: AppField(
                              controller: controller.stateEC,
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10)),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(() => Text(
                      "Cidade",
                      style: TextStyle(
                        color:
                        controller.validCity.value ? Colors.black : Colors.red,
                      ),
                    )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(() => Visibility(
                      visible: controller.selectedCountry.codCountry <= 1,
                      child: AppDrop<CityModel>(
                        onChanged: (value) {
                          controller.selectedCity = value!;
                        },
                        items: _itemsCities(),
                        label: controller.selectedCity.city,
                      ),
                      replacement: AppField(
                          controller: controller.cityEC,
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10)),
                    )),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              AppField(
                label: "Senha",
                controller: controller.passwordEC,
                validation: (value) => Mask.validations.generic(
                  value,
                  min: 8,
                  error: 'Min 8 Caracteres',
                ),
                obscured: true,
              ),
              AppField(
                label: "Confirma senha",
                obscured: true,
                validation: (value) => Mask.validations.compare(
                  value,
                  compareTo: controller.passwordEC.text,
                  error: "Senhas não conferem",
                ),
                controller: controller.confirmPasswordEC,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: Wrap(
                  verticalDirection: VerticalDirection.down,
                  children: [
                    GestureDetector(
                      child: Obx(
                            () => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Visibility(
                              visible: controller.politicPrivacies.value,
                              child: const Icon(Icons.check_box),
                              replacement: Icon(
                                Icons.check_box_outline_blank,
                                color: controller.validPolitics.value
                                    ? null
                                    : Colors.red,
                              )),
                        ),
                      ),
                      onTap: () {
                        controller.politicPrivacies.value =
                        !controller.politicPrivacies.value;
                      },
                    ),
                    const Text(
                        "Ao aceitar você concorda com ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Termos de Uso,",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.useTerms);
                      },
                    ),
                    GestureDetector(
                      child: const Text(
                        " Política de Privacidade ",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.politics);
                      },
                    ),
                    const Text(
                      "e ",
                      style: TextStyle(
                      color: Colors.black,
                    ),
                    ),
                    GestureDetector(
                        child: const Text(
                          "Termo de Consentimento ",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.consentientTerms);
                        }),
                    const Text(
                        "do Azerox SA.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: controller.validForm,
                    child: Obx(() => Visibility(
                      visible: controller.isLoading.value,
                      replacement: const Text("Cadastrar"),
                      child: const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<StateModel>> _itemsState() {
    final response = <DropdownMenuItem<StateModel>>[];
    controller.states.forEach((state) {
      response.add(DropdownMenuItem(
        value: state,
        child: Text(state.state),
      ));
    });
    return response;
  }

  List<DropdownMenuItem<CountryModel>> _itemsCountry() {
    final response = <DropdownMenuItem<CountryModel>>[];
    controller.countries.forEach((country) {
      response.add(DropdownMenuItem(
        value: country,
        child: Text(country.country),
      ));
    });
    return response;
  }

  List<DropdownMenuItem<String>> _itemsDays() {
    final response = <DropdownMenuItem<String>>[];
    var days = List.generate(31, (index) => "${index + 1}".padLeft(2, "0"));

    days.forEach((element) {
      response.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });
    return response;
  }

  List<DropdownMenuItem<String>> _itemsMonths() {
    final response = <DropdownMenuItem<String>>[];
    var months = List.generate(12, (index) => "${index + 1}".padLeft(2, "0"));

    months.forEach((element) {
      response.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });
    return response;
  }

  List<DropdownMenuItem<String>> _itemsYears() {
    final response = <DropdownMenuItem<String>>[];
    var actualYear = DateTime.now().year;
    var years = List.generate(60, (index) => "${actualYear - index}");

    years.forEach((element) {
      response.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });
    return response;
  }

  List<DropdownMenuItem<CityModel>> _itemsCities() {
    final response = <DropdownMenuItem<CityModel>>[];
    controller.cities.forEach((city) {
      response.add(DropdownMenuItem(
        value: city,
        child: Text(city.city),
      ));
    });
    return response;
  }
}
