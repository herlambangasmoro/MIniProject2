import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject2/bloc/news_bloc.dart';
import 'package:miniproject2/pages/news_page.dart';
import 'package:miniproject2/pages/news_page2.dart';
import 'package:miniproject2/services/news_services.dart';



class BlocProvider17 extends StatelessWidget {
  const BlocProvider17({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
      BlocProvider(
        create: (context)=> NewsOrgBloc(NewsServices()),
      ),
      ],
      child: const NewsOrgPage(),
      );
  }
}

