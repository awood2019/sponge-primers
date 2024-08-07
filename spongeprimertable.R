#make table of which sponge sequences have mismatches to coral primers and where

library("tidyverse")
setwd("/Users/quattrinia/Desktop/AW RStudio/data") #set working directory to folder with sponge data

#import files
ogsponges <- read_csv('cat_originalsponges.csv', show_col_types = FALSE) #import table of all original sponge names and sequences
barcode <- read_csv('cat_originalsponges_barcode.csv', show_col_types = FALSE) #import table of sequences containing the barcode region
retainprim <- read_csv('cat_retainedsponges_primers.csv', show_col_types = FALSE) #import table of sequences with primers retained, only contains sequences with primers having <= 2 mismatches
trimprim <- read_csv('cat_trimmedsponges.csv', show_col_types = FALSE) #import table of sequences with primers trimmed out, only contains barcode region of sequences that have primers with <=2 mismatches

#create barcode column in table
table.barcode <- left_join(ogsponges, barcode, by = "Name") #combined table of original seqs with seqs containing barcode
table.barcode$barcodematch <- ifelse(is.na(table.barcode$Sequence.y), "no", "yes") #create column saying no if seq had no barcode and yes if it did

#create matches primer with <=2 mismatches column
table.trimprim <- left_join(table.barcode, trimprim, by = "Name") #added column with trimmed seqs
table.trimprim$primermatch <- ifelse(is.na(table.trimprim$Sequence),"no", "yes") #added column saying yes if sequence contained primers and no if sequence didn't contain primers

#create number of forward mismatches column
table.mismatch <- filter(retainprim, Type == "mismatch") #filter out the rows that have mismatch in the type column from the primer table                                                                                                                                                                                                                                                                                                                                              
table.mismatchinfo <- table.mismatch %>%
  group_by(`Sequence Name`) %>% #grouping the sequences by primer name since some have more than one mismatch
  summarise(Number=sum(Length), Positions=toString(unique(Minimum))) #summarizing by amount and location of mismatches
table.mismatchinfo <- table.mismatchinfo %>% rename("Name" = "Sequence Name") #rename Sequence Name column to Name
final.table <- left_join(table.trimprim, table.mismatchinfo, by = "Name") #added primer mismatch info column to larger table
view(final.table)

final.table$NumberMismatch <- ifelse(final.table$barcodematch == "yes", 
                                     ifelse(final.table$primermatch == "yes", ifelse(is.na(final.table$Number), "0", final.table$Number), final.table$Number), 
                                     final.table$Number) #if the barcode is present and the primer matches but there are no mismatches, change the NA values to 0
view(final.table)

write.csv(final.table, "/Users/quattrinia/Desktop/AW RStudio/28Sspongeprimermatches.csv") #export table as csv

#-----------------------------
#add column for sequences containing A insertions in reverse primer binding region
excel.table <- read_csv('28S_sponge_primer_matches.csv', show_col_types = FALSE) #import polished table of sponge mismatches from Excel
A1insertion <- read_csv('cat_originalsponges_A1insertion.csv', show_col_types = FALSE) #import table of sequences with A insertion in position 1
A2insertion <- read_csv('cat_originalsponges_A2insertion.csv', show_col_types = FALSE) #import table of sequences with A insertion in position 2

table.A1 <- left_join(excel.table, A1insertion, by = "Name") #add sequences with A insertion at position 741 to table
table.A1$A1insertion <- ifelse(is.na(table.A1$Sequence), "no", "yes") #create column saying no if there's no A insertion and yes if there is

table.A2 <- left_join(table.A1, A2insertion, by = "Name") #add sequences with A insertion at position 745 to table
table.A2$A2insertion <- ifelse(is.na(table.A2$Sequence.y), "no", "yes") #create column saying no if there's no A insertion and yes if there is

write.csv(table.A2, "/Users/quattrinia/Desktop/AW RStudio/Ainsert_28Sspongeprimermatches.csv") #export table as a csv

          