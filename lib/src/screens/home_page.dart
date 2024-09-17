import 'package:app_template/src/bloc/get_tcs_loc/bloc/get_tcs_loc_bloc.dart';
import 'package:app_template/src/models/get_tcs_location_model.dart';
import 'package:app_template/src/screens/location_details_screen.dart';
import 'package:app_template/src/utils/api_client.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/bottom_sheet_widget.dart';
import 'package:app_template/src/widgets/common_app_bar.dart';
import 'package:app_template/src/widgets/common_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  String filterValue;
  Future<List<Location>> getfilter(List<Location> locationList,
      GetTcsLocationModel getTcsLocationModel) async {
    if (filterValue == null || filterValue == "clear") {
      locationList = getTcsLocationModel.locations;
    } else {
      getTcsLocationModel.locations
        ..forEach((element) {
          if (element.area == filterValue) {
            locationList.add(element);
          }
        });
    }
    return locationList;
  }

  @override
  void initState() {
    // ApiClient apiClient = ApiClient();
    // apiClient.getPvrDetails("0");

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetTcsLocBloc(ApiClient())..add(LoadGetTcsLocEvent("")),
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight(context, dividedBy: 10)),
          child: CommonAppBar(
            searchTextEditingController: searchController,
          ),
        ),
        body: Column(
          children: [
            Container(
              child: CommonSearchbar(
                searchTextEditingController: searchController,
                onChanged: (value) {},
                onIconPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetWidget(
                            onValueChanged: (value) {
                              filterValue = value;
                              setState(() {});
                            },
                            sheetContext: context,
                          ));
                },
              ),
            ),
            BlocBuilder<GetTcsLocBloc, GetTcsLocState>(
              builder: (context, state) {
                if (state is GetTcsLocLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is GetTcsLocErrorState) {
                  return Container();
                }

                if (state is GetTcsLocsLoadedState) {
                  List<Location> locationList = [];
                  getfilter(locationList, state.gettcsLocResponseModel);

                  return Expanded(
                    child: FutureBuilder(
                        future: getfilter(
                            locationList, state.gettcsLocResponseModel),
                        builder: (context, snapshot) {
                          locationList = snapshot.data;
                          return ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount:locationList==null?0: locationList.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(index.toString()),
                                  ),
                                  title: Text(locationList[index].area),
                                  subtitle: Text(locationList[index].location),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    push(
                                        context,
                                        LocationDetailsScrren(
                                          location: locationList[index],
                                        ));
                                  },
                                );
                              });
                        }),
                  );
                } else
                  return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
