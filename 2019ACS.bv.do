* NOTE: You need to set the Stata working directory to the path
* where the data file is located.
/***
Setting up the IPUMS 2019 ACS data.
***/

set more off

cd "C:\Users\bvogt\Downloads"

clear
quietly infix                  ///
  int     year        1-4      ///
  long    sample      5-10     ///
  double  serial      11-18    ///
  double  cbserial    19-31    ///
  double  hhwt        32-41    ///
  double  cluster     42-54    ///
  byte    stateicp    55-56    ///
  byte    statefip    57-58    ///
  double  density     59-65    ///
  byte    metro       66-66    ///
  double  strata      67-78    ///
  byte    gq          79-79    ///
  byte    mortgage    80-80    ///
  int     rent        81-84    ///
  long    rentgrs     85-89    ///
  long    hhincome    90-96    ///
  byte    foodstmp    97-97    ///
  long    valueh      98-104   ///
  byte    cidatapln   105-105  ///
  byte    cihispeed   106-107  ///
  byte    coupletype  108-108  ///
  int     pernum      109-112  ///
  double  perwt       113-122  ///
  byte    sex         123-123  ///
  int     age         124-126  ///
  byte    race        127-127  ///
  int     raced       128-130  ///
  byte    racwht      131-131  ///
  byte    hcovany     132-132  ///
  byte    hcovpriv    133-133  ///
  byte    hcovpub     134-134  ///
  byte    school      135-135  ///
  byte    educ        136-137  ///
  int     educd       138-140  ///
  byte    empstat     141-141  ///
  byte    empstatd    142-143  ///
  byte    wkswork1    144-145  ///
  long    inctot      146-152  ///
  long    ftotinc     153-159  ///
  long    incwage     160-165  ///
  long    incwelfr    166-170  ///
  double  hwsei       171-174  ///
  byte    diffrem     175-175  ///
  byte    diffphys    176-176  ///
  byte    vetstat     177-177  ///
  byte    vetstatd    178-179  ///
  byte    pwstate2    180-181  ///
  byte    gcrespon    182-182  ///
  byte    spmpov      183-183  ///
  using `"2019ACS.bv.dat"'

replace hhwt       = hhwt       / 100
replace density    = density    / 10
replace perwt      = perwt      / 100
replace hwsei      = hwsei      / 100

format serial     %8.0f
format cbserial   %13.0f
format hhwt       %10.2f
format cluster    %13.0f
format density    %7.1f
format strata     %12.0f
format perwt      %10.2f
format hwsei      %4.2f

label var year       `"Census year"'
label var sample     `"IPUMS sample identifier"'
label var serial     `"Household serial number"'
label var cbserial   `"Original Census Bureau household serial number"'
label var hhwt       `"Household weight"'
label var cluster    `"Household cluster for variance estimation"'
label var stateicp   `"State (ICPSR code)"'
label var statefip   `"State (FIPS code)"'
label var density    `"Population-weighted density of PUMA"'
label var metro      `"Metropolitan status"'
label var strata     `"Household strata for variance estimation"'
label var gq         `"Group quarters status"'
label var mortgage   `"Mortgage status"'
label var rent       `"Monthly contract rent"'
label var rentgrs    `"Monthly gross rent"'
label var hhincome   `"Total household income "'
label var foodstmp   `"Food stamp recipiency"'
label var valueh     `"House value"'
label var cidatapln  `"Cellular data plan for a smartphone or other mobile device"'
label var cihispeed  `"Broadband (high speed) Internet service such as cable, fiber optic, or DSL servi"'
label var coupletype `"Householder couple type"'
label var pernum     `"Person number in sample unit"'
label var perwt      `"Person weight"'
label var sex        `"Sex"'
label var age        `"Age"'
label var race       `"Race [general version]"'
label var raced      `"Race [detailed version]"'
label var racwht     `"Race: white"'
label var hcovany    `"Any health insurance coverage"'
label var hcovpriv   `"Private health insurance coverage"'
label var hcovpub    `"Public health insurance coverage"'
label var school     `"School attendance"'
label var educ       `"Educational attainment [general version]"'
label var educd      `"Educational attainment [detailed version]"'
label var empstat    `"Employment status [general version]"'
label var empstatd   `"Employment status [detailed version]"'
label var wkswork1   `"Weeks worked last year"'
label var inctot     `"Total personal income"'
label var ftotinc    `"Total family income"'
label var incwage    `"Wage and salary income"'
label var incwelfr   `"Welfare (public assistance) income"'
label var hwsei      `"Socioeconomic Index, Hauser and Warren"'
label var diffrem    `"Cognitive difficulty"'
label var diffphys   `"Ambulatory difficulty"'
label var vetstat    `"Veteran status [general version]"'
label var vetstatd   `"Veteran status [detailed version]"'
label var pwstate2   `"Place of work: state"'
label var gcrespon   `"Responsible for grandchildren"'
label var spmpov     `"SPM poverty status"'

label define year_lbl 1850 `"1850"'
label define year_lbl 1860 `"1860"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1920 `"1920"', add
label define year_lbl 1930 `"1930"', add
label define year_lbl 1940 `"1940"', add
label define year_lbl 1950 `"1950"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label define year_lbl 2019 `"2019"', add
label define year_lbl 2020 `"2020"', add
label define year_lbl 2021 `"2021"', add
label values year year_lbl

label define sample_lbl 202104 `"2017-2021, PRCS 5-year"'
label define sample_lbl 202103 `"2017-2021, ACS 5-year"', add
label define sample_lbl 202102 `"2021 PRCS"', add
label define sample_lbl 202101 `"2021 ACS"', add
label define sample_lbl 202004 `"2016-2020, PRCS 5-year"', add
label define sample_lbl 202003 `"2016-2020, ACS 5-year"', add
label define sample_lbl 202001 `"2020 ACS"', add
label define sample_lbl 201904 `"2015-2019, PRCS 5-year"', add
label define sample_lbl 201903 `"2015-2019, ACS 5-year"', add
label define sample_lbl 201902 `"2019 PRCS"', add
label define sample_lbl 201901 `"2019 ACS"', add
label define sample_lbl 201804 `"2014-2018, PRCS 5-year"', add
label define sample_lbl 201803 `"2014-2018, ACS 5-year"', add
label define sample_lbl 201802 `"2018 PRCS"', add
label define sample_lbl 201801 `"2018 ACS"', add
label define sample_lbl 201704 `"2013-2017, PRCS 5-year"', add
label define sample_lbl 201703 `"2013-2017, ACS 5-year"', add
label define sample_lbl 201702 `"2017 PRCS"', add
label define sample_lbl 201701 `"2017 ACS"', add
label define sample_lbl 201604 `"2012-2016, PRCS 5-year"', add
label define sample_lbl 201603 `"2012-2016, ACS 5-year"', add
label define sample_lbl 201602 `"2016 PRCS"', add
label define sample_lbl 201601 `"2016 ACS"', add
label define sample_lbl 201504 `"2011-2015, PRCS 5-year"', add
label define sample_lbl 201503 `"2011-2015, ACS 5-year"', add
label define sample_lbl 201502 `"2015 PRCS"', add
label define sample_lbl 201501 `"2015 ACS"', add
label define sample_lbl 201404 `"2010-2014, PRCS 5-year"', add
label define sample_lbl 201403 `"2010-2014, ACS 5-year"', add
label define sample_lbl 201402 `"2014 PRCS"', add
label define sample_lbl 201401 `"2014 ACS"', add
label define sample_lbl 201306 `"2009-2013, PRCS 5-year"', add
label define sample_lbl 201305 `"2009-2013, ACS 5-year"', add
label define sample_lbl 201304 `"2011-2013, PRCS 3-year"', add
label define sample_lbl 201303 `"2011-2013, ACS 3-year"', add
label define sample_lbl 201302 `"2013 PRCS"', add
label define sample_lbl 201301 `"2013 ACS"', add
label define sample_lbl 201206 `"2008-2012, PRCS 5-year"', add
label define sample_lbl 201205 `"2008-2012, ACS 5-year"', add
label define sample_lbl 201204 `"2010-2012, PRCS 3-year"', add
label define sample_lbl 201203 `"2010-2012, ACS 3-year"', add
label define sample_lbl 201202 `"2012 PRCS"', add
label define sample_lbl 201201 `"2012 ACS"', add
label define sample_lbl 201106 `"2007-2011, PRCS 5-year"', add
label define sample_lbl 201105 `"2007-2011, ACS 5-year"', add
label define sample_lbl 201104 `"2009-2011, PRCS 3-year"', add
label define sample_lbl 201103 `"2009-2011, ACS 3-year"', add
label define sample_lbl 201102 `"2011 PRCS"', add
label define sample_lbl 201101 `"2011 ACS"', add
label define sample_lbl 201008 `"2010 Puerto Rico 10%"', add
label define sample_lbl 201007 `"2010 10%"', add
label define sample_lbl 201006 `"2006-2010, PRCS 5-year"', add
label define sample_lbl 201005 `"2006-2010, ACS 5-year"', add
label define sample_lbl 201004 `"2008-2010, PRCS 3-year"', add
label define sample_lbl 201003 `"2008-2010, ACS 3-year"', add
label define sample_lbl 201002 `"2010 PRCS"', add
label define sample_lbl 201001 `"2010 ACS"', add
label define sample_lbl 200906 `"2005-2009, PRCS 5-year"', add
label define sample_lbl 200905 `"2005-2009, ACS 5-year"', add
label define sample_lbl 200904 `"2007-2009, PRCS 3-year"', add
label define sample_lbl 200903 `"2007-2009, ACS 3-year"', add
label define sample_lbl 200902 `"2009 PRCS"', add
label define sample_lbl 200901 `"2009 ACS"', add
label define sample_lbl 200804 `"2006-2008, PRCS 3-year"', add
label define sample_lbl 200803 `"2006-2008, ACS 3-year"', add
label define sample_lbl 200802 `"2008 PRCS"', add
label define sample_lbl 200801 `"2008 ACS"', add
label define sample_lbl 200704 `"2005-2007, PRCS 3-year"', add
label define sample_lbl 200703 `"2005-2007, ACS 3-year"', add
label define sample_lbl 200702 `"2007 PRCS"', add
label define sample_lbl 200701 `"2007 ACS"', add
label define sample_lbl 200602 `"2006 PRCS"', add
label define sample_lbl 200601 `"2006 ACS"', add
label define sample_lbl 200502 `"2005 PRCS"', add
label define sample_lbl 200501 `"2005 ACS"', add
label define sample_lbl 200401 `"2004 ACS"', add
label define sample_lbl 200301 `"2003 ACS"', add
label define sample_lbl 200201 `"2002 ACS"', add
label define sample_lbl 200101 `"2001 ACS"', add
label define sample_lbl 200008 `"2000 Puerto Rico 1%"', add
label define sample_lbl 200007 `"2000 1%"', add
label define sample_lbl 200006 `"2000 Puerto Rico 1% sample (old version)"', add
label define sample_lbl 200005 `"2000 Puerto Rico 5%"', add
label define sample_lbl 200004 `"2000 ACS"', add
label define sample_lbl 200003 `"2000 Unweighted 1%"', add
label define sample_lbl 200002 `"2000 1% sample (old version)"', add
label define sample_lbl 200001 `"2000 5%"', add
label define sample_lbl 199007 `"1990 Puerto Rico 1%"', add
label define sample_lbl 199006 `"1990 Puerto Rico 5%"', add
label define sample_lbl 199005 `"1990 Labor Market Area"', add
label define sample_lbl 199004 `"1990 Elderly"', add
label define sample_lbl 199003 `"1990 Unweighted 1%"', add
label define sample_lbl 199002 `"1990 1%"', add
label define sample_lbl 199001 `"1990 5%"', add
label define sample_lbl 198007 `"1980 Puerto Rico 1%"', add
label define sample_lbl 198006 `"1980 Puerto Rico 5%"', add
label define sample_lbl 198005 `"1980 Detailed metro/non-metro"', add
label define sample_lbl 198004 `"1980 Labor Market Area"', add
label define sample_lbl 198003 `"1980 Urban/Rural"', add
label define sample_lbl 198002 `"1980 1%"', add
label define sample_lbl 198001 `"1980 5%"', add
label define sample_lbl 197009 `"1970 Puerto Rico Neighborhood"', add
label define sample_lbl 197008 `"1970 Puerto Rico Municipio"', add
label define sample_lbl 197007 `"1970 Puerto Rico State"', add
label define sample_lbl 197006 `"1970 Form 2 Neighborhood"', add
label define sample_lbl 197005 `"1970 Form 1 Neighborhood"', add
label define sample_lbl 197004 `"1970 Form 2 Metro"', add
label define sample_lbl 197003 `"1970 Form 1 Metro"', add
label define sample_lbl 197002 `"1970 Form 2 State"', add
label define sample_lbl 197001 `"1970 Form 1 State"', add
label define sample_lbl 196002 `"1960 5%"', add
label define sample_lbl 196001 `"1960 1%"', add
label define sample_lbl 195001 `"1950 1%"', add
label define sample_lbl 194002 `"1940 100% database"', add
label define sample_lbl 194001 `"1940 1%"', add
label define sample_lbl 193004 `"1930 100% database"', add
label define sample_lbl 193003 `"1930 Puerto Rico"', add
label define sample_lbl 193002 `"1930 5%"', add
label define sample_lbl 193001 `"1930 1%"', add
label define sample_lbl 192003 `"1920 100% database"', add
label define sample_lbl 192002 `"1920 Puerto Rico sample"', add
label define sample_lbl 192001 `"1920 1%"', add
label define sample_lbl 191004 `"1910 100% database"', add
label define sample_lbl 191003 `"1910 1.4% sample with oversamples"', add
label define sample_lbl 191002 `"1910 1%"', add
label define sample_lbl 191001 `"1910 Puerto Rico"', add
label define sample_lbl 190004 `"1900 100% database"', add
label define sample_lbl 190003 `"1900 1% sample with oversamples"', add
label define sample_lbl 190002 `"1900 1%"', add
label define sample_lbl 190001 `"1900 5%"', add
label define sample_lbl 188003 `"1880 100% database"', add
label define sample_lbl 188002 `"1880 10%"', add
label define sample_lbl 188001 `"1880 1%"', add
label define sample_lbl 187003 `"1870 100% database"', add
label define sample_lbl 187002 `"1870 1% sample with black oversample"', add
label define sample_lbl 187001 `"1870 1%"', add
label define sample_lbl 186003 `"1860 100% database"', add
label define sample_lbl 186002 `"1860 1% sample with black oversample"', add
label define sample_lbl 186001 `"1860 1%"', add
label define sample_lbl 185002 `"1850 100% database"', add
label define sample_lbl 185001 `"1850 1%"', add
label values sample sample_lbl

