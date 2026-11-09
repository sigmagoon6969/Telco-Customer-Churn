use my_database;

select * from tcc;

select 
count(customer_id) as total_customers,
sum(churn_value) as number_of_churned_customer,
round(avg(churn_value)*100,2) as customer_churned_rate
from tcc;

select
round(sum(monthly_charges),2) as total_monthly_revenue,
round(sum(case when churn_value = 1 then monthly_charges else 0 end),2) as monthly_revenue_lost,
round(sum(case when churn_value = 1 then monthly_charges else 0 end)/sum(monthly_charges)*100,2)
as monthly_loss_perc
from tcc;

select churn_label as did_they_leave,
count(customer_id) as customer_count,
round(avg(monthly_charges),2) as average_monthly_bill
from tcc
group by churn_label;

select churn_label as did_they_leave,
round(avg(tenure_months),2) as average_months_stayed
from tcc
group by churn_label;

select churn_label as did_they_leave,
round(avg(cltv),2) as average_lifetime_value
from tcc
group by churn_label;

select round(sum(monthly_charges)*12,2) as total_annual_revenue,
round(sum(case when churn_value = 1 then monthly_charges else 0 end)*12,2) as annual_revenue_lost,
round((sum(case when churn_value = 1 then monthly_charges else 0 end)*12)/(sum(monthly_charges)*12)*100,2)
as annual_loss_perc
from tcc;

select
count(customer_id) as total_churned_customers,
sum(cltv) as total_lifetime_value_lost
from tcc
where churn_value = 1;

select
count(customer_id) as total_quitters,
sum(case when tenure_months <= 6 then 1 else 0 end) as quit_in_first_6_months,
round((sum(case when tenure_months <= 6 then 1 else 0 end))/(count(customer_id))*100,2) 
as first_6_month_quitters_perc
from tcc
where churn_value =1;

select 
count(customer_id) as total_churned_customers,
round(sum(monthly_charges),2) as monthly_revenue_lost_from_newbies
from tcc
where churn_value = 1
and tenure_months <= 6;

select city,
count(customer_id) as total_customers,
sum(case when churn_value = 1 then 1 else 0 end) as total_quitters,
round((sum(case when churn_value = 1 then 1 else 0 end))/(count(customer_id))*100,2) as total_quitters_perc
from tcc
group by city
order by total_quitters_perc desc;

select city,
round(sum(case when churn_value = 1 then monthly_charges else 0 end),2) as monthly_revenue_loss
from tcc
group by city
order by monthly_revenue_loss desc
limit 10;

select senior_citizen as is_a_senior_citizen,
count(customer_id) as total_customers,
sum(churn_value) as total_quitter,
round(avg(churn_value)*100,2) as quitter_perc
from tcc
group by senior_citizen;


select partner as have_a_partner,
count(customer_id) as total_customers,
sum(churn_value) as total_quitter,
round(avg(churn_value)*100,2) as quitter_perc
from tcc
group by partner;


select senior_citizen as is_a_senior_citizen,
partner as have_a_partner,
count(customer_id) as total_customers,
sum(churn_value) as total_quitter,
round(avg(churn_value)*100,2) as quitter_perc
from tcc
group by senior_citizen,partner;

select dependents as is_dependent,
count(customer_id) as total_customer,
sum(churn_value) as total_quitters,
round((sum(churn_value))/(count(customer_id))*100,2) as quitter_perc
from tcc
group by dependents;


select contract,
dependents as is_dependent,
count(customer_id) as total_customer,
sum(churn_value) as total_quitters,
round((sum(churn_value))/(count(customer_id))*100,2) as quitter_perc
from tcc
where contract = "Month-to-month"
group by dependents;

select internet_service,
count(customer_id) as total_customers,
sum(churn_value) as total_quitters,
round((sum(churn_value))/(count(customer_id))*100,2) as quitter_perc
from tcc
group by internet_service;

select internet_service,
round(sum(monthly_charges),2) as total_monthly_revenue,
round(avg(monthly_charges),2) as average_monthly_revenue,
round(sum(case when churn_value=1 then monthly_charges else 0 end),2) as monthly_revenue_lost
from tcc
group by internet_service;

select internet_service,
tech_support as does_have_tech_support,
count(customer_id) as total_user,
sum(case when churn_value = 1 then 1 else 0 end) as total_quitters,
round(avg(churn_value)*100,2) as quitter_perc
from tcc
where internet_service = "Fiber optic"
group by tech_support;


select internet_service,
online_security as does_have_online_security,
count(customer_id) as total_user,
sum(case when churn_value = 1 then 1 else 0 end) as total_quitters,
round(avg(churn_value)*100,2) as quitter_perc
from tcc
where internet_service = "Fiber optic"
group by online_security;


select internet_service,
tech_support as does_have_tech_support,
online_security as does_have_online_security,
count(customer_id) as total_user,
sum(case when churn_value = 1 then 1 else 0 end) as total_quitters,
round(avg(churn_value)*100,2) as quitter_perc
from tcc
where internet_service = "Fiber optic"
group by tech_support, online_security;

select * from tcc;

select services_taken as number_of_services_taken,
count(customer_id) as total_customers,
sum(case when churn_value = 1 then 1 else 0 end) as customers_quit,
round(avg(churn_value)*100,2) as quitters_perc
from tcc
group by services_taken
order by services_taken desc;

select
services_taken as number_of_services_taken,
round(avg(monthly_charges),2) as avg_revenue_contribution_per_month,
round(avg(cltv),0) as avg_lifetime_value
from tcc
group by services_taken
order by services_taken desc;

select contract,
count(customer_id) as total_customer,
sum(churn_value) as total_quit,
round(avg(churn_value)*100,2) as quit_perc,
round(sum(case when churn_value = 1 then monthly_charges else 0 end),2) as monthly_revenue_lost
from tcc
group by contract;

select payment_method,
count(customer_id) as total_customers,
sum(churn_value) as total_quit,
round(avg(churn_value)*100,2) as quit_perc,
round(sum(case when churn_value = 1 then monthly_charges else 0 end),2) as monthly_revenue_lost
from tcc
group by payment_method;

select churn_reason as reason_of_quitting,
sum(churn_value) as total_quitters
from tcc
where churn_reason <> "Active Customer"
group by churn_reason
order by total_quitters desc;

select case
when churn_score >=80 then"critical risk"
when churn_score >=60 then"high risk"
when churn_score >=40 then"medium risk"
else "low_risk" end as risk_status,
count(customer_id) as active_customer_count,
round(sum(monthly_charges),2) as revenue_at_risk
from tcc
where churn_value = 0
group by risk_status;
