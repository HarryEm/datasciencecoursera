# datasciencecoursera

After loading the necessary libraries, the relevant tables are imported into R

Then for both Train and Test, the column headers are added, after which point the subject and activity label columns are added via cbind

Merge the two sets, they have the same number of columnns so this is easily achieved with rbind

Subset anything containing mean (mean) or standard deviation (std) using grepl

Add new column headings to make sure its clear what the variables are, and add a column making clear what the activity numbers relate to

Clear summary achieved by activity by subject with summarise_each
