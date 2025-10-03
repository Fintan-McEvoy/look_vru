estimate_fat_percent_single_slice <- function (fat_voxels,fat_plus_st_voxels){
    ct_estimate <- (fat_voxels/fat_plus_st_voxels)*100
    model_estimate <- (0.672*ct_estimate) + 3.222
    
    return(sprintf("The estimated Fat%% is %.2f %%", round(model_estimate,digits=2)))
    #return(round(model_estimate,digits=2))
}

message("Functions imported successfully.")
