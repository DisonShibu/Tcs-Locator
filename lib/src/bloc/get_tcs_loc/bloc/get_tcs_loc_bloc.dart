import 'package:app_template/src/models/get_tcs_location_model.dart';
import 'package:app_template/src/utils/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_tcs_loc_event.dart';
part 'get_tcs_loc_state.dart';

class GetTcsLocBloc extends Bloc<GetTcsLocEvent, GetTcsLocState> {
  ApiClient apiclient;
  GetTcsLocBloc(this.apiclient) : super(GetTcsLocLoadingState()) {
    on<LoadGetTcsLocEvent>(
      (event, emit) async {
        emit(GetTcsLocLoadingState());
        try {
          final response = await apiclient?.getPvrDetails(event.getTcsLocModel);
          
            emit(GetTcsLocsLoadedState(response));
          
        } catch (error, stacktrace) {
          debugPrint("Exception occured: $error stackTrace: $stacktrace");
          emit(GetTcsLocErrorState(error.toString()));
        }
      },
    );
  }
}
