import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final String? iconUrl;
  final VoidCallback onPressed;

  const SocialButton({
    Key? key,
    required this.text,
    this.icon,
    this.iconUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final buttonHeight = _getButtonHeight(width);
    final fontSize = _getFontSize(width);
    final iconSize = _getIconSize(width);
    final horizontalPadding = _getHorizontalPadding(width);

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xCCFFFFFF),
          side: const BorderSide(color: Colors.black26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 12,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null || iconUrl != null)
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: icon ??
                    (iconUrl != null
                        ? Image.asset(
                      iconUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        );
                      },
                    )
                        : null),
              ),
            if (icon != null || iconUrl != null) SizedBox(width: _getSpacing(width)),
            Flexible(
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getButtonHeight(double width) {
    if (width > 1200) return 56.0;
    if (width > 800) return 52.0;
    if (width > 600) return 50.0;
    if (width < 360) return 46.0;
    return 50.0;
  }

  double _getFontSize(double width) {
    if (width > 1200) return 16.0;
    if (width > 800) return 15.5;
    if (width < 360) return 13.5;
    return 15.0;
  }

  double _getIconSize(double width) {
    if (width > 1200) return 24.0;
    if (width > 800) return 22.0;
    if (width < 360) return 18.0;
    return 20.0;
  }

  double _getHorizontalPadding(double width) {
    if (width > 1200) return 24.0;
    if (width > 800) return 20.0;
    if (width < 360) return 12.0;
    return 16.0;
  }

  double _getSpacing(double width) {
    if (width > 1200) return 12.0;
    if (width > 800) return 10.0;
    if (width < 360) return 8.0;
    return 10.0;
  }
}