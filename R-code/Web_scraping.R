############## Web scraping 

##################################################
#### Table이 페이지로 되어 있는 경우
##################################################
install.packages("rvest")
library(rvest)

url <- "https://home.kahis.go.kr/home/lkntscrinfo/selectLkntsOccrrncList.do"

disease_table <- data.frame()
disease_table <- unique(disease_table)
# Loop through each page of the table
for (page in 1:20) {  # Update the number of pages as needed
  # Build the URL for the current page
  page_url <- paste0(url, "?page=", page)
  
  # Read the webpage into R
  webpage <- read_html(page_url)
  
  # Extract the table of diseases
  current_page_table <- html_table(html_nodes(webpage, "table")[[10]])
  
  # Append the current page's data to the main data frame
  disease_table <- rbind(disease_table, current_page_table)
}

html_table(html_nodes(webpage, "table")[[10]])













#############################################################
########### 테이블이 Javascript로 되어 있는 경우
#############################################################
install.packages("RSelenium")
install.packages("seleniumPipes")
library(RSelenium)
library(rvest)


# Set up RSelenium
rD <- rsDriver(browser = c("chrome"), chromever = "111.0.5563.64")
rD <- rsDriver(browser = c("firefox"))
# Navigate to the web page
remDr <- rD[["client"]]
remDr$navigate("https://home.kahis.go.kr/home/lkntscrinfo/selectLkntsOccrrncList.do")

# Find the button element and click it
remDr$findElement(using = 'xpath', value = "//*[@id='form1']/div[3]/div[2]/button[1]")$clickElement()


# Wait for the table to load
Sys.sleep(5)

# Extract the table of diseases
webpage <- remDr$getPageSource()[[1]]
disease_table <- html_table(html_nodes(read_html(webpage), "table")[[2]])

# Close the web driver and server
remDr$close()
selServ$stop()

