#### Count fat plus lean voxels whole body
count_all_voxels_single_slice <- function(slice){
counts <- 0
im_data <- t(dcmImages$img[[slice]])
im_data_HU <- (rescale_slope * im_data) + rescale_intercept
total_counts_single_slice <- sum(im_data_HU >= -250 & im_data_HU <= 200)

return (total_counts_single_slice)
}

message("Functions imported successfully.")
