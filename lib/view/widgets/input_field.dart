// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kid_education/core/constant/radius.core.dart';
import 'package:kid_education/core/validation.dart';
import 'package:kid_education/core/constant/color.dart';
import 'package:kid_education/view/widgets/txt.widget.dart';

class InputTextField extends StatefulWidget {
  final List<Validate>? validations;
  final bool validateAll;
  final String title;
  final String hint;
  final FontWeight? fontWeight;
  final Color? colorText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChange;
  final int maxLines;
  final String? init;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final int? maxInputLength;

  /// it's mean hide keyboard after submit
  final bool hideKeyboard;
  final TextStyle? titleStyle;
  final OutlineInputBorder? border;
  final Color? filledColor;
  final Color? borderColor;
  final bool enable;

  final VoidCallback? onSubmit;
  final Widget? titleSpace;

  late FocusNode focusNode;

  late GlobalKey<FormFieldState> validationKey;

  InputTextField({
    super.key,
    this.validations,
    this.validateAll = false,
    this.title = '',
    this.hint = '',
    this.fontWeight,
    this.colorText,
    this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.maxLines = 1,
    this.init,
    this.maxInputLength,
    this.border,
    this.isDense = true,
    this.contentPadding,
    this.filledColor = const Color(0xffF9FAFB),
    this.suffix,
    this.onSubmit,
    this.enable = true,
    this.style,
    this.hideKeyboard = false,
    this.titleStyle,
    this.borderColor,
    this.suffixIcon,
    this.titleSpace,
  });

  @override
  State<InputTextField> createState() => InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {
  final key = GlobalKey<FormFieldState>();
  final node = FocusNode();
  @override
  void initState() {
    widget
      ..validationKey = key
      ..focusNode = node;

    super.initState();
  }

  @override
  void didUpdateWidget(covariant InputTextField oldWidget) {
    widget
      ..validationKey = key
      ..focusNode = node;
    super.didUpdateWidget(oldWidget);
  }

  /// this field will be used to control what is state of password (visible and invisible)
  late bool _hideContent = widget.keyboardType == TextInputType.visiblePassword;

  late final _controller = (widget.controller ?? TextEditingController())
    ..text = widget.init ?? '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty) ...[
          MainText(
            widget.title,
            style: widget.titleStyle ??
                const TextStyle(
                    fontWeight: FontWeight.w400, color: black, fontSize: 16),
          ),
          widget.titleSpace ??
              const SizedBox(
                height: 8,
              ),
        ],
        TextFormField(
          key: widget.validationKey,
          focusNode: widget.focusNode,
          minLines: 1,
          cursorHeight: 22.0,
          enabled: widget.enable,
          controller: _controller,
          onChanged: widget.onChange,
          maxLines: widget.maxLines,
          maxLength: widget.maxInputLength,
          validator: (value) {
            if (!widget.enable) return null;

            final errors = StringBuffer();
            for (final v in widget.validations ?? <Validate>[]) {
              if (!v.$1(value)) {
                errors.writeln('✘ ${v.$2}');
                if (!widget.validateAll) return errors.toString();
              }
            }

            if (errors.isEmpty) return null;
            return errors.toString();
          },
          onEditingComplete: () => widget.hideKeyboard
              ? FocusManager.instance.primaryFocus?.unfocus()
              : FocusScope.of(context).nextFocus(),
          onFieldSubmitted: (_) => widget.onSubmit?.call(),
          keyboardType: widget.keyboardType,
          obscureText: _hideContent,
          style: widget.style ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          decoration: InputDecoration(
            isDense: widget.isDense,
            prefixIcon: widget.prefixIcon,
            suffix: widget.suffix,
            contentPadding: widget.contentPadding,
            hintText: widget.hint.isNotEmpty ? widget.hint : null,
            hintStyle: const TextStyle(
                color: greyText, fontSize: 16, fontWeight: FontWeight.w400),
            border: _border(color: widget.borderColor ?? greyStork),
            disabledBorder: _border(color: widget.borderColor ?? greyStork),
            enabledBorder: _border(color: widget.borderColor ?? greyStork),
            focusedBorder: _border(color: widget.borderColor ?? primaryColor),
            errorBorder: _border(color: const Color(0xffFF3F3F)),
            fillColor: widget.filledColor ?? white,
            filled: true,
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                ? ExcludeFocus(
                    child: IconButton(
                      onPressed: () =>
                          setState(() => _hideContent = !_hideContent),
                      splashRadius: 0.1,
                      icon: _hideContent
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({required Color color}) {
    return widget.border == null
        ? OutlineInputBorder(
            borderRadius: circular8,
            borderSide: BorderSide(color: color),
          )
        : widget.border!.copyWith(borderSide: BorderSide(color: color));
  }
}
