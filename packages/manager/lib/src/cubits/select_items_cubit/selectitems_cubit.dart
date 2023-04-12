import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/items_model/items.dart';

part 'selectitems_state.dart';

class SelectItemsCubit extends Cubit<SelectItemsState> {
  final String? errorText;

  SelectItemsCubit({ this.errorText}) : super(SelectItemsInitial(errorText));

  initErrorMessage(String errortxt) {
    emit(SelectItemsSearch(!state.change!, state.items, state.selectedItems,
        state.searchItemsList, state.searchWord, errortxt));
  }

  loadData(List<Item>? itemList, [Item? item]) {
    emit(SelectItemsLoad(
        !state.change!, itemList, state.selectedItems, state.errorText));
  }

  ///Select Items From List
  ///[item] selected Items from list
  selectItems(Item item) {
    //! Emit New state by selected item
    emit(SelectItemsSearch(!state.change!, state.items, item,
        state.searchItemsList, state.searchWord, state.errorText));
  }

  ///Error text
  error() {
    //! Emit New state by selected item
    emit(SelectItemsError(
        !state.change!, state.items, state.selectedItems, state.errorText));
  }

  ///Search in Items List
  ///[searchWord] word need to search by
  searchInItemsList(String searchWord) {
    //! Search in list by search Word
    List<Item> listItems = state.items!
        .where((element) =>
            element.value!.toLowerCase().contains(searchWord.toLowerCase()))
        .toList();
    //! Emit New Search List
    emit(SelectItemsSearch(!state.change!, state.items, state.selectedItems,
        listItems, searchWord, state.errorText));
  }

  reset() {
    emit(SelectItemsLoad(!state.change!, const [], null, state.errorText));
  }
}
