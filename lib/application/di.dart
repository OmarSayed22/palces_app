import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt instance = GetIt.instance;
Future<void> initAppModule() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  //App preference instance
  //Internet Info  instance
  instance.registerLazySingleton<ImagePicker>(() => ImagePicker());
}
//
// Future<void> initRegisterModule() async {
//   if (!GetIt.I.isRegistered<RegisterCubit>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterCubit>(() => RegisterCubit(instance()));
//   }
// }
//
// Future<void> initSignInModule() async {
//   if (!GetIt.I.isRegistered<SignInWithFacebookUseCase>()) {
//     instance.registerFactory<SignInWithFacebookUseCase>(
//         () => SignInWithFacebookUseCase(instance()));
//   }
//   if (!GetIt.I.isRegistered<SignInWithGoogleUseCase>()) {
//     instance.registerFactory<SignInWithGoogleUseCase>(
//         () => SignInWithGoogleUseCase(instance()));
//   }
//   if (!GetIt.I.isRegistered<SignInCubit>()) {
//     instance.registerFactory<SignInWithEmailAndPasswordUseCase>(
//         () => SignInWithEmailAndPasswordUseCase(instance()));
//     instance.registerFactory<SignInCubit>(() => SignInCubit(
//           instance(),
//           instance(),
//           instance(),
//         ));
//   }
// }
//
// Future<void> initMainModule() async {
//   initSetDataModule();
//   if (!GetIt.I.isRegistered<ReAuthUserUseCase>()) {
//     instance.registerFactory<ReAuthUserUseCase>(
//         () => ReAuthUserUseCase(instance()));
//   }
//   if (!GetIt.I.isRegistered<ReAuthProvider>()) {
//     instance.registerFactory<ReAuthProvider>(() => ReAuthProvider(instance()));
//   }
// }
//
// Future<void> initSetDataModule() async {
//   if (!GetIt.I.isRegistered<AddDataUseCase>()) {
//     instance.registerFactory<AddDataUseCase>(() => AddDataUseCase(instance()));
//   }
//   if (!GetIt.I.isRegistered<UploadImageUseCase>()) {
//     instance.registerFactory<UploadImageUseCase>(
//         () => UploadImageUseCase(instance()));
//   }
// }
