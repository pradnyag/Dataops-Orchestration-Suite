-- This worksheet contains code for setting up db in snowflake and RBAC for secure access

use role accountadmin;
create warehouse if not exists dbt_wh with warehouse_size = 'x-small';

create database if not exists dbt_db;

create role if not exists dbt_role;

show grants on warehouse dbt_wh;
grant usage on warehouse dbt_wh to role dbt_role;
grant role dbt_role to user pradnya;
grant all on database dbt_db to role dbt_role;

use role dbt_role;

create schema if not exists dbt_db.dbt_schema;