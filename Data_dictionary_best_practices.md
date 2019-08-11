# data-dictionary-best-practices
What is a data dictionary?

A data dictionary provides a detailed description for each element or variable in your dataset or data model. It represents a concise guide to understanding and using the data that everyone can reference and be on the same page. It makes onboarding new contributors easier and ensures that all business teams have crystal-clear requirements for implementation of your metrics.
1.	Start small and iterate. Documenting every single piece of data is painful and not a great use of time. Don’t do this. Focus on starting with the data that’s important and useful to you and documenting those fields or tables. Then, as you incorporate more data from other tables or databases, focus on documenting those incrementally. 
2.	Collect and define the terms. A data dictionary may contain:
•	The exact variable name as shown in the data file
•	A more descriptive version of the variable name that might be used in visualizations
•	Categories to which the variable belongs
•	The measurement units
•	Expected minimum and maximum values (allowed values)
•	A longer explanation of what the variable means (coded values, quality flags, etc.)
3.	Use consistent codes. Be consistent in the use of codes to indicate categorical variables - they should always be the same within one data set. Pay particular attention to spelling and case when using abbreviations.
4.	Be very clear with your words. When choosing a label or term – for example: ‘prediction’, ‘estimate’, or ‘projection’ – be clear about what that actually means, what it is actually capturing, so that everyone can begin with the same understanding.
5.	Create, manage, and document your data storage system. Keep a managed file storage system to prevent inconsistencies, e.g., duplicated, lost, or misplaced files. Use appropriate tools, such as version control tools, to keep track of the history of the data files. Organize files logically to represent the structure of the research/data. Include human readable "readme" files at critical levels of the directory tree. A "readme" file might include such things as explanations of naming conventions and how the structure of the directory relates to the structure of the data.
6.	Document steps used in data processing. Whenever possible, document your workflow (the process used to clean, analyze and visualize data) noting what data products are created at each step. Depending on the nature of the project, this might be as a computer script, or it may be notes in a text file. 
7.	Quality control. Enabling others to verify the quality and credibility of a given data product is critical and should include:
•	determining how to identify potentially erroneous data
•	how to deal with erroneous data
•	how problematic data will be marked (i.e. flagged)
8.	When possible, establish consistent baselines for comparison. To ensure similar outcome between datasets, obtain data using similar techniques, processes, environments. Providing mechanisms to compare data sets against each other that provide a measurable means to alert you of a possible error condition.
9.	Ensure that datasets used are reproducible. When searching for data, it is necessary to document which terms and queries were originally used to capture that data.  This ensures that you can reproduce the search results and obtain similar, if not the same, results. Toward this end, follow these guidelines:
•	Note the location of the originating data set
•	Document the search terms used
•	Document any additional parameters and/or controls that were used (pull-down boxes, radio buttons, text entry forms)
•	Document the query terms used, where possible
•	Note the database version and/or date, so you can limit data sets that were added since the query was last performed
•	Note the name of the website and URL, if applicable
10.	Consider the compatibility of the data you are integrating. The integration of multiple data sets from different sources requires that they be compatible. Methods used to create the data should be considered early in the process, to avoid problems later during attempts to integrate data sets. Note: just because data can be integrated does not necessarily mean that they should be, or that the results can meet the needs of the analysis. 
