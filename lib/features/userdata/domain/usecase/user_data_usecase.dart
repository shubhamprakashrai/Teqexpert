import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:teqexpert_assingnment/core/usecase/usecase.dart';
import 'package:teqexpert_assingnment/features/userdata/domain/repository/user_base_repo.dart';

@singleton
class UserdataUseCase implements UseCase<Response,void>{
 final UserBaseRepo userBaseRepo;
 const UserdataUseCase(this.userBaseRepo);
 
  @override
  Future<Response> call({void params}) async  {
   return await userBaseRepo.userFeatchbaseRep();
  }
}

