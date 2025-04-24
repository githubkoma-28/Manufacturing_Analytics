Create Database Manufacturing_Dataset_SQL;
Use Manufacturing_Dataset_SQL;

Select*from manufacturing_dataset_table;


-- KPI 1
-- Manufacture Qty

Select Sum(Manufactured_Qty) as Total_Manufacturing_Qty, 
Concat(Round((Sum(Manufactured_Qty) / (Sum(Manufactured_Qty) + Sum(Rejected_Qty) + Sum(Processed_Qty) + Sum(Wastage_Qty)) * 100), 2), "%") 
as Percentage
from manufacturing_dataset_table;


-- KPI 2
-- Rejected Qty

Select Sum(Rejected_Qty) as Total_Rejected_Qty, 
Concat(Round((Sum(Rejected_Qty) / (Sum(Manufactured_Qty) + Sum(Rejected_Qty) + Sum(Processed_Qty) + Sum(Wastage_Qty)) * 100), 2), "%") 
as Percentage
from manufacturing_dataset_table;


-- KPI 3
-- Processed Qty

Select Sum(Processed_Qty) as Total_Processed_Qty, 
Concat(Round((Sum(Processed_Qty) / (Sum(Manufactured_Qty) + Sum(Rejected_Qty) + Sum(Processed_Qty) + Sum(Wastage_Qty)) * 100), 2), "%") 
as Percentage
from manufacturing_dataset_table;

-- KPI 4
-- Wastage Qty

Select Sum(Wastage_Qty) as Total_Wastage_Qty, 
Concat(Round((Sum(Wastage_Qty) / (Sum(Manufactured_Qty) + Sum(Rejected_Qty) + Sum(Processed_Qty) + Sum(Wastage_Qty)) * 100), 2), "%") 
as Percentage
from manufacturing_dataset_table;


-- KPI 5
-- Employee Wise Rejected Qty

Select Emp_Name, Count(Rejected_Qty) as Total_Rejected_Qty 
from manufacturing_dataset_table group by Emp_Name order by Total_Rejected_Qty desc;


-- KPI 6
-- Machine Wise Rejected Qty

Select Machine_Name , Count(Rejected_Qty) as Total_Rejected_Qty 
from manufacturing_dataset_table group by Machine_Name order by Total_Rejected_Qty desc;


-- KPI 7
-- Production Comparison Trend

Select Fiscal_Date, Sum(Manufactured_Qty), Sum(Rejected_Qty) from manufacturing_dataset_table 
group by Fiscal_Date order by fiscal_date;


-- KPI 8
-- Manufacture Vs Rejected

Select Sum(Manufactured_Qty) as Manufacture, Sum(Rejected_Qty) as Rejected from manufacturing_dataset_table;


-- KPI 9
-- Dept wise Manufacture Vs Reject

Select Department_Name, Sum(Manufactured_Qty) as Total_Manufactured_Qty, Sum(Rejected_Qty) as Total_Rejected_Qty 
from manufacturing_dataset_table group by Department_Name order by Department_Name;