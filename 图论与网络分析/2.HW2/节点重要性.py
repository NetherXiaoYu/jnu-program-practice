import pylab 
import numpy as np 
import pandas as pd 
import matplotlib as mpl 
import matplotlib.pyplot as plt 
import networkx as nx 
import seaborn as sns 
 
import itertools 
from itertools import count 
from operator import itemgetter 
 
from networkx.drawing.nx_agraph import graphviz_layout 
from networkx.algorithms.community.centrality import girvan_newman 
 
df = pd.read_csv("./dataset/member-edges.csv") 
df = df[0:1000] 
print(df) 
 
G = nx.from_pandas_edgelist(df, "member1", "member2", create_using = nx.Graph()) 
 
# 计算 度中心性 
dc = nx.degree_centrality(G) 
sorted(dc.items(), key = lambda x : x[1], reverse=True) 
 
# 计算 介数中心性 
bc = nx.betweenness_centrality(G) 
sorted(bc.items(), key = lambda x : x[1], reverse=True) 
 
# 计算 接近中心性 
cc = nx.closeness_centrality(G) 
sorted(cc.items(), key = lambda x : x[1], reverse=True) 
 
# 计算 特征向量中心性 
ec = nx.eigenvector_centrality(G) 
sorted(ec.items(), key = lambda x : x[1], reverse=True) 
 
# 计算 PageRank 分数 
pr = nx.pagerank(G) 
sorted(pr.items(), key = lambda x : x[1], reverse=True)

