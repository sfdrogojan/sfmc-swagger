import subprocess


class Git:
    ''' The class handles the GIT processes '''

    def __init__(self, token: str, owner: str, repo: str, folder: str):
        ''' Git class constructor '''
        self.__github_token = token
        self.__repo_owner = owner
        self.__repo_name = repo
        self.__repo_folder = folder

    def clone(self):
        ''' Executes a git clone command on the target repository '''

        # logging the working directory for debug
        print('----- Directory and file debug: -----')
        print('Repository directory: ' + self.__repo_folder)

        # Command to clone the repo
        command = 'git clone https://{owner}:{token}@github.com/{owner}/{repo}.git {repo_folder}'.format(
            owner=self.__repo_owner,
            token=self.__github_token,
            repo=self.__repo_name,
            repo_folder=self.__repo_folder
        )

        print('\n----- Clone command output: -----\n' + command)

        try:
            subprocess.check_output(command, shell=True)
            status_code = 0
        except subprocess.CalledProcessError as e:
            status_code = e.returncode

        exit(status_code)
