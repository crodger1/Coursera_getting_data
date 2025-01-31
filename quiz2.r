library(httr)
library(httpuv)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github",key="7e6d9b4893d85cbd602b",secret = "62a3e0b3b4cfe95151f2a35cd4c80a3293e53db2")

# myapp <- oauth_app("github",key="Client ID",secret = "CLIENT SECRET")

# "7e6d9b4893d85cbd602b"
# "62a3e0b3b4cfe95151f2a35cd4c80a3293e53db2"

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache=FALSE)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# install.packages("jsonlite")
# library(jsonlite)

json1=content(req)
json2=jsonlite::fromJSON(toJSON(json1))

## getting HTML data
con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
head(htmlCode)

nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])


