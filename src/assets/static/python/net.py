#!/usr/bin/python
# -*- coding:utf-8 -*-
import networkx as nx
import community
import numpy as np
import sys
import json


d1 = sys.argv[1]
d2 = sys.argv[2]
d3 = sys.argv[3]

nodes = {}
edges = {}
file_object = open(d1)
try:
    nodes = file_object.read()
    nodes = json.loads(nodes)
finally:
    file_object.close()
file_object2 = open(d2)
try:
    edges = file_object2.read()
    edges = json.loads(edges)
finally:
    file_object2.close()

result = {}
G = nx.Graph()

for node in nodes.keys():
    G.add_node(node)
for edge in edges:
    es = edge.split("--")
    edge1 = es[0]
    edge2 = es[1]
    G.add_edge(edge1,edge2)

pos = nx.spring_layout(G)
nodesinfo = []
edgesinfo = []
colorlist = ["#1abc9c", "#9b59b6", "#3498db", "#27ae60", "#34495e", "#f39c12", "#e74c3c", "#998418", "#448E4D"]
partitions = community.best_partition(G)

for node in partitions.keys():
    element = {}
    element["x"] = str(pos[node][0])
    element["y"] = str(pos[node][1])
    element["color"] = colorlist[partitions[node] % len(colorlist)]
    element["id"] = node
    element["label"] = node
    element["size"] = nodes[node]
    attributes = {}
    attributes["Community ID"] = partitions[node]
    attributes["Weight"] = nodes[node]
    element["attributes"] = attributes
    nodesinfo.append(element)

index = 0
for edge in edges:
    element = {}
    element["source"] = edge.split("--")[0]
    element["target"] = edge.split("--")[1]
    element["id"] = index
    element["label"] = ""
    attributes = {}
    attributes["Weight"] = edges[edge]
    element["attributes"] = attributes
    edgesinfo.append(element)
    index += 1

result["nodes"] = nodesinfo
result["edges"] = edgesinfo
file_object = open(d3,'w')
file_object.write(json.dumps(result))
file_object.close()
print ("1")





