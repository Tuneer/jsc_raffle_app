class UpdateUserCommentModel {
  UpdateUserCommentModel({
    this.status,
    this.message,
  });

  UpdateUserCommentModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['Message'];
  }

  bool? status;
  String? message;

  UpdateUserCommentModel copyWith({
    bool? status,
    String? message,
  }) =>
      UpdateUserCommentModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['Message'] = message;
    return map;
  }
}
