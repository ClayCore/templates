# Return a commandline string for a compiler
# based on a select few options from a predefined list
# of supported commands from the configuration file


class CommandParser(object):
    def __init__(self, commands: list[str]):
        self.commands = commands
