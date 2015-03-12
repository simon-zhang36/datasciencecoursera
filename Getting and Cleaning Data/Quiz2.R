# Q1

library(httr)
oauth_endpoints("github")

myapp <- oauth_app("github",
                   key="3161a13bbb3d164e23b1",
                   secret = "bc46ec123cc5ac70e581924de29ba8e32bbfca8e")

github_token <- oauth2.0_token(oauth_endpoints("github"),myapp,cache=FALSE)


gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos",gtoken)
stop_for_status(req)
content(req)

json2 <- jsonlite::fromJSON(toJSON(content(req)))

json2[json2$name == "datasharing","created_at"]

# Q4
con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(con,n=100)
nchar(htmlCode[c(10,20,30,100)])


# html2 <- GET(url)
# content2 = content(html2,as="text")
# parsedHtml = htmlParse(content2,asText=TRUE)


# Q5
d5 <- read.fwf(
        file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
        widths=c(-1,9, -5,4,4, -5,4,4, -5,4,4, -5,4,4),
        skip=4)
sum(d5[,4])

d6 <- read.fwf(
        file="./data/getdata-wksst8110.for",
        widths=c(-1,9, -5,4,4, -5,4,4, -5,4,4, -5,4,4),
        skip=4)
sum(d6[,4])
