
part of 'user_cubit.dart';

class UserDataState {
  final UserState state;
  final String? errorMessage;
  final int? statusCode;
  final List<UserDataModal>? data;
  const UserDataState({
    this.state = UserState.initial, 
    this.data, 
    this.errorMessage, 
    this.statusCode
  });


  UserState get loading => UserState.loading;
  UserState get loaded => UserState.loaded;
  UserState get error => UserState.loaded;
  UserState get initial => UserState.loaded;

  bool get isLoading => state == UserState.loading;
  bool get isError => state == UserState.error;
  bool get isLoaded => state == UserState.loaded;
  bool get isInitial => state == UserState.initial;


  UserDataState copyWith({
    UserState? state, 
    List<UserDataModal>? data,
    int? statusCode,
    String? errorMessage,
    }){
    return UserDataState(
      state: state ?? this.state, 
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum UserState{
  loading, error, loaded, initial;
}