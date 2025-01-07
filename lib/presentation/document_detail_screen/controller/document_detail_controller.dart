import 'package:url_launcher/url_launcher.dart';
import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';
import 'package:salon_symphony/presentation/documents_screen/models/documents_model.dart';


class DocumentsDetailController extends GetxController {

  Map<String, dynamic> map = Get.arguments;
  AppPreferences _appPreferences = AppPreferences();
  Rx<DocumentData>? documentResponseModel = DocumentData().obs;
  RxBool isInternetAvailable = true.obs;
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  RxBool isApiCalling = false.obs;

  @override
  void onReady() {
    super.onReady();
    getDocuments();
  }

  void getDocuments() async {
    Utils.check().then((value) async {
      if (value) {
        apiCallStatus.value = ApiCallStatus.loading;
        isInternetAvailable.value = true;
        var userId;
        _appPreferences.getUserId().then((value1) {
          userId = value1;
        });
        var salonId;
        _appPreferences.getSalonId().then((value1) {
          salonId = value1;
        });
        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((value) async {
          print('Tokeeeen ====> $value');
          await BaseClient.get(Constants.salonDocs+"/${map['id']}",
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                documentResponseModel!.value = DocumentData.fromJson(response.data['data']);
                documentResponseModel!.value.localStatus!.value = documentResponseModel!.value.viewStatus!;
                return true;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              onError: (error) {
                apiCallStatus.value = ApiCallStatus.error;
                ApiException apiException = error;
                print(apiException.message);

                BaseClient.handleApiError(error);

                return false;
              },
              queryParameters: null);
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }

  Future<void> launchUrls() async {
    if(documentResponseModel!.value.localStatus!.value != AppConstant.VIEWED) {
      documentResponseModel!.value.localStatus!.value = AppConstant.VIEWED;
      updateStatus(documentResponseModel!.value.localStatus!.value, documentResponseModel!.value.id!);
    }
    Uri url = Uri.parse(documentResponseModel!.value.link!);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<dynamic> updateStatus(int status,int docId) async {
    await _appPreferences.isPreferenceReady;
    var userId;
    _appPreferences.getUserId().then((value1) {
      userId = value1;
    });

    Utils.check().then((value) async {

      if (value) {

        _appPreferences
            .getAccessToken(prefName: AppPreferences.prefAccessToken)
            .then((token) async {
          await BaseClient.post(
              Constants.userDocView,
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
              }, onSuccess: (response) async {


          }, onError: (error) {
            print(error);
            // show error message to user
            BaseClient.handleApiError(error);

            Utils.showToast(error.toString(), true);
          }, data: {
            "user_id": userId,
            'salon_document_id': docId,
          });
        });
      } else {
        Utils.showToast('No internet connection', true);
      }
    });
  }


  @override
  void onClose() {
    super.onClose();
  }


}
