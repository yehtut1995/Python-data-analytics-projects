// ===================================================
// Query 1: Show all microbes
// ===================================================
MATCH (m:Microbe)
RETURN m;

// ===================================================
// Query 2: Show all diseases
// ===================================================
MATCH (d:Disease)
RETURN d;

// ===================================================
// Query 3: Microbes associated with diseases
// ===================================================
MATCH (m:Microbe)-[:ASSOCIATED]->(d:Disease)
RETURN m.name AS Microbe, d.name AS Disease;

// ===================================================
// Query 4: Microbes associated with colorectal cancer
// ===================================================
MATCH (m:Microbe)-[:ASSOCIATED]->(d:Disease)
WHERE d.name = "Colorectal Cancer"
RETURN m.name;

// ===================================================
// Query 5: Microbes and metabolites
// ===================================================
MATCH (m:Microbe)-[:PRODUCES]->(met:Metabolite)
RETURN m.name, met.name;

// ===================================================
// Query 6: Metabolites affecting pathways
// ===================================================
MATCH (met:Metabolite)-[r:AFFECTS]->(p:Pathway)
RETURN met.name, r.effect, p.name;

// ===================================================
// Query 7: Disease pathways
// ===================================================
MATCH (d:Disease)-[:INVOLVES]->(p:Pathway)
RETURN d.name, p.name;

// ===================================================
// Query 8: Complete biological chain
// ===================================================
MATCH path =
(m:Microbe)-[:PRODUCES]->
(met:Metabolite)-[:AFFECTS]->
(p:Pathway)<-[:INVOLVES]-
(d:Disease)
RETURN path;// ===================================================
// Query 1: Show all microbes
// ===================================================
MATCH (m:Microbe)
RETURN m;

// ===================================================
// Query 2: Show all diseases
// ===================================================
MATCH (d:Disease)
RETURN d;

// ===================================================
// Query 3: Microbes associated with diseases
// ===================================================
MATCH (m:Microbe)-[:ASSOCIATED]->(d:Disease)
RETURN m.name AS Microbe, d.name AS Disease;

// ===================================================
// Query 4: Microbes associated with colorectal cancer
// ===================================================
MATCH (m:Microbe)-[:ASSOCIATED]->(d:Disease)
WHERE d.name = "Colorectal Cancer"
RETURN m.name;

// ===================================================
// Query 5: Microbes and metabolites
// ===================================================
MATCH (m:Microbe)-[:PRODUCES]->(met:Metabolite)
RETURN m.name, met.name;

// ===================================================
// Query 6: Metabolites affecting pathways
// ===================================================
MATCH (met:Metabolite)-[r:AFFECTS]->(p:Pathway)
RETURN met.name, r.effect, p.name;

// ===================================================
// Query 7: Disease pathways
// ===================================================
MATCH (d:Disease)-[:INVOLVES]->(p:Pathway)
RETURN d.name, p.name;

// ===================================================
// Query 8: Complete biological chain
// ===================================================
MATCH path =
(m:Microbe)-[:PRODUCES]->
(met:Metabolite)-[:AFFECTS]->
(p:Pathway)<-[:INVOLVES]-
(d:Disease)
RETURN path;