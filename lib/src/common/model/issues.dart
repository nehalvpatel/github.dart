import 'package:github/src/common.dart';
import 'package:github/src/common/model/users.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issues.g.dart';

/// Model class for an issue on the tracker.
@JsonSerializable()
class Issue {
  Issue({
    this.id = 0,
    this.url = '',
    this.htmlUrl = '',
    this.number = 0,
    this.state = '',
    this.title = '',
    this.user,
    List<IssueLabel>? labels,
    this.assignee,
    this.assignees,
    this.milestone,
    this.commentsCount = 0,
    this.pullRequest,
    this.createdAt,
    this.closedAt,
    this.updatedAt,
    this.body = '',
    this.closedBy,
  }) {
    if (labels != null) {
      this.labels = labels;
    }
  }

  int id;

  /// The api url.
  String url;

  /// Url to the Issue Page
  String htmlUrl;

  /// Issue Number
  int number;

  /// Issue State
  String state;

  /// Issue Title
  String title;

  /// User who created the issue.
  User? user;

  /// Issue Labels
  @JsonKey(defaultValue: <IssueLabel>[])
  List<IssueLabel> labels = <IssueLabel>[];

  /// The User that the issue is assigned to
  User? assignee;

  /// The User that the issue is assigned to
  List<User>? assignees;

  /// The Milestone
  Milestone? milestone;

  /// Number of Comments
  @JsonKey(name: 'comments')
  int commentsCount;

  /// A Pull Request
  IssuePullRequest? pullRequest;

  /// Time that the issue was created at
  DateTime? createdAt;

  /// The time that the issue was closed at
  DateTime? closedAt;

  /// The time that the issue was updated at
  DateTime? updatedAt;

  String body;

  /// The user who closed the issue
  User? closedBy;

  bool get isOpen => state == 'open';
  bool get isClosed => state == 'closed';

  factory Issue.fromJson(Map<String, dynamic> input) => _$IssueFromJson(input);
  Map<String, dynamic> toJson() => _$IssueToJson(this);
}

/// Model class for a request to create/edit an issue.
@JsonSerializable()
class IssueRequest {
  IssueRequest(
      {this.title,
      this.body,
      this.labels,
      this.assignee,
      this.assignees,
      this.state,
      this.milestone});
  String? title;
  String? body;
  List<String>? labels;
  String? assignee;
  List<String>? assignees;
  String? state;
  int? milestone;

  Map<String, dynamic> toJson() => _$IssueRequestToJson(this);

  factory IssueRequest.fromJson(Map<String, dynamic> input) =>
      _$IssueRequestFromJson(input);
}

/// Model class for a pull request for an issue.
@JsonSerializable()
class IssuePullRequest {
  IssuePullRequest({
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  /// Url to the Page for this Issue Pull Request
  String? htmlUrl;
  String? diffUrl;
  String? patchUrl;

  factory IssuePullRequest.fromJson(Map<String, dynamic> input) =>
      _$IssuePullRequestFromJson(input);
  Map<String, dynamic> toJson() => _$IssuePullRequestToJson(this);
}

/// Model class for an issue comment.
@JsonSerializable()
class IssueComment {
  IssueComment({
    this.id,
    this.body,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.htmlUrl,
    this.issueUrl,
    this.authorAssociation,
  });
  int? id;
  String? body;
  User? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? url;
  String? htmlUrl;
  String? issueUrl;
  String? authorAssociation;

  factory IssueComment.fromJson(Map<String, dynamic> input) =>
      _$IssueCommentFromJson(input);
  Map<String, dynamic> toJson() => _$IssueCommentToJson(this);
}

/// Model class for an issue label.
@JsonSerializable()
class IssueLabel {
  IssueLabel({
    this.name = '',
    this.color = '',
  });

  String name;

  String color;

  factory IssueLabel.fromJson(Map<String, dynamic> input) =>
      _$IssueLabelFromJson(input);
  Map<String, dynamic> toJson() => _$IssueLabelToJson(this);

  @override
  String toString() => 'IssueLabel: $name';
}

/// Model class for a milestone.
@JsonSerializable()
class Milestone {
  Milestone({
    this.id,
    this.number,
    this.state,
    this.title,
    this.description,
    this.creator,
    this.openIssuesCount,
    this.closedIssuesCount,
    this.createdAt,
    this.updatedAt,
    this.dueOn,
  });

  /// Unique Identifier for Milestone
  int? id;

  /// Milestone Number
  int? number;

  /// Milestone State
  String? state;

  /// Milestone Title
  String? title;

  /// Milestone Description
  String? description;

  /// Milestone Creator
  User? creator;

  /// Number of Open Issues
  @JsonKey(name: 'open_issues')
  int? openIssuesCount;

  /// Number of Closed Issues
  @JsonKey(name: 'closed_issues')
  int? closedIssuesCount;

  /// Time the milestone was created at
  DateTime? createdAt;

  /// The last time the milestone was updated at
  DateTime? updatedAt;

  /// The due date for this milestone
  DateTime? dueOn;

  factory Milestone.fromJson(Map<String, dynamic> input) =>
      _$MilestoneFromJson(input);
  Map<String, dynamic> toJson() => _$MilestoneToJson(this);
}

/// Model class for a new milestone to be created.
@JsonSerializable()
class CreateMilestone {
  CreateMilestone(
    this.title, {
    this.state,
    this.description,
    this.dueOn,
  });

  String? title;
  String? state;
  String? description;
  DateTime? dueOn;

  Map<String, dynamic> toJson() => _$CreateMilestoneToJson(this);

  factory CreateMilestone.fromJson(Map<String, dynamic> input) =>
      _$CreateMilestoneFromJson(input);
}
