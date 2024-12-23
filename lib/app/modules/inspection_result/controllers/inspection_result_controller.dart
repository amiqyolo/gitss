import 'package:get/get.dart';
import 'package:gitss/app/models/home/menu_item.dart';
import 'package:gitss/app/models/inspection/user_info.dart';
import 'package:gitss/app/repository/user_repository.dart';

class InspectionResultController extends GetxController {
  final UserRepository _repository = UserRepository();

  final RxList<UserInfo> userList = <UserInfo>[].obs;
  final MenuItem menuItem = Get.arguments as MenuItem;

  void fetchUsers() {
    userList.value = _repository.fetchUserInfo(menuItem.title);
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
