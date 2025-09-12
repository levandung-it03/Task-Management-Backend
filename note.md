Roles & Permissions
ROLE_PM
Create: Project, Phase, Collection, Task
RUD: On anything they created (Project, Phase, Collection, Task)
Other: Can create CommentsOfReport
ROLE_LEAD
Create: Task
RUD: On Tasks they created
Other: Can create CommentsOfReport
ROLE_EMP
Create: Report
RUD: On Reports they created
Other: Can create CommentsOfReport
So the core rules are:
PM = full hierarchy creator (Projects, Phases, Collections, Tasks) + Comments.
Lead = only Task creator (with RUD) + Comments.
Employee = only Report creator (with RUD) + Comments.

Summary: CollectionService
Task Creation
A Task can only be created inside a Collection if:
Start date ≥ Collection start date
Deadline ≤ Collection due date
Project is in progress
Phase is not ended
Collection is not ended
Delegates task creation to TaskService.
Collection Retrieval
Get by ID: Only accessible if CollectionTransService.canSeeCollections() returns true (user is project member or assigned to a Task inside project).
Get All Related Collections:
If user is a project member → get all collections in phase.
Else → only collections where the user is assigned to a Task.
Collection Update
Validate request dates vs. Phase.
Validate parent entities not ended.
Ensure tasks inside collection still fit within new start/due dates.
Only owner (creator) can update.
Collection Delete
Only Project owner can delete.
Project must be in-progress, Phase not ended, Collection not ended.
Collection must not contain Tasks.
Collection Completion
Only Collection owner can complete.
Project must be in-progress, Phase not ended, Collection not ended.
All Tasks must be completed before completing Collection.
Completion = setting endDate = now.
Related Tasks Retrieval
Fetch all tasks of a Collection.
Sort order:
Incomplete tasks first (endDate == null)
Then by start date ascending
Then by priority (higher priority first)
Statistics
Build per-user statistics from TaskForUsers.
Sort by total points (descending).
Helper: validateCollection
Start date ≥ Phase start
Due date ≤ Phase due
CollectionTransService
canSeeCollections(Project, username) returns true if:
User is project member
OR user is assigned to any Task in the project

Summary: CommentOfReportService
create(Report, CommentCreationRequest, token)
Preconditions (validated via report):
Project must be in-progress
Phase must not be ended
Collection must not be ended
Allowed creators (must be at least one):
Assigned user of the TaskForUser that created the Report
Project owner of the Report’s Project
Task owner of the Task containing the Report
Forbidden case:
If user has ROLE_ADMIN but is a kicked project leader (ProjectService.isKickedLeader) → reject
Comment creation:
Save new CommentOfReport with:
User info from token
Linked to the Report
Content & created time
If it’s a reply (repliedCommentId present):
Attach repliedComment
Notify replied comment’s creator via email
Else:
Notify assigned user of the report via email
notifyViaEmail(target, userCreating, report, msgEnum)
Sends simple email with:
Recipient = target
Subject = from msgEnum
Body includes:
Commenter info
Assigned user info
Report title
Task / Collection / Phase / Project names

Summary: GroupService
getPaginatedGroups(request, token)
Get current user (by token).
Fetch paginated groups related to user via GroupHasUsersService.findAllRelatedGroups.
Map to response DTOs.
create(request, token)
Get current user (creator).
Validate all assigned emails exist.
Save new group (with creator as admin).
Add assigned users as members.
Save all relationships in GroupHasUsers.
Notify new members via email.
Return group ID.
get(id, token)
Get group by ID.
Validate current user is related to the group (either creator or in GroupHasUsers).
Return group detail with members.
update(id, request, token)
Validate group exists.
Check current user is admin of the group.
Validate new users exist.
Add new members (avoid duplicates).
Update group name and update time.
Save and notify newly added users.
changeStatus(id, request, token)
Validate group exists.
Check current user is admin of the group.
Update group active status and update time.
getRelatedGroups(token)
Extract username from token.
Fetch all groups related to user via GroupHasUsersService.findAllRelatedToUser.
Map to short responses depending on user’s role in group.
getUsersGroupToAssign(id, token)
Extract username from token.
Fetch assignable users in the group via GroupHasUsersService.getUsersGroupToAssign.
Map to short DTOs.
notifyViaEmail(usersGroup, msgEnum)
For each user (except admins) in usersGroup, enqueue an email about group change.
Process queue immediately.
Helper: isRelatedToGroup(email, group)
User is related if:
They are the creator, or
They are in the group’s GroupHasUsers.

