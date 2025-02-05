import 'package:flutter/material.dart';
import 'package:schedule/src/common/pagination/pagination_delegate_mobile.dart';

class MyPaginationDelegate<P, T> extends PaginationDelegateMobile<P, T> {
  MyPaginationDelegate({
    required super.pagingController,
    required super.constraints,
    required super.noItemsImage,
    required super.noItemsText,
    required Widget Function(BuildContext, T, int) itemBuilder,
  }) : super(itemBuilder: itemBuilder);
}