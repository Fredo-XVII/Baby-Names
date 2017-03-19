
plot <- national %>% 
  filter(Name == "John", Gender == 'M') %>%
  select(everything())

qplot(plot$Year, plot$Count , plot)

plot %>% ggplot(aes(as.integer(plot$Year),plot$Count)) + geom_line()


as.numeric(format(plot$Year,'%Y'))

format(substr(plot$Year,1,4),'%Y')

tmp <-  as.Date(plot$Year,'%Y')
format(tmp,'%Y')

library(rsconnect)
rsconnect::setAccountInfo(name='fredoxvii',
                          token='B402329ACE6C89A4A67D989A7685ED75',
                          secret='aNZvdhgiqNcARzaSFUt1spgCp/3Y570qQBC2zTor')

deployApp(appDir = "C:\\Users\\marqu\\Documents\\Baby-Names\\Baby_Names_App", 
          appFiles = NULL, appFileManifest = NULL,
          appPrimaryDoc = NULL, appSourceDoc = NULL, appName = NULL,
          appTitle = NULL, contentCategory = NULL, account = NULL,
          server = NULL, upload = TRUE,
          launch.browser = getOption("rsconnect.launch.browser", interactive()),
          logLevel = c("verbose"), lint = TRUE,
          metadata = list())

# https://fredoxvii.shinyapps.io/baby_names_app/

terminateApp(appName = "Baby_Names_App", account = NULL, server = NULL, quiet = FALSE)
