import 'package:get_it/get_it.dart';
import 'package:sg_finance/viewModel/change_value_vm.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ChangeValueVm>(ChangeValueVm());
}
