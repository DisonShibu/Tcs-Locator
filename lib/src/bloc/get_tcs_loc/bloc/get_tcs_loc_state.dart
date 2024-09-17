part of 'get_tcs_loc_bloc.dart';

@immutable
 abstract class GetTcsLocState  {}


 


class GetTcsLocLoadingState extends GetTcsLocState {
  @override
  List<Object> get props => [];
}

class GetTcsLocsLoadedState extends GetTcsLocState {
  final GetTcsLocationModel gettcsLocResponseModel ;

  GetTcsLocsLoadedState(this.gettcsLocResponseModel);

  @override
  List<Object> get props => [gettcsLocResponseModel];
}

class GetTcsLocErrorState extends GetTcsLocState {
  final String error;

  GetTcsLocErrorState(this.error);
  @override
  List<Object> get props => [error];
}

