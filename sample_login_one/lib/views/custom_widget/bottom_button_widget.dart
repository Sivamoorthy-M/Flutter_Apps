import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localpath/resource/AppContextExtension.dart';

class BottomButtonWidget extends StatelessWidget {
  const BottomButtonWidget(
      {super.key, required this.title, required this.hasBorder});

  final String title;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? context.resources.color.colorWhite : context.resources.color.colorMediumBlue,
          borderRadius: BorderRadius.circular(context.resources.dimension.borderRadius10),
          border: hasBorder ? Border.all(
            color: context.resources.color.colorMediumBlue,
            width: context.resources.dimension.borderWidth1,
          ) : Border.fromBorderSide(BorderSide.none), 
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(context.resources.dimension.borderRadius10),
          child: Container(
            height: context.resources.dimension.height60,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? context.resources.color.colorMediumBlue : context.resources.color.colorWhite ,
                  fontWeight: FontWeight.w600,
                  fontSize: context.resources.dimension.smallText14
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
