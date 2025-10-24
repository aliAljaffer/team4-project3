# Project 3 - Capstone

## Introduction

For a change, we won't use the frontend/backend apps provided by the IronHack DevOps bootcamp. Instead, I'll supply my personal project, [Catus Locatus](https://github.com/aliAljaffer/catus-locatus) and adapt our approach to it. One of the key changes is that we'll use Azure Database for PostgreSQL (PostgreSQL) instead of Azure SQL Database (MSSQL), but the goal is the same. I will provide the source code for the frontend and backend. So the team can focus on the infrastructure and Kubernetes!

I already created the required Dockerfiles, but if any member of the team wants to create Dockerfiles for the two tiers, please assign yourself the issues [(#4) feature/frontend: Dockerfile for frontend](https://github.com/aliAljaffer/team4-project3/issues/4) and [(#5) feature/backend: Dockerfile for backend](https://github.com/aliAljaffer/team4-project3/issues/5). Otherwise, I'll provide them later in the project week.

## Note

To initialize terraform, we'll use the `-backend-config` flag with a `state.config` file.

```bash
terraform init -backend-config="./state.config"
```

## Contributing

This is a public-yet-private repository for our capstone project, thus only the team members are allowed to contribute.

- Absolutely minimize AI usage in this project, as it might diminish the benefits you can gain by working on the solution yourself.
- New feature = new branch. Outside of a few rare cases, we'll not be merging to main directly.
- Always submit clean PRs, with no dead code. Dead code is code that's commented out or is unused.
- If you must use AI, use it to guide you and don't just copy/paste the issue/fix it gives you. Be ready to defend your decisions and choices during the daily Scrum.
