# Dataops-Orchestration-Suite

This project is designed to perform data transformations on the TPCH dataset hosted in Snowflake using dbt (Data Build Tool). The project creates tables and views in Snowflake, and a CI pipeline is set up to automatically trigger whenever code is pushed or pulled to the `main` branch.

## Table of Contents

- [Project Overview](#project-overview)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [Running dbt Models](#running-dbt-models)
- [Continuous Integration (CI) Pipeline](#continuous-integration-ci-pipeline)
- [Contributing](#contributing)


## Project Overview

This project aims to transform and analyze TPCH (Transaction Processing Performance Council) data using dbt within a Snowflake environment. The transformations are organized into models that produce both tables and views. Additionally, a CI pipeline ensures that all changes are automatically tested and deployed.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.8 or higher
- dbt-core
- A Snowflake account with the appropriate permissions
- Git

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Set up Python environment**:
   ```bash
   python -m venv env
   source env/bin/activate  # On Windows, use `env\Scripts\activate`
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure dbt**:
   - Set up your `profiles.yml` to connect to your Snowflake instance.
   - Replace the necessary placeholders with your Snowflake credentials.

   Example `profiles.yml`:
   ```yaml
   my_profile:
     target: dev
     outputs:
       dev:
         type: snowflake
         account: your_account
         user: your_user
         password: your_password
         role: your_role
         warehouse: your_warehouse
         database: your_database
         schema: your_schema
         threads: 4
         client_session_keep_alive: False
   ```

## Project Structure

The project is organized into several key directories:

- **models/**: Contains dbt models, which are SQL files that define the transformations.
  - **marts/**: Contains the final tables and views.
  - **staging/**: Contains raw data transformations and intermediate steps.
- **macros/**: Contains reusable SQL snippets and macros.
- **tests/**: Contains custom tests for validating data quality.
- **target/**: Stores compiled dbt models and other artifacts.
- **profiles.yml**: Configuration file for dbt, defining your Snowflake connection.

## Running dbt Models

To execute the dbt models and apply the transformations:

```bash
dbt run
```

To test the models and ensure data integrity:

```bash
dbt test
```

## Continuous Integration (CI) Pipeline

A GitHub Actions CI pipeline is configured to:

- Install dependencies
- Set up the dbt environment
- Run the dbt models
- Test the transformations
- Generate documentation

The pipeline is triggered on any push or pull request to the `main` branch. The configuration for the CI pipeline can be found in the `.github/workflows/ci_cd.yml` file.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Open a pull request.
