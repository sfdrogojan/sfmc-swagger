import os
import yaml


class Config:
    ''' The configuration class '''

    def __init__(self, rootDir):
        ''' Config class constructor '''
        with open(os.path.join(rootDir, 'config.yml'), 'r') as file:
            self.__bag = yaml.safe_load(file)

    def get(self):
        ''' Returns the config bag list '''
        return self.__bag
