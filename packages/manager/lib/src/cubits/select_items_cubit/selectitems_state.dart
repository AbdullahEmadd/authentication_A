part of 'selectitems_cubit.dart';

abstract class SelectItemsState extends Equatable {
  final List<Item>? items;
  final Item? selectedItems;
  final bool? change;
  final String? searchWord;
  final List<Item>? searchItemsList;
  final String? errorText;

  const SelectItemsState(
      {this.items,
      this.selectedItems,
      this.change,
      this.searchWord,
      this.searchItemsList,
      this.errorText});
}

class SelectItemsLoad extends SelectItemsState {
  const SelectItemsLoad(
      bool change, List<Item>? items, Item? selecteditem, String? errorText)
      : super(
            items: items,
            searchItemsList: items,
            selectedItems: selecteditem,
            change: change,
            errorText: errorText);

  @override
  List<Object?> get props =>
      [items, selectedItems, change, searchWord, searchItemsList, errorText];
}

class SelectItemsError extends SelectItemsState {
  const SelectItemsError(
      bool change, List<Item>? items, Item? selecteditem, String? errorText)
      : super(
            items: items,
            searchItemsList: items,
            selectedItems: selecteditem,
            change: change,
            errorText: errorText);

  @override
  List<Object?> get props =>
      [items, selectedItems, change, searchWord, searchItemsList, errorText];
}

class SelectItemsInitError extends SelectItemsState {
  const SelectItemsInitError(
      bool change, List<Item> items, Item selecteditem, String errorText)
      : super(
            items: items,
            searchItemsList: items,
            selectedItems: selecteditem,
            change: change,
            errorText: errorText);

  @override
  List<Object?> get props =>
      [items, selectedItems, change, searchWord, searchItemsList, errorText];
}

class SelectItemsInitial extends SelectItemsState {
  SelectItemsInitial(String? errorText)
      : super(
            items: [],
            selectedItems: null,
            change: false,
            searchItemsList: [],
            searchWord: null,
            errorText: errorText);

  @override
  List<Object?> get props =>
      [items, selectedItems, change, searchWord, searchItemsList, errorText];
}

class SelectItemsSearch extends SelectItemsState {
  const SelectItemsSearch(bool change, List<Item>? items, Item? selectedItems,
      List<Item>? searchItemsList, String? searchWord, String? errorText)
      : super(
            items: items,
            selectedItems: selectedItems,
            change: change,
            searchItemsList: searchItemsList,
            searchWord: searchWord,
            errorText: errorText);

  @override
  List<Object?> get props =>
      [items, selectedItems, change, searchWord, searchItemsList, errorText];
}
