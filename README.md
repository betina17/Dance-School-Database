```markdown
# Database Project

## Lab 1: Database Design

### Requirements:
Imagine a simple application that requires a database. Represent the application data in a relational structure and implement the structure in a SQL Server database. The database must contain at least:
- 10 tables
- Two 1:n relationships
- One m:n relationship

---

## Lab 2: SQL Queries


### Tasks:
On the relational structure created for Lab 1, write SQL statements that:

- **Insert Data**: Insert data into at least 4 tables. At least one statement must violate referential integrity constraints.
- **Update Data**: Update data for at least 3 tables.
- **Delete Data**: Delete data from at least 2 tables.

In the `UPDATE` and `DELETE` statements, use the following:
- Logical operators: `{AND, OR, NOT}`
- Comparison operators: `{<, <=, =, >, >=, <>}`
- `IS [NOT] NULL`, `IN`, `BETWEEN`, and `LIKE`

### SQL Queries:
1. **Set Operations**:  
   - 2 queries with the `UNION` operation; use `UNION [ALL]` and `OR`
   - 2 queries with the `INTERSECT` operation; use `INTERSECT` and `IN`
   - 2 queries with the `EXCEPT` operation; use `EXCEPT` and `NOT IN`
   
2. **Join Operations**:  
   - 1 query with `INNER JOIN`
   - 1 query with `LEFT JOIN`
   - 1 query with `RIGHT JOIN`
   - 1 query with `FULL JOIN`
   - One query will join at least 3 tables, while another will join at least two many-to-many relationships

3. **Subqueries**:  
   - 2 queries with the `IN` operator and a subquery in the `WHERE` clause (in at least one case, the subquery must include a subquery in its own `WHERE` clause)
   - 2 queries with the `EXISTS` operator and a subquery in the `WHERE` clause
   - 2 queries with a subquery in the `FROM` clause

4. **Aggregation and Grouping**:  
   - 4 queries with the `GROUP BY` clause
   - 3 of these queries must also contain the `HAVING` clause
   - 2 of the latter must also have a subquery in the `HAVING` clause
   - Use aggregation operators: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`

5. **Special Operators**:  
   - 4 queries using `ANY` and `ALL` to introduce a subquery in the `WHERE` clause (2 queries per operator)
   - Rewrite 2 of these with aggregation operators and the other 2 with `IN`/`[NOT] IN`

### Additional Requirements:
- Use arithmetic expressions in the `SELECT` clause in at least 3 queries
- Use `AND`, `OR`, `NOT`, and parentheses in the `WHERE` clause in at least 3 queries
- Use `DISTINCT` in at least 3 queries, `ORDER BY` in at least 2 queries, and `TOP` in at least 2 queries
- You can use views in at most 3 queries
- You can change the relational structure created in Lab 1
- Your queries must be relevant to the problem domain

---

## Lab 3: Altering the Database


### Tasks:
Sometimes, after you design a database, you need to change its structure. Unfortunately, changes aren’t always correct, so they must be reverted. Your task is to create a versioning mechanism that allows you to easily switch between database versions.

Write SQL scripts that:
- **Modify the type of a column**
- **Add/Remove a column**
- **Add/Remove a `DEFAULT` constraint**
- **Add/Remove a primary key**
- **Add/Remove a candidate key**
- **Add/Remove a foreign key**
- **Create/Drop a table**

For each of the scripts above, write another one that reverts the operation. Place each script in a stored procedure and use a simple, intuitive naming convention.

### Version Control:
Create a new table that holds the current version of the database schema. The version is an integer number. Write a stored procedure that receives a version number as a parameter and brings the database to that version.

---

## Lab 4: Indexes


### Tasks:
Work on 3 tables of the form `Ta(aid, a2, …)`, `Tb(bid, b2, …)`, `Tc(cid, aid, bid, …)`, where:
- `aid`, `bid`, `cid`, `a2`, `b2` are integers
- The primary keys are underlined
- `a2` is `UNIQUE` in `Ta`
- `aid` and `bid` are foreign keys in `Tc`, referencing the primary keys in `Ta` and `Tb`, respectively

### Index Queries:
1. Write queries on `Ta` such that their execution plans contain the following operators:
   - Clustered index scan
   - Clustered index seek
   - Nonclustered index scan
   - Nonclustered index seek
   - Key lookup

2. Write a query on `Tb` with a `WHERE` clause of the form `WHERE b2 = value` and analyze its execution plan. Create a nonclustered index to speed up the query. Re-examine the execution plan.

3. Create a view that joins at least 2 tables. Check whether existing indexes are helpful. If not, reassess the existing indexes or examine the cardinality of the tables.

---
