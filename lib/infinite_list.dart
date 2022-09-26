import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/services/states/comment_bloc.dart';
import 'package:weatherApp/services/states/comment_events.dart';
import 'package:weatherApp/services/states/comment_states.dart';

class InfiniteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteList();
}

class _InfiniteList extends State<InfiniteList> {
  CommentBloc _commentBloc;
  final _scrollController = ScrollController();
  final _scrollThreadhold = 250.0;

  @override
  void initState() {
    super.initState();
    _commentBloc = BlocProvider.of(context);
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if(maxScrollExtent - currentScroll <= _scrollThreadhold) {
        _commentBloc.add(CommentFetchedEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if(state is CommentStateInitial) {
              return Center(child: CircularProgressIndicator());
            }

            if(state is CommentStateFailure) {
              return Center(
                child: Text('Cannot load comments from server', style: TextStyle(fontSize: 22, color: Colors.redAccent),),
              );
            }

            if(state is CommentStateSuccess) {
              final currentState = (state as CommentStateSuccess);
              if(currentState.comments.isEmpty) {
                return Center(child: Text('Empty comments !'),);
              }
              return  ListView.builder(itemBuilder: (BuildContext buildContext, int index) {
                if(index >= state.comments.length) {
                  return Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          strokeWidth: 50,
                        ),
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    leading: Text('${currentState.comments[index].id} - ${index + 1}'),
                    title: Text('${currentState.comments[index].email}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    isThreeLine: true,
                    subtitle: Text(
                      '${currentState.comments[index].body}',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
              }, itemCount: currentState.hasReachedEnd ? currentState.comments.length : currentState.comments.length + 1,
                controller: _scrollController);
            }
            return Center(child: Text('Other states'),);
          },
        ),
      ),
    );
  }
  
}