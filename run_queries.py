"""Run each statement from queries.sql against the supplied SQLite database."""

import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def main() -> None:
    sql = (ROOT / "queries.sql").read_text(encoding="utf-8")
    database_uri = (ROOT / "university.sqlite3").as_uri() + "?mode=ro"
    with sqlite3.connect(database_uri, uri=True) as connection:
        connection.execute("PRAGMA foreign_keys = ON")
        for number, statement in enumerate(sql.split(";"), start=1):
            if not statement.strip():
                continue
            cursor = connection.execute(statement)
            print(f"\nQuery {number}")
            print(" | ".join(column[0] for column in cursor.description))
            for row in cursor:
                print(" | ".join(str(value) for value in row))


if __name__ == "__main__":
    main()
