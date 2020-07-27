### Agenda
 - Buggy merge_sort / Yesterday's solution
 - Motivations
 - Basics
 - Branches
 - Adding and pushing to remote repo's


## Why Git?
1. Collaboration: team members can simultaneously work on separate features
2. VCS (version control system) allows us to revisit older versions of the code base
3. Everyone (almost) uses Git or a system with similar commands

https://insights.stackoverflow.com/survey/2018#development-practices

## Mental Model
1. Working directory holds all files in the project
2. Staging area holds files we choose to commit
3. Local repository (.git directory) holds commit history

## Workflow
1. Make changes to files 
2. Add changes to staging area
3. Commit changes to local repository
4. Push commits to remote repo


# initializing a git repository
* `git init`
* `git config --local user.username <your_GitHub_username>`
* `git config --local user.email <you_GitHub_email>`

# adding files
* `git status`
* `git add <file>`
* `git add -A` - adds all files in all subdirectories
* `git add .` - adds all files in current directory and its subdirectories
* `git diff` - shows differences between unstaged and commited versions of a file

# committing files
* `git commit -m "<message>"`
* `git log`

# branching
* `git branch` - see existing branches
* `git branch <new_branch_name>` - make a new branch
* `git checkout <branch_name>` - go to a different branch 
* `git checkout -b <branch-name>` - make and go to a new branch
* `git merge <branch_name>` - merge changes into the current branch
* Branching: https://www.atlassian.com/git/tutorials/using-branches

# stashing
* `git stash`
* `git stash list` - see stashed changes
* `git stash apply`
* `git stash apply <index>` - apply specific stashed changes

# connecting to remote repository on GitHub
* `git remote add <alias_for_remote_repo> <remote_repo_url>` - the alias is an arbitrary name for the remote repo
* `git remote` - see a list of remote repo aliases
* `git remote -v` - seea a list of remote repo aliases and URLs
* `git push -u <alias_for_remote_repo> <branch_name>` - connect local and remote repo and track changes in the remote repo
* `git push -u <alias_for_remote_repo> <branch_name>` - connect local and remote repo and track changes in the remote repo for all branches
* `git clone <remote_repo_url>` - make a local repo from an existing remote repo