import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject2/bloc/news_bloc.dart';
import 'package:miniproject2/models/news_model.dart';
import 'package:miniproject2/pages/news_page2.dart';
import 'package:miniproject2/services/news_services.dart';


class NewsOrgPage extends StatefulWidget {
  const NewsOrgPage({Key? key}) : super(key: key);

  @override
  _NewsOrgPageState createState() => _NewsOrgPageState();
}

class _NewsOrgPageState extends State<NewsOrgPage> {
  late NewsOrgBloc _newsOrgBloc;

  @override
  void initState() {
    super.initState();
    _newsOrgBloc = NewsOrgBloc(NewsServices())..add(LoadNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://www.fifplay.com/img/public/premier-league-logo.png',
          width: 100,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1,
        child: BlocProvider(
          create: (context) => _newsOrgBloc,
          child: BlocBuilder<NewsOrgBloc, NewsOrgState>(
            builder: (context, state) {
              print('isi$state');
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NewsErrorState) {
                return const Center(
                  child: Text('error'),
                );
              }
              if (state is NewsLoadedState) {
                List<NewsOrgModel> newsModel = state.news;
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: newsModel.length,
                    itemBuilder: (context, index) {
                      var data = newsModel[index];
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                data.title.toString(),
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Image.network(
                                  data.urlToImage != null
                                      ? data.urlToImage.toString()
                                      : "https://ongpng.com/wp-content/uploads/2023/01/35.ronaldo_474x644-1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(data.description.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.network(
              'https://www.fifplay.com/img/public/premier-league-logo.png',
              height: 40,
              width: 50,
            ),
            label: 'Premier League',
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1go1EtRhXlyZwhGSX58kZic0CHB9F0wKOFKZnxPhiToEKc580qt2a81mrw_273Aq3ypU&usqp=CAU',
              height: 40,
              width: 40,
            ),
            label: 'La Liga',
          ),
        ],

        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsOrgPage2()),
            );
          }
        },
      ),
    );
  }
}