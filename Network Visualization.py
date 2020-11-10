import csv
import networkx as nx
from operator import itemgetter
import community 
import matplotlib.pyplot as plt

with open('quakers_nodelist.csv','r') as nodecvs:
    nodereader = csv.reader(nodecvs)
    nodes = [n for n in nodereader][1:]


node_names= [n[0] for n in nodes] 

with open('quakers_edgelist.csv','r') as edgecsv:
    edgereader = csv.reader(edgecsv)
    edges = [tuple(e) for e in edgereader][1:] 
	
print(len(node_names))
print(len(edges)) 

G = nx.Graph()
G.add_nodes_from(node_names)
G.add_edges_from(edges) 

print(nx.info(G))
#creating a dictionary
hist_sig_dict = {}
gender_dict = {}
birth_dict = {}
death_dict = {}
id_dict = {}
say_edge = {}
for node in nodes: #defining attribute
    hist_sig_dict[node[0]] = node[1]
    gender_dict[node[0]] = node[2]
    birth_dict[node[0]] = node[3]
    death_dict[node[0]] = node[4]
    id_dict[node[0]] = node[5] 
	
nx.set_node_attributes(G,hist_sig_dict,'historical_significances')#set attribute in the graph object
nx.set_node_attributes(G,gender_dict,'gender')
nx.set_node_attributes(G,birth_dict,'birth_year')
nx.set_node_attributes(G,death_dict,'death_year')
nx.set_node_attributes(G,id_dict,'sdfb_id')


#for say_edge in edges:#want to make another list in dictionary for edge
    #src_sict[edge[0]] = say_edge
    #terg_dict[edge [0]] = edge[2]

#nx.set_edge_attributes(G,say_edge)#want to set the edge attrbutes in the dcitionary.

	
for n in G.nodes():
    print(n,G.node[n]['birth_year'])
 
#draw a grapgh
#pos = nx.drawing.nx_pydot.graphviz_layout(G, prod='dot')
#nx.draw(G,pos, node_size=500,node_shape='o',node_color='yellow',node_border='black',with_labels=True) 
#ax= plt.gca()
#ax.collections[0].set_edgecolor("#000000")

#determine the density of the graph
density = nx.density(G)
print("Network Density:",density) 

#show the shortest path bettween spacific two nodes 
find_whitend_path= nx.shortest_path(G,source="Margaret Fell",target="George Whitehead") 
print("Finding the shortest path:",find_whitend_path) 
print("length of the path:",len(find_whitend_path)-1)

#identifying the diameter this network diagram have some nodes are fall apart so calculation of diameter we create a subgrapgh and calculate the diameter.
print(nx.is_connected(G))
components = nx.connected_components(G)
largest_component = max(components,key=len) 

subgraph=G.subgraph(largest_component)
diameter=nx.diameter(subgraph)
print("Netork diameter between the connected nodes:",diameter)

#transitivity : identify all relations that might have in the grapgh but at present those are not availabe, but there is a possibility to make a connection
triadic_closuer = nx.transitivity(G)
print("transitivity of the network:",triadic_closuer)

#calculating HUB/or most important node in the network 
degree_dict = dict(G.degree(G.nodes()))
nx.set_node_attributes(G,degree_dict,"degree") 
print(G.node['George Fox'])
#printing out cronologically the hub in the network
sorted_degree = sorted(degree_dict.items(),key=itemgetter(1),reverse=True) 
print("Top 20 nodes by degree:")
for d in sorted_degree[:20]:
    print(d)

#centrality measure according to 2 types
betweenness_dict = nx.betweenness_centrality(G) 
eigenvector_dict = nx.eigenvector_centrality(G) # Run eigenvector centrality
#Assinigng attribute in network
nx.set_node_attributes(G, betweenness_dict, 'betweenness') 
nx.set_node_attributes(G, eigenvector_dict, 'eigenvector') 

#sorting the betweenness of centrality among nodes
sorted_betweenness = sorted(betweenness_dict.items(), key=itemgetter(1), reverse=True)
#printing the sorted list
print("Top 20 nodes by betweenness centrality:")
for b in sorted_betweenness[:20]:
    print(b)

top_betweennes = sorted_betweenness
for tb in top_betweennes:
    degree = degree_dict[tb[0]] # Use degree_dict to access a node's degree, see footnote 2
    print("Name:",tb[0],"Between Centrality:",tb[1],"Degree:",degree) 

#drawing grapgh with betweenness centratlity
pos = nx.kamada_kawai_layout(G)
betCent = nx.betweenness_centrality(G, normalized=True, endpoints=True)
node_color = [20000.0 * G.degree(v) for v in G]
node_size =  [v * 10000 for v in betCent.values()]
plt.figure(figsize=(80,80)) 

labels = {}
for node in G.nodes:
    if node in sorted(betCent,key=betCent.get, reverse=True)[:20]:
        #set the node name as the key and the label as its value 
        labels[node] = node


nx.draw_networkx(G, pos=pos, with_labels=False,
                 node_color=node_color,
                 node_size=node_size ) 
				 
#Now only add labels to the nodes you require (the hubs in my case)
nx.draw_networkx_labels(G,pos,labels,font_size=16)

#sorting the eigenvector centrality
sorted_eigenvector = sorted(eigenvector_dict.items(),key=itemgetter(1),reverse=True)
print("To 10 nodes by eigenvector centrality")
for m in sorted_eigenvector[10]:
    print(m)
    
		
print("\nCommunity decleration with modularity\n")
communities = community.best_partition(G)
nx.set_node_attributes(G, communities, 'modularity') 

class0 = [n for n in G.nodes() if G.node[n]['modularity'] == 0]
class0_eigenvector = {n:G.node[n]['eigenvector'] for n in class0}
class0_sorted_by_eigenvector = sorted(class0_eigenvector.items(), key=itemgetter(1), reverse=True)
print("Modularity Class 0 Sorted by Eigenvector Centrality:")
for node in class0_sorted_by_eigenvector[:5]:
    print("Name:", node[0], "| Eigenvector Centrality:", node[1]) 




#print(G)



#show the grapgh
plt.show()