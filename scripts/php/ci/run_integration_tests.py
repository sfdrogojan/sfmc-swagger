from bootstrap import PHPUNIT_EXEC, REPO_FOLDER, config
from processes.Codebase import Codebase

codebase = Codebase(PHPUNIT_EXEC, REPO_FOLDER)
codebase.integration_tests(config["repos"]["phpsdk"]["tests"])
