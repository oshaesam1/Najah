import 'package:flutter/cupertino.dart';

@immutable
abstract class AppStates {}

class AdminInitialState extends AppStates {}

class AdminCreateDatabaseState extends AppStates {}

class AdminGetDatabaseLoadingState extends AppStates {}

class AdminGetDatabaseState extends AppStates {}

class AdminInsertDatabaseState extends AppStates {}

class AdminUpdateDatabaseState extends AppStates {}

class AdminDeleteDatabaseState extends AppStates {}


