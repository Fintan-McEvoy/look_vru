estimate_fat_percent_lt_kidney_slice <- function (fat_voxels,fat_plus_st_voxels){
    ct_estimate <- (fat_voxels/fat_plus_st_voxels)
    model_estimate <- (0.672*ct_estimate) + 3.222
    return(model_estimate)
}

message("Functions imported successfully.")
