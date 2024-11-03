import 'dart:io';

import 'package:dio/dio.dart';

import 'errors/failure.dart';

class ApiService {
  final Dio _dio;
  final baseUrl = "https://icode-sendbad-store.runasp.net/api/";

  ApiService(this._dio);
  // {
  //   _dio.options.headers['Content-Type'] = 'application/json';
  // }

  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, String>? headers}) async {
    var response =
        await _dio.get('$baseUrl$endPoint', options: Options(headers: headers));
    print(response.data);

    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      required dynamic data,
      Map<String, String>? headers}) async {
    try {
      var response = await _dio.post('$baseUrl$endPoint',
          data: data,
          options: Options(validateStatus: (_) => true, headers: headers));
      print(response.data);
      return response.data;
    } catch (e, s) {
      print('from api Exception details:\n $e');
      print('from api Stack trace:\n $s');
      if (e is DioException &&
          (e.type == DioExceptionType.unknown ||
              e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.connectionError)) {
        throw ServerFailure('No Internet Connection');
      } else if (e is SocketException) {
        // throw ServerFailure('No Internet Connection');
        if (e.message.contains('Failed host lookup')) {
          throw ServerFailure('Failed to resolve hostname');
        } else {
          throw ServerFailure('No Internet Connection');
        }
      } else {
        // throw  Exception(e.toString());
        throw ServerFailure(e.toString());
      }
    }
  }

  // put method
  Future<Map<String, dynamic>> put(
      {required String endPoint,
      required Map<String, dynamic> data,
      Map<String, String>? headers}) async {
    try {
      var response = await _dio.put('$baseUrl$endPoint',
          data: data, options: Options(headers: headers));

      return response.data;
    } catch (error, stacktrace) {
      // Handle any error that occurs during the request
      // print('Error: $error');
      // print('Stacktrace: $stacktrace');
      throw Exception(
          'Failed to make PUT request , Error: $error , Stacktrace: $stacktrace ');
    }
  }

  // patch method
  Future<Map<String, dynamic>> patch(
      {required String endPoint,
      required Map<String, dynamic> data,
      Map<String, String>? headers}) async {
    try {
      var response = await _dio.patch('$baseUrl$endPoint',
          data: data, options: Options(headers: headers));

      return response.data;
    } catch (error, stacktrace) {
      // Handle any error that occurs during the request
      // print('Error: $error');
      // print('Stacktrace: $stacktrace');
      throw Exception(
          'Failed to make PATCH request , Error: $error , Stacktrace: $stacktrace ');
    }
  }

  // delete method
  Future<Map<String, dynamic>> delete(
      {required String endPoint, Map<String, String>? headers}) async {
    try {
      var response = await _dio.delete('$baseUrl$endPoint',
          options: Options(headers: headers));

      return response.data;
    } catch (error, stacktrace) {
      // Handle any error that occurs during the request
      // print('Error: $error');
      // print('Stacktrace: $stacktrace');
      throw Exception(
          'Failed to make DELETE request , Error: $error , Stacktrace: $stacktrace ');
    }
  }

  // Future<Map<String, dynamic>> postRequestWithFiles({
  //   required String endPoint,
  //   required Map<String, dynamic> data,
  //   // required List<File> imageFiles,
  //   required File file,
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     FormData formData = FormData.fromMap(data);

  //     // Add image files to the form data
  //     // if (imageFiles.isEmpty != true) {
  //     //   // formData.fields.add(const MapEntry("images", ""));
  //     //   // }
  //     //   for (var file in imageFiles) {
  //     //     String fileName = file.path.split('/').last;
  //     //     formData.files.add(MapEntry(
  //     //       "Images",
  //     //       await MultipartFile.fromFile(file.path, filename: fileName),
  //     //     ));
  //     //   }
  //     // }
  //     // Add an empty value for "images" if no image files are provided
  //     // if (imageFiles.isEmpty) {
  //     //   formData.fields.add(const MapEntry("images", ""));
  //     // }

  //     // Add the PDF file to the form data
  //     // String pdfFileName = pdfFile.path.split('/').last;
  //     // formData.files.add(MapEntry(
  //     //   "FilePDF",
  //     //   await MultipartFile.fromFile(pdfFile.path, filename: pdfFileName),
  //     // ));
  //     // // Add an empty value for "FilePDF" if no PDF file is provided
  //     // if (pdfFile.path.isEmpty || pdfFile == null) {
  //     //   formData.fields.add(const MapEntry("FilePDF", ""));
  //     // }

  //     var response = await _dio.post('$baseUrl$endPoint',
  //         data: formData, options: Options(headers: headers));

  //     return response.data;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Failed to make POST request with files, Error: $error , Stacktrace: $stacktrace');
  //   }
  // }
  Future<Map<String, dynamic>> postRequestWithFiles({
    required String endPoint,
    required Map<String, dynamic> data,
    required File file,
    Map<String, String>? headers,
  }) async {
    try {
      FormData formData = FormData();

      // Print the entire data map for debugging
      print('Data provided: $data');

      // Check if Date is present and valid
      if (data.containsKey('Date')) {
        var dateValue = data['Date'];
        if (dateValue is DateTime) {
          String formattedDate = dateValue.toIso8601String();
          formData.fields.add(MapEntry('Date', formattedDate));
          print('Date: $formattedDate');
        } else {
          throw Exception('Date must be of type DateTime');
        }
      } else {
        throw Exception('Date is required');
      }

      // Add invoice number and amount
      if (data.containsKey('InvoiceNumber')) {
        formData.fields
            .add(MapEntry('InvoiceNumber', data['InvoiceNumber'].toString()));
      } else {
        throw Exception('InvoiceNumber is required');
      }

      if (data.containsKey('InvoiceAmount')) {
        formData.fields
            .add(MapEntry('InvoiceAmount', data['InvoiceAmount'].toString()));
      } else {
        throw Exception('InvoiceAmount is required');
      }

      // Check the file
      if (file.existsSync()) {
        String fileName = file.path.split('/').last;
        formData.files.add(MapEntry(
          "InvoiceImage",
          await MultipartFile.fromFile(file.path, filename: fileName),
        ));
      } else {
        throw Exception('File does not exist');
      }

      // Make the POST request
      var response = await _dio.post('$baseUrl$endPoint',
          data: formData, options: Options(headers: headers));
      print('Response: ${response.data}');
      return response.data;
    } catch (error, stacktrace) {
      throw Exception(
          'Failed to make POST request with files, Error: $error, Stacktrace: $stacktrace');
    }
  }

  // Future<Map<String, dynamic>> postRequestWithFiles({
  //   required String endPoint,
  //   required dynamic data,
  //   required File file, // Assuming this is the image file
  //   Map<String, String>? headers,
  // }) async {
  //   try {
  //     FormData formData = FormData();

  //     // Check if dateTime is present in the data map
  //     if (data.containsKey('Date')) {
  //       formData.fields.add(MapEntry('Date', data['Date'].toIso8601String()));
  //     }

  //     // Add other data fields to the form data
  //     data.forEach((key, value) {
  //       if (key != 'Date') {
  //         formData.fields.add(MapEntry(key, value.toString()));
  //       }
  //     });

  //     // Add image file to the form data
  //     String fileName = file.path.split('/').last;
  //     formData.files.add(MapEntry(
  //       "image", // The expected key on the server side
  //       await MultipartFile.fromFile(file.path, filename: fileName),
  //     ));

  //     // Make the POST request
  //     var response = await _dio.post('$baseUrl$endPoint',
  //         data: formData, options: Options(headers: headers));
  //     print(response.data);
  //     return response.data;
  //   } catch (error, stacktrace) {
  //     throw Exception(
  //         'Failed to make POST request with files, Error: $error , Stacktrace: $stacktrace');
  //   }
  //   // try {
  //   //   // Create FormData
  //   //   FormData formData = FormData();

  //   //   // Add DateTime field to the form data (make sure to format it correctly)
  //   //   if (data.containsKey("Date")) {
  //   //     formData.fields.add(MapEntry('Date', data["Date"].toIso8601String()));
  //   //   }

  //   //   // Add other data fields to the form data
  //   //   data.forEach((key, value) {
  //   //     if (key != "Date") {
  //   //       // Prevent adding DateTime again
  //   //       formData.fields.add(MapEntry(key, value.toString()));
  //   //     }
  //   //   });

  //   //   // Add image file to the form data
  //   //   String fileName = file.path.split('/').last;
  //   //   formData.files.add(MapEntry(
  //   //     "InvoiceImage", // Change "image" to the expected key on the server side
  //   //     await MultipartFile.fromFile(file.path, filename: fileName),
  //   //   ));

  //   //   // If you have more files, you can handle them similarly
  //   //   // Example: Add additional files if needed
  //   //   /*
  //   // if (additionalFiles.isNotEmpty) {
  //   //   for (var additionalFile in additionalFiles) {
  //   //     String additionalFileName = additionalFile.path.split('/').last;
  //   //     formData.files.add(MapEntry(
  //   //       "additionalFiles", // Change to your expected key
  //   //       await MultipartFile.fromFile(additionalFile.path, filename: additionalFileName),
  //   //     ));
  //   //   }
  //   // }
  //   // */

  //   //   // Make the POST request
  //   //   var response = await _dio.post('$baseUrl$endPoint',
  //   //       data: formData, options: Options(headers: headers));

  //   //   return response.data;
  // }
}
