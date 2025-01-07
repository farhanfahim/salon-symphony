import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:salon_symphony/core/utils/utils.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../data/models/pre_signed_model_response.dart';
import '../../data/services/base_client.dart';
import '../constants/constants.dart';


class MediaUploadController extends GetxController{

  ProgressDialog pd = ProgressDialog(context: Get.context!);

  Future<dynamic> s3SignedUrlAPI({required String filePath, String title = 'Image', required Function(String url)? onDone,bool? isShowLoader = true}) async {


    if(isShowLoader! == true){
      pd.show( msg: 'Uploading $title...');
    }


    var fileMimeType = lookupMimeType(filePath);
    print(fileMimeType);
    Utils.check().then((value) async {
      if (value) {
        await BaseClient.post(
            Constants.preSignedUrl,
            headers: {
              "x-access-token" : Constants.preSignedHeaderValue
            },
            onSuccess: (response) async {
              print(response);

              PresignedUrlModelResponse model = PresignedUrlModelResponse.fromJson(response.data['data']);

              var  fileName = filePath
                  .split('/')
                  .last;
             return await uploadImageToBucket(model: model, fileName: fileName, imageFile: filePath, title: title, onDone: onDone);
            },
            onError: (error) {
              BaseClient.handleApiError(error);
              //btnController.stop();
             // apiCallStatus = ApiCallStatus.error;
            },
            data: {
              'contentType': fileMimeType
            }
        );
      }
      else {
        Utils.showToast('No Internet Connection', true);
      }
    });
  }

  Future<dynamic> uploadImageToBucket({required PresignedUrlModelResponse model, required String imageFile, required String fileName, required String title, required Function(String url)? onDone}) async {

    dio.FormData formData = dio.FormData.fromMap({
      "ACL": model.result!.fields!.aCL!,
      "Content-Type": model.result!.fields!.contentType!,
      "bucket": model.result!.fields!.bucket!,
      "X-Amz-Algorithm": model.result!.fields!.xAmzAlgorithm!,
      "X-Amz-Credential": model.result!.fields!.xAmzCredential!,
      "X-Amz-Date": model.result!.fields!.xAmzDate!,
      "Key": model.result!.fields!.key!,
      "Policy": model.result!.fields!.policy!,
      "X-Amz-Signature": model.result!.fields!.xAmzSignature!,
      "file": await dio.MultipartFile.fromFile(
          imageFile,
          filename: fileName)
    });

    Utils.check().then((value) async {
      if (value) {
        await BaseClient.post(
            model.result!.url!.replaceAll(" ", ""),
            headers: {
              "x-access-token" : Constants.preSignedHeaderValue
            },
            onSendProgress: (sent, total){
              print('progress: ${(sent / total * 100).toStringAsFixed(0)}% ($sent/$total)');
              final prg = sent / total * 100;
              pd.update(/*value: prg.toInt(),*/msg:'${(sent / total * 100).toStringAsFixed(0)}%');
            },
            onSuccess: (response) async {
              print(response.headers);
              print(response.headers['data']);
              var data = response.headers['data'];
              pd.close();
              onDone!(response.headers['location']![0]);
            },
            onError: (error) {
              print(error.statusCode);
              BaseClient.handleApiError(error);
            },
            data: formData
        );
      }
      else {
        Utils.showToast('No Internet Connection', true);

      }
    });
  }


}