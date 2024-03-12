class ApiResponse<T> {
  T? data; 
  bool isLoading;
 
  ApiResponse({
    this.data,
    this.isLoading = false,
  });

  factory ApiResponse.loading() => ApiResponse(isLoading: true);
  factory ApiResponse.success(T? data) => ApiResponse(data: data);
}
