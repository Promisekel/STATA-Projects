 cd "C:\Users\AG-Amuasi Bio\Desktop\FOLDER\PROJECT\masters\nicoline\dataset.dta"
/////SOCIO-DEMGRAPHIC X'TICS
ta Age 
recode Age(min/19=1 ">20years") (20/30=2 "20-30years") (31/40=3 "31-40year") (41/max=4 ">40years"),gen(agegrp)
ta agegrp

ta LevelofEducation,nol
encode LevelofEducation, gen(edu)
ta edu
recode edu (1=3 "JHS") (2=1 "no education") (3=2 "Primary") (4=4 "SHS") (5=5 "Tertiary"), gen(education)
ta education

ta Occupation
encode Occupation, gen(occup)
numlabel occup,add
ta occup
recode occup (101=1 "unemployed") (5  7 9 10 11 12 14 16 17 19 20 21 25 26 27 33 34 35 36 42 46 48 51  55 59 60 61 64 78 81 82 85 86 87 89 90 93 94 99 100 102 104 24=2 " self employed") (1 2 3 4 6 13 15 23 28 29 30 31 37 38 43 44 45 47 49 52 53 54 56 57 58 62 63 65 66 67 68 69 70 71 72 73 76 77 79 80 83 84 88 91 92 96 97 103 105 8 18=3  "government employed") (74 75 95=4  "student") (39 40 41 50 98 =5 "traders") (22 32=6 "farmers"), gen(occupation)
ta occupation

ta Placeofresidence
encode Placeofresidence,gen(resi)

asdoc tab1 agegrp education occupation Placeofresidence
su Age

//MATERNAL VAIABLES
des Gestationalweeks
destring Gestationalweeks,gen(Gestationalweeks2)
recode Gestationalweeks (min/12=1 "First Trimester: Week 1 to Week 12") (13/27 =2 "Second Trimester; Week 13 to Week 27") (28/max=3 "Third Trimester; Week 28 to Birth"),gen (gestation)
ta gestation

ta Parity
recode Parity (0=1 "none") (1/5=2 "1-5") (6/max=3 ">5"),gen(par2)
ta par2

recode Parity (0=1 "Nulliparous") (1=2 "Primiparous") (2/max=3 "Multiparous"),gen(par)
ta par

ta Gravida
recode Gravida (0=1 "Nulligravida") (1=2 "Primigravida") (2/max=3 "Multigravida"),gen(grav)
ta grav


//////DEPENDENT VARABLES
****UPTAKE
ta HepatitisBtestdone
encode HepatitisBtestdone, gen(hepbuptake)
ta hepbuptake
recode hepbuptake (1=0 "no") (2=1 "yes"), gen(hepbuptake2)
ta hepbuptake2

***PREVALENCE
ta HepatitisBtestresults
encode HepatitisBtestresults,gen (hepbresults)
replace hepbresults=2 if hepbresults==1
ta hepbresults
replace hepbresults=. if hepbresults==1
recode hepbresults (2=0 "negative") (3=1 "positive"), gen(hepbresults2)
ta hepbresults2


/////CHI-SQURE
***DEMOGRPHIC AND PREVALENCE
asdoc ta agegrp hepbresults , col chi
ta education hepbresults , col chi
ta occupation hepbresults , col chi
ta Placeofresidence hepbresults , col chi

***MATERNAL X'TICS AND PREVALENCE



/////LOGISTIC REGRESSION PREVALENCE
***DEMOGRAPHICS AND PREVALENCE
logistic hepbresults2 i.agegrp 
logistic hepbresults2 i.education 
logistic hepbresults2 i.occupation 
logistic hepbresults2 i.resi

stepwise, pr(.3): logistic hepbresults2 agegrp education occupation resi


***MATERNAL X'TICS AND PREVALENCE
ta par hepbresults, col chi
ta grav hepbresults, col chi
ta gestation hepbresults, col chi

logistic hepbresults2 i.par 
logistic hepbresults2 i.grav 
regress hepbresults2 i.gestation

stepwise, pr(.2): logistic hepbresults2 par grav gestation 

/////CHI-SQUARE UPTAKE
***DEMOGRPHIC AND UPTAKE
ta agegrp hepbuptake , col chi
ta education hepbuptake , col chi
ta occupation hepbuptake , col chi
ta Placeofresidence hepbuptake , col chi

***MATERNAL X'TICS AND UPTAKE
ta par hepbuptake2, col chi
ta grav hepbuptake2, col chi
ta gestation hepbuptake2, col chi

/////LOGISTIC REGRESSION PREVALENCE
***DEMOGRPHIC AND UPTAKE
logistic hepbuptake2 i.agegrp 
logistic hepbuptake2 i.education 
logistic hepbuptake2 i.occupation 
logistic hepbuptake2 i.resi
logistic hepbuptake2 i.resi

logistic hepbuptake2 i.agegrp i.education i.occupation i.resi

***MATERNAL X'TICS AND UPTAKE
logistic hepbuptake2 i.par 
logistic hepbuptake2 i.grav 



logistic hepbuptake2 i.agegrp i.education i.occupation i.resi
