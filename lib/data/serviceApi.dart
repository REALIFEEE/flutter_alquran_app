import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ahlul_quran_app/data/model/detailsurah.dart';
import 'package:flutter_ahlul_quran_app/data/model/surahmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  Future<Either<String, List<SurahModel>>> getAllSurah() async {
    try {
      final response =
          await client.get(Uri.parse('https://equran.id/api/surat'));
      return Right(List<SurahModel>.from(
              jsonDecode(response.body).map((x) => SurahModel.fromJson(x)))
          .toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, SurahDetailModel>> getDetailSurah(
      int nomorsurah) async {
    try {
      final response = await client
          .get(Uri.parse('https://equran.id/api/surat/$nomorsurah'));
      return Right(SurahDetailModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
