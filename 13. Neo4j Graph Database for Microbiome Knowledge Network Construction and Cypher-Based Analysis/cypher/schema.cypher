// ======================================================
// Constraints
// ======================================================

CREATE CONSTRAINT microbe_id IF NOT EXISTS
FOR (m:Microbe)
REQUIRE m.microbe_id IS UNIQUE;

CREATE CONSTRAINT disease_id IF NOT EXISTS
FOR (d:Disease)
REQUIRE d.disease_id IS UNIQUE;

CREATE CONSTRAINT metabolite_id IF NOT EXISTS
FOR (m:Metabolite)
REQUIRE m.metabolite_id IS UNIQUE;

CREATE CONSTRAINT pathway_id IF NOT EXISTS
FOR (p:Pathway)
REQUIRE p.pathway_id IS UNIQUE;

CREATE CONSTRAINT gene_id IF NOT EXISTS
FOR (g:Gene)
REQUIRE g.gene_id IS UNIQUE;


// ======================================================
// Optional Indexes
// ======================================================

CREATE INDEX microbe_name IF NOT EXISTS
FOR (m:Microbe)
ON (m.name);

CREATE INDEX disease_name IF NOT EXISTS
FOR (d:Disease)
ON (d.name);

CREATE INDEX metabolite_name IF NOT EXISTS
FOR (m:Metabolite)
ON (m.name);

CREATE INDEX pathway_name IF NOT EXISTS
FOR (p:Pathway)
ON (p.name);

CREATE INDEX gene_symbol IF NOT EXISTS
FOR (g:Gene)
ON (g.symbol);