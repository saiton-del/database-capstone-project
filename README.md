# Enterprise Database Solution (Database Capstone Project)

An enterprise-grade, high-performance database architecture featuring a hybrid SQL/NoSQL layout designed for high-concurrency e-commerce operations, real-time analytics, dynamic caching, and audit logging compliance.

---

## 🚀 Overview & Key Highlights

- **Relational Core (PostgreSQL 16):** Houses core financial transactions, customer accounts, orders, and item catalog state using third-normal-form (3NF) relational structures.
- **In-Memory Cache (Redis 7):** Handles flash-sale ephemeral shopping carts (`cart:{user_id}`), real-time inventory decrement counters (`inventory:{product_id}`), and leaderboards.
- **Document Store (MongoDB 7):** Manages dynamic product attributes (specs, sizes, colors) and unbounded customer product reviews.
- **Row-Level Security (RLS):** Enforces customer data isolation policies directly within the database level.
- **Automated Change Data Capture (CDC):** Triggers automatically record historical updates/deletes to prices and orders in an immutable `audit_logs` table.
- **Query Optimization:** Optimized query execution paths using partial composite indexes, reducing query latency from ~262ms to ~13ms (~19x speedup).

---

## 📁 Repository Structure

```text
database-capstone-project/
├── requirements/
│   ├── project_requirements.md
│   └── er_diagram.png
├── migrations/
│   ├── V1__core_tables.sql
│   ├── V2__indexes.sql
│   ├── V3__audit_and_triggers.sql
│   ├── V4__row_level_security.sql
│   └── V5__seed_demo_data.sql
├── nosql/
│   ├── mongodb_design.md
│   ├── redis_design.md
│   └── nosql_setup.md
├── optimization/
│   ├── analytical_queries.sql
│   ├── before_explain.md
│   ├── after_explain.md
│   └── optimization_report.md
├── security/
│   ├── roles_and_permissions.sql
│   ├── rls_policies.sql
│   ├── audit_implementation.sql
│   └── security_report.md
├── backups/
│   ├── backup_script.sh
│   ├── restore_commands.sh
│   └── backup_verification.md
├── presentation/
│   ├── architecture.md
│   ├── project_walkthrough.md
│   └── demo_script.md
├── docs/
│   ├── architecture_diagram.png
│   ├── data_dictionary.md
│   ├── lessons_learned.md
│   └── final_report.md
└── README.md
