from typing import List

class Data:
    def __init__(self, attrs: List[float]):
        self.__attrs__ = attrs

    def get_attrs(self):
        return self.__attrs__