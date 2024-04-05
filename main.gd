class_name PathUtils

class ListItemsInFolder:
    var dir: DirAccess
    var file_name: StringName
    var path: StringName

    func _init(p_path: StringName) -> void:
        path = p_path
        dir = DirAccess.open(p_path)

    func should_continue() -> bool:
        return file_name != ""

    func _iter_init(arg) -> bool:
        dir.list_dir_begin()
        return _iter_next(arg)

    func _iter_next(_arg) -> bool:
        file_name = dir.get_next()
        return should_continue()

    func _iter_get(_arg) -> StringName:
        return file_name

## Merge two paths together, first is always assumed to be a folder
static func join(first: String, second: String) -> String:
    var modified: String = first

    if !first.ends_with("/"):
        modified += "/"

    return modified + second
