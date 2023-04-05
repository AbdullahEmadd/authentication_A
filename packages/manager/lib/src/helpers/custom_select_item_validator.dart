
import '../cubits/select_items_cubit/selectitems_cubit.dart';

class SelectItemValidator {
  static bool validationFunction({
    List<SelectItemsCubit> selectItemsCubitList = const [],
  }) {
    int count = 0;

    for (var item in selectItemsCubitList) {
      if (item.state.selectedItems == null) {
        item.error();
        count = count + 1;
      }
    }

    return count > 0 ? false : true;
  }
}
