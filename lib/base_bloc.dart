import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {

  final _loadingStream = PublishSubject<bool>();
  final _errorStream = PublishSubject<String>();

  void notifyLoading(bool isLoading) {
     _loadingStream.sink.add(isLoading);
  }

  void notifyError(String errorMessage) {
    _errorStream.sink.add(errorMessage);
  }

  Stream<bool> get loadingStream => _loadingStream.stream;

  Stream<String> get errorStream => _errorStream.stream;

  void dispose() {
    _loadingStream.close();
    _errorStream.close();
  }
}