from group import Group
from typing import List

class Cluster:
    def __init__(self):
        self.__groups__: List[Group] = []

    def add_group(self, new_group: Group):
        self.__groups__.append(new_group)

    def get_groups(self):
        return self.__groups__