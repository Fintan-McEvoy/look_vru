#### Count fat voxels in single slice -- Left kidney

count_fat_voxels_lt_kidney_slice <- function(k){
	
	#counter <- 0
	highlight_coords <- list()
	im_data <- t(dcmImages$img[[k]])
	im_data_HU <- (rescale_slope * im_data) + rescale_intercept
	pb <- txtProgressBar(min = 2, max = 511, style = 3)
	for (i in 2:511){
        for (j in 2:511){
        setTxtProgressBar(pb, i)
        rows_im <- c(i-1,i-1,i-1,i,i,i,i+1,i+1,i+1)
	cols_im <- c(j-1,j,j+1,j-1,j,j+1,j-1,j,j+1)
	call_im <- cbind(rows_im, cols_im)
	if(all(im_data_HU[call_im] >=  range_min) & all(im_data_HU[call_im] <=  range_max)){
		im_data <- t(dcmImages$img[[k-1]])
        	im_data_HU <- im_data + rescale_intercept
        	if(all(im_data_HU[call_im] >=  range_min) & all(im_data_HU[call_im] <=  range_max)){
        		im_data <- t(dcmImages$img[[k+1]])
			im_data_HU <- im_data + rescale_intercept
                    
		if(all(im_data_HU[call_im] >=  range_min) & all(im_data_HU[call_im] <=  range_max)){
                #counter = counter+1
                highlight_coords[[length(highlight_coords) + 1]] <- c(i,j)
                }             
               	}
            }
        }
        flush.console()  # Ensure progress bar updates in Jupyter
    }
return(highlight_coords)
}

message("Functions imported successfully.")
