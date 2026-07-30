# Neo4j Graph Database for Microbiome Knowledge Network Construction and Cypher-Based Analysis

## Project Overview

**MicroBiomeKG** is a portfolio project that demonstrates how a biomedical knowledge graph can be built using **Neo4j** to integrate microbiome-related entities and their biological relationships. The project models interactions among microbes, diseases, metabolites, pathways, and genes, enabling graph-based exploration of microbiome research.

This project was inspired by research workflows in precision medicine and microbiome informatics, where knowledge graphs are used to integrate heterogeneous biological data and support hypothesis generation.

> **Note:** This project uses a **synthetic sample dataset** created solely for educational and portfolio purposes. The data do **not** represent real biological findings and should not be used for scientific or clinical interpretation.

---

## Objectives

* Build a biomedical knowledge graph using Neo4j.
* Model relationships between microbiome entities.
* Demonstrate graph database design and Cypher querying.
* Integrate Neo4j with Python for graph exploration and analysis.
* Showcase skills relevant to biomedical informatics and knowledge graph applications.

---

## Knowledge Graph Schema

### Node Types

* **Microbe**
* **Disease**
* **Metabolite**
* **Pathway**
* **Gene**

### Relationship Types

* `ASSOICATED` (Microbe → Disease)
* `PRODUCES` (Microbe → Metabolite)
* `AFFECTS` (Metabolite → Pathway)
* `PARTICIPATES_IN` (Gene → Pathway)
* `INVOLVES` (Disease → Pathway)

---

## Project Structure

```text
MicroBiomeKG/
│
├── data/
│   ├── microbes.csv
│   ├── diseases.csv
│   ├── metabolites.csv
│   ├── pathways.csv
│   ├── genes.csv
│   ├── microbe_disease.csv
│   ├── microbe_metabolite.csv
│   ├── metabolite_pathway.csv
│   ├── gene_pathway.csv
│   └── disease_pathway.csv
│
├── cypher/
│   ├── schema.cypher
│   ├── import.cypher
│   └── queries.cypher
│
├── notebooks/
│   └── 01_Neo4j_KnowledgeGraph_Analysis.ipynb
│
│
├── README.md
└── requirements.txt
```

---

## Dataset

The project uses a **synthetic sample dataset** designed to mimic a small microbiome knowledge graph.

### Nodes

| Entity     | Description           |
| ---------- | --------------------- |
| Microbe    | Microbial species     |
| Disease    | Human diseases        |
| Metabolite | Microbial metabolites |
| Pathway    | Biological pathways   |
| Gene       | Human genes           |

### Relationships

| Relationship    | Description                           |
| --------------- | ------------------------------------- |
| ASSOICATED      | Microbe associated with disease       |
| PRODUCES        | Microbe produces metabolite           |
| AFFECTS         | Metabolite affects biological pathway |
| PARTICIPATES_IN | Gene participates in pathway          |
| INVOLVES        | Disease involves pathway              |

The synthetic dataset contains:

* 26 nodes
* 40 relationships

---

## Technologies

* Neo4j
* Cypher Query Language
* Python
* Neo4j Python Driver
* Pandas
* Matplotlib
* NetworkX
* Jupyter Notebook

---

## Workflow

### 1. Data Preparation

Synthetic CSV files were created to represent biological entities and their relationships.

### 2. Knowledge Graph Construction

The CSV files were imported into Neo4j to create a graph database consisting of microbes, diseases, metabolites, pathways, and genes.

### 3. Cypher Querying

Cypher queries were developed to explore biological relationships, including:

* Microbe–disease associations
* Disease pathways
* Microbial metabolite production
* Gene participation in pathways
* Multi-hop biological connections

### 4. Python Integration

The Neo4j Python Driver was used to connect to the graph database and execute Cypher queries. Query results were converted into pandas DataFrames for analysis and visualization.

---

## Example Cypher Query

```cypher
MATCH (m:Microbe)-[:ASSOICATED]->(d:Disease)
RETURN m.name AS Microbe,
       d.name AS Disease;
```

---

## Example Biological Query

The following query traces the biological chain from microbes to diseases through metabolites and pathways.

```cypher
MATCH
(m:Microbe)-[:PRODUCES]->
(met:Metabolite)-[:AFFECTS]->
(p:Pathway)<-[:INVOLVES]-
(d:Disease)

RETURN
m.name,
met.name,
p.name,
d.name;
```

---

## Python Analysis

The accompanying Jupyter notebook demonstrates how to:

* Connect to Neo4j
* Execute Cypher queries
* Convert results into pandas DataFrames
* Explore graph data
* Visualize relationships using NetworkX
* Generate summary statistics

---

## Learning Outcomes

Through this project, I gained practical experience in:

* Graph database design
* Knowledge graph construction
* Neo4j and Cypher
* Biomedical data modeling
* Python–Neo4j integration
* Graph-based data exploration
* Biological relationship modeling

---

## Limitations

* The dataset is entirely synthetic and intended only for demonstration.
* The graph contains a limited number of entities and relationships.
* No biological or clinical conclusions should be drawn from the generated data.

---

## Future Improvements

Potential extensions include:

* Integrating real microbiome datasets from public repositories.
* Incorporating molecular pathway databases such as KEGG or Reactome.
* Importing literature-derived relationships from PubMed.
* Applying Neo4j Graph Data Science algorithms (e.g., PageRank, Louvain, Betweenness Centrality) to identify influential microbes and pathways.
* Developing an interactive Streamlit dashboard for graph exploration.

---

## Disclaimer

This project is intended for educational and portfolio purposes only. All entities and relationships were created using a synthetic sample dataset to demonstrate Neo4j knowledge graph construction, Cypher querying, and Python integration. It is not intended for biomedical research, clinical decision-making, or scientific interpretation.
