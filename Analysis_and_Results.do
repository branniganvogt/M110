/**********************************************************************
Brannigan Vogt
MS Research Project Analysis, Robustness, and Results.
21 May 2023
**********************************************************************/
clear all

cd "C:\Users\bvogt\Downloads\19-21May 2023"

// Main Analysis:
// Drop States with any Supressed data
use BV_DATA_MSRP, clear
preserve
xtset, clear
drop if nsuppressed > 0
xtset state Month, monthly
save BV_Data_UDO_DroppedSupp, replace
restore

** 1st JUNE 2023 CHANGES:
estpost tabstat UR SUD4IC PICLnal DICPnal GSL SSPs PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean Uniten_Overd_Deaths if state == 38, ///
    statistics(mean) columns(variables)
eststo state38

estpost tabstat UR SUD4IC PICLnal DICPnal GSL SSPs PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean Uniten_Overd_Deaths if state != 38, ///
    statistics(mean) columns(variables)
eststo not_state38

esttab state38 not_state38 using summary_statistics.docx, replace


* Use estpost to generate a matrix of summary statistics for state == 38
estpost tabstat UR SUD4IC PICLnal DICPnal GSL SSPs PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean Uniten_Overd_Deaths if state == 38, ///
    statistics(mean) columns(variables)
eststo state38

* Repeat for state != 38
estpost tabstat UR SUD4IC PICLnal DICPnal GSL SSPs PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean Uniten_Overd_Deaths if state != 38, ///
    statistics(mean) columns(variables)
eststo not_state38

* Use estout to write the summary statistics to a text file
estout state38 not_state38, cells("mean")



// Calculate Synthetic Control having dropped states with suppressed data
	// And running in-space placebo tests for p-value calculation.
use BV_Data_UDO_DroppedSupp, clear
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(38) trperiod(733) fig keep(UODresults1) plac pval replace
restore
use UODresults1
rename _time month
sort state month
** Looking in this dataset, we can find the values for state==38 which show p-values and treatment effects.
** We can also see the rmspe_rank is 1 for all but the first two states, giving a MSPE ratio of 1/50=0.02

// get gap fig:
use BV_Data_UDO_DroppedSupp, clear
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(38) trperiod(733) gapfig(classic) keep(UODresults123) replace
restore

// get p-val fig:
use BV_Data_UDO_DroppedSupp, clear
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(38) trperiod(733) fig(plac) keep(UODresults1) plac pval replace
restore


/**********************************************************************
ROBUSTNESS CHECK:
Imputed Data Analysis
**********************************************************************/

// Impute random value 0-9 for supressed data values.
use BV_DATA_MSRP, clear
preserve
set seed 348871 // Notice that in setup I make use of a seed for replicability in the generation of imputed values for suppressed data.
replace Uniten_Overd_Deaths = runiformint(0,9) if missing(Uniten_Overd_Deaths)
save BV_Data_UDO_ImputedSupp, replace
restore

// Calculate Synthetic Control with imputed suppressed data
use BV_Data_UDO_ImputedSupp, clear
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(38) trperiod(733) fig keep(synthr1) replace
restore
** Does not change the results much at all, robust to this approach.
**********************************************************************


/**********************************************************************
ROBUSTNESS CHECK:
Bias-correction (Just on Main Analysis)
**********************************************************************/
use BV_Data_UDO_DroppedSupp, clear
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(38) trperiod(733) fig keep(UODresults1) replace figure bcorrect(merge figure)
restore
**********************************************************************

/**********************************************************************
ROBUSTNESS CHECK:
Leave-one-out (Removing each state from main analysis)
**********************************************************************/
* Define the states with weights
local weightedStates "40 32 30 29 20 21 14"

* Loop over these states
foreach state of local weightedStates {
    * Load the data
    use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53
    drop if state == `state' | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresults1`state') replace

    * Restore the original dataset
    restore
}
**********************************************************************

**Drop Rhode Island
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53 (Washington)
    drop if statefip == 44 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresultsDROPRHODEISLAND) replace

    * Restore the original dataset
    restore
	
**Drop Maryland
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53 (Washington)
    drop if statefip == 24 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresultsDROPMARYLAND) replace

    * Restore the original dataset
    restore

**Drop Maine
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53 (Washington)
    drop if statefip == 23 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresultsDROPMAINE) replace

    * Restore the original dataset
    restore

**Drop Nevada
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53 (Washington)
    drop if statefip == 32 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresultsDROPNEVADA) replace

    * Restore the original dataset
    restore


