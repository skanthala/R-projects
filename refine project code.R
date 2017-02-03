Converting company column to lower case: 
  refine_original$company <- str_replace(refine_original$company, "^p.*|^P.*|^f.*", "philips" )
  refine_original$company <- str_replace(refine_original$company, "^a.*|^A.*", "akzo" )
  refine_original$company <- str_replace(refine_original$company, "^v.*|^V.*", "van houten" )
  refine_original$company <- str_replace(refine_original$company, "^u.*|^U.*", "unilever" )
  dividing Productcode into two columns: 
  refine_original<-  separate(refine_original,"Product code / number", c("Product code", "Number"), "-")
  Adding new column product category  to refine_original and saving as refine_clean:
  refine_clean <- mutate(refine_original, productcategory = ifelse(grepl("p", refine_original$`Product code`), 
  "Smartphone", ifelse(grepl("x", refine_original$`Product code`), "Laptop", ifelse(grepl("v", refine_original$`Product code`),
  "TV", ifelse(grepl("q", refine_original$`Product code`), "Tablet",  "other")))))
  combining address columns:
  refine_clean <- unite(refine_clean, full_address, address:country, sep = ",")
  Creating Dummy varibales:
    for(level in unique(refine_clean$company)){
      refine_clean[paste("company", level, sep = "_")] <- ifelse(refine_clean$company == level, 1, 0)
    }
  for(level in unique(refine_clean$productcategory)){
    refine_clean[paste("product", level, sep = "_")] <- ifelse(refine_clean$productcategory == level, 1, 0)
  }
  Exporting refine_clean and refine_original  dataframe to csv format:
  write.csv(refine_clean, "refine_clean.csv")
  write.csv(refine_original, "refine_original.csv")
  