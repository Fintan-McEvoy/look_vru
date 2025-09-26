#rescale_intercept <- For use with each image to covert raw pixel values to HU values, the value is given in the DICOM header 
rescale_intercept <- extractHeader(dcmImages$hdr[1], string="RescaleIntercept", numeric=TRUE)

#rescale_slope <-For use with each image to covert raw pixel values to HU values, the value is given in the DICOM header 
rescale_slope <- extractHeader(dcmImages$hdr[1], string="RescaleSlope", numeric=TRUE)

#CT  Number Range  -- fixed range determined by experiment
range_max <- -24
range_min <- -250

# NUmber of CT images in the stack
numImages <- length(list.files(file.path(base_dir,'data_folder'), recursive= TRUE, ignore.case = TRUE))

#PaitentID from the dicom headers
patientID <- extractHeader(dcmImages$hdr[1], string="PatientID", numeric=FALSE)

#Get base directory
base_dir <- getwd()

message("Variables imported successfully.")
