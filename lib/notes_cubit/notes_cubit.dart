import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'notes_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AdminInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;


  List<Map> newTasks = [];

late Database database;

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
            'CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AdminCreateDatabaseState());
    });
  }

void insertToDatabase({
    required String title,

  }) async
  {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO tasks(title) VALUES("$title",');
          print('inserted1: $id1');
          emit(AdminInsertDatabaseState());

    });
  }

  void getDataFromDatabase(database)
  {
    newTasks = [];

    emit(AdminGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
        if(element['status'] == 'new')
          newTasks.add(element);
      });

      emit(AdminGetDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async
  {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(AdminUpdateDatabaseState());
    });
  }


  void deleteData({
    required int id,
  }) async
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value)
    {
      getDataFromDatabase(database);
      emit(AdminDeleteDatabaseState());
    });
  }


  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;


}