Summary: PhaseService
Core responsibilities
Manages phases within a project (CRUD, validation, access control, completion, statistics).
Key methods
create(Project, PhaseRequest, token)
Validates phase timeline fits inside project timeline.
Only allowed if project is in progress.
Saves new phase linked to project.
Returns new phase ID.
update(id, PhaseRequest, token)
Validates phase exists.
Validates new timeline is consistent with project and collections.
Project must be in progress, phase must not be ended.
Only phase owner can update.
Updates entity via mapper.
delete(id, token)
Validates phase exists.
Only project owner can delete.
Project must be in progress, phase must not be ended.
If phase has collections → reject.
Deletes phase.
completePhase(id, token)
Only phase owner can complete.
Project must be in progress.
Cannot complete if phase has any uncompleted collection.
Sets endDate = today.
Read operations
get(id, token) → Fetch single phase if user can see it (via PhaseTransService.canSeePhases).
getPhaseDetail(phaseId, token) → Same but mapped to detail response.
getAllRelatedPhases(project, token) →
If user is project member/admin → all phases.
Else → only phases where user is assigned tasks.
getAllRelatedCollections(phaseId, token) → fetch + map + sort collections by endDate and startDate.
getSimpleCollections(phaseId) → return map of collectionId → collectionName.
getUsersStatistic(phaseId) → get all users from tasks in phase, map to statistics, sort by total points.
Helpers
validatePhase(request, project)
Start date must not be before project start.
End date must not be after project end.
existsByProjectId(projectId)
findAllProjectId(projectId)
existsNotCompleteByProjectId(projectId)
PhaseTransService
canSeePhases(project, username) → true if:
User is in project users, OR
User is assigned to any task in the project.

ProjectService Summary
Dependencies:
ProjectRepository, ProjectMapper, ProjectRoleService, UserInfoService, JwtService,
ProjectRoleMapper, PhaseService, PhaseMapper, UserInfoMapper,
EmailQueueService, EmailService, ReportService, TaskService,
TaskForUsersService.
Core Responsibilities
Project Lifecycle
create(ProjectRequest, token) → Creates project, assigns creator as OWNER.
update(id, ProjectRequest, token) → Update project info (must be OWNER).
delete(id, token) → Only OWNER can delete if:
No phases exist,
No other project members.
startProject(projectId, token) → Sets status = IN_PROGRESS.
switchPauseAndInProgressProject(projectId, token) → Toggle between IN_PROGRESS ↔ PAUSED.
closeProject(projectId, token) → Close immediately (no need to check completeness).
complete(token, id) → Complete only if all phases are completed → sets status = COMPLETED.
Project Membership
addLeaders(projectId, AddedLeaderRequest, token) → Add new leaders (role = MEMBER).
kickLeader(projectId, KickedLeaderRequest, token) → Remove a leader and send email notification.
getLeaders(token, projectId) → Get all project roles.
getLeadersToAddIntoProject(projectId, query, token) → Search leaders not in project.
Phase Management (Delegates to PhaseService)
createPhase(projectId, PhaseRequest, token)
getAllRelatedPhases(projectId, token)
getSimplePhases(projectId)
Project Visibility
getRelatedProjects(token)
High-role (OWNER/MEMBER) → from project roles.
Low-role (EMP) → from task assignments.
getProjectDetail(projectId, token)
Accessible if user is project member or assigned task user.
Statistics & Overview
getProjectStatistic(token) → Counts running, ended, pending projects.
getProjectOverview(projectId) → Reports + tasks overview (approved, rejected, done on time/late).
getUsersStatistic(projectId) → Stats of users’ task points in project.
Utility
notifyViaEmail(List<ProjectRole>, ProjectMsg) → Queue email notifications.
getProjectByOwner(projectId, token) → Ensures current user is OWNER.
getUpdatableProject(id, token) → Ensures project is OWNER + IN_PROGRESS.
isKickedLeader(Task, username) → Check if a user was removed from project.
ProjectRoleService
saveAll(List<ProjectRole>)
findByUserInfoEmail(email)
delete(ProjectRole)

