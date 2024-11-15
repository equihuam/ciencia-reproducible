library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg) 


# define nodes dataframe
nodes <- create_node_df(n = 4, 
                        type = "lower",
                        style = "filled",
                        color = "teal", 
                        shape = "circle", 
                        data = c(3.5, 2.6, 9.4, 2.7))

# define edges dataframe
edges <- create_edge_df(from = c(1, 2, 3, 3),
                        to = c(2, 4, 4, 2))

# create graph
my_graph <- create_graph(nodes_df = nodes, edges_df = edges)

# print graph
render_graph(my_graph)

#------------------------------------------------------------

# Una gráfica básica
my_graphviz <- grViz("digraph{
         
                     graph[rankdir = LR]
                     
                     node[shape = rectangle, style = filled]  
                     A[label = 'Figure']
                     B[label = 'Analysis.R']
                     C[label = 'Data.csv']
 
                     edge[color = black]
                     B -> A
                     C -> B
                     
                     }")

my_graphviz

# -----------------------------------------------------------

# Una gráfica con GraphViz
gvz <- grViz("digraph{
 
      graph[rankdir = LR]
  
      node[shape = rectangle, style = filled]
  
      node[fillcolor = Coral, margin = 0.2]
      A[label = 'Figure 1: Map']
      B[label = 'Figure 2: Metrics']
  
      node[fillcolor = Cyan, margin = 0.2]
      C[label = 'Figures.Rmd']
  
      node[fillcolor = Violet, margin = 0.2]
      D[label = 'Analysis_1.R']
      E[label = 'Analysis_2.R']
  
      subgraph cluster_0 {
        graph[shape = rectangle]
        style = rounded
        bgcolor = Gold
    
        label = 'Data Source 1'
        node[shape = rectangle, fillcolor = LemonChiffon, margin = 0.25]
        F[label = 'my_dataframe_1.csv']
        G[label = 'my_dataframe_2.csv']
      }
  
      subgraph cluster_1 {
         graph[shape = rectangle]
         style = rounded
         bgcolor = Gold
    
         label = 'Data Source 2'
         node[shape = rectangle, fillcolor = LemonChiffon, margin = 0.25]
         H[label = 'my_dataframe_3.csv']
         I[label = 'my_dataframe_4.csv']
      }
  
      edge[color = black, arrowhead = vee, arrowsize = 1.25]
      C -> {A B}
      D -> C
      E -> C
      F -> D
      G -> D
      H -> E
      I -> E
      
      }")

gvz

# -------------------------------------------------------------

# Ahora con mermaid

mermaid("
        graph LR
        A[Nutrients]
        A-->B[Phytoplankton]
        B-->B1[Mussels]
        ")

# --------------------------------------------------------------

# Mermaid algo más complejo
mermaid("
        %%{init: {'theme':'forest'}}%%
        graph BT
        A((Salinity))
        A-->B(Barnacles)
        B-.->|-0.10|B1{Mussels}
        A-- 0.30 -->B1
 
        C[Air Temp]
        C-->B
        C-.->E(Macroalgae)
        E-->B1
        C== 0.89 ==>B1
 
        style A fill:#FFF, stroke:#333, stroke-width:4px
        style B fill:#9AA, stroke:#9AA, stroke-width:2px
        style B1 fill:#879, stroke:#333, stroke-width:1px
        style C fill:#ADF, stroke:#333, stroke-width:2px
        style E fill:#9C2, stroke:#9C2, stroke-width:2px
 
        ")


# ---------------------------------------------------------------

mermaid("
        gantt
          title A Gantt Diagram
          dateFormat YYYY-MM-DD
          section Section
          A task          :a1, 2014-01-01, 30d
          Another task    :after a1, 20d
          section Another
          Task in Another :2014-01-12, 12d
          another task    :24d"
        )
