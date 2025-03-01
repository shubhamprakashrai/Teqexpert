import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:teqexpert_assingnment/features/userdata/domain/repository/user_base_repo.dart';

@LazySingleton(as: UserBaseRepo)
class UserGetDataRepoImpl extends UserBaseRepo {
  final Dio dio; // Injecting Dio instead of DioClient

  UserGetDataRepoImpl(this.dio);

  @override
  Future<Response> userFeatchbaseRep() async {
    return await dio.get("posts");
  }
}
