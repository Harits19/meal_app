import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:meal_app/constans/constanta.dart';
import 'package:meal_app/favorite/bloc/favorite_bloc.dart';
import 'package:meal_app/favorite/views/favorite_page.dart';
import 'package:meal_app/meal/bloc/meal_bloc.dart';
import 'package:meal_app/views/circular_progress_widget.dart';
import 'package:meal_app/views/empty_widget.dart';
import 'package:meal_app/views/meal_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);

  static const routeName = "/";

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
              Modular.to.pushNamed(FavoritePage.routeName);
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
              child: BlocBuilder<MealBloc, MealState>(
                builder: (context, state) {
                  if (state is MealLoading) {
                    return const CircularProgressWidget();
                  }
                  if (state is MealLoaded) {
                    return ListView(
                      children: [
                        ...state.meal.map(
                          (e) => MealContainer(
                            meal: e,
                            onTapFavorite: () {
                              if (e.idMeal == null) return;
                              context.read<FavoriteBloc>().add(
                                    FavoriteAdded(e),
                                  );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return const EmptyWidget();
                },
              ),
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
