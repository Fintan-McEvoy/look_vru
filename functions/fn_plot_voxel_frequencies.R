plot_voxel_frequencies <- function(fat_voxel_count,fat_plus_lean_voxel_count){
frequencies <- c(fat_voxel_count, fat_plus_lean_voxel_count)
labels <- c("Fat Voxels", "Fat plus Soft Tissue Voxels")
# Approximate Copenhagen University brown  palette
brown_palette <- c("#8B5A2B", "#A0522D")  
#Create bar plot
barplot(frequencies,  names.arg = labels,  col = brown_palette,  space = 1,
        main = "Frequencies of 'Fat' and 'Lean + Fat' voxels",  ylab = "Frequency",
        border = NA)
    
}

message("Functions imported successfully.")
