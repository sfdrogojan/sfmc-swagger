import sys
import os
import yaml
from subprocess import CalledProcessError, check_output

# Validating the existance of env variables
if not 'TRAVIS_BUILD_DIR' in os.environ:
    print('TRAVIS_BUILD_DIR env variable was not found')
    exit(255)

if not 'GITHUB_TOKEN' in os.environ:
    print('GITHUB_TOKEN env variable was not found')
    exit(255)

# Loading the config
with open('./config.yml', 'r') as file:
    config = yaml.safe_load(file)

# Vars
github_token = os.environ.get('GITHUB_TOKEN')
travis_folder = os.environ.get('TRAVIS_BUILD_DIR')
repo_folder = os.path.abspath(os.path.join(travis_folder, config['repos']['phpsdk']['name']))

# logging the working directory for debug
print('----- Directory and file debug: -----')
print('Travis build directory: ' + travis_folder)
print('Repository directory: ' + repo_folder)

# Command to clone the repo
command = 'git clone https://{owner}:{token}@github.com/{owner}/{repo}.git {repo_folder}'.format(
    owner=config["repos"]["phpsdk"]["owner"],
    token=github_token,
    repo=config['repos']['phpsdk']['name'],
    repo_folder=repo_folder
)

print('\n----- Clone command output: -----\n' + command)

try:
    output = check_output(command, shell=True)
    status_code = 0
except CalledProcessError as e:
    output = e.stdout
    status_code = e.returncode

exit(status_code)
