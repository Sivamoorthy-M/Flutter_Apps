import 'package:flutter/material.dart';
import 'package:localpath/models/FilmsData.dart';
import 'package:localpath/resource/AppContextExtension.dart';
import 'package:localpath/view/widget/MyTextView.dart';

class FilmDetailsScreen extends StatefulWidget {
  static const String filmDetailsScreenId = "film_details";

  final Films? filmData;
  FilmDetailsScreen(this.filmData);

  @override
  State<FilmDetailsScreen> createState() => _FilmDetailsScreenState();
}

class _FilmDetailsScreenState extends State<FilmDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.resources.strings.movieDetailScreen)),
      body: Container(
        color: context.resources.color.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.resources.dimension.smallMargin),
            child: Column(children: [
              Center(
                child: Image.network(
                  widget.filmData?.image ?? "",
                  errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/img_error.png'),
                  fit: BoxFit.fill, 
                  height: context.resources.dimension.imageHeight,
                ),
              ),
              Card(
                child: Column(children: [
                  ListTile(
                    title: MyTextView(
                       widget.filmData?.originalTitleRomanised ?? "NA",
                       context.resources.color.colorPrimaryText,
                       context.resources.dimension.bigText,
                    ),
                    subtitle: MyTextView(
                      widget.filmData?.title ?? "NA",
                      context.resources.color.colorSecondaryText,
                      context.resources.dimension.verySmallText
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: context.resources.dimension.verySmallMargin,),
                        Icon(Icons.star, color: context.resources.color.colorAccent,)
                      ],
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
