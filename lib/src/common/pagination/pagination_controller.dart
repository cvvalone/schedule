import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

final class PaginationController<PageKeyType, ItemType>
    extends PagingController<PageKeyType, ItemType> {
  PaginationController({
    required super.firstPageKey,
    super.invisibleItemsThreshold,
  });

  void clear() {
    itemList = null;
  }

  bool get isDisposed => _isDisposed;
  bool _isDisposed = false;

  @override
  void dispose() {
    if (_isDisposed) {
      return;
    }
    _isDisposed = true;
    super.dispose();
  }

  void notify() {
    notifyListeners();
  }

}
