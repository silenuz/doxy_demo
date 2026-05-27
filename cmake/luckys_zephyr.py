"""
@Project: doxy-to-godot
@Date: 5/25/26
@File: luckys_zephyr

@Author: Silenuz Nowan (silenuznowan@Yahoo.com)

"""
from collections import namedtuple
from pathlib import Path
from xml.etree import ElementTree as et

ClassInfo = namedtuple("ClassInfo", ["class_name", "reference"])

def get_class_name(data_node: et.Element) -> ClassInfo:
    # todo: update docstring for new method signature
    """
    Gets the class name from the doxygen node's id attribute
    :param data_node: The doxygen XML node containing the class data
    :return: a string containing the class name
    """
    class_name = data_node.attrib['id']
    name = class_name.replace("class", "")
    reference_node  = data_node.find('includes')
    reference = reference_node.attrib['refid']
    return ClassInfo(name, reference)

def create_profile_for_class(file):
    tree = et.parse(file)
    root = tree.getroot()
    data_node = root[0]
    class_info = get_class_name(data_node)
    return data_node,class_info