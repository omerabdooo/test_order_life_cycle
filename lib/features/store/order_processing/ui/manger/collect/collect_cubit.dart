import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'collect_state.dart';

class CollectCubit extends Cubit<CollectState> {
  CollectCubit() : super(CollectInitial());

  String numberBill = "";
  String mountBill = "";
  File image = File('');
}
