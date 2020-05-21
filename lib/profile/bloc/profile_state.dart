import 'package:company_project/model/detail_profile.dart';
import 'package:meta/meta.dart';

@immutable
class ProfileState {
  final bool isLoaded;
  final bool isLoading;
  final DetailProfile detailProfile;

  ProfileState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.detailProfile,
  });

  factory ProfileState.empty() {
    return ProfileState(
        isLoaded: false,
        isLoading: false,
        detailProfile: null);
  }

  factory ProfileState.failure() {
    return ProfileState(
        isLoaded: false,
        isLoading: false,
        detailProfile: null);
  }

  factory ProfileState.success({DetailProfile detailProfile}) {
    return ProfileState(
        isLoaded: true,
        isLoading: false,
        detailProfile: detailProfile);
  }

//  ProfileState updateLoading({
//    bool isLoading,
//  }) {
//    return copyWith(
//      isLoading: isLoading,
//    );
//  }

  ProfileState copyWith({
    bool isLoaded,
    bool isLoading,
    DetailProfile detailProfile
  }) {
    return ProfileState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      detailProfile: detailProfile ?? this.detailProfile,
    );
  }
}
