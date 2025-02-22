extends Window


func set_info(file: FileSystemItem, unit: String) -> void:
	%FileName.text = file.text
	%FileType.text = file.get_type()
	%FileSize.text = str(file.file_size, unit)
	%FileCritical.text = "True" if file.system_file else "False"
