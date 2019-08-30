import sys
import os
import yaml
from subprocess import CalledProcessError, check_output

script_path = os.path.realpath(__file__)

# Validating the existance of env variables
if not 'TRAVIS_BUILD_DIR' in os.environ:
    print('TRAVIS_BUILD_DIR env variable was not found')
    exit(255)

# Loading the config
with open(os.path.join(script_path, 'config.yml'), 'r') as file:
    config = yaml.safe_load(file)

# Vars
travis_folder = os.environ.get('TRAVIS_BUILD_DIR')
phpunit_exec = os.environ.get('PHPUNIT_EXEC') if 'PHPUNIT_EXEC' in os.environ else 'phpunit'
repo_folder = os.path.abspath(os.path.join(travis_folder, config['repos']['phpsdk']['name']))
config_file = os.path.join(repo_folder, 'SalesForce', 'phpunit.xml.dist')
tests = ','.join(config['repos']['phpsdk']['tests'])

# logging the working directory for debug
print('----- Directory and file debug: -----')
print('Travis build directory: ' + travis_folder)
print('Repository directory: ' + repo_folder)
print('Configuration file: ' + config_file)

# Command to run the unit tests
command = '{phpunit} -c {config_file} --testsuite={testsuite}'.format(
    phpunit=phpunit_exec,
    config_file=config_file,
    testsuite=tests
)

print('\n----- Running PHPUnit command: -----\n' + command)

try:
    output = check_output(command, shell=True)
    status_code = 0
except CalledProcessError as e:
    output = e.output
    status_code = e.returncode

print('\n----- Unit tests results: -----\n' + output.decode())

exit(status_code)
