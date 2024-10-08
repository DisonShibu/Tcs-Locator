import 'dart:async';
import 'dart:developer';
import 'package:app_template/src/models/get_tcs_location_model.dart';
import 'package:app_template/src/models/header_model.dart';
import 'package:app_template/src/models/login_request_model.dart';
import 'package:app_template/src/utils/urls.dart';
import 'package:dio/dio.dart';

import 'object_factory.dart';


enum AccessMode { READ, WRITE }
HeaderModel authHeaderModel = new HeaderModel();

void setAuthHeaderModel(
    {var accessMode, String xReferenceId}) {
  if(ObjectFactory().appHive != null && ObjectFactory().appHive.getToken() != null && ObjectFactory().appHive.getToken().trim().length > 0)
    authHeaderModel.authorization ="Bearer "+ObjectFactory().appHive.getToken();
  authHeaderModel.xAccessMode = accessMode.toString();
  authHeaderModel.xUdid = "";
  authHeaderModel.xRequestTime = "";
  authHeaderModel.xReferenceId = xReferenceId;
  authHeaderModel.xSession = "";
  if(ObjectFactory().appHive != null && ObjectFactory().appHive.getXUser() != null && ObjectFactory().appHive.getXUser().trim().length > 0)
    authHeaderModel.xUser = ObjectFactory().appHive.getXUser();
  if(ObjectFactory().appHive != null && ObjectFactory().appHive.getUserId() != null && ObjectFactory().appHive.getUserId().trim().length > 0)
    authHeaderModel.xUserId = ObjectFactory().appHive.getUserId();
  // print("Token "+authHeaderModel.xTenantId);
}

class ApiClient {
  HeaderModel loginModel = new HeaderModel(
    xSession: "",
    xAccessMode: AccessMode.WRITE.toString(),
    xUdid: "",
    xRequestTime: "",
  );

  // ///  user login
  // Future<Response> loginRequest(LoginRequest loginRequest) {
  //   print(loginRequest.toString());

  //   return ObjectFactory()
  //       .appDio
  //       .loginPost(url: Urls.baseUrl, data: loginRequest, header: loginModel);
  // }

   Future<GetTcsLocationModel> getPvrDetails(
    String getPvrId,
  ) async {
    try {

      final payload = await ObjectFactory().appDio.get(url: ""
      
      );
      log(payload.toString());
      return GetTcsLocationModel.fromJson(payload.data);
    } catch (err) {
      throw Exception(err);
    }
  }

}


