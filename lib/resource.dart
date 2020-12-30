class Resource<T> {
   Status status;
   T data;
   dynamic jsonString;
   String errorMessage;

   Resource(this.status, this.data,this.jsonString, this.errorMessage);

   static  Resource<T> error<T>(String errorMessage) {
     return Resource(Status.ERROR, null, null, errorMessage);
   }

   static  Resource<T>  success<T>(T data, dynamic jsonString) {
     return Resource(Status.SUCCESS, data, jsonString, null);
   }
}

enum Status {
  SUCCESS,
  ERROR
}