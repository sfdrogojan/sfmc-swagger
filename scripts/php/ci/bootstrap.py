import os
from validator import check_env
from utils.Config import Config

# Check if the environment if properly set up
check_env()

# loading the config
config = Config(os.path.dirname(__file__)).get()

# define constants
PHPUNIT_EXEC = os.environ.get('PHPUNIT_EXEC') if 'PHPUNIT_EXEC' in os.environ else 'phpunit'
GITHUB_TOKEN = os.environ.get('GITHUB_TOKEN')
TRAVIS_BUILD_FOLDER = os.path.dirname(os.environ.get('TRAVIS_BUILD_DIR'))
REPO_FOLDER = os.path.abspath(os.path.join(os.path.dirname(TRAVIS_BUILD_FOLDER), config['repos']['phpsdk']['name']))
REPO_OWNER = config['repos']['phpsdk']['owner']
REPO_NAME = config['repos']['phpsdk']['name']
