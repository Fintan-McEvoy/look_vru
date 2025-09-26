#### Count fat plus lean voxels whole body
count_all_voxels_whole_body <- function(){
counts <- 0
pb <- txtProgressBar(min = 1, max = length(dcmImages$img), style = 3)
for (i in seq_along(dcmImages$img)) {
    setTxtProgressBar(pb, i)
    im_data <- t(dcmImages$img[[i]])
    im_data_HU <- (rescale_slope * im_data) + rescale_intercept
    counts[i] <- sum(im_data_HU >= -250 & im_data_HU <= 200)
    flush.console()
    }
    total_voxels <- sum(counts)
    return (total_voxels)
}

message("Functions imported successfully.")
