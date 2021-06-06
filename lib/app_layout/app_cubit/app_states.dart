abstract class AppState{}

class AppInitState extends AppState{}

class AppLoadingState extends AppState{}

class AppGetUserSuccessState extends AppState{}

class AppGetUserErrorState extends AppState{
 final error;
 AppGetUserErrorState({this.error});
}

class ChangeBottomNavState extends AppState{}

class NewPostState extends AppState{}

class PickProfileSuccessState extends AppState{}

class PickProfileErrorState extends AppState{}

class PickCoverSuccessState extends AppState{}

class PickCoverErrorState extends AppState{}

class UploadProfileSuccessState extends AppState{}

class UploadProfileErrorState extends AppState{}

class UploadCoverSuccessState extends AppState{}

class UploadCoverErrorState extends AppState{}

class UpdateUserErrorState extends AppState{}

class UpdateUserLoadingState extends AppState{}

class PickPostImageSuccessState extends AppState{}

class PickPostImageErrorState extends AppState{}

class CreatePostLoadingState extends AppState{}

class CreatePostSuccessState extends AppState{}

class CreatePostErrorState extends AppState{}

class RemovePostImage extends AppState{}



