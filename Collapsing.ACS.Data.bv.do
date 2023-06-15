/**********************************************************************
Brannigan Vogt
MS Research Project Data
2019 ACS Data used for State Aggregates
19 May 2023
**********************************************************************/
clear all

cd "C:\Users\bvogt\Downloads\19 May 2023"

use 2019AVS.bv.data, clear

// Define the survey design
svyset [pweight=perwt], strata(strata)

// Create variables to identify individuals aged 15-24, those with grade 12 or higher education, and those not in a metro area
gen age1524 = (age >= 15 & age <= 24)
gen education12plus = (educ >= 06)
gen rural = (metro == 1)
gen insured = (hcovany == 2)

// Create state means using the survey weights
// Wage Income

egen weighted_incwage = total(incwage*perwt), by(statefip)
egen total_perwt = total(perwt), by(statefip)
gen incwage_mean = weighted_incwage/total_perwt

// Create state means using the survey weights
// Portion of individuals aged 15-24

egen weighted_age1524 = total(age1524*perwt), by(statefip)
gen age1524_mean = weighted_age1524/total_perwt

// Create state means using the survey weights
// Portion of individuals with grade 12 education or higher
egen weighted_education12plus = total(education12plus*perwt), by(statefip)
gen education12plus_mean = weighted_education12plus/total_perwt

// Create state means using the survey weights
// Portion of individuals not living in a metro area or mixed metro area (i.e., people who live in rural areas).
egen weighted_rural = total(rural*perwt), by(statefip)
gen rural_mean = weighted_rural/total_perwt

// Create state means using the survey weights
// Portion of individuals with any health insurance coverage.
egen weighted_insured = total(insured*perwt), by(statefip)
gen insured_mean = weighted_insured/total_perwt

collapse incwage_mean age1524_mean education12plus_mean rural_mean insured_mean, by(statefip)

save 2019ACS_StateMeans, replace
