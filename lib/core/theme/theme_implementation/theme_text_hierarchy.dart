import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text_hierarchy/text_hierarchy.dart';

class ThemeTextHierarchy implements TextHierarchy {
  @override
  TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle h3 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle h4 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle h5 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle h6 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle subtitle1 = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle subtitle2 = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle body1 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle body2 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle caption = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  @override
  TextStyle overline = GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );
}
