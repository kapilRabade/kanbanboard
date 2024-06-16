
class GetAllCommentsDto {
  final List<GetAllComments> comments;

  GetAllCommentsDto({required this.comments});

  factory GetAllCommentsDto.fromJson(List<dynamic> jsonList) {
    List<GetAllComments> comments = jsonList.map((item) => GetAllComments.fromJson(item)).toList();
    return GetAllCommentsDto(comments: comments);
  }
}

class GetAllComments {
  String? content;
  String? id;
  DateTime? postedAt;
  dynamic projectId;
  String? taskId;
  Attachment? attachment;

  GetAllComments({
    this.content,
    this.id,
    this.postedAt,
    this.projectId,
    this.taskId,
    this.attachment,
  });

  factory GetAllComments.fromJson(Map<String, dynamic> json) => GetAllComments(
    content: json["content"],
    id: json["id"],
    postedAt: json["posted_at"] == null ? null : DateTime.parse(json["posted_at"]),
    projectId: json["project_id"],
    taskId: json["task_id"],
    attachment: json["attachment"] == null ? null : Attachment.fromJson(json["attachment"]),
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "id": id,
    "posted_at": postedAt?.toIso8601String(),
    "project_id": projectId,
    "task_id": taskId,
    "attachment": attachment?.toJson(),
  };
}

class Attachment {
  String? fileName;
  String? fileType;
  String? fileUrl;
  String? resourceType;

  Attachment({
    this.fileName,
    this.fileType,
    this.fileUrl,
    this.resourceType,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    fileName: json["file_name"],
    fileType: json["file_type"],
    fileUrl: json["file_url"],
    resourceType: json["resource_type"],
  );

  Map<String, dynamic> toJson() => {
    "file_name": fileName,
    "file_type": fileType,
    "file_url": fileUrl,
    "resource_type": resourceType,
  };
}
