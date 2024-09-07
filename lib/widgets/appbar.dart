
import 'package:flutter/material.dart';
import 'package:prm_cart/theme/style.dart';

PreferredSizeWidget customAppBar(String appbarTitle) => AppBar(
      leading: const Icon(
        Icons.keyboard_arrow_left_sharp,
        size: 40,
        weight: 0.1,
      ),
      title: Text(
        appbarTitle,
        style: AppWidget().appbartext(),
      ),
      actions: const [Icon(Icons.search)],
      centerTitle: true,
    );