ReportService Summary
Dependencies
ReportRepository – persistence.
CommentOfReportService + CommentOfReportMapper – manage comments.
UserInfoService, JwtService – auth & user info.
EmailService – email notifications.
Core Responsibilities
Handles report lifecycle, review actions (approve/reject), comments, and notifications.
Key Methods
🔹 Update
update(reportId, newContent, token)
Validates report via findUpdatableReport.
Checks project, phase, collection, task not ended.
Only report owner (assigned user) can update.
Updates content + timestamp.
Sends email notification to task owner.
🔹 Comments
createComment(reportId, request, token)
Fetches report.
Validates parent entities not ended.
Creates comment via CommentOfReportService.
Returns mapped response.
🔹 Review
approveReport(reportId, token)
Validates report via findUpdatableReport.
Sets status = APPROVED + reviewed time.
Notifies assigned user.
rejectReport(reportId, rejectReason, token)
Validates report.
Sets status = REJECTED + reviewed time + reason.
Notifies assigned user.
🔹 Validation
validateEndedParentEntities(report)
Project must be IN_PROGRESS.
Phase not ended.
Collection not ended.
Task not ended.
findUpdatableReport(reportId, token)
Report must exist and not already reviewed.
Validates parent entities.
For LEAD role: rejects if kicked from project.
Returns report.
🔹 Queries & Helpers
hasAtLeastOneReport(taskId) → true/false.
save(report) → persist.
findAllByUserTaskCreatedId(id) → list of reports.
existsByEmailsInAndTaskId(emails, taskId)
existsReportByTaskId(id)
existsReportByUserTaskCreatedId(userTaskId)
countAllInProjectByStatus(projectId, status)
🔹 Notifications
notifyViaEmail(target, specifiedPerson, report, msgEnum)
Sends formatted email with report + project hierarchy info.
✅ Permissions (implicit from checks)
EMP (assigned user) → can create/update own reports, add comments.
LEAD / PM (task/project owner) → can approve/reject reports of assigned users.
All roles → can comment on reports (validated in CommentOfReportService).

TaskForUsersService
Manages the relationship between users and tasks (assignment, reports, kick/re-add, permissions).
Core Features
User Search
searchUsersOfRootToCreateSubTask – search eligible users to assign.
Assignment
saveAllByEmails – assign users to a task.
save, saveAll – persist user-task relationships.
Reports
createReport – assigned user creates a report (only if task started, not kicked, no approved report).
getReportsAndComments – project owner, task owner, or assigned user (not kicked) can view.
Kick/Re-add
kickUser – task owner can kick users (different rules for root/sub tasks).
reAddUser – task owner can rejoin kicked user.
Validation
validateEndedParentEntities – checks project, phase, collection, task not ended.
findUserTaskByTaskOwner – ensures only task owner can modify users.
Queries
getAllUsersOfTask, getUserOfTask, checkIsAssignedUserTask.
Find by project/phase/collection.
existsByProjectIdAndAssignedUsername.
📌 TaskService
Manages tasks themselves (create, update, assign, lock, complete, delete, view).
Core Features
Creation
create – PM/member creates root task in a collection (valid project/phase/collection).
createSubTask – task owner creates sub-task (must be within root task’s timeline, no report users).
Get & View
get – fetch task (check permissions).
getUsersOfTask – PM/Lead see all, employee only sees themselves.
getSubTasksOfRootTask – root task’s subtasks (permissions vary).
getAllRelatedTasks & getAllRelatedUndoneTasks.
getRootTaskDetail, getTaskDelegator.
Update
updateDescription, updateReportFormat, update (general info).
Only if no reports exist yet.
Complete / Lock
updateDoneTask – mark as done (only if started, all subtasks & reports done).
updateLockedStatusTask – lock/unlock task.
Delete
delete – only owner, within 12h, no reports.
deleteRootTask – removes task + users.
deleteSubTask – moves users back to root, deletes sub-task.
Notifications
notifyViaEmail – informs assigned users of changes.
Validation
validateTask – valid dates.
validateSubTask – within root task boundaries.
Statistics
countAllInProjectDoneOnTime, countAllInProjectLate.
existsTaskNotCompletedByCollectionId.
--------------------------------------------
caveat bool1(value bool) {
value
}

