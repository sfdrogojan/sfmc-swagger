import sys
import requests
from requests.auth import HTTPBasicAuth

# example call: python client.py <token> <owner> <repository> <head_branch> <base_branch>

token = sys.argv[1]
owner = sys.argv[2]
repository = sys.argv[3]
head_branch = sys.argv[4]
base_branch = sys.argv[5]
default_pr_title = "Automated release"

headers = {
    "Accept": "application/vnd.github.v3+json",
    "Content-type": "application/json"
}

# Check if a PR is already present in the target branch
response = requests.get(
    f"https://api.github.com/repos/{owner}/{repository}/pulls",
    auth=HTTPBasicAuth(owner, token),
    headers=headers,
    data={"head": f"{owner}:{head_branch}"}
)

if response.status_code != 200:
    exit(-1)

# Check if we have PR's open for the branch
pull_requests = response.json()
if len(pull_requests) > 0:
    for pr in pull_requests:
        if pr.get("title") == default_pr_title:
            print("Automated PR already exists")
            exit(0)

# Creating the PR
print("Creating the PR")

body = {
    "title": default_pr_title,
    "body": "This release was done because the API spec may have changed",
    "head": f"{owner}:{head_branch}",
    "base": base_branch
}

response = requests.post(
    f"https://api.github.com/repos/{owner}/{repository}/pulls",
    auth=HTTPBasicAuth(owner, token),
    headers=headers,
    json=body
)

if response.status_code == 200:
    exit(0)

# Error
exit(-1)
