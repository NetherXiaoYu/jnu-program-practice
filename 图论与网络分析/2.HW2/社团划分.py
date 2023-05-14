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

partition_sequence = []
comp = girvan_newman(G)
cnt = 0
for _ in range(100):
    cnt += 1
    print("Processing", cnt)
    partition_sequence.append(next(comp))
    
def modularity(partition):
    return nx.community.quality.modularity(G, partition)

best_partition = max(partition_sequence, key=modularity)

node_colors = ["#FF0000", "#FFC0CB", "#FF6347", "#FFA500", "#FFFF00", "#FFFACD", "#F0E68C", "#EE82EE", "#FF00FF", "#8A2BE2", "#800080", "#7CFC00", "#90EE90", "#2E8B57"]
color_map = []
cnt = 0
for node in G:
    print("Processing", cnt)
    cnt += 1
    for i in range(len(best_partition)):
        if node in best_partition[i]:
            color_map.append(node_colors[i])
            break

fig = plt.figure(figsize = (15, 9), dpi=500)
pos = nx.kamada_kawai_layout(G)
nx.draw(G, pos, alpha = 0.8, nodelist = G.nodes(), node_color = color_map, node_size = 24, with_labels = False, font_size = 12, width = 0.2, edge_color = "black")
fig.set_facecolor("#ffffff")

plt.legend()
plt.savefig("graph_gn.png")

modularity_list = []
for i in range(len(partition_sequence)):
    modularity_list.append(modularity(partition_sequence[i]))

max_ind = np.argmax(np.array(modularity_list))
plt.plot(modularity_list)
plt.annotate('('+str(max_ind)+','+str(modularity_list[max_ind])+')',xytext=(max_ind,modularity_list[max_ind]),xy=(max_ind,modularity_list[max_ind]))
plt.savefig("gn_value.png")
