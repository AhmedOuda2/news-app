sealed class ResultApi<T> {}

class SuccessApi<T> extends ResultApi<T> {
  SuccessApi(this.data);
  T data;
}

class ErorrApi<T> extends ResultApi<T> {
  ErorrApi(this.erorr);
  String erorr;
}
