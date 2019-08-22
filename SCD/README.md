# SCD from ORACLE
Slowly Changing Dimensions
What is a Slowly Changing Dimension?

A Slowly Changing Dimension (SCD) is a dimension that stores and manages both current and historical data over time in a data warehouse. It is considered and implemented as one of the most critical ETL tasks in tracking the history of dimension records.

There are three types of SCDs and you can use Warehouse Builder to define, deploy, and load all three types of SCDs.

What are the three types of SCDs?

The three types of SCDs are:

Type 1 SCDs - Overwriting

In a Type 1 SCD the new data overwrites the existing data. Thus the existing data is lost as it is not stored anywhere else. This is the default type of dimension you create. You do not need to specify any additional information to create a Type 1 SCD.

Type 2 SCDs - Creating another dimension record

A Type 2 SCD retains the full history of values. When the value of a chosen attribute changes, the current record is closed. A new record is created with the changed data values and this new record becomes the current record. Each record contains the effective time and expiration time to identify the time period between which the record was active.

Type 3 SCDs - Creating a current value field

A Type 3 SCD stores two versions of values for certain selected level attributes. Each record stores the previous value and the current value of the selected attribute. When the value of any of the selected attributes changes, the current value is stored as the old value and the new value becomes the current value.

Note: SCD Type 2 and 3 are available with the Enterprise ETL option of OWB 10gR2. With Core ETL features, SCD Type 1, that is, Do not keep history option, is only available.

You cannot create a Type 2 or Type 3 slowly changing dimension if the type of storage is MOLAP.


to be crisp and clear

There are three main types of SCDs:

Type 1: Overwrite the value of a field when it changes.
Type 2: Adds a version number or effective date column for each record and have multiple rows for the same natural key.
Type 3: Adds a separate history column to each row with a limited number of older values

