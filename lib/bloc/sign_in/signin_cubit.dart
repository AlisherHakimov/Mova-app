// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova_app/bloc/sign_in/signin_state.dart';
import 'package:mova_app/constants/api_constants.dart';
import 'package:mova_app/models/auth/session.dart';
import 'package:mova_app/models/enums/bloc_status.dart';
import 'package:mova_app/services/hive_service.dart';
import 'package:retrofit/dio.dart';

import '../../api/api_helper.dart';
import '../../models/account/account_details.dart';
import '../../models/auth/authentication.dart';
import '../../models/my_list/created_list.dart';
import '../../ui/widgets/snacbars/custom_snacbar.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  void changeCheckBox({required bool isRemember}) {
    emit(
      state.copyWith(isRemember: isRemember),
    );
  }

  late AccountDetails _accountDetails;
  String? _sessionId;
  String? _accountId;
  Future<void> signIn(
    String username,
    String password,
    BuildContext context,
  ) async {
    if (username.isEmpty && password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(customSnacBar(
        context,
        message: 'Empty password or username',
        title: 'Warning',
        contentType: ContentType.warning,
      ));
    } else {
      emit(state.copyWith(isLoading: BlocStatus.loading));
      try {
        _sessionId = await _auth(username, password, context);
        HiveService.saveSessionId(_sessionId);
        _accountDetails = await ApiHelper.getClient()
            .getAccountDetails(HiveService.getSessionId());
        _accountId = _accountDetails.id.toString();
        HiveService.saveAccountDetails(_accountDetails);
        await _createList();
        emit(state.copyWith(isLoading: BlocStatus.success));
      } catch (error) {
        emit(state.copyWith(isLoading: BlocStatus.error));
        print(error);
      }
    }
  }

  Future<String> _auth(
      String username, String password, BuildContext context) async {
    Authentication makeToken = await ApiHelper.getClient().createToken();
    String token = makeToken.requestToken;
    final userInfoBody = {
      'username': username,
      'password': password,
      'request_token': token,
    };
    final HttpResponse<Authentication> validateWithLogin;
    try {
      validateWithLogin = await ApiHelper.getClient()
          .validateWithLogin(userInfoBody, ApiConstants.apiKey);
      final tokenBody = {'request_token': validateWithLogin.data.requestToken};
      final HttpResponse<Session> makeSession =
          await ApiHelper.getClient().createSession(tokenBody);
      return makeSession.data.sessionId;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnacBar(
          context,
          message: 'Invalid username or password',
          title: 'Error',
          contentType: ContentType.failure,
        ),
      );
      return '';
    }
  }

  Map<String, String> bodyMap = {
    'name': 'MyMovies',
    'description': 'It`s my favorite movies',
    'language': HiveService.getLanguage(),
  };

  Future<bool> _createList() async {
    int? listId = HiveService.getListId();
    if (listId == null) {
      final listResponse = await ApiHelper.getClient()
          .getCreatedList(_accountId, HiveService.getSessionId());

      if (listResponse.response.statusCode == 200) {
        CreatedList createdList = listResponse.data.results[0];
        HiveService.saveListId(createdList.id);
        return true;
      } else {
        final createList =
            await ApiHelper.getClient().createList(_sessionId, bodyMap);
        if (createList.response.statusCode == 200) {
          HiveService.saveListId(createList.data['list_id']);
          return true;
        } else {
          return false;
        }
      }
    } else {
      return true;
    }
  }
}