label define stateicp_lbl 01 `"Connecticut"'
label define stateicp_lbl 02 `"Maine"', add
label define stateicp_lbl 03 `"Massachusetts"', add
label define stateicp_lbl 04 `"New Hampshire"', add
label define stateicp_lbl 05 `"Rhode Island"', add
label define stateicp_lbl 06 `"Vermont"', add
label define stateicp_lbl 11 `"Delaware"', add
label define stateicp_lbl 12 `"New Jersey"', add
label define stateicp_lbl 13 `"New York"', add
label define stateicp_lbl 14 `"Pennsylvania"', add
label define stateicp_lbl 21 `"Illinois"', add
label define stateicp_lbl 22 `"Indiana"', add
label define stateicp_lbl 23 `"Michigan"', add
label define stateicp_lbl 24 `"Ohio"', add
label define stateicp_lbl 25 `"Wisconsin"', add
label define stateicp_lbl 31 `"Iowa"', add
label define stateicp_lbl 32 `"Kansas"', add
label define stateicp_lbl 33 `"Minnesota"', add
label define stateicp_lbl 34 `"Missouri"', add
label define stateicp_lbl 35 `"Nebraska"', add
label define stateicp_lbl 36 `"North Dakota"', add
label define stateicp_lbl 37 `"South Dakota"', add
label define stateicp_lbl 40 `"Virginia"', add
label define stateicp_lbl 41 `"Alabama"', add
label define stateicp_lbl 42 `"Arkansas"', add
label define stateicp_lbl 43 `"Florida"', add
label define stateicp_lbl 44 `"Georgia"', add
label define stateicp_lbl 45 `"Louisiana"', add
label define stateicp_lbl 46 `"Mississippi"', add
label define stateicp_lbl 47 `"North Carolina"', add
label define stateicp_lbl 48 `"South Carolina"', add
label define stateicp_lbl 49 `"Texas"', add
label define stateicp_lbl 51 `"Kentucky"', add
label define stateicp_lbl 52 `"Maryland"', add
label define stateicp_lbl 53 `"Oklahoma"', add
label define stateicp_lbl 54 `"Tennessee"', add
label define stateicp_lbl 56 `"West Virginia"', add
label define stateicp_lbl 61 `"Arizona"', add
label define stateicp_lbl 62 `"Colorado"', add
label define stateicp_lbl 63 `"Idaho"', add
label define stateicp_lbl 64 `"Montana"', add
label define stateicp_lbl 65 `"Nevada"', add
label define stateicp_lbl 66 `"New Mexico"', add
label define stateicp_lbl 67 `"Utah"', add
label define stateicp_lbl 68 `"Wyoming"', add
label define stateicp_lbl 71 `"California"', add
label define stateicp_lbl 72 `"Oregon"', add
label define stateicp_lbl 73 `"Washington"', add
label define stateicp_lbl 81 `"Alaska"', add
label define stateicp_lbl 82 `"Hawaii"', add
label define stateicp_lbl 83 `"Puerto Rico"', add
label define stateicp_lbl 96 `"State groupings (1980 Urban/rural sample)"', add
label define stateicp_lbl 97 `"Military/Mil. Reservations"', add
label define stateicp_lbl 98 `"District of Columbia"', add
label define stateicp_lbl 99 `"State not identified"', add
label values stateicp stateicp_lbl

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label define statefip_lbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefip_lbl 62 `"Massachusetts-Rhode Island"', add
label define statefip_lbl 63 `"Minnesota-Iowa-Missouri-Kansas-Nebraska-S.Dakota-N.Dakota"', add
label define statefip_lbl 64 `"Maryland-Delaware"', add
label define statefip_lbl 65 `"Montana-Idaho-Wyoming"', add
label define statefip_lbl 66 `"Utah-Nevada"', add
label define statefip_lbl 67 `"Arizona-New Mexico"', add
label define statefip_lbl 68 `"Alaska-Hawaii"', add
label define statefip_lbl 72 `"Puerto Rico"', add
label define statefip_lbl 97 `"Military/Mil. Reservation"', add
label define statefip_lbl 99 `"State not identified"', add
label values statefip statefip_lbl

label define metro_lbl 0 `"Metropolitan status indeterminable (mixed)"'
label define metro_lbl 1 `"Not in metropolitan area"', add
label define metro_lbl 2 `"In metropolitan area: In central/principal city"', add
label define metro_lbl 3 `"In metropolitan area: Not in central/principal city"', add
label define metro_lbl 4 `"In metropolitan area: Central/principal city status indeterminable (mixed)"', add
label values metro metro_lbl

label define gq_lbl 0 `"Vacant unit"'
label define gq_lbl 1 `"Households under 1970 definition"', add
label define gq_lbl 2 `"Additional households under 1990 definition"', add
label define gq_lbl 3 `"Group quarters--Institutions"', add
label define gq_lbl 4 `"Other group quarters"', add
label define gq_lbl 5 `"Additional households under 2000 definition"', add
label define gq_lbl 6 `"Fragment"', add
label values gq gq_lbl

label define mortgage_lbl 0 `"N/A"'
label define mortgage_lbl 1 `"No, owned free and clear"', add
label define mortgage_lbl 2 `"Check mark on manuscript (probably yes)"', add
label define mortgage_lbl 3 `"Yes, mortgaged/ deed of trust or similar debt"', add
label define mortgage_lbl 4 `"Yes, contract to purchase"', add
label values mortgage mortgage_lbl

