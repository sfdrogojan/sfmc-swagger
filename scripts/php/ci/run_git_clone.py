from bootstrap import GITHUB_TOKEN, REPO_OWNER, REPO_NAME, REPO_FOLDER
from processes.Git import Git

git = Git(GITHUB_TOKEN, REPO_OWNER, REPO_NAME, REPO_FOLDER)
git.clone()
