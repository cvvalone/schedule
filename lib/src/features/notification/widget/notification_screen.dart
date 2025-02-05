import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:schedule/src/common/pagination/my_pagination_delegate.dart';
import 'package:schedule/src/common/pagination/pagination_controller.dart';
import 'package:schedule/src/common/pagination/pagination_delegate_mobile.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  static const int _pageSize = 20;

  final PaginationController<int, String> _pagingController =
      PaginationController(firstPageKey: 0);

  @override
  void initState() {
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    _pagingController.notify();
    // _pagingController.startNoItemsTimeout(Duration(seconds: 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final calcWidth = width - width * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Сповіщення'),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2),
            child: Container(
              height: 2,
              color: ScheduleColors.greyColor,
              width: calcWidth,
            )),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PagedListView(
            pagingController: _pagingController,
            builderDelegate: MyPaginationDelegate(
              constraints: constraints,
              pagingController: _pagingController,
              noItemsImage: 'assets/images/empty.png',
              noItemsText: 'Немає нових сповіщень.',
              itemBuilder: (context, item, index) => ListTile(
                title: Text(
                  item,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final newItems =
          List.generate(_pageSize, (index) => 'Item ${pageKey + index + 1}');

      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }
}
