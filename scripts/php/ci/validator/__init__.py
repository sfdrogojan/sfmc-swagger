import os


def check_env():
    # Validating the existance of env variables
    if 'TRAVIS_BUILD_DIR' not in os.environ:
        print('TRAVIS_BUILD_DIR env variable was not found')
        exit(255)

    if 'GITHUB_TOKEN' not in os.environ:
        print('GITHUB_TOKEN env variable was not found')
        exit(255)
