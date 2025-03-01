import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@factoryMethod 
abstract class UserBaseRepo {
  Future<Response> userFeatchbaseRep();
}