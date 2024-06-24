import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfectmatch/constants/app_colors.dart';
import 'package:perfectmatch/constants/size.dart';
import 'package:perfectmatch/constants/styles/textstyle.dart';
import 'package:perfectmatch/screens/location/controller/city_controller.dart';
import 'package:perfectmatch/screens/location/controller/district_controller.dart';
import 'package:perfectmatch/screens/location/controller/statecontroller.dart';
import 'package:perfectmatch/screens/location/widgets/dropdown_state.dart';
import 'package:perfectmatch/screens/signupscreen/view/screens/profile1_screen.dart';
import 'package:perfectmatch/screens/widget/buttons.dart';
import 'package:perfectmatch/utils/common_helper.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final stateController = Get.put(StateController());
    final districtController = Get.put(DistrictController());
    final cityController = Get.put(CityController());

    var selectedState = ''.obs;
    var selectedDistrict = ''.obs;

    RxBool selectedItem1 = false.obs;
    RxBool selectedItem2 = false.obs;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: BButton(onTap: () {
              Get.back();
            }),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Form(
            key: GlobalKey<FormState>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Your Location',
                  style: lexend(Colors.black, 22, FontWeight.w600),
                ),
                Text(
                  'Please select your Location',
                  style: lexend(Colors.black, 12, FontWeight.w400),
                ),
                hSpace(screenHeight * 0.02),
                Obx(() {
                  if (stateController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return DropdownState(
                    title: 'State',
                    hint: 'Select your state',
                    icon: Icons.arrow_drop_down_sharp,
                    stateController: selectedState,
                    items: stateController.states.map((state) {
                      return DropdownMenuItem(
                        value: state['id'].toString(),
                        child: Text(state['name']),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        selectedState.value = newValue;
                        selectedItem1.value = true;
                        districtController.fetchDistricts(int.parse(newValue));
                      }
                    },
                  );
                }),
                hSpace(screenHeight * 0.01),
                Obx(() {
                  if (selectedItem1.value) {
                    if (districtController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return DropdownState(
                      title: 'District',
                      hint: 'Select your district',
                      icon: Icons.arrow_drop_down_sharp,
                      stateController: selectedDistrict,
                      items: districtController.districts.map((district) {
                        return DropdownMenuItem(
                          value: district['id'].toString(),
                          child: Text(district['name']),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          selectedDistrict.value = newValue;
                          selectedItem2.value = true;
                          cityController.fetchCities(int.parse(newValue));
                        }
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                hSpace(screenHeight * 0.01),
                Obx(() {
                  if (selectedItem2.value) {
                    if (cityController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return DropdownState(
                      title: 'City',
                      hint: 'Select your city',
                      icon: Icons.arrow_drop_down_sharp,
                      stateController: selectedDistrict,
                      items: cityController.cities.map((city) {
                        return DropdownMenuItem(
                          value: city['id'].toString(),
                          child: Text(city['name']),
                        );
                      }).toList(),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                const Spacer(),
                PrimaryButton(
                  text: 'Next',
                  onTap: () async {
                    HapticFeedback.mediumImpact();
                    Get.to(const Profile1Screen());
                  },
                ),
                hSpace(screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
