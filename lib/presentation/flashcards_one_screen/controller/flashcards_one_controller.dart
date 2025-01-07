
import 'package:appinio_swiper/controllers.dart';
import 'package:appinio_swiper/enums.dart';
import 'package:salon_symphony/core/utils/app_constant.dart';
import 'package:salon_symphony/presentation/flashcards_screen/controller/flashcards_controller.dart';
import 'package:salon_symphony/presentation/flashcards_screen/models/flashcards_response_model.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../Shared_prefrences/app_prefrences.dart';
import '../../../core/utils/utils.dart';
import '../../../data/services/api_call_status.dart';
import '../../../data/services/api_exceptions.dart';
import '../../../data/services/base_client.dart';
import '/core/app_export.dart';

class FlashcardsOneController extends GetxController {

  Map<String, dynamic> map = Get.arguments;
  MatchEngine? matchEngine;
  Rx<int> knowCount = 0.obs;
  Rx<int> learningCount = 0.obs;
  Rx<int> indicatorCount = 0.obs;
  Rx<int> currentIndex = 0.obs;
  Rx<AppinioSwiperDirection> direction = AppinioSwiperDirection.left.obs;
  List<SwipeItem> swipeItems = <SwipeItem>[];
  Rx<int> cardsLength = 0.obs;
  AppPreferences _appPreferences = AppPreferences();
  RxBool isInternetAvailable = true.obs;
  AppinioSwiperController appinioSwiperController = AppinioSwiperController();
  Rx<ApiCallStatus> apiCallStatus = ApiCallStatus.holding.obs;
  Rx<FlashCardData>? flashCardResponseModel = FlashCardData().obs;

  Rx<int> pos = 0.obs;

  @override
  void onReady() {
    super.onReady();
    apiCallStatus.value = ApiCallStatus.loading;
    getFlashcard();
  }


  Future <dynamic> getFlashcard() async{
    Utils.check().then((value) async {
      apiCallStatus.value = ApiCallStatus.loading;
      if (value) {
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
          await BaseClient.get(Constants.flashcards +'/${map['id']}',
              onSuccess: (response) {
                apiCallStatus.value = ApiCallStatus.success;
                indicatorCount.value = 0;
                knowCount.value = 0;
                learningCount.value = 0;
                flashCardResponseModel!.value = FlashCardData.fromJson(response.data['data']);
                print('flashCardResponseModel ${flashCardResponseModel!.value.name}');
                print('Meta====> ${flashCardResponseModel!.value.meta!.known}');
                if (flashCardResponseModel!.value.meta!.known != null) {
                  knowCount.value = flashCardResponseModel!.value.meta!.known!;
                }
                if (flashCardResponseModel!.value.meta!.learning != null) {
                  learningCount.value = flashCardResponseModel!.value.meta!.learning!;
                }
                if(flashCardResponseModel!.value.flashcardElements!=null){
                  swipeItems.clear();
                  for(var item in flashCardResponseModel!.value.flashcardElements!){

                    if(item.userScore == null){
                      swipeItems.add(SwipeItem(content: item ));
                    }else{
                      if(item.localUserScore.value==AppConstant.LEARNING){
                        learningCount.value++;
                      }else if(item.localUserScore.value==AppConstant.KNOWN){
                        knowCount.value++;
                      }
                    }
                  }
                  if(swipeItems.isEmpty){
                    Get.offNamed(
                        AppRoutes.flashcardCompleteScreen,
                        arguments: {
                          'id': map['id'],
                          'is_completed': false
                        });
                  }
                  cardsLength.value = swipeItems.length;
                  matchEngine = MatchEngine(swipeItems: swipeItems);
                  apiCallStatus.value = ApiCallStatus.success;

                }else{
                  apiCallStatus.value = ApiCallStatus.empty;
                }
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
              queryParameters: {
              'viewed_user_id': userId,
              });
        });
      } else {
        Utils.showToast('Check your internet connection', true);
      }
    });
  }


  Future <dynamic> updateFlashcardScore(int status, int index,int id, bool isLast) async{

    await _appPreferences.isPreferenceReady;

    var userID;
    _appPreferences.getUserId().then((value1) {
      userID = value1;
    });
    Utils.check().then((value) async {
      if (value) {

        _appPreferences.getAccessToken(prefName: AppPreferences.prefAccessToken).then((value) async {

          await BaseClient.post(
              Constants.flashcardScores,
              onSuccess: (response) {
                if(index == swipeItems.length-1){
                  flashCardResponseModel!.value.localUserFlashcardStatus!.value = AppConstant.COMPLETED;
                }else{
                  flashCardResponseModel!.value.localUserFlashcardStatus!.value = AppConstant.STARTED;
                }
                flashCardResponseModel!.value.flashcardElements![index].localUserScore.value = status;
                print("localUserFlashcardStatus ${flashCardResponseModel!.value.localUserFlashcardStatus!.value}");
                print("localUserScore ${flashCardResponseModel!.value.flashcardElements![index].localUserScore.value}");
                if (isLast) {
                  getFlashcard();
                }
                return true;
              },

              onError: (error) {
                ApiException apiException = error;
                print(apiException.message);
                BaseClient.handleApiError(error);
                return false;
              },
              headers: {
                'Authorization': 'Bearer $value',
                'Accept': 'application/json',
              },
              data : {
                'status': status,
                'flashcard_element_id': id,
                'flashcard_id':  flashCardResponseModel!.value.id!,
                'user_id': userID,
              }

          );
        });

      } else {
        Utils.showToast('No internet connection',true);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }


}
