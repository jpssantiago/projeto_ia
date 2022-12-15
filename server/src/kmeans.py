from typing import List
from data import Data
from cluster import Cluster
import random
from group import Group
import math

class KMeans:
    def __init__(self, k: int, data_list: List[Data]):
        self.__k__ = k
        self.__datalist__ = data_list
        self.__cluster__ = Cluster()
    
    def __select_random_mid__(self):
        for _ in range(self.__k__):
            chosen_data = random.choice(self.__datalist__)
            new_group = Group(chosen_data.get_attrs().copy())
            self.__cluster__.add_group(new_group)

    def __add_closest_group__(self, data: Data):
        dictionary = {}

        for current_group in self.__cluster__.get_groups():
            dictionary[current_group] = self.__euclidean_distance__(data.get_attrs(), current_group.get_mid())
        
        closest_group = min(dictionary, key=dictionary.get)    
        closest_group.add_data(data)
        
    
    def __euclidean_distance__(self, data_attrs: List[float], mid_attrs: List[float]):
        count = 0

        for data_attr, mid_attr in zip(mid_attrs, data_attrs):
            count += math.pow(data_attr - mid_attr, 2)

        return math.sqrt(count)

    def __verify_mid__(self):
        change = False

        for current_group in self.__cluster__.get_groups():
            if current_group.altered_mid():
                change = True

        if change:
            self.__clear_groups__()

        return change
    
    def __clear_groups__(self):
        for current_group in  self.__cluster__.get_groups():
            current_group.clear_group()

    def run(self):
        self.__select_random_mid__()

        new_mids = True

        while new_mids:
            for data in self.__datalist__:
                self.__add_closest_group__(data)
            
            new_mids = self.__verify_mid__()
        
        return self.__cluster__