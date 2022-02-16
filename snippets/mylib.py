# 导入相关包
from __future__ import annotations
from matplotlib.pyplot import figure
# from matplotlib import rc
from copy import deepcopy
from typing import *
import math
import logging
import importlib
import sys
import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
import os
import collections
import itertools
from pathlib import Path
import random

plt.style.use('default')
# import seaborn as sns
# from itertools import product

def normal_log():
    logging.root.setLevel(level=logging.INFO)

def debug_log():
    logging.root.setLevel(level=logging.DEBUG)

logging.root.setLevel(level=logging.INFO) # default normal mode
font_setting = {'family': 'sans-serif',
                'sans-serif': ['Helvetica'], 'size': 12}
# use latex in matplotlib
matplotlib.rc('font', **font_setting)
# 中文字体设置
# reference https://matplotlib.org/3.1.0/tutorials/text/text_props.html#text-with-non-latin-glyphs
matplotlib.rcParams['font.sans-serif'] = ['SimHei', 'sans-serif']

# minus problem
matplotlib.rcParams['axes.unicode_minus'] = False

# 导出图片
def export_figure(s, tikz=False):
    if not os.path.isdir('../thesis/figures/'):
        logging.info("directory not find")
        return None
    logging.info(f"filename:{s}")
    if tikz:
        import tikzplotlib
        tikzplotlib.save(f"../thesis/figures/{s}.tex", strict=True)
    plt.savefig(f"../thesis/figures/{s}.pdf")

# 导入数据
def import_data(s: str):
    return pd.read_csv(f'./data/{s}.csv')


class Answer():
    def __init__(self,round_=4,scientific_notation=5):
        self.round_ = round_
        self.text = "% The definition of the result from the code\n"
        self.data = {}
        self.scientific_notation = scientific_notation
        self.Item = collections.namedtuple('Item',['data','unit','comment'])

    def update_text(self):
        self.text = "% The definition of the result from the code\n"
        for name,info in self.data.items():
            if info.data == float('inf'):
                self.text += f"\n% TODO: {info.comment}\n"
                self.text += "\\newcommand{\\" + name +"}"
                self.text += r"{\ensuremath{\infty}"
                self.text += r"\todo{" + f"{info.comment}" +"}}\n"
                continue
            if info.data <= 10 ** self.scientific_notation:
                data_str = str(round(info.data,self.round_))
            else:
                # data_str = f"{info.data:.str(self.round_)e}""
                data_str = "{:."+ str(self.round_) +"e}"
                data_str = data_str.format(info.data)
            self.text += f"\n% {info.comment}(raw={info.data})\n"
            self.text += "\\newcommand{\\" + name +"}"
            self.text += "{\\ensuremath{\\SI{" + data_str
            self.text += "}{" + info.unit +"}}}\n"

    def write(self):
        p = Path('../thesis/sections')
        tex_file = p / 'ans.tex'
        tex_file.touch()
        tex_file.write_text(self.text)


    def add_result(self,name:str,data:float=float('inf'),comment:str="",unit=""):
        self.data[name] = (self.Item(data,unit,comment))
        logging.info(f"{name}({comment}):{data} {unit}")
        self.update_text()
        self.write()

    def __getitem__(self,key):
        return self.data[key]

ans = Answer()
# ans.add_result('todoTest',comment="完成计算")
# ans.add_result('testA',0.575,'just a test',"kg")
# ans.add_result('testB',1230000000,'just a test')

# print(ans.data)
# print(ans['testB'])
# print(ans.text)
