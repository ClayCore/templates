#!/usr/bin/env python3

from core.parser import ProjectParser
from utils.config import ProjectConfig
from utils.logger import Logger


def main():
    # Load the project configuration
    project_config = ProjectConfig()

    # Parse the project
    project = ProjectParser(project_config)

    Logger.pdebug(project.stringify())

    # Pass it to the builder which will add
    # all dependencies as defined in project configuration


if __name__ == '__main__':
    main()
