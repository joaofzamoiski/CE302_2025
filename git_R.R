library(usethis)
use_git_config(user.name = "joaofzamoiski", 
               user.email = "joaozamoiski@ufpr.br")

usethis::create_github_token()
gitcreds::gitcreds_set()

