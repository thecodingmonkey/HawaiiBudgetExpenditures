// Load the Hawaii State Capital budget in a Neo4j graph

LOAD CSV WITH HEADERS FROM "https://data.hawaii.gov/api/views/8t8p-2mku/rows.csv?accessType=DOWNLOAD" AS row CREATE (n:BudgetItem)
SET n = row

// Replace null values
MATCH (n:BudgetItem) WHERE n.Department IS NULL SET n.Department = "Unknown"

// Add indexes
CREATE INDEX ON :Program(project_id)

// Create Programs, Services, and Departments, and add relationships
MATCH (n:BudgetItem)
MERGE (program:Program{project_id:n["Project ID"], name:n["Project"]})
MERGE (service:Service{name:n["Service"]})
MERGE (n)-[:REFERS_TO]->(program)
MERGE (department:Department{name:n["Department"]})-[:IS_PART_OF]->(service)
MERGE (program)<-[:FUNDS]-(department)
