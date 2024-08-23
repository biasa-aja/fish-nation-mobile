import 'package:bloc/bloc.dart';
import 'package:example_fish_fortune/data/data_sources/remote/home_api.dart';
import 'package:example_fish_fortune/data/models/recent_item_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_list_state.dart';
part 'recent_list_cubit.freezed.dart';

class RecentListCubit extends Cubit<RecentListState> {
  RecentListCubit() : super(const RecentListState.loading());

  void getAll() async {
    emit(const RecentListState.loading());

    final response = await HomeApi().getRecentList();

    if (response.isNotEmpty) {
      emit(RecentListState.success(response));
    }

    ///
    else {
      emit(const RecentListState.failure());
    }
  }
}
