# Read a csv file and insert a new line at a given position.
# Copyright (C) 2013 Thomas Nauss
#   
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#      
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Author: Thomas Nauss
# Version: "2013-10-23"


insert.row <- function(input.data.frame, row.line, row.content) {
  # Insert a new data row at a given position.
  # Args:
  #   input.data.frame: Data frame into which the row will be added
  #   row.line: Row number at which the new content will be added
  #   row.content: Content of the new row
  #
  # Returns:
  #   Data frame with added new row.
  input.data.frame[(row.line+1):(nrow(input.data.frame)+1), ] <- 
    input.data.frame[row.line:nrow(input.data.frame),]
  input.data.frame[row.line, ] <- row.content
  return(input.data.frame)
}

# Set working directory (alternatively, add a path to the filename), read
# csv file to a data frame.
setwd("D:/active/moc/dm/programs/r-dm-ln-07/src")
my.data <- read.table("csv_example_in.csv", 
                      header=TRUE, sep=",", quote="\"'", dec=".",
                      na.strings = "nan", stringsAsFactors=FALSE)
input.data.frame <- my.data[,c(1:2,4,9)]

# Define position and content of the new row and supply them along with the
# respective column subset of the input data frame to the insert.row function.
row.line <- 3
row.content <- list("2000-01-01 01:46:00", "eat", "fer0", -10.5)
new.data.frame <- insert.row(my.data[,c(1:2,4,9)], 3, row.content)

# Write content of the manipulated data frame to csv file using tabs as
# delimiters and , as decimal sign.
write.table(new.data.frame, "csv_exmaple_out_function.csv",
            col.names=TRUE, sep="\t", quote=TRUE, dec=",")
