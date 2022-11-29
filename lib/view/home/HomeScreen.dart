import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:localpath/data/remote/response/Status.dart';
import 'package:localpath/models/FilmsData.dart';
import 'package:localpath/view/widget/LoadingWidget.dart';
import 'package:localpath/view/widget/MyTextView.dart';
import 'package:localpath/view/details/FilmDetailsScreen.dart';
import 'package:localpath/viewmodel/FilmsListVM.dart';
import 'package:localpath/resource/AppContextExtension.dart';
import 'package:localpath/utils/Utils.dart';
import '../widget/MyErrorWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String id = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FilmsListVM viewmodel = FilmsListVM();

  @override
  void initState() {
    viewmodel.fetchFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: MyTextView(
                context.resources.strings.homeScreen,
                context.resources.color.colorWhite,
                context.resources.dimension.bigText)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<FilmsListVM>(
        create: (BuildContext context) => viewmodel,
        child: Consumer<FilmsListVM>(builder: (context, viewmodel, _) {
          switch (viewmodel.filmData.status) {
            case Status.LOADING:
              print("Loading");
              return LoadingWidget();
            case Status.ERROR:
              return MyErrorWidget(viewmodel.filmData.message ?? "NA");
            case Status.COMPLETED:
              print("Data Completed");
              return _filmListView(viewmodel.filmData.data?.films);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _filmListView(List<Films>? films) {
    return ListView.builder(
        itemCount: films?.length,
        itemBuilder: (context, position) {
          if (films != null) {
            return _filmItemView(films[position]);
          } else {
            return Container();
          }
        });
  }

  Widget _filmItemView(Films film) {
    return Card(
      elevation: context.resources.dimension.lightElevation,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
              context.resources.dimension.imageBorderRadius),
          child: Image.network(
            width: context.resources.dimension.listImageSize,
            height: context.resources.dimension.listImageSize,
            film.image,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('assets/images/img_error.png'),
            fit: BoxFit.fill,
          ),
        ),
        title: MyTextView(film.title, context.resources.color.colorPrimaryText,
            context.resources.dimension.bigText),
        subtitle: MyTextView(
            film.originalTitleRomanised,
            context.resources.color.colorSecondaryText,
            context.resources.dimension.mediumText),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextView(
                "${Utils.setRating(film.people)}",
                context.resources.color.colorBlack,
                context.resources.dimension.mediumText),
            SizedBox(width: context.resources.dimension.smallMargin),
            Icon(
              Icons.star,
              color: context.resources.color.colorAccent,
            )
          ],
        ),
        onTap: () {
          _sendDataToMovieDetailScreen(context, film);
        },
      ),
    );
  }

  void _sendDataToMovieDetailScreen(BuildContext context, Films? item) {
    Navigator.pushNamed(context, FilmDetailsScreen.filmDetailsScreenId,
        arguments: item);
  }
}
