part of 'recent_list_cubit.dart';

@freezed
class RecentListState with _$RecentListState {
  const factory RecentListState.loading() = _Loading;
  const factory RecentListState.success(List<RecentItemResponse> data) =
      _Success;
  const factory RecentListState.failure() = _Failure;
}
