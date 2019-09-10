import os
from subprocess import CalledProcessError, check_output


class Codebase:
    ''' Codebase processes class '''

    def __init__(self, phpunit, folder):
        ''' Git class constructor '''
        self.__phpunit_exec = phpunit
        self.__repo_folder = folder

    def integration_tests(self, tests):
        # Vars
        config_file = os.path.join(self.__repo_folder, 'SalesForce', 'phpunit.xml.dist')
        testsuite = ','.join(tests)

        # logging the working directory for debug
        print('----- Directory and file debug: -----')
        print('Repository directory: ' + self.__repo_folder)
        print('Configuration file: ' + config_file)

        # Command to run the unit tests
        command = '{phpunit} -c {config_file} --testsuite={testsuite}'.format(
            phpunit=self.__phpunit_exec,
            config_file=config_file,
            testsuite=testsuite
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
