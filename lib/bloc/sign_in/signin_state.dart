// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../models/enums/bloc_status.dart';

class SignInState {
  String? username;
  String? password;
  BlocStatus isLoading;
  bool? isRemember;
  SignInState({
    this.username,
    this.password,
    this.isLoading = BlocStatus.initial,
    this.isRemember,
  });

  SignInState copyWith({
    String? username,
    String? password,
    BlocStatus? isLoading,
    bool? isRemember,
  }) {
    return SignInState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isRemember: isRemember ?? this.isRemember,
    );
  }
}
