
-- This query filters orders that were placed by customer 71; groups those orders by employee and
-- order year; and filters only groups of employees and years that have more than one order. For the
-- remaining groups, the query presents the employee ID, order year, and count of orders, sorted by the
-- employee ID and order year. For now, don’t worry about understanding how this query does what it
-- does; I’ll explain the query clauses one at a time, and gradually build this query.




-- If you try to refer to an attribute that does not participate in the GROUP BY list (such as freight) and not
-- as an input to an aggregate function in any clause that is processed after the GROUP BY clause, you
-- get an error—in such a case, there’s no guarantee that the expression will return a single value per
-- group. For example, the following query will fail.










