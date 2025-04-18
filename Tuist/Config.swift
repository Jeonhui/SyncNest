@preconcurrency import ProjectDescription

let plugins: [ProjectDescription.PluginLocation] = [
    .git(url: "https://github.com/JHKits/ClarchPlugin", tag: "1.1.0"),
    .git(url: "https://github.com/JHKits/TRSEPlugin", tag: "1.0.0"),
    .local(path: .relativeToRoot("Plugins/SyncNestConfigurationPlugin"))
]

let config = Config(
    plugins: plugins,
    generationOptions: .options()
)
