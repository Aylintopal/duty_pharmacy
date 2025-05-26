import 'dart:io';
import 'package:dio/dio.dart';
import 'package:duty_pharmacy/features/home/model/pharmacy_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PharmacyRepository {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String? apiKey = dotenv.env['API_KEY'];
  static final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'content-type': 'application/json',
        'authorization': apiKey,
      },
    ),
  );

  static Future<List<PharmacyModel>> getPharmacies({
    required String city,
    String? state,
  }) async {
    List<PharmacyModel> pharmacies = [];
    final response = await dio.get('/health/dutyPharmacy?ilce=$state&il=$city');

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> data = response.data['result'];

      // Her bir JSON nesnesini PharmacyModel nesnesine dönüştür ve listeye ekle
      pharmacies = data.map((json) => PharmacyModel.fromJson(json)).toList();

      return pharmacies;
    } else {
      throw Exception('Failed to load pharmacies');
    }
  }
}
