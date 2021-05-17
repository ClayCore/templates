import enum
import sys
import os
import errno

from c_cpp_build.utils.logger import Logger


class SourceType(enum.Enum):
    HEADER = 0
    SOURCE = 1


class SourceFile():
    def __init__(self, path: str):
        # Path to a specific source file
        self.path = path

        # The type of the file can be extrapolated from the suffix
        self.extension = self.get_extension()

        # Header/source
        self.type = self.validate_extension()

    # Return the last given occurence of a string array split with `.`
    def get_extension(self):
        return self.path.split('.')[-1]

    # Validate whether the given extension
    def validate_extension(self):
        if self.extension in {'h', 'hpp', 'hxx'}:
            return SourceType.HEADER
        elif self.extension in {'c', 'cpp', 'cxx'}:
            return SourceType.SOURCE
        else:
            Logger.perror(f"Failed to recognize extension: {self.extension}")
            Logger.exit(errno.EINVAL)

    def __str__(self):
        return f'Source file: [{self.path}]'
