import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:moneyphi/Http/Interceptors.dart';

import '../utils/SharedPref.dart';

class ImagePickerController extends ChangeNotifier {
  File? images;

  var imagePicker = new ImagePicker();

  Future pickImage() async {
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    images = File(image!.path);

    notifyListeners();
  }

  Future pickGallery() async {
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    images = File(image!.path);

    notifyListeners();
  }

  sendImageServer(files, context, text) async {
    print(files);

    // await MultipartFile.fromFile(files.path,
    //     filename: files.path.split("/").last);
//     var formData = ({
// "bankImage":await MultipartFile.fromFile(files.path,
//     filename: files.path.split("/").last)
//
//     });
//     HttpService().uploadImage(endPoint:"ins/mftrans/uploadBankImg/$text",data:formData, context:context )
//
//     ;

    // var headers = {
    //   'x-access-token': 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbnZlc3RvciI6eyJ1c2VyUm9sZSI6InVzZXIiLCJpbnNJZCI6ODQsIm5hbWUiOiJSYWh1bCBQcmFqYXBhdGkiLCJ1c2VyTmFtZSI6InJhaHVscHJhamFwYXRpODM3QGdtYWlsLmNvbSIsInBob25lQ29kZSI6OTEsInBob25lTnVtYmVyIjo5NzE0MjA5NTgwLCJzdGF0dXMiOiJSUCIsInBob25lVmVyaWZpZWQiOnRydWUsImVtYWlsVmVyaWZpZWQiOnRydWUsImt5Y1N0YXR1cyI6ImRvbmUiLCJpc0t5Y0RvbmUiOjEsImlzRmFjdGFEb25lIjowfSwiaWF0IjoxNjUzMDY3NTc3LCJleHAiOjE2NTMwNzQ3Nzd9.LLcOEYAzzleAVGVhZTA0a8AdmjtK2SjNczM5AFCFKIoCUrMzGsSUwJ96zXA4AlP234ijC619fd3UJR4ojaxiOgi2L1MNhpkPjPZIH1tuMOAZ8CHdrFcmV7sVxjjs-kzFzOV1JLQI0DFXEsCIWpEUr3jT5USWkwMGDEI-XMrzEpE'
    // };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://stag.app.moneyphi.com/api/ins/mftrans/uploadBankImg/$text'));

    request.files
        .add(await http.MultipartFile.fromPath('bankImage', files.path));

    SharedPref().getString(key: "token").then((token) {
      print("token======>>$token");
      var headers = {'x-access-token': '$token'};
      request.headers.addAll(headers);
    });
    //  request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
