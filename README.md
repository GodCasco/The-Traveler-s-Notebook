# 🗺️ The Traveler's Notebook — Relational Database Project

A **relational database design and implementation project** built around a fictional travel review platform. The goal was to go through the full database engineering lifecycle — from requirements and ER modelling to a fully deployed MySQL schema with advanced features.

> ⚠️ The official project report and full documentation are written in **Portuguese**.

---

## 🛠️ Tech Stack

<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" height="1000"/>

---

## 📐 What Was Built

### Conceptual Model
An **Entity-Relationship (ER) diagram** with four core entities:

- 👤 **User** *(Utilizador)*
- ⭐ **Review** *(Avaliação)*
- 🏙️ **City** *(Cidade)*
- 📍 **Point of Interest** *(Ponto de Interesse)*

### Logical Model
The ER diagram was converted into a full relational model, normalized to **Third Normal Form (3NF)** and validated with relational algebra to ensure correctness.

### Physical Implementation (MySQL)
The schema was fully deployed in MySQL, covering:

- **Schema Design** — Auto-increment PKs, foreign keys, and `CHECK` constraints
- **User Roles** — `Manager`, `Moderator`, and `User` roles managed via `GRANT` privileges
- **Views** — For data abstraction and access control
- **Stored Procedures & Prepared Statements** — Parameterized, injection-safe queries
- **B-Tree Indexing** — On high-frequency lookup columns
- **Scheduled Events** — Periodic caching of heavy aggregations (e.g. destination rankings)

---

## 👥 Contributors

| Name |
|---|
| Duarte Arruda |
| Guilherme Costa |
| Ivo Horta |
| Vasco Machado |
