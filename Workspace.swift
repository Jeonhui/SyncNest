@preconcurrency import ProjectDescription
import ClarchPlugin

let workspace = Workspace(
    name: "SyncNest",
    projects: ClarchConfiguration.workspacePaths
)
