import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:schedule/src/common/bloc/widgets/base_empty_view.dart';
import 'package:schedule/src/common/bloc/widgets/platform_progress.dart';
import 'package:schedule/src/common/bloc/widgets/refresh_button.dart';


abstract class PaginationDelegateMobile<P, T>
    extends PagedChildBuilderDelegate<T> {
  PaginationDelegateMobile({
    required this.pagingController,
    // required this.translation,
    required this.constraints,
    required this.noItemsImage,
    required this.noItemsText,
    required super.itemBuilder,
    this.initialProgressWidget,
  }) : super(
          firstPageProgressIndicatorBuilder: (final _) => SizedBox(
            height: constraints.maxHeight,
            child: initialProgressWidget ?? const PlatformProgress(),
          ),
          newPageProgressIndicatorBuilder: (final _) => const Padding(
            padding: EdgeInsets.all(16),
            child: PlatformProgress(),
          ),
          noItemsFoundIndicatorBuilder: (final _) => SizedBox(
            height: constraints.maxHeight,
            child: BaseEmptyView(
              imagePath: noItemsImage,
              title: noItemsText,
            ),
          ),
          firstPageErrorIndicatorBuilder: (final _) => SizedBox(
            height: constraints.maxHeight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: RefreshButton(
                onPressed: () => pagingController.refresh(),
              ),
            ),
          ),
          newPageErrorIndicatorBuilder: (final _) => Padding(
            padding: const EdgeInsets.all(20),
            child: RefreshButton(
              onPressed: () => pagingController.retryLastFailedRequest(),
            ),
          ),
          animateTransitions: true,
          transitionDuration: Duration(seconds: 2),
        );
  // final AppLocalizations translation;
  final BoxConstraints constraints;
  final PagingController<P, T> pagingController;
  final String noItemsImage;
  final String noItemsText;
  final Widget? initialProgressWidget;
}
