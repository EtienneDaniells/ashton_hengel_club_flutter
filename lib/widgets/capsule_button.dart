import 'package:ashton_hengel_club/global/colors.dart';
import 'package:flutter/material.dart';

class CapsuleButton extends StatelessWidget {
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
  final Alignment alignment;

  const CapsuleButton(this.text,
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
      this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
      this.alignment = Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
        width: width,
        height: height,
        child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onTap,
            onLongPress: onLongPress,
            splashColor: disableTapEffects ? Colors.transparent : Colors.black,
            highlightColor:
                disableTapEffects ? Colors.transparent : Colors.black,
            child: Stack(
              children: <Widget>[
                Container(
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
                icon == null ? Container(width: width,) :Container(
                  alignment: Alignment.center,
                  height: height,
                  width: height,
                  child: icon,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(color: borderColor, width: borderWidth)),
                ),
              ],
            )
            ));
  }
}
