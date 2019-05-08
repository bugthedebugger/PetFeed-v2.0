#! /usr/bin/python3

from abc import ABC
from abc import abstractmethod


class Model(ABC):

    @abstractmethod
    def from_map(self, data_maps):
        pass

    @abstractmethod
    def to_map(self):
        pass