label define rent_lbl 0000 `"N/A"'
label define rent_lbl 0001 `"No cash rent (1980-1990)"', add
label define rent_lbl 0015 `"Less than $30 (1980 Puerto Rico Samples)"', add
label define rent_lbl 0025 `"$1-50"', add
label define rent_lbl 0010 `"$1-19"', add
label define rent_lbl 0002 `"0002"', add
label define rent_lbl 0003 `"0003"', add
label define rent_lbl 0004 `"0004"', add
label define rent_lbl 0005 `"0005"', add
label define rent_lbl 0006 `"0006"', add
label define rent_lbl 0007 `"0007"', add
label define rent_lbl 0008 `"0008"', add
label define rent_lbl 0009 `"0009"', add
label define rent_lbl 0011 `"0011"', add
label define rent_lbl 0012 `"0012"', add
label define rent_lbl 0013 `"0013"', add
label define rent_lbl 0014 `"0014"', add
label define rent_lbl 0016 `"0016"', add
label define rent_lbl 0017 `"0017"', add
label define rent_lbl 0018 `"0018"', add
label define rent_lbl 0019 `"0019"', add
label define rent_lbl 0020 `"0020"', add
label define rent_lbl 0021 `"0021"', add
label define rent_lbl 0022 `"0022"', add
label define rent_lbl 0023 `"0023"', add
label define rent_lbl 0024 `"0024"', add
label define rent_lbl 0026 `"0026"', add
label define rent_lbl 0027 `"0027"', add
label define rent_lbl 0028 `"0028"', add
label define rent_lbl 0029 `"0029"', add
label define rent_lbl 0035 `"$30-39"', add
label define rent_lbl 0030 `"0030"', add
label define rent_lbl 0031 `"0031"', add
label define rent_lbl 0032 `"0032"', add
label define rent_lbl 0033 `"0033"', add
label define rent_lbl 0034 `"0034"', add
label define rent_lbl 0036 `"0036"', add
label define rent_lbl 0037 `"0037"', add
label define rent_lbl 0038 `"0038"', add
label define rent_lbl 0039 `"0039"', add
label define rent_lbl 0045 `"$40-49"', add
label define rent_lbl 0040 `"0040"', add
label define rent_lbl 0041 `"0041"', add
label define rent_lbl 0042 `"0042"', add
label define rent_lbl 0043 `"0043"', add
label define rent_lbl 0044 `"0044"', add
label define rent_lbl 0046 `"0046"', add
label define rent_lbl 0047 `"0047"', add
label define rent_lbl 0048 `"0048"', add
label define rent_lbl 0049 `"0049"', add
label define rent_lbl 0055 `"$50-59"', add
label define rent_lbl 0050 `"0050"', add
label define rent_lbl 0051 `"0051"', add
label define rent_lbl 0052 `"0052"', add
label define rent_lbl 0053 `"0053"', add
label define rent_lbl 0054 `"0054"', add
label define rent_lbl 0056 `"0056"', add
label define rent_lbl 0057 `"0057"', add
label define rent_lbl 0058 `"0058"', add
label define rent_lbl 0059 `"0059"', add
label define rent_lbl 0065 `"$60-69"', add
label define rent_lbl 0060 `"0060"', add
label define rent_lbl 0061 `"0061"', add
label define rent_lbl 0062 `"0062"', add
label define rent_lbl 0063 `"0063"', add
label define rent_lbl 0064 `"0064"', add
label define rent_lbl 0066 `"0066"', add
label define rent_lbl 0067 `"0067"', add
label define rent_lbl 0068 `"0068"', add
label define rent_lbl 0069 `"0069"', add
label define rent_lbl 0075 `"$70-79"', add
label define rent_lbl 0070 `"0070"', add
label define rent_lbl 0071 `"0071"', add
label define rent_lbl 0072 `"0072"', add
label define rent_lbl 0073 `"0073"', add
label define rent_lbl 0074 `"0074"', add
label define rent_lbl 0076 `"0076"', add
label define rent_lbl 0077 `"0077"', add
label define rent_lbl 0078 `"0078"', add
label define rent_lbl 0079 `"0079"', add
label define rent_lbl 0085 `"$80-89"', add
label define rent_lbl 0090 `"$80-99 (1960 1%)"', add
label define rent_lbl 0080 `"0080"', add
label define rent_lbl 0081 `"0081"', add
label define rent_lbl 0082 `"0082"', add
label define rent_lbl 0083 `"0083"', add
label define rent_lbl 0084 `"0084"', add
label define rent_lbl 0086 `"0086"', add
label define rent_lbl 0087 `"0087"', add
label define rent_lbl 0088 `"0088"', add
label define rent_lbl 0089 `"0089"', add
label define rent_lbl 0091 `"0091"', add
label define rent_lbl 0092 `"0092"', add
label define rent_lbl 0093 `"0093"', add
label define rent_lbl 0094 `"0094"', add
label define rent_lbl 0095 `"0095"', add
label define rent_lbl 0096 `"0096"', add
label define rent_lbl 0097 `"0097"', add
label define rent_lbl 0098 `"0098"', add
label define rent_lbl 0099 `"0099"', add
label define rent_lbl 0110 `"$100-119 (1960 1%)"', add
label define rent_lbl 0100 `"0100"', add
label define rent_lbl 0101 `"0101"', add
label define rent_lbl 0102 `"0102"', add
label define rent_lbl 0103 `"0103"', add
label define rent_lbl 0104 `"0104"', add
label define rent_lbl 0105 `"0105"', add
label define rent_lbl 0106 `"0106"', add
label define rent_lbl 0107 `"0107"', add
label define rent_lbl 0108 `"0108"', add
label define rent_lbl 0109 `"0109"', add
label define rent_lbl 0115 `"$110-119"', add
label define rent_lbl 0125 `"$120-129"', add
label define rent_lbl 0135 `"$120-149 (1960 1%)"', add
label define rent_lbl 0145 `"$140-149"', add
label define rent_lbl 0155 `"$150-159"', add
label define rent_lbl 0165 `"$160-169"', add
label define rent_lbl 0175 `"$150-199 (1960 1%)"', add
label define rent_lbl 0185 `"$180-189"', add
label define rent_lbl 0195 `"$190-199"', add
label define rent_lbl 0212 `"$200-224"', add
label define rent_lbl 0237 `"$225-249"', add
label define rent_lbl 0275 `"$250-299 (Puerto Rico)"', add
label define rent_lbl 0262 `"$250-274"', add
label define rent_lbl 0287 `"$275-299"', add
label define rent_lbl 0325 `"$300-349"', add
label define rent_lbl 0375 `"$350-399"', add
label define rent_lbl 0450 `"$400-499  ($400+ Puerto Rico)"', add
label define rent_lbl 0500 `"$500+"', add
label define rent_lbl 0200 `"$200+ (1960 1%)"', add
label define rent_lbl 0112 `"$100-124"', add
label define rent_lbl 0137 `"$125-149"', add
label define rent_lbl 0162 `"$150-174"', add
label define rent_lbl 0187 `"$175-199"', add
label define rent_lbl 0282 `"$275-299"', add
label define rent_lbl 0312 `"$300-324"', add
label define rent_lbl 0337 `"$325-349"', add
label define rent_lbl 0362 `"$350-374"', add
label define rent_lbl 0387 `"$375-399"', add
label define rent_lbl 0412 `"$400-424"', add
label define rent_lbl 0437 `"$425-449"', add
label define rent_lbl 0462 `"$450-474"', add
label define rent_lbl 0487 `"$475-499"', add
label define rent_lbl 0525 `"$500-549 (Puerto Rico)"', add
label define rent_lbl 0512 `"$500-524"', add
label define rent_lbl 0537 `"$525-549"', add
label define rent_lbl 0575 `"$550-599"', add
label define rent_lbl 0625 `"$600-649"', add
label define rent_lbl 0675 `"$650-699"', add
label define rent_lbl 0725 `"$700-749"', add
label define rent_lbl 0875 `"$750-999"', add
label define rent_lbl 1000 `"$1,000+"', add
label define rent_lbl 8888 `"1960s cases to be allocated"', add
label define rent_lbl 9997 `"9997"', add
label define rent_lbl 9998 `"9998"', add
label define rent_lbl 9999 `"No cash rent (1940)"', add
label define rent_lbl -001 `"-001"', add
label values rent rent_lbl

label define rentgrs_lbl 00000 `"N/A"'
label define rentgrs_lbl 00010 `"$1-19"', add
label define rentgrs_lbl 00025 `"$20-29"', add
label define rentgrs_lbl 00035 `"$30-39"', add
label define rentgrs_lbl 00045 `"$40-49"', add
label define rentgrs_lbl 00055 `"$50-59"', add
label define rentgrs_lbl 00065 `"$60-69"', add
label define rentgrs_lbl 00075 `"$70-79"', add
label define rentgrs_lbl 00090 `"$80-99"', add
label define rentgrs_lbl 00110 `"$100-119"', add
label define rentgrs_lbl 00135 `"$120-149"', add
label define rentgrs_lbl 00175 `"$150-199"', add
label define rentgrs_lbl 00200 `"$200+"', add
label values rentgrs rentgrs_lbl

label define hhincome_lbl 9999998 `"9999998"'
label define hhincome_lbl 9999999 `"9999999"', add
label values hhincome hhincome_lbl

label define foodstmp_lbl 0 `"N/A"'
label define foodstmp_lbl 1 `"No"', add
label define foodstmp_lbl 2 `"Yes"', add
label values foodstmp foodstmp_lbl

label define valueh_lbl 0000000 `"$0 (1940)"'
label define valueh_lbl 0000250 `"Less than $500"', add
label define valueh_lbl 0000500 `"Less than $999"', add
label define valueh_lbl 0001000 `"Less than $2,000"', add
label define valueh_lbl 0001500 `"$2,000-$1,999"', add
label define valueh_lbl 0002500 `"Less than $5,000"', add
label define valueh_lbl 0003500 `"$3,000-$3,999"', add
label define valueh_lbl 0004000 `"$3,000-$4,999"', add
label define valueh_lbl 0004500 `"$4,000-$4,999"', add
label define valueh_lbl 0005000 `"Less than $10,000"', add
label define valueh_lbl 0006250 `"$5,000 - 7,499"', add
label define valueh_lbl 0008750 `"$7,500 - 9,999"', add
label define valueh_lbl 0012500 `"$10,000 - 14,999"', add
label define valueh_lbl 0011250 `"$10,000 - 12,499"', add
label define valueh_lbl 0013750 `"$12,500 - 14,999"', add
label define valueh_lbl 0017500 `"$15,000 - 19,999"', add
label define valueh_lbl 0016250 `"$15,000 - 17,499"', add
label define valueh_lbl 0018750 `"$17,500 - 19,999"', add
label define valueh_lbl 0025000 `"$20,000-$29,999"', add
label define valueh_lbl 0022500 `"$20,000 - 24,999"', add
label define valueh_lbl 0021250 `"$20,000 - 22,499"', add
label define valueh_lbl 0023750 `"$22,500 - 24,999"', add
label define valueh_lbl 0030000 `"$25,000 - 34,999"', add
label define valueh_lbl 0026250 `"$25,000 - 27,499"', add
label define valueh_lbl 0027500 `"$25,000 - 29,999"', add
label define valueh_lbl 0028750 `"$27,500 - 29,999"', add
label define valueh_lbl 0032500 `"$30,000 - 34,999"', add
label define valueh_lbl 0031250 `"$30,000-$32,499"', add
label define valueh_lbl 0033750 `"$32,500-$34,999"', add
label define valueh_lbl 0035000 `"$35,000+"', add
label define valueh_lbl 0042500 `"$35,000 - 49,999"', add
label define valueh_lbl 0037500 `"$35,000 - 39,999"', add
label define valueh_lbl 0036250 `"$35,000-$37,499"', add
label define valueh_lbl 0038750 `"$37,500-$39,999"', add
label define valueh_lbl 0045000 `"$40,000 - 49,999"', add
label define valueh_lbl 0042499 `"$40,000 - 44,999"', add
label define valueh_lbl 0047500 `"$45,000 - 49,999"', add
label define valueh_lbl 0050000 `"$50,000+"', add
label define valueh_lbl 0055000 `"$50,000 - 59,999"', add
label define valueh_lbl 0052500 `"$50,000 - 54,999"', add
label define valueh_lbl 0057500 `"$55,000 - 59,999"', add
label define valueh_lbl 0065000 `"$60,000 - 69,999"', add
label define valueh_lbl 0062500 `"$60,000 - 64,999"', add
label define valueh_lbl 0067500 `"$65,000 - 69,999"', add
label define valueh_lbl 0075000 `"$70,000 - 79,999"', add
label define valueh_lbl 0072500 `"$70,000 - 74,999"', add
label define valueh_lbl 0077500 `"$75,000 - 79,999"', add
label define valueh_lbl 0087500 `"$75,000-$99,999"', add
label define valueh_lbl 0085000 `"$80,000 - 89,999"', add
label define valueh_lbl 0095000 `"$90,000 - 99,999"', add
label define valueh_lbl 0100000 `"$100,000+"', add
label define valueh_lbl 0112500 `"$100,000 - 124,999"', add
label define valueh_lbl 0137500 `"$125,000 - 149,999"', add
label define valueh_lbl 0175000 `"$150,000 - 199,999"', add
label define valueh_lbl 0162500 `"$150,000 - 174,999"', add
label define valueh_lbl 0187500 `"$175,000 - 199,999"', add
label define valueh_lbl 0200000 `"$200,000+"', add
label define valueh_lbl 0225000 `"$200,000 - 249,999"', add
label define valueh_lbl 0275000 `"$250,000 - 299,999"', add
label define valueh_lbl 0350000 `"$300,000 - 399,999"', add
label define valueh_lbl 0400000 `"$400,000+"', add
label define valueh_lbl 0450000 `"$400,000 - 499,999"', add
label define valueh_lbl 0625000 `"$500,000 - 749,999"', add
label define valueh_lbl 0875000 `"$750,000 - 999,999"', add
label define valueh_lbl 1000000 `"$1,000,000+"', add
label define valueh_lbl 9999998 `"Missing"', add
label define valueh_lbl 9999999 `"N/A"', add
label values valueh valueh_lbl

