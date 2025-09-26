delete_folder_contents <- function(folder_path) {
# List all files and directories inside the folder  
contents <- list.files(folder_path, full.names = TRUE, recursive = TRUE)

# Delete each item
for (item in contents){
	if (file.exists(item)){
	unlink(item, recursive = TRUE, force = TRUE)
	}
}
}

message("Functions imported successfully.")
