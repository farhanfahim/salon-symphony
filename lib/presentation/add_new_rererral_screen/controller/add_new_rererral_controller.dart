import 'package:flutter/material.dart';
import 'package:salon_symphony/presentation/add_new_rererral_screen/models/add_new_rererral_model.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/models/GetPostionListingModel.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '../../../widgets/animatedButton.dart';
import '/core/app_export.dart';
import '../../../core/utils/dummy_content.dart';
import '../../../core/utils/helper_functions.dart';
import '../../../core/utils/responsive.dart';
import '../../../widgets/custom_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddNewRererralController extends GetxController {
  Responsive responsive = Responsive();
  final animatedButtonController = AnimatedButtonController();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AppPreferences _appPreferences = AppPreferences();

  Rx<TextEditingController> candidatenameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> instaController = TextEditingController().obs;
  Rx<TextEditingController> positionController = TextEditingController().obs;
  Rx<TextEditingController> experienceController = TextEditingController().obs;
  Rx<TextEditingController> relationController = TextEditingController().obs;
  Rx<TextEditingController> descController = TextEditingController().obs;
  Rx<AddNewRererralModel> addNewRererralModelObj = AddNewRererralModel().obs;

  FocusNode? candidatenameNode = FocusNode();
  FocusNode? phoneNumberNode = FocusNode();
  FocusNode? instaNode = FocusNode();
  FocusNode? positionNode = FocusNode();
  FocusNode? experienceNode = FocusNode();
  FocusNode? relationNode = FocusNode();
  FocusNode? descNode = FocusNode();

  RxList<ExperienceModel> arrOfOptions = DummyContent.experience.obs;
  RxList<RelationModel> arrOfOptionsReleation = DummyContent.relation.obs;
  RxList<dataModel> arrOfOptionsPosition = <dataModel>[].obs;

  bool formSubmitted = false;
  RxBool isFormCompleted = false.obs;

  final maskFormatter = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void onInit() {
    super.onInit();
  }



  checkForm() {
    if (candidatenameController.value.text.isEmpty ||
        positionController.value.text.isEmpty ||
        experienceController.value.text.isEmpty ||
        relationController.value.text.isEmpty ) {
      isFormCompleted.value = false;
    } else {
      isFormCompleted.value = true;
    }
  }






  void saveInfo(context) {
    final formState = formKey.currentState;
    if (formSubmitted == true) {
      if (formState!.validate()) {
        formState.save();
        checkForm();
        // then do something
      }
    }
  }

  updateItem(int index) {
    for (var item in arrOfOptions) {
      item.selected = false.obs;
    }
    arrOfOptions[index].selected = true.obs;
    arrOfOptions.refresh();
    checkForm();
  }

  updateRelation(int index) {
    for (var item in arrOfOptionsReleation) {
      item.selected = false.obs;
    }
    arrOfOptionsReleation[index].selected = true.obs;
    arrOfOptionsReleation.refresh();
    checkForm();
  }

  updatePosition(int index) {
    for (var item in arrOfOptionsPosition) {
      item.selected = false.obs;
    }
    arrOfOptionsPosition[index].selected = true.obs;
    arrOfOptionsPosition.refresh();
    checkForm();
  }




  Future<dynamic> getPositionListing() async {
    Utils.check().then((value) async {
      if (value) {
        await BaseClient.get(Constants.GetPositionListing,
            onSuccess: (response) {
              GetPostionListingModel positionListingModel =
              GetPostionListingModel.fromJson(response.data);
              positionListingModel.data!
                  .map((e) => arrOfOptionsPosition
                  .add(dataModel(name: e.name, id: e.id, selected: false.obs)))
                  .toList();

              print('response.data ===== > ${response.data}');
              return true;
            }, onError: (error) {
              ApiException apiException = error;

              print(apiException.message);

              BaseClient.handleApiError(error);

              apiCallStatus = ApiCallStatus.error;

              return false;
            }, headers: {
              'Accept': 'application/json',
            }, queryParameters: null);
      } else {
        animatedButtonController.reset();
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<dynamic> referCandidateApi() async {
    await _appPreferences.isPreferenceReady;

    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });
    await _appPreferences.isPreferenceReady;
    var salonId;
    _appPreferences.getSalonId().then((value1) {
      salonId = value1;
      print('salonId====>${salonId}');
    });
    Utils.check().then((value) async {
      if (value) {
        // *) perform api call
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          await BaseClient.post(
              Constants.userReferrals,
              onSuccess: (response) async {
                animatedButtonController.reset();
                Utils.showToast(response.data['message'], false);
                Get.back();
              },
              onError: (error) {
                print(error);
                BaseClient.handleApiError(error);
                animatedButtonController.reset();
                apiCallStatus = ApiCallStatus.error;
              },
              headers: {
                'Authorization': 'Bearer ${value}',
                'Accept': 'application/json',
              },
              data: {
                'name': candidatenameController.value.text,

                'instagram': instaController.value.text,
                'salon_id': salonId,
                'relation': relationController.value.text,
                'experience': experienceController.value.text,
                'position_id': arrOfOptionsPosition.where((element) => element.selected!.value == true).first.id,
                'user_id': userId,
                'description': descController.value.text,
                if(maskFormatter.getUnmaskedText() != '')
                  'phone': '+1'+maskFormatter.getUnmaskedText(),

              }
          );
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }


  void validate(context) {
    formSubmitted = true;
    Utils.hideKeyboard(context);
    final formState = formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      referCandidateApi();

    }else{
      animatedButtonController.reset();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPositionListing();
  }

  @override
  void onClose() {
    super.onClose();
    candidatenameController.value.dispose();
    phoneNumberController.value.dispose();
    instaController.value.dispose();
    positionController.value.dispose();
    experienceController.value.dispose();
    relationController.value.dispose();
    descController.value.dispose();
  }
}
