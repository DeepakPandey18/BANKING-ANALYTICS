use banking;
show tables;
select * from finance_1;
desc finance_1;
select * from finance_2;
desc finance_2;

KPI:
>Year wise loan amount Stats
 >Grade and sub grade wise revol_bal
  >Total Payment for Verified Status Vs Total Payment for Non Verified Status
   >State wise and month wise loan status
	>Home ownership Vs last payment date stats

#KPI1:
select distinct issue_d,loan_amnt from finance_1;

#KPI2:
select finance_1.grade,finance_1.sub_grade,sum(finance_2.revol_bal)
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by 1,2
order by 1;

#KPI3:
select distinct finance_1.verification_status,sum(finance_2.total_pymnt)
from finance_1 join finance_2
on finance_1.id=finance_2.id
where finance_1.verification_status="verified" or finance_1.verification_status="not verified"
group by 1
order by 2;

#KPI4:
select addr_state,issue_d,loan_amnt
from finance_1;

#KPI5:
select distinct finance_1.home_ownership,finance_2.last_pymnt_d
from finance_1 join finance_2
on finance_1.id=finance_2.id
group by 1,2
order by 1;





