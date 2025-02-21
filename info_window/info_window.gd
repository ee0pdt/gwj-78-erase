extends Window


func set_info(file: FileSystemItem) -> void:
	%FileName.text = file.text
	%FileType.text = file.get_type()
	%FileSize.text = str(file.file_size)
