import 'package:dementiademo/cubit_states/user_form_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFormCubit extends Cubit<UserFormStates> {
  UserFormCubit() : super(UFInitialState());
  static UserFormCubit get(context) => BlocProvider.of(context);
  var ageContoller = TextEditingController();
  String dropDownIntialVal = 'Choose number of children you have';
  List<String> deopDownItemsList = [
    'Choose number of children you have',
    '1',
    '2',
    '3',
    'more than 3 children'
  ];

  void ondropDownItemChanged(String? newValue) {
    dropDownIntialVal = newValue!;
    print(newValue);
    emit(onDropDownValueChangedState());
  }

  bool valu = false;
  int val=-1;
  List<int> radioValues = [-1,-1];
  List<Map<String, dynamic>> radioList = [];
  void x({var value, int? index}) {
    radioValues[index!]=value!;
    print(radioValues[index]);
    val = value;
    print(this.val);
    valu = true;
    emit(onRadioListTleSelectedState());

//    print(value);
//      if (value == 1) {
//        print( "it'in true" );
//        value==val ;
//        valu == true;
//
////      print('i am in raioList  ${radioList[0].toString()}');
//        emit( onRadioListTle1SelectedState( ) );
//
//      }
//      else {
//        print( "it's in else" );
//        valu = false;
//        radioList.add( {'wifeRadioB': '$value'} );
//        print( 'i am in raioList  ${radioList[0].toString( )}' );
//        emit( onRadioListTle2SelectedState( ) );
//        val = this.val;
//      }
  }
  int value=-1;
  List<String>titles=['yes','no'];
  void onRadioTapped({int ? radioValue}){
    value=radioValue!;
    emit(onRadioListTleSelectedState());
  }


}