label define cidatapln_lbl 0 `"N/A (GQ)"'
label define cidatapln_lbl 1 `"Yes"', add
label define cidatapln_lbl 2 `"No"', add
label values cidatapln cidatapln_lbl

label define cihispeed_lbl 00 `"N/A (GQ)"'
label define cihispeed_lbl 10 `"Yes (Cable modem, fiber optic or DSL service)"', add
label define cihispeed_lbl 11 `"Cable modem only"', add
label define cihispeed_lbl 12 `"Fiber optic only"', add
label define cihispeed_lbl 13 `"DSL service only"', add
label define cihispeed_lbl 14 `"Cable modem + Fiber optic"', add
label define cihispeed_lbl 15 `"Cable modem + DSL service"', add
label define cihispeed_lbl 16 `"Fiber optic + DSL service"', add
label define cihispeed_lbl 17 `"Cable modem, Fiber optic and DSL service"', add
label define cihispeed_lbl 20 `"No"', add
label values cihispeed cihispeed_lbl

label define coupletype_lbl 0 `"N/A"'
label define coupletype_lbl 1 `"Opposite-sex husband/wife/spouse household"', add
label define coupletype_lbl 2 `"Same-sex husband/wife/spouse household"', add
label define coupletype_lbl 3 `"Opposite-sex unmarried partner household"', add
label define coupletype_lbl 4 `"Same-sex unmarried partner household"', add
label values coupletype coupletype_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label values sex sex_lbl

label define age_lbl 000 `"Less than 1 year old"'
label define age_lbl 001 `"1"', add
label define age_lbl 002 `"2"', add
label define age_lbl 003 `"3"', add
label define age_lbl 004 `"4"', add
label define age_lbl 005 `"5"', add
label define age_lbl 006 `"6"', add
label define age_lbl 007 `"7"', add
label define age_lbl 008 `"8"', add
label define age_lbl 009 `"9"', add
label define age_lbl 010 `"10"', add
label define age_lbl 011 `"11"', add
label define age_lbl 012 `"12"', add
label define age_lbl 013 `"13"', add
label define age_lbl 014 `"14"', add
label define age_lbl 015 `"15"', add
label define age_lbl 016 `"16"', add
label define age_lbl 017 `"17"', add
label define age_lbl 018 `"18"', add
label define age_lbl 019 `"19"', add
label define age_lbl 020 `"20"', add
label define age_lbl 021 `"21"', add
label define age_lbl 022 `"22"', add
label define age_lbl 023 `"23"', add
label define age_lbl 024 `"24"', add
label define age_lbl 025 `"25"', add
label define age_lbl 026 `"26"', add
label define age_lbl 027 `"27"', add
label define age_lbl 028 `"28"', add
label define age_lbl 029 `"29"', add
label define age_lbl 030 `"30"', add
label define age_lbl 031 `"31"', add
label define age_lbl 032 `"32"', add
label define age_lbl 033 `"33"', add
label define age_lbl 034 `"34"', add
label define age_lbl 035 `"35"', add
label define age_lbl 036 `"36"', add
label define age_lbl 037 `"37"', add
label define age_lbl 038 `"38"', add
label define age_lbl 039 `"39"', add
label define age_lbl 040 `"40"', add
label define age_lbl 041 `"41"', add
label define age_lbl 042 `"42"', add
label define age_lbl 043 `"43"', add
label define age_lbl 044 `"44"', add
label define age_lbl 045 `"45"', add
label define age_lbl 046 `"46"', add
label define age_lbl 047 `"47"', add
label define age_lbl 048 `"48"', add
label define age_lbl 049 `"49"', add
label define age_lbl 050 `"50"', add
label define age_lbl 051 `"51"', add
label define age_lbl 052 `"52"', add
label define age_lbl 053 `"53"', add
label define age_lbl 054 `"54"', add
label define age_lbl 055 `"55"', add
label define age_lbl 056 `"56"', add
label define age_lbl 057 `"57"', add
label define age_lbl 058 `"58"', add
label define age_lbl 059 `"59"', add
label define age_lbl 060 `"60"', add
label define age_lbl 061 `"61"', add
label define age_lbl 062 `"62"', add
label define age_lbl 063 `"63"', add
label define age_lbl 064 `"64"', add
label define age_lbl 065 `"65"', add
label define age_lbl 066 `"66"', add
label define age_lbl 067 `"67"', add
label define age_lbl 068 `"68"', add
label define age_lbl 069 `"69"', add
label define age_lbl 070 `"70"', add
label define age_lbl 071 `"71"', add
label define age_lbl 072 `"72"', add
label define age_lbl 073 `"73"', add
label define age_lbl 074 `"74"', add
label define age_lbl 075 `"75"', add
label define age_lbl 076 `"76"', add
label define age_lbl 077 `"77"', add
label define age_lbl 078 `"78"', add
label define age_lbl 079 `"79"', add
label define age_lbl 080 `"80"', add
label define age_lbl 081 `"81"', add
label define age_lbl 082 `"82"', add
label define age_lbl 083 `"83"', add
label define age_lbl 084 `"84"', add
label define age_lbl 085 `"85"', add
label define age_lbl 086 `"86"', add
label define age_lbl 087 `"87"', add
label define age_lbl 088 `"88"', add
label define age_lbl 089 `"89"', add
label define age_lbl 090 `"90 (90+ in 1980 and 1990)"', add
label define age_lbl 091 `"91"', add
label define age_lbl 092 `"92"', add
label define age_lbl 093 `"93"', add
label define age_lbl 094 `"94"', add
label define age_lbl 095 `"95"', add
label define age_lbl 096 `"96"', add
label define age_lbl 097 `"97"', add
label define age_lbl 098 `"98"', add
label define age_lbl 099 `"99"', add
label define age_lbl 100 `"100 (100+ in 1960-1970)"', add
label define age_lbl 101 `"101"', add
label define age_lbl 102 `"102"', add
label define age_lbl 103 `"103"', add
label define age_lbl 104 `"104"', add
label define age_lbl 105 `"105"', add
label define age_lbl 106 `"106"', add
label define age_lbl 107 `"107"', add
label define age_lbl 108 `"108"', add
label define age_lbl 109 `"109"', add
label define age_lbl 110 `"110"', add
label define age_lbl 111 `"111"', add
label define age_lbl 112 `"112 (112+ in the 1980 internal data)"', add
label define age_lbl 113 `"113"', add
label define age_lbl 114 `"114"', add
label define age_lbl 115 `"115 (115+ in the 1990 internal data)"', add
label define age_lbl 116 `"116"', add
label define age_lbl 117 `"117"', add
label define age_lbl 118 `"118"', add
label define age_lbl 119 `"119"', add
label define age_lbl 120 `"120"', add
label define age_lbl 121 `"121"', add
label define age_lbl 122 `"122"', add
label define age_lbl 123 `"123"', add
label define age_lbl 124 `"124"', add
label define age_lbl 125 `"125"', add
label define age_lbl 126 `"126"', add
label define age_lbl 129 `"129"', add
label define age_lbl 130 `"130"', add
label define age_lbl 135 `"135"', add
label values age age_lbl

