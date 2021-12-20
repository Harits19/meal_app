import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/constans/base_constanta.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/favorite/views/favorite_page.dart';
import 'package:meal_app/views/meal_container.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int indexSelectedLetter = initIndexLetter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MealFavoritePage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Center(child: Text("List Favorites")),
                  Icon(
                    Icons.star,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  BlocBuilder<MealBloc, MealState>(builder: (context, state) {
                if (state is MealLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MealLoaded) {
                  return ListView(
                    children: [
                      ...state.meal.map(
                        (e) => MealContainer(
                          meal: e,
                        ),
                      ),
                    ],
                  );
                }
                return const Center(child: Text("Empty"));
              }),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(listAlphabet.length, (index) {
                    final isActive = index == indexSelectedLetter;
                    return InkWell(
                      onTap: () {
                        indexSelectedLetter = index;
                        setState(() {});
                        context.read<MealBloc>().add(MealGetItemsByFirstLetter(
                            firstLetter: listAlphabet[index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          listAlphabet[index],
                          style: TextStyle(
                            fontWeight: isActive ? FontWeight.bold : null,
                            color: isActive ? Colors.red : null,
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
