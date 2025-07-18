use blinkit;
 
 #1 little bit data cleaning
 set sql_safe_updates=0;
 update grocery
 set Item_Fat_Content = 
 case
 when Item_Fat_Content = 'LF' then 'Low Fat'
 when Item_Fat_Content = 'reg' then 'Regular'
 else Item_Fat_Content
 end;
 
#2 Total sales 
 create view Total_Sales as
 select round(sum(sales),2) from grocery;
 
select * from Total_Sales;
 
#3 Avg sales between year 2015 and 2020
create view Avg_Sales as
select round(avg(sales),2) from grocery
where Outlet_Establishment_Year between 2015 and 2020;
 
select * from Avg_Sales;
 
#4 Total count of different items sold
create view no_of_items as
select item_type as item,count(item_type) as No_of_item from grocery
group by item_type;
select * from no_of_items;

#5 Average customer rating for each item type

create view Item_Ratings as
select Item_Type,round(avg(Rating),2) as total_rating from grocery
group by item_type
order by total_rating ;

select * from Item_Ratings;

# sales summary according to fields

create view sales_summary as
select Item_Fat_Content,
count(Item_Type) as no_of_items,
round(sum(sales),2) as total_sales,
round(avg(sales),2) as avg_sales,
round(avg(rating),2)as Avg_Rating
from grocery

group by item_fat_content
order by Avg_Rating;

select * from sales_summary;

# 

create view Total_Matrics_by_outlet_type as
select outlet_type,
count(item_type)as no_of_items,
round(sum(sales),2)as total_sales,
round(avg(sales),2)as avg_sales,
round(avg(rating),2)as avg_rating 
from grocery

group by outlet_type
order by avg_rating;

select * from Total_Matrics_by_outlet_type;

 
select * from grocery;
