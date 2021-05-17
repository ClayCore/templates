import errno

from c_cpp_build.core.types import SourceFile
from c_cpp_build.utils.logger import Logger


class Builder(object):
    def __init__(self, project):
        # Parsed project instance
        self.project = project
