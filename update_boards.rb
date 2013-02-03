#!/usr/bin/env ruby

# repositories to update

repos = {
 :rails =>  "/Users/yankov/ruby/rails",
 :metasploit => "/Users/yankov/projects/metasploit-framework"
}

# This is the stupidest update script on the planet
# But it works. And I couldn't think of a better way at the moment.
# Cause I'm tired and it's Saturday evening. Perhaps I had to go drink some beer,
# but no. And seriously, this works. If, like, I put it in the cronjob and run it
# every 15m it'll work as magic. It's still bullshit, yes, for various reasons.
# But hey, cut me some slack! Seriously, why you even waste time sitting here and thinking
# that the following piece of code is awful and how you could make it better. Just run the goddamn
# thing. Do not read. Trust me it works. If it breaks on your computer this is not my fault.
# If it doesn't work then probably you have a shitty computer. Reinstall your OS.
# If re-installing OS doesn't help then buy a new computer. Bye.

repos.each do |name, repo_path|
  # `cd #{repo_path}`
  `git --git-dir=#{repo_path}/.git fetch`
  `git --git-dir=#{repo_path}/.git pull --all`
  # `cd ~/projects/gittop`
  `gittop #{repo_path} -f #{name}_boards.js && mv #{name}_boards.js ~/projects/gitboards/js/`
end

# `cd ~/projects/gitboards`
`git --git-dir=/Users/yankov/projects/gitboards/.git add .`
`git --git-dir=/Users/yankov/projects/gitboards/.git commit -m "update boards"`
`git --git-dir=/Users/yankov/projects/gitboards/.git push origin gh-pages`
# `cd ~/projects/gittop`
