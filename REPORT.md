# Practical Work №7–10 — Data Sorting, Filtering, SQL Queries and Joining Tables

## Summary of Completed Work

- **Part 1 (Sorting, Filtering and Searching):** Opened `University_Database.xlsx` (`Students` table) in LibreOffice Calc `26.8.3.1` and performed all five required operations: alphabetical sort by `last_name`, sort by `group_id`, filter by single group (`group_id = 1`, 5 rows), two-condition filter (`group_id = 1` and `birth_date` in `2008`, 3 rows), and search by `student_id = 1003`. Results were saved as dedicated sheets in `University_Database.xlsx` and captured in screenshots.
- **Parts 2–4 (SQL Queries, Aggregates and JOIN):** Imported all seven tables (`Students`, `Groups`, `Teachers`, `Subjects`, `Classrooms`, `Exams`, `Grades`) into `university.sqlite3`, verified `PRAGMA integrity_check = ok` and `PRAGMA foreign_key_check`, executed all 14 SQL queries (`queries.sql` / `run_queries.py`), saved full execution output in `query-results.txt`, and verified execution in DBeaver `26.1.5`.

## Key SQL Results (`queries.sql` / `query-results.txt`)

| Part | Query Description | Result Summary |
| --- | --- | --- |
| Part 2 (Q1–Q4) | Basic `SELECT` from `Students`, `Groups`, `Subjects` | 15 students, 15 groups, 15 subjects returned |
| Part 3 (Q5–Q6) | `WHERE group_id = 1` and `ORDER BY last_name` | 5 students in group 1; all 15 sorted alphabetically |
| Part 3 (Q7–Q8) | `COUNT(*)` and `GROUP BY` students per group | Total: `15`; `PO-1-24`: 5, `IT-21`: 2, 8 groups with 1, 5 empty groups with `0` |
| Part 3 (Q9–Q11) | Grade aggregates (`MAX`, `MIN`, `AVG`) | Max: `100`, Min: `74`, Avg: `88.33` |
| Part 4 (Q12–Q14) | `JOIN` (`Students` + `Groups`, `Students` + `Grades`, `Students` + `Grades` + `Exams` + `Subjects`) | 15 joined rows for each query |

## JOIN Relationships and Comparison

- **Connecting columns:** `Students.group_id → Groups.group_id`, `Grades.student_id → Students.student_id`, `Grades.exam_id → Exams.exam_id`, and `Exams.subject_id → Subjects.subject_id`.
- **Comparison with original tables:** Original tables store entities separately to avoid duplication. `JOIN` dynamically combines student details with readable group names, subject names, and grades without modifying the source tables. In Query 8, `LEFT JOIN` preserves groups with zero students (`COUNT = 0`), whereas `INNER JOIN` would omit empty groups.

## Answers to Individual Questions

1. **What is the difference between sorting and filtering?**  
   Sorting changes the display order of all records (e.g., A–Z or ascending), while filtering hides rows that do not meet specified criteria.
2. **What is SQL used for?**  
   SQL (Structured Query Language) is used to define, retrieve, filter, update, aggregate, and join data stored in relational databases.
3. **What is the difference between `WHERE` and `ORDER BY`?**  
   `WHERE` filters rows based on a condition before returning results; `ORDER BY` sorts the returned rows by one or more columns.
4. **Why do we use `GROUP BY` and aggregate functions?**  
   `GROUP BY` groups rows sharing the same column value so aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`) can calculate summary metrics for each group.
5. **What is the purpose of `JOIN`?**  
   `JOIN` combines related rows from two or more tables using matching key columns (typically primary and foreign keys).
6. **What is the difference between `INNER JOIN` and `LEFT JOIN`?**  
   `INNER JOIN` returns only rows that have matching values in both tables. `LEFT JOIN` returns all rows from the left table and fills unmatched right-table columns with `NULL`.

## Deliverables Included

- `University_Database.xlsx` — updated workbook with original tables and saved sorting/filtering/search sheets.
- `university.sqlite3` — SQLite database containing all 7 university tables.
- `queries.sql` — SQL script with all 14 queries.
- `run_queries.py` & `query-results.txt` — verification runner and full query output.
- `screenshots/` — `calc-sort-lastname.png`, `calc-sort-group.png`, `calc-filter-group.png`, `calc-filter-two.png`, `calc-search-id.png`, `dbeaver-join-group-cropped.png`.

## Conclusion

Data sorting, filtering, searching, SQL querying, aggregate analysis, and multi-table `JOIN` operations were completed and verified across spreadsheet and SQLite/DBeaver environments.