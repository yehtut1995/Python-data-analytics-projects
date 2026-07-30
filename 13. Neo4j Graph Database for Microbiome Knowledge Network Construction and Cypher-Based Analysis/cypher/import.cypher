// ======================================================
// Import Microbes
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///microbes.csv' AS row

CREATE (:Microbe{
    microbe_id: row.microbe_id,
    name: row.name,
    phylum: row.phylum
});


// ======================================================
// Import Diseases
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///diseases.csv' AS row

CREATE (:Disease{
    disease_id: row.disease_id,
    name: row.name,
    category: row.category
});


// ======================================================
// Import Metabolites
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///metabolites.csv' AS row

CREATE (:Metabolite{
    metabolite_id: row.metabolite_id,
    name: row.name,
    type: row.type
});


// ======================================================
// Import Pathways
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///pathways.csv' AS row

CREATE (:Pathway{
    pathway_id: row.pathway_id,
    name: row.name
});


// ======================================================
// Import Genes
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///genes.csv' AS row

CREATE (:Gene{
    gene_id: row.gene_id,
    symbol: row.symbol
});


// ======================================================
// Microbe -> Disease
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///microbe_disease.csv' AS row

MATCH (m:Microbe {microbe_id: row.microbe_id})
MATCH (d:Disease {disease_id: row.disease_id})

CREATE (m)-[:ASSOICATED {
    evidence: row.evidence
}]->(d);


// ======================================================
// Microbe -> Metabolite
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///microbe_metabolite.csv' AS row

MATCH (m:Microbe {microbe_id: row.microbe_id})
MATCH (met:Metabolite {metabolite_id: row.metabolite_id})

CREATE (m)-[:PRODUCES]->(met);


// ======================================================
// Metabolite -> Pathway
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///metabolite_pathway.csv' AS row

MATCH (met:Metabolite {metabolite_id: row.metabolite_id})
MATCH (p:Pathway {pathway_id: row.pathway_id})

CREATE (met)-[:AFFECTS {
    effect: row.effect
}]->(p);


// ======================================================
// Gene -> Pathway
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///gene_pathway.csv' AS row

MATCH (g:Gene {gene_id: row.gene_id})
MATCH (p:Pathway {pathway_id: row.pathway_id})

CREATE (g)-[:PARTICIPATES_IN]->(p);


// ======================================================
// Disease -> Pathway
// ======================================================

LOAD CSV WITH HEADERS
FROM 'file:///disease_pathway.csv' AS row

MATCH (d:Disease {disease_id: row.disease_id})
MATCH (p:Pathway {pathway_id: row.pathway_id})

CREATE (d)-[:INVOLVES]->(p);