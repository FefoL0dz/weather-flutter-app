import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherApp/services/services.dart';
import 'package:weatherApp/services/states/comment_events.dart';
import 'package:weatherApp/services/states/comment_states.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {

final NUMBER_OF_COMMENTS_PER_PAGE = 20;

CommentBloc():super(CommentStateInitial());

@override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
  try {
    final hasReachedEndOfOnePage = (state is CommentStateSuccess && (state as CommentStateSuccess).hasReachedEnd);
    if(event is CommentFetchedEvent && !hasReachedEndOfOnePage) {
      if(state is CommentStateInitial) {
        final comments = await getCommentsFromApi(0, NUMBER_OF_COMMENTS_PER_PAGE);
        yield CommentStateSuccess(
            comments: comments,
            hasReachedEnd: false
        );
      } else if (state is CommentStateSuccess) {
        final currentState = state as CommentStateSuccess;
        int finalIndexOfCurrentPage = (state as CommentStateSuccess).comments.length;
        final comments = await getCommentsFromApi(finalIndexOfCurrentPage, NUMBER_OF_COMMENTS_PER_PAGE);
        if(comments.isEmpty) {
          yield (state as CommentStateSuccess).cloneWith(hasReachedEnd: true);
        } else {
          yield CommentStateSuccess(comments: currentState.comments + comments,
              hasReachedEnd: false);
        }
      } else {

      }
    } else {

    }
  } catch (exception) {
    yield CommentStateFailure();
  }
}
}
