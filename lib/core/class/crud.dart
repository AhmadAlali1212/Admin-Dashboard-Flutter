import 'dart:convert';
import 'dart:io';
import 'package:adminapplication/core/constant/status_requset.dart';
import 'package:adminapplication/core/functions/check_internet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' show basename;

class Crud {
  Future<Either<StatusRequset, Map>> postData(String linkuri, Map data) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(Uri.parse(linkuri), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return Left(StatusRequset.serviceFailure);
        }
      } else {
        return Left(StatusRequset.OfflineFailure);
      }
    } catch (e) {
      print("postData error: $e");

      return Left(StatusRequset.exceptionFailure);
    }
  }

  Future<Either<StatusRequset, Map>> addRequestWithImageOne(
    String url,
    data,
    File? image, [
    String? namerequest,
  ]) async {
    try {
      if (await CheckInternet()) {
        if (namerequest != null) {
          namerequest = "files";
        }
        var request = http.MultipartRequest('POST', Uri.parse(url));
        if (image != null) {
          var length = await image.length();
          var stream = http.ByteStream(image.openRead());
          stream.cast();
          var multiparFile = http.MultipartFile(
            namerequest ?? "files",
            stream,
            length,
            filename: basename(image.path),
          );
          request.files.add(multiparFile);
        }

        data.forEach((key, values) {
          request.fields[key] = values;
        });
        var myrequest = await request.send();
        var response = await http.Response.fromStream(myrequest);

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return Left(StatusRequset.serviceFailure);
        }
      } else {
        return Left(StatusRequset.OfflineFailure);
      }
    } catch (e) {
      print("addRequestWithImageOne error: $e");

      return Left(StatusRequset.exceptionFailure);
    }
  }
}