caveat bool2(v1 bool, v2 bool) {
v1 && v2
}

caveat bool3(v1 bool, v2 bool, v3 bool) {
v1 && v2 && v3
}

caveat bool4(v1 bool, v2 bool, v3 bool, v4 bool) {
v1 && v2 && v3 && v4
}

caveat bool5(v1 bool, v2 bool, v3 bool, v4 bool, v5 bool) {
v1 && v2 && v3 && v4 && v5
}

caveat bool6(v1 bool, v2 bool, v3 bool, v4 bool, v5 bool, v6 bool) {
v1 && v2 && v3 && v4 && v5 && v6
}

definition user {}

definition project {
relation owner: user
relation member: user
relation kicked: user
relation child_phase: phase#parent

permission view = owner | member | assigned_user
permission assigned_user = child_phase->assigned_user
permission update = owner caveated [bool1]
permission delete = owner caveated [bool2]
permission start = owner
permission pause = owner
permission close = owner
permission complete = owner caveated [bool1]
permission add_member = owner
permission kick_member = owner
}

definition phase {
relation parent: project
relation owner: user
relation child_collection: collection#parent

permission view = parent->view
permission assigned_user = child_collection->assigned_user
permission create = parent->owner
permission update = owner caveated [bool2]
permission delete = parent->owner caveated [bool3]
permission complete = owner caveated [bool3]
}

definition collection {
relation parent: phase
relation owner: user
relation child_task: task#parent

permission view = parent->view
permission assigned_user = child_task->assigned_user
permission create = parent->owner
permission update = owner caveated [bool4]
permission delete = parent->parent->owner caveated [bool4]
permission complete = owner caveated [bool4]
}

definition task {
relation parent: collection
relation project: project
relation owner: user
relation assigned: user
relation kicked: user
relation child_subtask: subtask#parent

permission view = assigned | owner | project->owner | project->member
permission assigned_user = assigned | child_subtask->assigned_user
permission create = parent->owner | (owner caveated [bool1])
permission update = owner caveated [bool4]
permission delete = owner caveated [bool5]
permission complete = owner caveated [bool6]
permission lock = owner caveated [bool2]
permission assign_user = owner caveated [bool2]
permission kick_user = owner caveated [bool2]
permission readd_user = owner caveated [bool2]
}

definition subtask {
relation parent: task
relation project: project
relation owner: user
relation assigned: user
relation kicked: user

permission view = assigned | owner | parent->owner | project->owner | project->member
permission assigned_user = assigned
permission create = parent->owner caveated [bool1]
permission update = owner caveated [bool4]
permission delete = owner caveated [bool4]
permission complete = owner caveated [bool4]
permission assign_user = owner caveated [bool2]
permission kick_user = owner caveated [bool2]
permission readd_user = owner caveated [bool2]
}

definition report {
relation parent: task | subtask
relation project: project
relation owner: user
relation assigned: user

permission create = assigned caveated [bool2]
permission update = owner caveated [bool3]
permission approve = (parent->owner | project->owner) - project->kicked caveated [bool3]
permission reject = (parent->owner | project->owner) - project->kicked caveated [bool3]
permission view = owner | assigned | parent->owner | project->owner
permission comment = view caveated [bool3]
}

definition comment_of_report {
relation parent: report
relation owner: user
relation replied_comment: comment_of_report

permission create = parent->comment - project->kicked caveated [bool3]
permission view = parent->view
}

definition group {
relation admin: user
relation member: user

permission create = admin
permission update = admin
permission change_status = admin
permission view = admin | member
permission add_member = admin
permission view_assignable_users = admin
}