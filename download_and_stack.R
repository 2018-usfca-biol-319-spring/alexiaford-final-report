# Script to download and stack NEON data
# For BIOL 319 Spring 2018
# April 24, 2018

# load library to enable installation of packages from GitHub
library("devtools")

# Install copy of data stacking package (can comment this out after it installs)
install_github("naupaka/NEON-utilities/neonDataStackR",
               dependencies = TRUE)

# load the package
library("neonDataStackR")

# Example download and stack code:
# Change the data product ID (dpID) to the data set you want to download.
# This is for herbaceous clip harvest data, from all sites and months for #####change harvest data
# which it is currently available.
# zipsByProduct(dpID = "DP1.10043.001",
#               site = "all",
#               package = "expanded",
#               check.size = TRUE)

# combine all of the seperate data files into larger combined files
# Change the data product ID to the ID for the dataset you want to download
# and the filepath to the name of the folder that was downloaded in the
# previous step
stackByTable(dpID = "DP1.10043.001",
             filepath = "NEON_count-mosquitoes.zip",
             folder = FALSE)

# combine all of the seperate data files into larger combined files
# Change the data product ID to the ID for the dataset you want to download
# and the filepath to the name of the folder that was downloaded in the
# previous step
stackByTable(dpID = "DP1.10041.001",
             filepath = "NEON_pathogens-mosquito.zip",
             folder = FALSE)

# combine all of the seperate data files into larger combined files
# Change the data product ID to the ID for the dataset you want to download
# and the filepath to the name of the folder that was downloaded in the
# previous step
stackByTable(dpID = "DP1.00005.001",
             filepath = "neon_aggregated_temperature_data.zip",
             folder = FALSE)
