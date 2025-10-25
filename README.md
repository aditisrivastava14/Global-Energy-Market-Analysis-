*** ## Global Energy Market Analysis: Multi-Tool EDA & Visualization ## ***

The PowerPoint presentation for the project is available here : https://docs.google.com/presentation/d/14N4S3pYTvMWh-FDxHi9t_BItVNZqL9srG69iqphUSBo/edit?usp=sharing

This project executes a comprehensive Global Energy Market Analysis by leveraging proficiency across four key platforms: Python (Pandas/NumPy), MySQL, Excel, and Tableau.

The goal was to move beyond simple data aggregation to quantify market risk, volatility, and distribution, transforming raw data into actionable business intelligence.

## Project Objective

The project performs a full-spectrum data analysis on historical energy prices.

Exploratory Data Analysis (EDA): Quantify volatility and price distribution for all commodities by calculating eight core descriptive statistics, from mean to kurtosis.

Cross-Platform Validation: Demonstrate versatility by calculating these statistics using three different methods: Python (for rapid analysis), MySQL (for database querying proficiency), and Excel (for statistical validation).

Visual Business Intelligence: Create an interactive Tableau dashboard that makes all statistical results and historical price trends accessible for effective risk assessment and decision-making.

## Analytical Breakdown

Python (Pandas/NumPy)

The Python script was used for the initial, comprehensive EDA. It calculated the full suite of descriptive statistics, including Mean, Median, and Mode (Central Tendency); Variance, Standard Deviation, and Range (Measures of Dispersion/Risk); and Skewness and Kurtosis (Measures of Distribution Shape).

MySQL Workbench

Database competency was demonstrated by setting up the market data schema and executing complex SQL queries. Core metrics were calculated using built-in functions, while advanced statistics like Median, Skewness, and Kurtosis required translating complex statistical formulae into custom, multi-step database code.

Excel / Google Sheets

Excel was leveraged for rapid statistical validation. Concise, modern formulae (AVERAGE, VAR.S, MODE.SNGL) were used to confirm the accuracy of the metrics derived from both the Python and SQL environments.

## Tableau Dashboard — Visual Analysis Project

The final output is an interactive Tableau dashboard designed to provide a dynamic, 360-degree analysis of price trends across multiple measures.

Dashboard Components

Data Preparation: The dataset was pivoted into a 'long' format (Measure and Value), enabling the use of dynamic parameters and filters for flexible, user-driven analysis.

Multi-line Time Series: Visualizes time-based trends and allows users to select which measures to view over time.

Histogram Distribution: Displays the frequency and distribution of values for any chosen measure.

Scatter Plot (Dynamic Measure Comparison): Utilizes parameters and Level of Detail (LOD) expressions to allow users to dynamically compare the correlation between any two selected measures (X vs. Y).
