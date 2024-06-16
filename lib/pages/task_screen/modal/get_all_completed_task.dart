// To parse this JSON data, do
//
//     final getAllCompletedTaskDto = getAllCompletedTaskDtoFromJson(jsonString);

import 'dart:convert';

GetAllCompletedTaskDto getAllCompletedTaskDtoFromJson(String str) => GetAllCompletedTaskDto.fromJson(json.decode(str));

String getAllCompletedTaskDtoToJson(GetAllCompletedTaskDto data) => json.encode(data.toJson());

class GetAllCompletedTaskDto {
  List<Item>? items;
  Projects? projects;
  Projects? sections;

  GetAllCompletedTaskDto({
    this.items,
    this.projects,
    this.sections,
  });

  factory GetAllCompletedTaskDto.fromJson(Map<String, dynamic> json) => GetAllCompletedTaskDto(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    projects: json["projects"] == null ? null : Projects.fromJson(json["projects"]),
    sections: json["sections"] == null ? null : Projects.fromJson(json["sections"]),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "projects": projects?.toJson(),
    "sections": sections?.toJson(),
  };
}

class Item {
  DateTime? completedAt;
  String? content;
  String? id;
  dynamic itemObject;
  dynamic metaData;
  int? noteCount;
  List<dynamic>? notes;
  String? projectId;
  dynamic sectionId;
  String? taskId;
  String? userId;

  Item({
    this.completedAt,
    this.content,
    this.id,
    this.itemObject,
    this.metaData,
    this.noteCount,
    this.notes,
    this.projectId,
    this.sectionId,
    this.taskId,
    this.userId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    completedAt: json["completed_at"] == null ? null : DateTime.parse(json["completed_at"]),
    content: json["content"],
    id: json["id"],
    itemObject: json["item_object"],
    metaData: json["meta_data"],
    noteCount: json["note_count"],
    notes: json["notes"] == null ? [] : List<dynamic>.from(json["notes"]!.map((x) => x)),
    projectId: json["project_id"],
    sectionId: json["section_id"],
    taskId: json["task_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "completed_at": completedAt?.toIso8601String(),
    "content": content,
    "id": id,
    "item_object": itemObject,
    "meta_data": metaData,
    "note_count": noteCount,
    "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
    "project_id": projectId,
    "section_id": sectionId,
    "task_id": taskId,
    "user_id": userId,
  };
}

class Projects {
  Projects();

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
  );

  Map<String, dynamic> toJson() => {
  };
}
