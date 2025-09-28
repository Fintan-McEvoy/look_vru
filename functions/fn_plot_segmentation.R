plot_segmentation <- function(){ 

# Normalize values to [0, 1] 
img <- img / max(img)  # Normalize to [0, 1]
img_scaled <- (img - min(img)) / (max(img) - min(img))


# Convert grayscale to RGB
rgb_img <- array(0, dim = c(nrow(img), ncol(img), 3))
rgb_img[,,1] <- img_scaled  # Red channel
rgb_img[,,2] <- img_scaled  # Green channel
rgb_img[,,3] <- img_scaled  # Blue channel

# Create a raster matrix for image to display
raster_img <- matrix(NA, nrow = nrow(rgb_img), ncol = ncol(rgb_img))
raster_original_img <- matrix(NA, nrow = nrow(rgb_img), ncol = ncol(rgb_img))

for (i in 1:nrow(rgb_img)) {  
    for (j in 1:ncol(rgb_img)) {
        r <- rgb_img[i, j, 1]    
        g <- rgb_img[i, j, 2]    
        b <- rgb_img[i, j, 3]
        raster_original_img[i, j] <- rgb(r, g, b)  
    }
}




alpha <- 0.7  # transparency level
brown <- c(166, 123, 91) / 255  # normalize to [0, 1]

for (coord in highlight_coords) {
    x <- coord[1]  
    y <- coord[2]
    
    # Blend original pixel with pink
    rgb_img[x, y, ] <- (1 - alpha) * rgb_img[x, y, ] + alpha * brown
}

# Create a raster matrix for image to display
raster_img <- matrix(NA, nrow = nrow(rgb_img), ncol = ncol(rgb_img))


for (i in 1:nrow(rgb_img)) {  
    for (j in 1:ncol(rgb_img)) {
        r <- rgb_img[i, j, 1]    
        g <- rgb_img[i, j, 2]    
        b <- rgb_img[i, j, 3]
        raster_img[i, j] <- rgb(r, g, b)  
    }
}

# Flip horizontally by reversing columns
raster_img_flipped <- raster_img[, ncol(raster_img):1]
raster_original_img_flipped <- raster_original_img[, ncol(raster_original_img):1]

raster_obj <- t(as.raster(raster_img_flipped))
raster_original_obj <- t(as.raster(raster_original_img_flipped))

#PLo t options for full screen
options(repr.plot.width = 16, repr.plot.height = 6)

par(mfrow = c(1, 2), mar = c(1, 1, 1, 1))  
# layout and margins

# Plot segmented image
plot(raster_original_obj,
     xlim = c(0, ncol(raster_img_flipped)),
     ylim = c(0, nrow(raster_img_flipped)),
     asp = 1)

# Plot segmented image
plot(raster_obj,
     xlim = c(0, ncol(raster_original_img_flipped)),
     ylim = c(0, nrow(raster_original_img_flipped)),
     asp = 1)
    
}

message("Functions imported successfully.")
