/***
Brannigan Vogt
MS-RP
Some Data Vis
21 May 2023
***/

clear all

cd "C:\Users\bvogt\Downloads\19-21May 2023"
/**********************************************************************
Data Visualization
**********************************************************************/

// Impute random value 0-9 for supressed data values.
use BV_DATA_MSRP, clear

destring Uninten_Overd_Deaths, replace force

// State with the most overdose deaths overall:
egen total_deaths = total(Uninten_Overd_Deaths), by(statefip)
egen max_deaths = max(total_deaths)
list statefip if total_deaths == max_deaths
save BV_Data_21May2023, replace


// Month with the most overdose deaths overall:
egen total_deaths_month = total(Uninten_Overd_Deaths), by(Month)
egen max_deaths_month = max(total_deaths_month)
list Month if total_deaths_month == max_deaths_month
save BV_Data_21May2023, replace

// State-month pair with the most overdose deaths:
egen total_deaths_state_month = total(Uninten_Overd_Deaths), by(statefip Month)
egen max_deaths_state_month = max(total_deaths_state_month)
list statefip Month if total_deaths_state_month == max_deaths_state_month
save BV_Data_21May2023, replace


use BV_DATA_MSRP, clear
// Amount of suppressed data per state.
estpost tabstat nsuppressed, by(state)

// Summarize Data
summ Uniten_Overd_Deaths
tab state, sum(Uniten_Overd_Deaths)

// Summarize Before and After for Oregon.
summarize Uniten_Overd_Deaths if state == 38 & Month < 733, detail
summarize Uniten_Overd_Deaths if state == 38 & Month >= 733, detail

// Output outreg2 tables for PRE/POST M110 Oregon. 
outreg2 using OR_Uniten_PREfeb21.doc if state == 38 & Month < 733, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Oregon, Jan 2018 to Jan 2021") label
outreg2 using OR_Uniten_POSTfeb21.doc if state == 38 & Month >= 733, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Oregon, Feb 2021 to Oct 2022") label

// Output outreg2 tables for  PRE/POST COVID19 for Oregon.
outreg2 using OR_Uniten_PREmar20.doc if state == 38 & Month < 722, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Oregon, Jan 2018 to Feb 2020") label
outreg2 using OR_Uniten_POSTmar20.doc if state == 38 & Month >= 722, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Oregon, March 2020 to Oct 2022") label

// Output outreg2 tables for PRE/POST M110 vote (counting all of nov as post).
outreg2 using OR_Uniten_PRENov20.doc if state == 38 & Month < 730, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Oregon, Jan 2018 to Oct 2020") label
outreg2 using OR_Uniten_POSTNov20.doc if state == 38 & Month >= 730, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Oregon, Nov 2020 to Oct 2022") label

// Summarize Before and After for All states + DC (except WA & OR).
preserve
drop if state == 38
outreg2 using ALLbutOR_Uniten_PREfeb21.doc if Month < 733, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in All States+DC (but WA & OR) Jan 2018 to Jan 2021") label
outreg2 using ALLbutOR_Uniten_POSTfeb21.doc if Month >= 733, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in All States+DC (but WA&OR) Feb 2021 to Oct 2022") label

outreg2 using ALLbutOR_Uniten_PREMar20.doc if Month < 722, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Rest of Sample, Jan 2018 to Feb 2020") label
outreg2 using ALLbutOR_Uniten_POSTMar20.doc if Month >= 722, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Rest of Sample, March 2020 to Oct 2022") label

outreg2 using ALLbutOR_Uniten_PRENov20.doc if Month < 730, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Rest of Sample, Jan 2018 to Oct 2020") label
outreg2 using ALLbutOR_Uniten_POSTNov20.doc if Month >= 730, replace sum(log) keep(Uniten_Overd_Deaths) title("Monthly Unintentional Overdose Deaths in Rest of Sample, Nov 2020 to Oct 2022") label
restore

// Oregon V Avg Other State (& DC) in Sample
preserve
collapse (mean) Uniten_Overd_Deaths, by(OR_Dummy Month)
xtset OR_Dummy Month, monthly
xtline Uniten_Overd_Deaths, overlay title("Unintentional Drug Overdose Deaths in Oregon vs. Rest of Sample") scheme(s2color) ///
xlab(696 "January 2018" 697 "February 2018" 698 "March 2018" 699 "April 2018" ///
700 "May 2018" 701 "June 2018" 702 "July 2018" 703 "August 2018" ///
704 "September 2018" 705 "October 2018" 706 "November 2018" ///
707 "December 2018" 708 "January 2019" 709 "February 2019" ///
710 "March 2019" 711 "April 2019" 712 "May 2019" 713 "June 2019" ///
714 "July 2019" 715 "August 2019" 716 "September 2019" ///
717 "October 2019" 718 "November 2019" 719 "December 2019" ///
720 "January 2020" 721 "February 2020" 722 "March 2020" 723 "April 2020" ///
724 "May 2020" 725 "June 2020" 726 "July 2020" 727 "August 2020" ///
728 "September 2020" 729 "October 2020" 730 "November 2020" ///
731 "December 2020" 732 "January 2021" 733 "February 2021" ///
734 "March 2021" 735 "April 2021" 736 "May 2021" 737 "June 2021" ///
738 "July 2021" 739 "August 2021" 740 "September 2021" ///
741 "October 2021" 742 "November 2021" 743 "December 2021" ///
744 "January 2022" 745 "February 2022" 746 "March 2022" 747 "April 2022" ///
748 "May 2022" 749 "June 2022" 750 "July 2022" 751 "August 2022" 752 "September 2022" 753 "October 2022", angle(90)) ///
xline(733) xline(722) xsize(10) ytitle("Drug Overdose Deaths") name(OR_Graph1, replace)
restore