label define race_lbl 1 `"White"'
label define race_lbl 2 `"Black/African American"', add
label define race_lbl 3 `"American Indian or Alaska Native"', add
label define race_lbl 4 `"Chinese"', add
label define race_lbl 5 `"Japanese"', add
label define race_lbl 6 `"Other Asian or Pacific Islander"', add
label define race_lbl 7 `"Other race, nec"', add
label define race_lbl 8 `"Two major races"', add
label define race_lbl 9 `"Three or more major races"', add
label values race race_lbl

label define raced_lbl 100 `"White"'
label define raced_lbl 110 `"Spanish write_in"', add
label define raced_lbl 120 `"Blank (white) (1850)"', add
label define raced_lbl 130 `"Portuguese"', add
label define raced_lbl 140 `"Mexican (1930)"', add
label define raced_lbl 150 `"Puerto Rican (1910 Hawaii)"', add
label define raced_lbl 200 `"Black/African American"', add
label define raced_lbl 210 `"Mulatto"', add
label define raced_lbl 300 `"American Indian/Alaska Native"', add
label define raced_lbl 302 `"Apache"', add
label define raced_lbl 303 `"Blackfoot"', add
label define raced_lbl 304 `"Cherokee"', add
label define raced_lbl 305 `"Cheyenne"', add
label define raced_lbl 306 `"Chickasaw"', add
label define raced_lbl 307 `"Chippewa"', add
label define raced_lbl 308 `"Choctaw"', add
label define raced_lbl 309 `"Comanche"', add
label define raced_lbl 310 `"Creek"', add
label define raced_lbl 311 `"Crow"', add
label define raced_lbl 312 `"Iroquois"', add
label define raced_lbl 313 `"Kiowa"', add
label define raced_lbl 314 `"Lumbee"', add
label define raced_lbl 315 `"Navajo"', add
label define raced_lbl 316 `"Osage"', add
label define raced_lbl 317 `"Paiute"', add
label define raced_lbl 318 `"Pima"', add
label define raced_lbl 319 `"Potawatomi"', add
label define raced_lbl 320 `"Pueblo"', add
label define raced_lbl 321 `"Seminole"', add
label define raced_lbl 322 `"Shoshone"', add
label define raced_lbl 323 `"Sioux"', add
label define raced_lbl 324 `"Tlingit (Tlingit_Haida, 2000/ACS)"', add
label define raced_lbl 325 `"Tohono O Odham"', add
label define raced_lbl 326 `"All other tribes (1990)"', add
label define raced_lbl 328 `"Hopi"', add
label define raced_lbl 329 `"Central American Indian"', add
label define raced_lbl 330 `"Spanish American Indian"', add
label define raced_lbl 350 `"Delaware"', add
label define raced_lbl 351 `"Latin American Indian"', add
label define raced_lbl 352 `"Puget Sound Salish"', add
label define raced_lbl 353 `"Yakama"', add
label define raced_lbl 354 `"Yaqui"', add
label define raced_lbl 355 `"Colville"', add
label define raced_lbl 356 `"Houma"', add
label define raced_lbl 357 `"Menominee"', add
label define raced_lbl 358 `"Yuman"', add
label define raced_lbl 359 `"South American Indian"', add
label define raced_lbl 360 `"Mexican American Indian"', add
label define raced_lbl 361 `"Other Amer. Indian tribe (2000,ACS)"', add
label define raced_lbl 362 `"2+ Amer. Indian tribes (2000,ACS)"', add
label define raced_lbl 370 `"Alaskan Athabaskan"', add
label define raced_lbl 371 `"Aleut"', add
label define raced_lbl 372 `"Eskimo"', add
label define raced_lbl 373 `"Alaskan mixed"', add
label define raced_lbl 374 `"Inupiat"', add
label define raced_lbl 375 `"Yup'ik"', add
label define raced_lbl 379 `"Other Alaska Native tribe(s) (2000,ACS)"', add
label define raced_lbl 398 `"Both Am. Ind. and Alaska Native (2000,ACS)"', add
label define raced_lbl 399 `"Tribe not specified"', add
label define raced_lbl 400 `"Chinese"', add
label define raced_lbl 410 `"Taiwanese"', add
label define raced_lbl 420 `"Chinese and Taiwanese"', add
label define raced_lbl 500 `"Japanese"', add
label define raced_lbl 600 `"Filipino"', add
label define raced_lbl 610 `"Asian Indian (Hindu 1920_1940)"', add
label define raced_lbl 620 `"Korean"', add
label define raced_lbl 630 `"Hawaiian"', add
label define raced_lbl 631 `"Hawaiian and Asian (1900,1920)"', add
label define raced_lbl 632 `"Hawaiian and European (1900,1920)"', add
label define raced_lbl 634 `"Hawaiian mixed"', add
label define raced_lbl 640 `"Vietnamese"', add
label define raced_lbl 641 `"Bhutanese"', add
label define raced_lbl 642 `"Mongolian"', add
label define raced_lbl 643 `"Nepalese"', add
label define raced_lbl 650 `"Other Asian or Pacific Islander (1920,1980)"', add
label define raced_lbl 651 `"Asian only (CPS)"', add
label define raced_lbl 652 `"Pacific Islander only (CPS)"', add
label define raced_lbl 653 `"Asian or Pacific Islander, n.s. (1990 Internal Census files)"', add
label define raced_lbl 660 `"Cambodian"', add
label define raced_lbl 661 `"Hmong"', add
label define raced_lbl 662 `"Laotian"', add
label define raced_lbl 663 `"Thai"', add
label define raced_lbl 664 `"Bangladeshi"', add
label define raced_lbl 665 `"Burmese"', add
label define raced_lbl 666 `"Indonesian"', add
label define raced_lbl 667 `"Malaysian"', add
label define raced_lbl 668 `"Okinawan"', add
label define raced_lbl 669 `"Pakistani"', add
label define raced_lbl 670 `"Sri Lankan"', add
label define raced_lbl 671 `"Other Asian, n.e.c."', add
label define raced_lbl 672 `"Asian, not specified"', add
label define raced_lbl 673 `"Chinese and Japanese"', add
label define raced_lbl 674 `"Chinese and Filipino"', add
label define raced_lbl 675 `"Chinese and Vietnamese"', add
label define raced_lbl 676 `"Chinese and Asian write_in"', add
label define raced_lbl 677 `"Japanese and Filipino"', add
label define raced_lbl 678 `"Asian Indian and Asian write_in"', add
label define raced_lbl 679 `"Other Asian race combinations"', add
label define raced_lbl 680 `"Samoan"', add
label define raced_lbl 681 `"Tahitian"', add
label define raced_lbl 682 `"Tongan"', add
label define raced_lbl 683 `"Other Polynesian (1990)"', add
label define raced_lbl 684 `"1+ other Polynesian races (2000,ACS)"', add
label define raced_lbl 685 `"Chamorro"', add
label define raced_lbl 686 `"Northern Mariana Islander"', add
label define raced_lbl 687 `"Palauan"', add
label define raced_lbl 688 `"Other Micronesian (1990)"', add
label define raced_lbl 689 `"1+ other Micronesian races (2000,ACS)"', add
label define raced_lbl 690 `"Fijian"', add
label define raced_lbl 691 `"Other Melanesian (1990)"', add
label define raced_lbl 692 `"1+ other Melanesian races (2000,ACS)"', add
label define raced_lbl 698 `"2+ PI races from 2+ PI regions"', add
label define raced_lbl 699 `"Pacific Islander, n.s."', add
label define raced_lbl 700 `"Other race, n.e.c."', add
label define raced_lbl 801 `"White and Black"', add
label define raced_lbl 802 `"White and AIAN"', add
label define raced_lbl 810 `"White and Asian"', add
label define raced_lbl 811 `"White and Chinese"', add
label define raced_lbl 812 `"White and Japanese"', add
label define raced_lbl 813 `"White and Filipino"', add
label define raced_lbl 814 `"White and Asian Indian"', add
label define raced_lbl 815 `"White and Korean"', add
label define raced_lbl 816 `"White and Vietnamese"', add
label define raced_lbl 817 `"White and Asian write_in"', add
label define raced_lbl 818 `"White and other Asian race(s)"', add
label define raced_lbl 819 `"White and two or more Asian groups"', add
label define raced_lbl 820 `"White and PI"', add
label define raced_lbl 821 `"White and Native Hawaiian"', add
label define raced_lbl 822 `"White and Samoan"', add
label define raced_lbl 823 `"White and Chamorro"', add
label define raced_lbl 824 `"White and PI write_in"', add
label define raced_lbl 825 `"White and other PI race(s)"', add
label define raced_lbl 826 `"White and other race write_in"', add
label define raced_lbl 827 `"White and other race, n.e.c."', add
label define raced_lbl 830 `"Black and AIAN"', add
label define raced_lbl 831 `"Black and Asian"', add
label define raced_lbl 832 `"Black and Chinese"', add
label define raced_lbl 833 `"Black and Japanese"', add
label define raced_lbl 834 `"Black and Filipino"', add
label define raced_lbl 835 `"Black and Asian Indian"', add
label define raced_lbl 836 `"Black and Korean"', add
label define raced_lbl 837 `"Black and Asian write_in"', add
label define raced_lbl 838 `"Black and other Asian race(s)"', add
label define raced_lbl 840 `"Black and PI"', add
label define raced_lbl 841 `"Black and PI write_in"', add
label define raced_lbl 842 `"Black and other PI race(s)"', add
label define raced_lbl 845 `"Black and other race write_in"', add
label define raced_lbl 850 `"AIAN and Asian"', add
label define raced_lbl 851 `"AIAN and Filipino (2000 1%)"', add
label define raced_lbl 852 `"AIAN and Asian Indian"', add
label define raced_lbl 853 `"AIAN and Asian write_in (2000 1%)"', add
label define raced_lbl 854 `"AIAN and other Asian race(s)"', add
label define raced_lbl 855 `"AIAN and PI"', add
label define raced_lbl 856 `"AIAN and other race write_in"', add
label define raced_lbl 860 `"Asian and PI"', add
label define raced_lbl 861 `"Chinese and Hawaiian"', add
label define raced_lbl 862 `"Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 863 `"Japanese and Hawaiian (2000 1%)"', add
label define raced_lbl 864 `"Filipino and Hawaiian"', add
label define raced_lbl 865 `"Filipino and PI write_in"', add
label define raced_lbl 866 `"Asian Indian and PI write_in (2000 1%)"', add
label define raced_lbl 867 `"Asian write_in and PI write_in"', add
label define raced_lbl 868 `"Other Asian race(s) and PI race(s)"', add
label define raced_lbl 869 `"Japanese and Korean (ACS)"', add
label define raced_lbl 880 `"Asian and other race write_in"', add
label define raced_lbl 881 `"Chinese and other race write_in"', add
label define raced_lbl 882 `"Japanese and other race write_in"', add
label define raced_lbl 883 `"Filipino and other race write_in"', add
label define raced_lbl 884 `"Asian Indian and other race write_in"', add
label define raced_lbl 885 `"Asian write_in and other race write_in"', add
label define raced_lbl 886 `"Other Asian race(s) and other race write_in"', add
label define raced_lbl 887 `"Chinese and Korean"', add
label define raced_lbl 890 `"PI and other race write_in:"', add
label define raced_lbl 891 `"PI write_in and other race write_in"', add
label define raced_lbl 892 `"Other PI race(s) and other race write_in"', add
label define raced_lbl 893 `"Native Hawaiian or PI other race(s)"', add
label define raced_lbl 899 `"API and other race write_in"', add
label define raced_lbl 901 `"White, Black, AIAN"', add
label define raced_lbl 902 `"White, Black, Asian"', add
label define raced_lbl 903 `"White, Black, PI"', add
label define raced_lbl 904 `"White, Black, other race write_in"', add
label define raced_lbl 905 `"White, AIAN, Asian"', add
label define raced_lbl 906 `"White, AIAN, PI"', add
label define raced_lbl 907 `"White, AIAN, other race write_in"', add
label define raced_lbl 910 `"White, Asian, PI"', add
label define raced_lbl 911 `"White, Chinese, Hawaiian"', add
label define raced_lbl 912 `"White, Chinese, Filipino, Hawaiian (2000 1%)"', add
label define raced_lbl 913 `"White, Japanese, Hawaiian (2000 1%)"', add
label define raced_lbl 914 `"White, Filipino, Hawaiian"', add
label define raced_lbl 915 `"Other White, Asian race(s), PI race(s)"', add
label define raced_lbl 916 `"White, AIAN and Filipino"', add
label define raced_lbl 917 `"White, Black, and Filipino"', add
label define raced_lbl 920 `"White, Asian, other race write_in"', add
label define raced_lbl 921 `"White, Filipino, other race write_in (2000 1%)"', add
label define raced_lbl 922 `"White, Asian write_in, other race write_in (2000 1%)"', add
label define raced_lbl 923 `"Other White, Asian race(s), other race write_in (2000 1%)"', add
label define raced_lbl 925 `"White, PI, other race write_in"', add
label define raced_lbl 930 `"Black, AIAN, Asian"', add
label define raced_lbl 931 `"Black, AIAN, PI"', add
label define raced_lbl 932 `"Black, AIAN, other race write_in"', add
label define raced_lbl 933 `"Black, Asian, PI"', add
label define raced_lbl 934 `"Black, Asian, other race write_in"', add
label define raced_lbl 935 `"Black, PI, other race write_in"', add
label define raced_lbl 940 `"AIAN, Asian, PI"', add
label define raced_lbl 941 `"AIAN, Asian, other race write_in"', add
label define raced_lbl 942 `"AIAN, PI, other race write_in"', add
label define raced_lbl 943 `"Asian, PI, other race write_in"', add
label define raced_lbl 944 `"Asian (Chinese, Japanese, Korean, Vietnamese); and Native Hawaiian or PI; and Other"', add
label define raced_lbl 949 `"2 or 3 races (CPS)"', add
label define raced_lbl 950 `"White, Black, AIAN, Asian"', add
label define raced_lbl 951 `"White, Black, AIAN, PI"', add
label define raced_lbl 952 `"White, Black, AIAN, other race write_in"', add
label define raced_lbl 953 `"White, Black, Asian, PI"', add
label define raced_lbl 954 `"White, Black, Asian, other race write_in"', add
label define raced_lbl 955 `"White, Black, PI, other race write_in"', add
label define raced_lbl 960 `"White, AIAN, Asian, PI"', add
label define raced_lbl 961 `"White, AIAN, Asian, other race write_in"', add
label define raced_lbl 962 `"White, AIAN, PI, other race write_in"', add
label define raced_lbl 963 `"White, Asian, PI, other race write_in"', add
label define raced_lbl 964 `"White, Chinese, Japanese, Native Hawaiian"', add
label define raced_lbl 970 `"Black, AIAN, Asian, PI"', add
label define raced_lbl 971 `"Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 972 `"Black, AIAN, PI, other race write_in"', add
label define raced_lbl 973 `"Black, Asian, PI, other race write_in"', add
label define raced_lbl 974 `"AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 975 `"AIAN, Asian, PI, Hawaiian other race write_in"', add
label define raced_lbl 976 `"Two specified Asian  (Chinese and other Asian, Chinese and Japanese, Japanese and other Asian, Korean and other Asian); Native Hawaiian/PI; and Other Race"', add
label define raced_lbl 980 `"White, Black, AIAN, Asian, PI"', add
label define raced_lbl 981 `"White, Black, AIAN, Asian, other race write_in"', add
label define raced_lbl 982 `"White, Black, AIAN, PI, other race write_in"', add
label define raced_lbl 983 `"White, Black, Asian, PI, other race write_in"', add
label define raced_lbl 984 `"White, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 985 `"Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 986 `"Black, AIAN, Asian, PI, Hawaiian, other race write_in"', add
label define raced_lbl 989 `"4 or 5 races (CPS)"', add
label define raced_lbl 990 `"White, Black, AIAN, Asian, PI, other race write_in"', add
label define raced_lbl 991 `"White race; Some other race; Black or African American race and/or American Indian and Alaska Native race and/or Asian groups and/or Native Hawaiian and Other Pacific Islander groups"', add
label define raced_lbl 996 `"2+ races, n.e.c. (CPS)"', add
label values raced raced_lbl

label define racwht_lbl 1 `"No"'
label define racwht_lbl 2 `"Yes"', add
label values racwht racwht_lbl

label define hcovany_lbl 1 `"No health insurance coverage"'
label define hcovany_lbl 2 `"With health insurance coverage"', add
label values hcovany hcovany_lbl

label define hcovpriv_lbl 1 `"Without private health insurance coverage"'
label define hcovpriv_lbl 2 `"With private health insurance coverage"', add
label values hcovpriv hcovpriv_lbl

label define hcovpub_lbl 1 `"Without public health insurance coverage"'
label define hcovpub_lbl 2 `"With public health insurance coverage"', add
label values hcovpub hcovpub_lbl

label define school_lbl 0 `"N/A"'
label define school_lbl 1 `"No, not in school"', add
label define school_lbl 2 `"Yes, in school"', add
label define school_lbl 8 `"Unknown"', add
label define school_lbl 9 `"Missing"', add
label values school school_lbl

