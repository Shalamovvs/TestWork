import 'package:flutter/material.dart';
import 'package:myapp/bloc/MainBloc.dart';
import 'package:myapp/bloc/MainEvent.dart';
import 'package:myapp/bloc/MainState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/listeners/MainListener.dart';
import 'package:myapp/providers/MainProvider.dart';
import 'package:myapp/screens/DetailScreen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class MainScreen extends StatelessWidget {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return MainProvider(
      child: MainListener(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                if (state is MainSuccess) {
                  return Container(
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () {
                        BlocProvider.of<MainBloc>(context).add(MainLoad());
                      },
                      controller: _refreshController,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.reposList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    repUrl: state.reposList[index].url, 
                                    imageUrl: state.reposList[index].owner.avatar, 
                                    login: state.reposList[index].owner.login
                                  )
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Container(
                                              child: Text('ID: ${state.reposList[index].id}'),
                                            ),
                                          ),
                                          Container(
                                            child: Text('Name: ${state.reposList[index].name}'),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Text('${state.reposList[index].description}'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                if (state is MainLoading)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else
                {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