use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53
    drop if state == 29 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresults1`state') replace

    * Restore the original dataset
    restore
	
**Drop Kansas
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53
    drop if state == 20 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresults1`state') replace

    * Restore the original dataset
    restore
	
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53
    drop if state == 21 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresults1`state') replace

    * Restore the original dataset
    restore
	
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53
    drop if state == 14 | statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresults1`state') replace

    * Restore the original dataset
    restore	
	
use BV_Data_UDO_DroppedSupp, clear
    preserve

    * Drop the current state and statefip == 53
    drop if statefip == 53

    * Run the SCM analysis
    allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
    trunit(38) trperiod(733) fig keep(UODresults99) replace

    * Restore the original dataset
    restore	
**

/**********************************************************************
ROBUSTNESS CHECK:
In-time, Measure 110 Vote (Passed in November 2020)

**********************************************************************/
use BV_Data_UDO_DroppedSupp, clear
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, ///
trunit(38) trperiod(730) fig figure bcorrect(merge figure) keep(Vote) replace
restore
** The impact is not significant in the first two months, and then is in January 2020. So if anything there was anticipatory impacts in January but overall the 
**********************************************************************

/**********************************************************************
ROBUSTNESS CHECK:
In-time, COVID-19 Lockdown (March 23 Gov Kate Brown issued a statewide stay-at-home order with class C misdemeanor charges for violators)
**********************************************************************/
use BV_Data_UDO_DroppedSupp, clear
// Drop PDAPS Policy Data from analysis
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, ///
trunit(38) trperiod(722) fig figure bcorrect(merge figure) keep(Lockdown) replace
restore
**********************************************************************

/**********************************************************************
ROBUSTNESS CHECK:
Matching Variable Sensitivity Analysis
**********************************************************************/
use BV_Data_UDO_DroppedSupp, clear
// Drop PDAPS Policy Data from analysis
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA0) replace
restore
** Omitting the PDAPS policy data

use BV_Data_UDO_DroppedSupp, clear
// Drop OverdoseDeaths Data from matching varlist for analysis
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA1) replace
restore
** Omitting the outcome var from matching var leaves the synthetic without a good match. It systematically under estimates the pre-treatment levels of overdose death.

// Drop ACS-derived data on mean personal wage income, portion of people aged 15-24, portion of people with grade 12 or higher, portion of people in non-metro areas, and portion of people with any medical coverage.
preserve
drop if statefip == 53
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA2) replace
restore
** Omitting ACS data gives a slgihtly worse fit of the synthetic oregon pre-treatment but does not substantially alter the results.

// Drop ACS and PDAPS data.
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA3) replace
restore
** Omitting ACS and PDAPS data

// Drop ACS, PDAPS, and BEA data
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR NotHeavyDrinking SmokerPercent, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA4) replace
restore
** Really good fit, the BRFSS data on alcohol and tabacoo consumption seems relevant.

// Drop ACS, PDAPS, and BRFSS data
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA5) replace
restore

// Drop PDAPS and BRFSS data.
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA6) replace
restore

// Drop PDAPS, BRFSS, BEA, and BLS data.
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths Uniten_Overd_Deaths incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA7) replace
restore


// Perform SCM with just outcome var and BLS's UR as matching var.
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths UR Uniten_Overd_Death, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA8) replace
restore

// Perform SCM with just outcome var as matching var.
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths Uniten_Overd_Death, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA9) replace
restore

// Perform SCM with just outcome var and ACS data as matching var.
preserve
drop if state == 48
allsynth Uniten_Overd_Deaths UR Uniten_Overd_Death, ///
trunit(38) trperiod(733) fig figure bcorrect(merge figure) keep(VSA10) replace
restore
**********************************************************************

/**********************************************************************
ROBUSTNESS CHECK:
Placebo-test in space, Washington (On February 25, 2021, the Washington Supreme Court struck down the state’s felony drug possession law)
**********************************************************************/
use BV_Data_UDO_DroppedSupp, clear
preserve
drop if state == 38
*allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
*trunit(48) trperiod(733) fig keep(UODresults1) replace figure bcorrect(merge figure)

allsynth Uniten_Overd_Deaths Uniten_Overd_Death UR PCPI2020 gdp2020 NotHeavyDrinking SmokerPercent incwage_mean age1524_mean education12plus_mean rural_mean insured_mean SUD4IC PICLnal DICPnal GSL SSPs, ///
trunit(48) trperiod(733) fig keep(UODresults1) replace figure
restore
**********************************************************************
