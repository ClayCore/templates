import json
import enum
import pprint
import errno
from glob import glob
from pathlib import Path

from c_cpp_build.core.types import SourceFile
from c_cpp_build.utils.logger import Logger


class Lang(enum.Enum):
    CLANG = 0,
    CPP = 1


class ProjectParser(object):
    def __init__(self, project_config):
        self.main_dir = project_config.project_root
        self.raw_config = project_config.config

        # Separate metadata from the rest of the project
        self.meta = self.raw_config['meta']
        self.config = self.raw_config['config']

        # Metadata
        self.author = self.meta['author']
        self.version = self.meta['version']
        self.name = self.meta['name']
        self.lang = self.get_lang()

        # Project configuration
        self.output_type = self.config['output']['target']
        self.output_dest = self.main_dir / self.config['output']['destination']

        # Project dependencies
        self.dependencies = self.process_dirs(self.config['dependencies'])

        # Included directories during build
        self.include_dirs = self.process_dirs(self.config['include'])

        # Exclude these during globs
        self.exclude_dirs = self.process_dirs(self.config['exclude'])

        # Start globbing source files
        self.sources = self.glob_sources()
        self.compile_options = self.get_commands()

    def get_lang(self):
        lang = self.meta['language']

        if lang == 'c':
            return Lang.CLANG
        elif lang == 'cpp':
            return Lang.CPP
        else:
            Logger.perror(f'Project language is invalid: {lang}')
            Logger.exit(errno.EINVAL)

    def process_dirs(self, paths):
        result = []
        for path in paths:
            processed_path = self.main_dir / Path(path).resolve()
            result.append(processed_path)

        return result

    def get_commands(self):
        compile_options = self.config['output']['options']

        return compile_options

    def glob_sources(self):
        types = ()
        if self.lang == Lang.CLANG:
            types = ('*.c', '*.h')
        elif self.lang == Lang.CPP:
            types = ('*.cpp', '*.cxx', '*.hpp', '*.hxx', '*.h')

        # Glob all the files from the source directory
        globbed = []
        for source_dir in self.include_dirs:
            for files in types:
                globbed.extend(glob(f'{source_dir}/{files}'))

        # Convert to internal SourceFile type
        sources = []
        for files in globbed:
            source = SourceFile(files)
            sources.append(source)

        return sources

    def stringify(self):
        sources_stringified = []
        for source in self.sources:
            sources_stringified.append(str(source))

        return {
            'metadata': {
                'name': self.name,
                'author': self.author,
                'version': self.version,
                'language': self.lang
            },
            'project': {
                'output': {
                    'output_type': self.output_type,
                    'output_destination': self.output_dest
                },
                'dependencies': self.dependencies,
                'include_dirs': self.include_dirs,
                'exclude_dirs': self.exclude_dirs
            },
            'processed': {
                'sources': sources_stringified
            }
        }
