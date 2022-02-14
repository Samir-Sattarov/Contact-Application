import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? preffixText;
  final double wightBorderFocus;
  final Color color;
  final Color colorFocusedBorder;
  final Color colorBorder;
  final Color colorCursor;
  final Color hintTextColor;
  final Color? textColor;
  final bool enableSuffix;
  final bool enablePreffix;
  final bool borderSide;
  final TextInputType? inputType;

  final TextEditingController? controller;

  const TextFormFieldWidget({
    Key? key,
    this.wightBorderFocus = 1,
    this.hintText = '',
    this.preffixText = '',
    this.controller,
    this.inputType = TextInputType.text,
    this.hintTextColor = Colors.black,
    this.textColor = Colors.white,
    this.colorCursor = Colors.white,
    this.color = Colors.transparent,
    this.colorBorder = Colors.transparent,
    this.colorFocusedBorder = Colors.transparent,
    this.borderSide = false,
    this.enableSuffix = false,
    this.enablePreffix = false,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _hidePassword = false;

  get enableSuffix => widget.enableSuffix == true
      ? IconButton(
          color: const Color(0xff666666),
          icon: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(47, 170, 170, 170),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        )
      : null;

  get enablePreffix => widget.enablePreffix == true
      ? (SizedBox(
          width: 145,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Text(
                widget.preffixText.toString(),
                style: const TextStyle(
                  color: Color.fromARGB(188, 255, 254, 254),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.add,
                color: Colors.grey,
              ),
              const VerticalDivider(
                color: Colors.white,
                width: 1,
              )
            ],
          ),
        ))
      : null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
              color: widget.colorFocusedBorder, width: widget.wightBorderFocus),
        ),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: widget.borderSide == true
              ? BorderSide(
                  color: widget.colorBorder,
                  width: 2,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        hintStyle:
            TextStyle(color: widget.hintTextColor, fontWeight: FontWeight.w600),
        hintText: widget.hintText,
        prefixIcon: enablePreffix,
        suffixIcon: enableSuffix,
        alignLabelWithHint: true,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: widget.color,
        errorMaxLines: 1,
        errorStyle: GoogleFonts.openSans(
          color: const Color.fromARGB(228, 255, 49, 49),
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
      cursorColor: widget.colorCursor,
      style: TextStyle(color: widget.textColor),
      controller: widget.controller,
      keyboardType: widget.inputType,
    );
  }
}
