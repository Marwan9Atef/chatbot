class ApiErrorModel {
  final String message;
  final int? code;
  final String? status;

  ApiErrorModel({required this.message, this.code, this.status});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) => ApiErrorModel(
        message: json['message'] as String? ?? 'Unknown error',
        code: json['code'] as int?,
        status: json['status'] as String?,
      );

  @override
  String toString() => 'ApiError($code): $message';
}
