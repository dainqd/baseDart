import 'package:example/style/font_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// File InputLogin
// @project learning
// @author dainq on 30-11-2020

class InputLogin extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool fieldPassword;
  final String? labelText;
  final Widget? prefixIcon;
  final double maxWidth;
  final TextInputType? textInputType;

  const InputLogin(
      {Key? key,
      this.controller,
      this.hintText,
      this.fieldPassword = false,
      this.labelText,
      this.prefixIcon,
      this.maxWidth = 350,
      this.textInputType})
      : super(key: key);

  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool? _obscureText;
  bool close = false;
  final double _sizeIcon = 18.0;

  @override
  void initState() {
    _obscureText = widget.fieldPassword;
    widget.controller?.addListener(listener);
    super.initState();
  }

  listener() {
    if (widget.controller?.text.isEmpty == true) {
      if (close) {
        setState(() {
          close = false;
        });
      }
    } else {
      if (!close) {
        setState(() {
          close = true;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        constraints: BoxConstraints(
            maxWidth: (MediaQuery.of(context).size.width - 74), maxHeight: 44),
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText ?? false,
          keyboardType: widget.textInputType,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsApp.color_17A63F),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              filled: true,
              prefixIcon: widget.prefixIcon,
              fillColor: ColorsApp.color_EAEAEA,
              hintText: widget.hintText,
              suffixIcon: widget.fieldPassword
                  ? _obscureText == true
                      ? InkWell(
                          onTap: () {
                            _obscureText = false;
                            setState(() {});
                          },
                          child: Icon(
                            CupertinoIcons.eye,
                            color: Colors.black,
                            size: _sizeIcon,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            _obscureText = true;
                            setState(() {});
                          },
                          child: Icon(
                            CupertinoIcons.eye_slash,
                            size: _sizeIcon,
                            color: Colors.black,
                          ),
                        )
                  : close
                      ? InkWell(
                          onTap: () {
                            widget.controller?.clear();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: _sizeIcon,
                          ),
                        )
                      : null),
        ),
      ),
    );
  }
}
