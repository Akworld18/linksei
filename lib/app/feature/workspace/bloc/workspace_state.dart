part of 'workspace_bloc.dart';

@immutable
abstract class WorkspaceState {}

class WorkspaceInitial extends WorkspaceState {}

class WorkspaceLoadingState extends WorkspaceState{}

class WorkspaceErrorState extends WorkspaceState{}
