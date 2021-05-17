# Project configuration module
# All c/cpp projects are defined by a `config.json` file in their project root

import errno
import os
import sys
import json
import glob
from pathlib import Path
from dotenv import find_dotenv, load_dotenv

from c_cpp_build.utils.logger import Logger


class ProjectConfig(object):
    config_file = 'project.json'

    def __init__(self):
        # Acquire configuration file for the project
        self.project_root = self.get_project()
        self.config_path = self.project_root / self.config_file

        # Unprocessed config
        self.config = self.open_config()

        # Environmental variables
        self.env_vars = self.get_env_vars()

    def get_project(self):
        max_dir_attempts = 5
        filepath = '**/' + self.config_file

        # Go up at most 5 directories
        for _ in range(max_dir_attempts):
            # Find the correct path matching the glob
            for config_path in glob.glob(filepath, recursive=True):
                temp_path = Path(config_path)
                # Return the resolved path
                if temp_path.exists():
                    return temp_path.parent.resolve()

            # Move up and glob until found
            filepath = '../' + filepath

        Logger.perror(f'Project root not found!')
        Logger.exit(errno.ENOENT)

    def open_config(self):
        # Open the config and deserialize it
        config = open(self.config_path, "r")

        return json.load(config)

    def get_env_vars(self):
        # Load `.env` files first
        load_dotenv(find_dotenv())

        # Pull env vars
