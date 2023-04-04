import 'package:flutter/material.dart';
// import 'package:offers/utils/colorconstant.dart';


class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
        this.padding,
        this.variant,
        this.alignment,
        this.margin,
        this.width,
        this.height,
        this.child,
        this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: _buildIconButtonWidget(),
    )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        iconSize: (height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: (width ?? 0),
          height: (height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll16:
        return EdgeInsets.all(
          16,
        );
      case IconButtonPadding.PaddingAll12:
        return EdgeInsets.all(
          12,
        );
      case IconButtonPadding.PaddingAll2:
        return EdgeInsets.all(
          4,
        );
      default:
        return EdgeInsets.all(
          8,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillGray90065:
        return Colors.grey;
      case IconButtonVariant.FillOrange50065:
        return Colors.orange;
      case IconButtonVariant.FillWhiteA700:
        return Colors.white;
      case IconButtonVariant.FillTealA70065:
        return Colors.teal;
      case IconButtonVariant.FillDeeppurple40065:
        return Colors.deepPurple;
      default:
        return Colors.grey[100];
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.CircleBorder32:
        return BorderRadius.circular(

          32.00,

        );
      case IconButtonShape.CircleBorder24:
        return BorderRadius.circular(

          24.00,

        );
      case IconButtonShape.CircleBorder16:
        return BorderRadius.circular(

          16.00,

        );
      default:
        return BorderRadius.circular(

          8.00,

        );
    }
  }
}

enum IconButtonShape {
  RoundedBorder8,
  CircleBorder32,
  CircleBorder24,
  CircleBorder16,
}

enum IconButtonPadding {
  PaddingAll8,
  PaddingAll16,
  PaddingAll12,
  PaddingAll2,
}

enum IconButtonVariant {
  FillGray100,
  FillGray90065,
  FillOrange50065,
  FillWhiteA700,
  FillTealA70065,
  FillDeeppurple40065,
}