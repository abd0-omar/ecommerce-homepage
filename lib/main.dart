import 'package:final_ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_ecommerce/cubit/favorites_cubit.dart';
import 'package:final_ecommerce/cubit/quantity_cubit.dart';
import 'package:final_ecommerce/cubit/favorites_observer.dart';
import 'package:final_ecommerce/screens/home/home_screen.dart';

void main() {
  Bloc.observer = FavoritesObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => QuantityCubit()),
      ],
      child: MaterialApp(
        title: 'Final E-commerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