label define educ_lbl 00 `"N/A or no schooling"'
label define educ_lbl 01 `"Nursery school to grade 4"', add
label define educ_lbl 02 `"Grade 5, 6, 7, or 8"', add
label define educ_lbl 03 `"Grade 9"', add
label define educ_lbl 04 `"Grade 10"', add
label define educ_lbl 05 `"Grade 11"', add
label define educ_lbl 06 `"Grade 12"', add
label define educ_lbl 07 `"1 year of college"', add
label define educ_lbl 08 `"2 years of college"', add
label define educ_lbl 09 `"3 years of college"', add
label define educ_lbl 10 `"4 years of college"', add
label define educ_lbl 11 `"5+ years of college"', add
label values educ educ_lbl

label define educd_lbl 000 `"N/A or no schooling"'
label define educd_lbl 001 `"N/A"', add
label define educd_lbl 002 `"No schooling completed"', add
label define educd_lbl 010 `"Nursery school to grade 4"', add
label define educd_lbl 011 `"Nursery school, preschool"', add
label define educd_lbl 012 `"Kindergarten"', add
label define educd_lbl 013 `"Grade 1, 2, 3, or 4"', add
label define educd_lbl 014 `"Grade 1"', add
label define educd_lbl 015 `"Grade 2"', add
label define educd_lbl 016 `"Grade 3"', add
label define educd_lbl 017 `"Grade 4"', add
label define educd_lbl 020 `"Grade 5, 6, 7, or 8"', add
label define educd_lbl 021 `"Grade 5 or 6"', add
label define educd_lbl 022 `"Grade 5"', add
label define educd_lbl 023 `"Grade 6"', add
label define educd_lbl 024 `"Grade 7 or 8"', add
label define educd_lbl 025 `"Grade 7"', add
label define educd_lbl 026 `"Grade 8"', add
label define educd_lbl 030 `"Grade 9"', add
label define educd_lbl 040 `"Grade 10"', add
label define educd_lbl 050 `"Grade 11"', add
label define educd_lbl 060 `"Grade 12"', add
label define educd_lbl 061 `"12th grade, no diploma"', add
label define educd_lbl 062 `"High school graduate or GED"', add
label define educd_lbl 063 `"Regular high school diploma"', add
label define educd_lbl 064 `"GED or alternative credential"', add
label define educd_lbl 065 `"Some college, but less than 1 year"', add
label define educd_lbl 070 `"1 year of college"', add
label define educd_lbl 071 `"1 or more years of college credit, no degree"', add
label define educd_lbl 080 `"2 years of college"', add
label define educd_lbl 081 `"Associate's degree, type not specified"', add
label define educd_lbl 082 `"Associate's degree, occupational program"', add
label define educd_lbl 083 `"Associate's degree, academic program"', add
label define educd_lbl 090 `"3 years of college"', add
label define educd_lbl 100 `"4 years of college"', add
label define educd_lbl 101 `"Bachelor's degree"', add
label define educd_lbl 110 `"5+ years of college"', add
label define educd_lbl 111 `"6 years of college (6+ in 1960-1970)"', add
label define educd_lbl 112 `"7 years of college"', add
label define educd_lbl 113 `"8+ years of college"', add
label define educd_lbl 114 `"Master's degree"', add
label define educd_lbl 115 `"Professional degree beyond a bachelor's degree"', add
label define educd_lbl 116 `"Doctoral degree"', add
label define educd_lbl 999 `"Missing"', add
label values educd educd_lbl

label define empstat_lbl 0 `"N/A"'
label define empstat_lbl 1 `"Employed"', add
label define empstat_lbl 2 `"Unemployed"', add
label define empstat_lbl 3 `"Not in labor force"', add
label values empstat empstat_lbl

label define empstatd_lbl 00 `"N/A"'
label define empstatd_lbl 10 `"At work"', add
label define empstatd_lbl 11 `"At work, public emerg"', add
label define empstatd_lbl 12 `"Has job, not working"', add
label define empstatd_lbl 13 `"Armed forces"', add
label define empstatd_lbl 14 `"Armed forces--at work"', add
label define empstatd_lbl 15 `"Armed forces--not at work but with job"', add
label define empstatd_lbl 20 `"Unemployed"', add
label define empstatd_lbl 21 `"Unemp, exper worker"', add
label define empstatd_lbl 22 `"Unemp, new worker"', add
label define empstatd_lbl 30 `"Not in Labor Force"', add
label define empstatd_lbl 31 `"NILF, housework"', add
label define empstatd_lbl 32 `"NILF, unable to work"', add
label define empstatd_lbl 33 `"NILF, school"', add
label define empstatd_lbl 34 `"NILF, other"', add
label values empstatd empstatd_lbl

label define incwage_lbl 999998 `"Missing"'
label define incwage_lbl 999999 `"N/A"', add
label define incwage_lbl 010000 `"010000"', add
label define incwage_lbl 000000 `"000000"', add
label values incwage incwage_lbl

label define incwelfr_lbl 99999 `"NIU"'
label define incwelfr_lbl 99998 `"99998"', add
label define incwelfr_lbl 00000 `"00000"', add
label values incwelfr incwelfr_lbl

