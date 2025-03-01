

import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:teqexpert_assingnment/features/userdata/data/models/user_modal.dart';
import 'package:teqexpert_assingnment/features/userdata/domain/usecase/user_data_usecase.dart';
part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserDataState>{
  final UserdataUseCase userdataUseCase;
  UserCubit(this.userdataUseCase) : super(const UserDataState());

  Future<void> fetchUsers() async {
    try {
      var res = await userdataUseCase();
      if(res.statusCode == HttpStatus.ok){
        emit(
          state.copyWith(
            statusCode: res.statusCode, 
            state: state.loaded, 
            data: (res.data as List?)?.map(
              (e) => UserDataModal.fromJson(e)
            ).toList()
          )
        );
      }
      else {
        emit(state.copyWith(
          state: state.error, 
          statusCode: res.statusCode, 
          errorMessage: res.statusMessage
          )
        );
      }
    } catch (e) {
      log("Error in fetchUsers $e");
      emit(state.copyWith(
        statusCode: 600, 
        errorMessage: e.toString(),
        state: state.error
        )
      );
    }
  }
}