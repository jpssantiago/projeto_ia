from typing import List
from data import Data

class Group:
    def __init__(self, mid: List[float]):
        self.__mid__ = mid
        self.__data__: List[Data] = []

    def get_mid(self):
        return self.__mid__

    def get_data(self):
        return self.__data__

    def add_data(self, newData: Data):
        self.__data__.append(newData)
    
    def __calc_mid__(self):
        cols: int = len(self.__mid__)
        rows: int = len(self.__data__)

        new_mid = [0 for x in range(cols)]

        for current_data in self.__data__:
            attrs = current_data.get_attrs()

            for x in range(cols):
                new_mid[x] += attrs[x] / rows

        return new_mid

    def altered_mid(self):
        new_mid = self.__calc_mid__()

        if new_mid == self.__mid__:
            return False
        
        self.__mid__ = new_mid
        return True
    
    def clear_group(self):
        self.__data__.clear()