label define hwsei_lbl 0713 `"0713"'
label define hwsei_lbl 0956 `"0956"', add
label define hwsei_lbl 1051 `"1051"', add
label define hwsei_lbl 1267 `"1267"', add
label define hwsei_lbl 1303 `"1303"', add
label define hwsei_lbl 1338 `"1338"', add
label define hwsei_lbl 1388 `"1388"', add
label define hwsei_lbl 1402 `"1402"', add
label define hwsei_lbl 1492 `"1492"', add
label define hwsei_lbl 1554 `"1554"', add
label define hwsei_lbl 1559 `"1559"', add
label define hwsei_lbl 1575 `"1575"', add
label define hwsei_lbl 1578 `"1578"', add
label define hwsei_lbl 1613 `"1613"', add
label define hwsei_lbl 1629 `"1629"', add
label define hwsei_lbl 1685 `"1685"', add
label define hwsei_lbl 1725 `"1725"', add
label define hwsei_lbl 1738 `"1738"', add
label define hwsei_lbl 1779 `"1779"', add
label define hwsei_lbl 1782 `"1782"', add
label define hwsei_lbl 1802 `"1802"', add
label define hwsei_lbl 1829 `"1829"', add
label define hwsei_lbl 1832 `"1832"', add
label define hwsei_lbl 1874 `"1874"', add
label define hwsei_lbl 1884 `"1884"', add
label define hwsei_lbl 1900 `"1900"', add
label define hwsei_lbl 1917 `"1917"', add
label define hwsei_lbl 1930 `"1930"', add
label define hwsei_lbl 1941 `"1941"', add
label define hwsei_lbl 1956 `"1956"', add
label define hwsei_lbl 1958 `"1958"', add
label define hwsei_lbl 1970 `"1970"', add
label define hwsei_lbl 1972 `"1972"', add
label define hwsei_lbl 2000 `"2000"', add
label define hwsei_lbl 2003 `"2003"', add
label define hwsei_lbl 2020 `"2020"', add
label define hwsei_lbl 2030 `"2030"', add
label define hwsei_lbl 2057 `"2057"', add
label define hwsei_lbl 2094 `"2094"', add
label define hwsei_lbl 2103 `"2103"', add
label define hwsei_lbl 2106 `"2106"', add
label define hwsei_lbl 2130 `"2130"', add
label define hwsei_lbl 2140 `"2140"', add
label define hwsei_lbl 2141 `"2141"', add
label define hwsei_lbl 2146 `"2146"', add
label define hwsei_lbl 2152 `"2152"', add
label define hwsei_lbl 2176 `"2176"', add
label define hwsei_lbl 2188 `"2188"', add
label define hwsei_lbl 2190 `"2190"', add
label define hwsei_lbl 2199 `"2199"', add
label define hwsei_lbl 2210 `"2210"', add
label define hwsei_lbl 2224 `"2224"', add
label define hwsei_lbl 2244 `"2244"', add
label define hwsei_lbl 2254 `"2254"', add
label define hwsei_lbl 2261 `"2261"', add
label define hwsei_lbl 2265 `"2265"', add
label define hwsei_lbl 2290 `"2290"', add
label define hwsei_lbl 2298 `"2298"', add
label define hwsei_lbl 2302 `"2302"', add
label define hwsei_lbl 2305 `"2305"', add
label define hwsei_lbl 2341 `"2341"', add
label define hwsei_lbl 2348 `"2348"', add
label define hwsei_lbl 2352 `"2352"', add
label define hwsei_lbl 2354 `"2354"', add
label define hwsei_lbl 2363 `"2363"', add
label define hwsei_lbl 2365 `"2365"', add
label define hwsei_lbl 2370 `"2370"', add
label define hwsei_lbl 2398 `"2398"', add
label define hwsei_lbl 2408 `"2408"', add
label define hwsei_lbl 2411 `"2411"', add
label define hwsei_lbl 2419 `"2419"', add
label define hwsei_lbl 2426 `"2426"', add
label define hwsei_lbl 2429 `"2429"', add
label define hwsei_lbl 2439 `"2439"', add
label define hwsei_lbl 2448 `"2448"', add
label define hwsei_lbl 2460 `"2460"', add
label define hwsei_lbl 2479 `"2479"', add
label define hwsei_lbl 2486 `"2486"', add
label define hwsei_lbl 2487 `"2487"', add
label define hwsei_lbl 2488 `"2488"', add
label define hwsei_lbl 2495 `"2495"', add
label define hwsei_lbl 2515 `"2515"', add
label define hwsei_lbl 2518 `"2518"', add
label define hwsei_lbl 2519 `"2519"', add
label define hwsei_lbl 2525 `"2525"', add
label define hwsei_lbl 2545 `"2545"', add
label define hwsei_lbl 2546 `"2546"', add
label define hwsei_lbl 2553 `"2553"', add
label define hwsei_lbl 2556 `"2556"', add
label define hwsei_lbl 2560 `"2560"', add
label define hwsei_lbl 2580 `"2580"', add
label define hwsei_lbl 2583 `"2583"', add
label define hwsei_lbl 2602 `"2602"', add
label define hwsei_lbl 2609 `"2609"', add
label define hwsei_lbl 2610 `"2610"', add
label define hwsei_lbl 2616 `"2616"', add
label define hwsei_lbl 2619 `"2619"', add
label define hwsei_lbl 2624 `"2624"', add
label define hwsei_lbl 2628 `"2628"', add
label define hwsei_lbl 2629 `"2629"', add
label define hwsei_lbl 2630 `"2630"', add
label define hwsei_lbl 2631 `"2631"', add
label define hwsei_lbl 2639 `"2639"', add
label define hwsei_lbl 2662 `"2662"', add
label define hwsei_lbl 2668 `"2668"', add
label define hwsei_lbl 2682 `"2682"', add
label define hwsei_lbl 2694 `"2694"', add
label define hwsei_lbl 2707 `"2707"', add
label define hwsei_lbl 2708 `"2708"', add
label define hwsei_lbl 2709 `"2709"', add
label define hwsei_lbl 2712 `"2712"', add
label define hwsei_lbl 2716 `"2716"', add
label define hwsei_lbl 2722 `"2722"', add
label define hwsei_lbl 2728 `"2728"', add
label define hwsei_lbl 2729 `"2729"', add
label define hwsei_lbl 2731 `"2731"', add
label define hwsei_lbl 2737 `"2737"', add
label define hwsei_lbl 2758 `"2758"', add
label define hwsei_lbl 2760 `"2760"', add
label define hwsei_lbl 2767 `"2767"', add
label define hwsei_lbl 2784 `"2784"', add
label define hwsei_lbl 2800 `"2800"', add
label define hwsei_lbl 2812 `"2812"', add
label define hwsei_lbl 2823 `"2823"', add
label define hwsei_lbl 2830 `"2830"', add
label define hwsei_lbl 2843 `"2843"', add
label define hwsei_lbl 2849 `"2849"', add
label define hwsei_lbl 2852 `"2852"', add
label define hwsei_lbl 2865 `"2865"', add
label define hwsei_lbl 2877 `"2877"', add
label define hwsei_lbl 2882 `"2882"', add
label define hwsei_lbl 2887 `"2887"', add
label define hwsei_lbl 2888 `"2888"', add
label define hwsei_lbl 2909 `"2909"', add
label define hwsei_lbl 2913 `"2913"', add
label define hwsei_lbl 2919 `"2919"', add
label define hwsei_lbl 2924 `"2924"', add
label define hwsei_lbl 2928 `"2928"', add
label define hwsei_lbl 2930 `"2930"', add
label define hwsei_lbl 2931 `"2931"', add
label define hwsei_lbl 2968 `"2968"', add
label define hwsei_lbl 2971 `"2971"', add
label define hwsei_lbl 2975 `"2975"', add
label define hwsei_lbl 2981 `"2981"', add
label define hwsei_lbl 3027 `"3027"', add
label define hwsei_lbl 3030 `"3030"', add
label define hwsei_lbl 3035 `"3035"', add
label define hwsei_lbl 3057 `"3057"', add
label define hwsei_lbl 3058 `"3058"', add
label define hwsei_lbl 3061 `"3061"', add
label define hwsei_lbl 3068 `"3068"', add
label define hwsei_lbl 3085 `"3085"', add
label define hwsei_lbl 3106 `"3106"', add
label define hwsei_lbl 3118 `"3118"', add
label define hwsei_lbl 3123 `"3123"', add
label define hwsei_lbl 3127 `"3127"', add
label define hwsei_lbl 3130 `"3130"', add
label define hwsei_lbl 3133 `"3133"', add
label define hwsei_lbl 3136 `"3136"', add
label define hwsei_lbl 3147 `"3147"', add
label define hwsei_lbl 3149 `"3149"', add
label define hwsei_lbl 3162 `"3162"', add
label define hwsei_lbl 3174 `"3174"', add
label define hwsei_lbl 3175 `"3175"', add
label define hwsei_lbl 3176 `"3176"', add
label define hwsei_lbl 3184 `"3184"', add
label define hwsei_lbl 3185 `"3185"', add
label define hwsei_lbl 3186 `"3186"', add
label define hwsei_lbl 3211 `"3211"', add
label define hwsei_lbl 3212 `"3212"', add
label define hwsei_lbl 3247 `"3247"', add
label define hwsei_lbl 3250 `"3250"', add
label define hwsei_lbl 3277 `"3277"', add
label define hwsei_lbl 3282 `"3282"', add
label define hwsei_lbl 3301 `"3301"', add
label define hwsei_lbl 3302 `"3302"', add
label define hwsei_lbl 3307 `"3307"', add
label define hwsei_lbl 3313 `"3313"', add
label define hwsei_lbl 3318 `"3318"', add
label define hwsei_lbl 3339 `"3339"', add
label define hwsei_lbl 3348 `"3348"', add
label define hwsei_lbl 3368 `"3368"', add
label define hwsei_lbl 3380 `"3380"', add
label define hwsei_lbl 3382 `"3382"', add
label define hwsei_lbl 3398 `"3398"', add
label define hwsei_lbl 3399 `"3399"', add
label define hwsei_lbl 3439 `"3439"', add
label define hwsei_lbl 3444 `"3444"', add
label define hwsei_lbl 3457 `"3457"', add
label define hwsei_lbl 3460 `"3460"', add
label define hwsei_lbl 3491 `"3491"', add
label define hwsei_lbl 3496 `"3496"', add
label define hwsei_lbl 3506 `"3506"', add
label define hwsei_lbl 3565 `"3565"', add
label define hwsei_lbl 3578 `"3578"', add
label define hwsei_lbl 3603 `"3603"', add
label define hwsei_lbl 3609 `"3609"', add
label define hwsei_lbl 3619 `"3619"', add
label define hwsei_lbl 3631 `"3631"', add
label define hwsei_lbl 3670 `"3670"', add
label define hwsei_lbl 3672 `"3672"', add
label define hwsei_lbl 3674 `"3674"', add
label define hwsei_lbl 3679 `"3679"', add
label define hwsei_lbl 3693 `"3693"', add
label define hwsei_lbl 3713 `"3713"', add
label define hwsei_lbl 3731 `"3731"', add
label define hwsei_lbl 3732 `"3732"', add
label define hwsei_lbl 3775 `"3775"', add
label define hwsei_lbl 3792 `"3792"', add
label define hwsei_lbl 3797 `"3797"', add
label define hwsei_lbl 3807 `"3807"', add
label define hwsei_lbl 3814 `"3814"', add
label define hwsei_lbl 3827 `"3827"', add
label define hwsei_lbl 3838 `"3838"', add
label define hwsei_lbl 3840 `"3840"', add
label define hwsei_lbl 3851 `"3851"', add
label define hwsei_lbl 3869 `"3869"', add
label define hwsei_lbl 3870 `"3870"', add
label define hwsei_lbl 3896 `"3896"', add
label define hwsei_lbl 3900 `"3900"', add
label define hwsei_lbl 3965 `"3965"', add
label define hwsei_lbl 3980 `"3980"', add
label define hwsei_lbl 4029 `"4029"', add
label define hwsei_lbl 4031 `"4031"', add
label define hwsei_lbl 4040 `"4040"', add
label define hwsei_lbl 4061 `"4061"', add
label define hwsei_lbl 4083 `"4083"', add
label define hwsei_lbl 4091 `"4091"', add
label define hwsei_lbl 4097 `"4097"', add
label define hwsei_lbl 4122 `"4122"', add
label define hwsei_lbl 4157 `"4157"', add
label define hwsei_lbl 4168 `"4168"', add
label define hwsei_lbl 4182 `"4182"', add
label define hwsei_lbl 4189 `"4189"', add
label define hwsei_lbl 4208 `"4208"', add
label define hwsei_lbl 4250 `"4250"', add
label define hwsei_lbl 4260 `"4260"', add
label define hwsei_lbl 4261 `"4261"', add
label define hwsei_lbl 4269 `"4269"', add
label define hwsei_lbl 4304 `"4304"', add
label define hwsei_lbl 4312 `"4312"', add
label define hwsei_lbl 4326 `"4326"', add
label define hwsei_lbl 4335 `"4335"', add
label define hwsei_lbl 4351 `"4351"', add
label define hwsei_lbl 4357 `"4357"', add
label define hwsei_lbl 4406 `"4406"', add
label define hwsei_lbl 4413 `"4413"', add
label define hwsei_lbl 4439 `"4439"', add
label define hwsei_lbl 4440 `"4440"', add
label define hwsei_lbl 4445 `"4445"', add
label define hwsei_lbl 4479 `"4479"', add
label define hwsei_lbl 4520 `"4520"', add
label define hwsei_lbl 4545 `"4545"', add
label define hwsei_lbl 4583 `"4583"', add
label define hwsei_lbl 4607 `"4607"', add
label define hwsei_lbl 4626 `"4626"', add
label define hwsei_lbl 4633 `"4633"', add
label define hwsei_lbl 4645 `"4645"', add
label define hwsei_lbl 4648 `"4648"', add
label define hwsei_lbl 4667 `"4667"', add
label define hwsei_lbl 4671 `"4671"', add
label define hwsei_lbl 4684 `"4684"', add
label define hwsei_lbl 4704 `"4704"', add
label define hwsei_lbl 4723 `"4723"', add
label define hwsei_lbl 4730 `"4730"', add
label define hwsei_lbl 4743 `"4743"', add
label define hwsei_lbl 4745 `"4745"', add
label define hwsei_lbl 4763 `"4763"', add
label define hwsei_lbl 4780 `"4780"', add
label define hwsei_lbl 4786 `"4786"', add
label define hwsei_lbl 4788 `"4788"', add
label define hwsei_lbl 4790 `"4790"', add
label define hwsei_lbl 4834 `"4834"', add
label define hwsei_lbl 4846 `"4846"', add
label define hwsei_lbl 4865 `"4865"', add
label define hwsei_lbl 4868 `"4868"', add
label define hwsei_lbl 4878 `"4878"', add
label define hwsei_lbl 4909 `"4909"', add
label define hwsei_lbl 4930 `"4930"', add
label define hwsei_lbl 4942 `"4942"', add
label define hwsei_lbl 4952 `"4952"', add
label define hwsei_lbl 5001 `"5001"', add
label define hwsei_lbl 5017 `"5017"', add
label define hwsei_lbl 5046 `"5046"', add
label define hwsei_lbl 5086 `"5086"', add
label define hwsei_lbl 5122 `"5122"', add
label define hwsei_lbl 5360 `"5360"', add
label define hwsei_lbl 5379 `"5379"', add
label define hwsei_lbl 5425 `"5425"', add
label define hwsei_lbl 5451 `"5451"', add
label define hwsei_lbl 5456 `"5456"', add
label define hwsei_lbl 5479 `"5479"', add
label define hwsei_lbl 5492 `"5492"', add
label define hwsei_lbl 5529 `"5529"', add
label define hwsei_lbl 5592 `"5592"', add
label define hwsei_lbl 5644 `"5644"', add
label define hwsei_lbl 5649 `"5649"', add
label define hwsei_lbl 5686 `"5686"', add
label define hwsei_lbl 5726 `"5726"', add
label define hwsei_lbl 5727 `"5727"', add
label define hwsei_lbl 5750 `"5750"', add
label define hwsei_lbl 5825 `"5825"', add
label define hwsei_lbl 5826 `"5826"', add
label define hwsei_lbl 5854 `"5854"', add
label define hwsei_lbl 5912 `"5912"', add
label define hwsei_lbl 5983 `"5983"', add
label define hwsei_lbl 6008 `"6008"', add
label define hwsei_lbl 6056 `"6056"', add
label define hwsei_lbl 6107 `"6107"', add
label define hwsei_lbl 6120 `"6120"', add
label define hwsei_lbl 6180 `"6180"', add
label define hwsei_lbl 6199 `"6199"', add
label define hwsei_lbl 6225 `"6225"', add
label define hwsei_lbl 6242 `"6242"', add
label define hwsei_lbl 6245 `"6245"', add
label define hwsei_lbl 6252 `"6252"', add
label define hwsei_lbl 6271 `"6271"', add
label define hwsei_lbl 6381 `"6381"', add
label define hwsei_lbl 6409 `"6409"', add
label define hwsei_lbl 6427 `"6427"', add
label define hwsei_lbl 6456 `"6456"', add
label define hwsei_lbl 6497 `"6497"', add
label define hwsei_lbl 6506 `"6506"', add
label define hwsei_lbl 6575 `"6575"', add
label define hwsei_lbl 6622 `"6622"', add
label define hwsei_lbl 6653 `"6653"', add
label define hwsei_lbl 6655 `"6655"', add
label define hwsei_lbl 6692 `"6692"', add
label define hwsei_lbl 6712 `"6712"', add
label define hwsei_lbl 6752 `"6752"', add
label define hwsei_lbl 6834 `"6834"', add
label define hwsei_lbl 6874 `"6874"', add
label define hwsei_lbl 6877 `"6877"', add
label define hwsei_lbl 6939 `"6939"', add
label define hwsei_lbl 6948 `"6948"', add
label define hwsei_lbl 6992 `"6992"', add
label define hwsei_lbl 7046 `"7046"', add
label define hwsei_lbl 7066 `"7066"', add
label define hwsei_lbl 7086 `"7086"', add
label define hwsei_lbl 7148 `"7148"', add
label define hwsei_lbl 7180 `"7180"', add
label define hwsei_lbl 7323 `"7323"', add
label define hwsei_lbl 7440 `"7440"', add
label define hwsei_lbl 7494 `"7494"', add
label define hwsei_lbl 7550 `"7550"', add
label define hwsei_lbl 7558 `"7558"', add
label define hwsei_lbl 7679 `"7679"', add
label define hwsei_lbl 7708 `"7708"', add
label define hwsei_lbl 7744 `"7744"', add
label define hwsei_lbl 8026 `"8026"', add
label define hwsei_lbl 8053 `"8053"', add
label define hwsei_lbl 0000 `"N/A"', add
label values hwsei hwsei_lbl

