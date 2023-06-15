/**********************************************************************
Brannigan Vogt
MS Research Project Data
Merging Data
19 May 2023
**********************************************************************/

clear all
cd "C:\Users\bvogt\Downloads\19 May 2023"

use "2019ACS_StateMeans", clear
merge 1:m statefip using "7May23_Drug_Overdose.dta"
drop _merge
save BV_DATA_MSRP, replace
use "SmokerStatus", clear
merge 1:m statefip using "BV_DATA_MSRP.dta"
drop _merge
rename data_value SmokerPercent
save BV_DATA_MSRP, replace
use "HeavyDrinking", clear
merge 1:m statefip using "BV_DATA_MSRP.dta"
drop _merge
rename data_value NotHeavyDrinking
save BV_DATA_MSRP, replace
use "GDP2020", clear
merge 1:m statefip using "BV_DATA_MSRP.dta"
drop _merge
save BV_DATA_MSRP, replace
use "PCPI2020", clear
merge 1:m statefip using "BV_DATA_MSRP.dta"
drop _merge
rename v1 PCPI2020
sort statefip Month
save BV_DATA_MSRP, replace
use "PolicyData", clear
merge 1:m statefip using "BV_DATA_MSRP.dta"
sort statefip Month
drop _merge
save BV_DATA_MSRP, replace
use "UR2020", clear
merge 1:m statefip using "BV_DATA_MSRP.dta"
sort statefip Month
drop _merge
save BV_DATA_MSRP, replace
