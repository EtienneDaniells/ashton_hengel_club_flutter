import 'package:ashton_hengel_club/global/colors.dart';
import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final double height;
  final double width;
  final Color backgroundColor;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool disableTapEffects;
  final double borderWidth;
  final Color borderColor;
  final Icon icon;
  final TextStyle textStyle;

  const PillButton(this.text,
      {Key key,
      this.enabled = true,
      this.height = 56.5,
      this.width,
      this.backgroundColor = PRIMARY_COLOR,
      this.onTap,
      this.onLongPress,
      this.disableTapEffects = false,
      this.borderWidth = 2,
      this.borderColor = SECONDARY_COLOR,
      this.icon,
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          splashColor: disableTapEffects ? Colors.transparent : Colors.white.withOpacity(0.15),
          highlightColor: disableTapEffects ? Colors.transparent : Colors.white.withOpacity(0.15),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            height: height,
            width: width,
            child: Text(
              text,
              style: textStyle,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgroundColor,
              border: Border.all(color: borderColor, width: borderWidth),
            ),
          ),
        ),
      ],
    );
  }
}