label define diffrem_lbl 0 `"N/A"'
label define diffrem_lbl 1 `"No cognitive difficulty"', add
label define diffrem_lbl 2 `"Has cognitive difficulty"', add
label values diffrem diffrem_lbl

label define diffphys_lbl 0 `"N/A"'
label define diffphys_lbl 1 `"No ambulatory difficulty"', add
label define diffphys_lbl 2 `"Has ambulatory difficulty"', add
label values diffphys diffphys_lbl

label define vetstat_lbl 0 `"N/A"'
label define vetstat_lbl 1 `"Not a veteran"', add
label define vetstat_lbl 2 `"Veteran"', add
label define vetstat_lbl 9 `"Unknown"', add
label values vetstat vetstat_lbl

label define vetstatd_lbl 00 `"N/A"'
label define vetstatd_lbl 10 `"Not a veteran"', add
label define vetstatd_lbl 11 `"No military service"', add
label define vetstatd_lbl 12 `"Currently on active duty"', add
label define vetstatd_lbl 13 `"Training for Reserves or National Guard only"', add
label define vetstatd_lbl 20 `"Veteran"', add
label define vetstatd_lbl 21 `"Veteran, on active duty prior to past year"', add
label define vetstatd_lbl 22 `"Veteran, on active duty in past year"', add
label define vetstatd_lbl 23 `"Veteran, on active duty in Reserves or National Guard only"', add
label define vetstatd_lbl 99 `"Unknown"', add
label values vetstatd vetstatd_lbl

label define pwstate2_lbl 00 `"N/A"'
label define pwstate2_lbl 01 `"Alabama"', add
label define pwstate2_lbl 02 `"Alaska"', add
label define pwstate2_lbl 04 `"Arizona"', add
label define pwstate2_lbl 05 `"Arkansas"', add
label define pwstate2_lbl 06 `"California"', add
label define pwstate2_lbl 08 `"Colorado"', add
label define pwstate2_lbl 09 `"Connecticut"', add
label define pwstate2_lbl 10 `"Delaware"', add
label define pwstate2_lbl 11 `"District of Columbia"', add
label define pwstate2_lbl 12 `"Florida"', add
label define pwstate2_lbl 13 `"Georgia"', add
label define pwstate2_lbl 15 `"Hawaii"', add
label define pwstate2_lbl 16 `"Idaho"', add
label define pwstate2_lbl 17 `"Illinois"', add
label define pwstate2_lbl 18 `"Indiana"', add
label define pwstate2_lbl 19 `"Iowa"', add
label define pwstate2_lbl 20 `"Kansas"', add
label define pwstate2_lbl 21 `"Kentucky"', add
label define pwstate2_lbl 22 `"Louisiana"', add
label define pwstate2_lbl 23 `"Maine"', add
label define pwstate2_lbl 24 `"Maryland"', add
label define pwstate2_lbl 25 `"Massachusetts"', add
label define pwstate2_lbl 26 `"Michigan"', add
label define pwstate2_lbl 27 `"Minnesota"', add
label define pwstate2_lbl 28 `"Mississippi"', add
label define pwstate2_lbl 29 `"Missouri"', add
label define pwstate2_lbl 30 `"Montana"', add
label define pwstate2_lbl 31 `"Nebraska"', add
label define pwstate2_lbl 32 `"Nevada"', add
label define pwstate2_lbl 33 `"New Hampshire"', add
label define pwstate2_lbl 34 `"New Jersey"', add
label define pwstate2_lbl 35 `"New Mexico"', add
label define pwstate2_lbl 36 `"New York"', add
label define pwstate2_lbl 37 `"North Carolina"', add
label define pwstate2_lbl 38 `"North Dakota"', add
label define pwstate2_lbl 39 `"Ohio"', add
label define pwstate2_lbl 40 `"Oklahoma"', add
label define pwstate2_lbl 41 `"Oregon"', add
label define pwstate2_lbl 42 `"Pennsylvania"', add
label define pwstate2_lbl 44 `"Rhode Island"', add
label define pwstate2_lbl 45 `"South Carolina"', add
label define pwstate2_lbl 46 `"South Dakota"', add
label define pwstate2_lbl 47 `"Tennessee"', add
label define pwstate2_lbl 48 `"Texas"', add
label define pwstate2_lbl 49 `"Utah"', add
label define pwstate2_lbl 50 `"Vermont"', add
label define pwstate2_lbl 51 `"Virginia"', add
label define pwstate2_lbl 53 `"Washington"', add
label define pwstate2_lbl 54 `"West Virginia"', add
label define pwstate2_lbl 55 `"Wisconsin"', add
label define pwstate2_lbl 56 `"Wyoming"', add
label define pwstate2_lbl 61 `"Maine-New Hamp-Vermont"', add
label define pwstate2_lbl 62 `"Massachusetts-Rhode Island"', add
label define pwstate2_lbl 63 `"Minn-Iowa-Missouri-Kansas-S Dakota-N Dakota"', add
label define pwstate2_lbl 64 `"Mayrland-Delaware"', add
label define pwstate2_lbl 65 `"Montana-Idaho-Wyoming"', add
label define pwstate2_lbl 66 `"Utah-Nevada"', add
label define pwstate2_lbl 67 `"Arizona-New Mexico"', add
label define pwstate2_lbl 68 `"Alaska-Hawaii"', add
label define pwstate2_lbl 72 `"Puerto Rico"', add
label define pwstate2_lbl 73 `"U.S. outlying area"', add
label define pwstate2_lbl 74 `"United States (1980 Puerto Rico samples)"', add
label define pwstate2_lbl 80 `"Abroad"', add
label define pwstate2_lbl 81 `"Europe"', add
label define pwstate2_lbl 82 `"Eastern Asia"', add
label define pwstate2_lbl 83 `"South Central, South East, and Western Asia"', add
label define pwstate2_lbl 84 `"Mexico"', add
label define pwstate2_lbl 85 `"Other Americas"', add
label define pwstate2_lbl 86 `"Other, nec"', add
label define pwstate2_lbl 87 `"Iraq"', add
label define pwstate2_lbl 88 `"Canada"', add
label define pwstate2_lbl 90 `"Confidential"', add
label define pwstate2_lbl 99 `"Not reported"', add
label values pwstate2 pwstate2_lbl

label define gcrespon_lbl 0 `"N/A"'
label define gcrespon_lbl 1 `"No"', add
label define gcrespon_lbl 2 `"Yes"', add
label values gcrespon gcrespon_lbl

label define spmpov_lbl 0 `"Not in poverty"'
label define spmpov_lbl 1 `"In poverty"', add
label define spmpov_lbl 9 `"N/A"', add
label values spmpov spmpov_lbl

save 2019AVS.bv.data