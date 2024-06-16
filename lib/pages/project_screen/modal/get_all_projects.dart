

class ProjectDto {
  String? id;
  dynamic parentId;
  int? order;
  String? color;
  String? name;
  int? commentCount;
  bool? isShared;
  bool? isFavorite;
  bool? isInboxProject;
  bool? isTeamInbox;
  String? url;
  String? viewStyle;

  ProjectDto(  {
    this.id,
    this.parentId,
    this.order,
    this.color,
    this.name,
    this.commentCount,
    this.isShared,
    this.isFavorite,
    this.isInboxProject,
    this.isTeamInbox,
    this.url,
    this.viewStyle
}  );

  factory ProjectDto.fromJson(Map<String, dynamic> json) {
    return ProjectDto(
          id: json["id"],
    parentId: json["parent_id"],
    order: json["order"],
    color: json["color"],
    name: json["name"],
    commentCount: json["comment_count"],
    isShared: json["is_shared"],
    isFavorite: json["is_favorite"],
    isInboxProject: json["is_inbox_project"],
    isTeamInbox: json["is_team_inbox"],
    url: json["url"],
    viewStyle: json["view_style"],
    );
  }
}
class GetAllProjectsDto {
  final List<ProjectDto> projects;

  GetAllProjectsDto({required this.projects});

  factory GetAllProjectsDto.fromJson(List<dynamic> jsonList) {
    List<ProjectDto> projects = jsonList.map((item) => ProjectDto.fromJson(item)).toList();
    return GetAllProjectsDto(projects: projects);
  }
}