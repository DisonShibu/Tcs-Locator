part of 'get_tcs_loc_bloc.dart';

@immutable
 

 abstract class GetTcsLocEvent  {
  final String getTcsLocModel;

  const GetTcsLocEvent(this.getTcsLocModel);
}

class LoadGetTcsLocEvent extends GetTcsLocEvent {
  const LoadGetTcsLocEvent(
     String getTcsLocModel)
      : super(getTcsLocModel);

  @override
  List<Object> get props => [];
}
