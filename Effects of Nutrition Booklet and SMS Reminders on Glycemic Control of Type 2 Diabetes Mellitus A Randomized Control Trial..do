use "D:\academic\UHAS\Mad Joyce\Mad Joyce\ANALYSIS\new\merge dta.dta"

///DEMOGRAPHICS
ta age
recode age (min/60=1 "<60years") (61/max=2 "<60ryears"),gen(agegrp)
ta agegrp

ta sex
recode sex (1=1 "male") (2=2 "female"),gen(sex2)
ta sex2

ta marital
recode marital (1=1 "single") (2=2 "married") (3=3 "Divorced") (4=4 "widowed"),gen(mar)
ta mar

ta education
recode education (1=1 "no education") (2=2 "primary") (3=3 "JHS") (4=4 "SHS/middle sch") (5=5 "tertiary"),gen(edu)
ta edu

ta occupation
recode occupation (1=1 "student") (2=2 "unemployed") (3=3 "self-employed") (4=4 "gov. employed") (5=5 "private employed"),gen(occup)
ta occup

ta diagnosed
recode diagnosed (min/8=1 ">10") (9/max=2 ">=10"),gen(diag)
ta diag

ta satisfysugalevel
recode satisfysugalevel (1 .=1 "not happy") (2=2 "happy") (3=3 "very happy"),gen(satisfysugalevel2)
ta satisfysugalevel2

ta income
recode income (1 .=1 "<500") (2=2 "500-1000") (3=3 "1000-5000") (4=4 "1500"),gen(income2)
ta income2


ta partneredu
recode partneredu (1 .=1 "no education") (2=2 "primary") (3=3 "JHS") (4=4 "SHS/middle school") (5=5 "tertiary"),gen(partneredu2)
ta partneredu2

ta havephone

ta agegrp typ2 , col
ta sex2 typ2 , col
ta mar typ2 , col
ta edu typ2 , col
ta occupation typ2 , col
ta diag typ2 , col
ta income2 typ2 , col
ta partneredu typ2 , col
ta havephone typ2 , col




//////diabetes and hypertension
ta glucoselevel
su glucoselevel
recode glucoselevel (min/6.2=0 "controlled") (7.1/max=1 "uncontrolled"),gen(glucoselevel2)
ta glucoselevel2
replace glucoselevel2=1 if glucoselevel2==.

/////BEHAVIOUR
ta lasthadbloodsugar,nol
encode lasthadbloodsugar,gen(b1a)
ta b1a
numlabel b1a,add
recode b1a (2 6 7 8=1 "none") (4 2 10 11=2 "always") (5 4=3 "sometimes") (1 3 9=4 "rarely") (10 11=5 "sometimes"),gen (b1aa)
ta b1aa typ2, col

ta lasthadblodsugarthirst
encode lasthadblodsugarthirst,gen(b2a)
ta b2a
numlabel b2a,add
recode b2a (2 6 7 8=1 "none") (4 2 10 11=2 "always") (1 12 3 9=3 "rarely") (5 4 13 10 11=4 "sometimes"),gen (b1aa)
ta b1aa  typ2, col

encode lasthadblodsugarthirst,gen(b2)
ta b2
numlabel b2,add
recode b2 ( 9 8=1 "none") (4 5 7=2 "always") (13 6 12=3 "sometimes") (1 3 4 10 11=4 "rarely"),gen (b2aaa)
ta b2aaa typ2, col

ta everbeenhospitalized
recode everbeenhospitalized (1=1 "Yea") (2=2 "no"),gen(db3)
ta db3

ta doingdailyactiv

ta missedappoint
recode missedappoint (1=1 "Yea") (2=2 "no"),gen(db4)
ta db4

//sort missedappoint
//replace missedappoint=2 in 9

ta howmanymissedapoint
encode howmanymissedapoint,gen(b3)
ta b3
numlabel b3,add
recode b3(5 1 2 3 4=1 "<5times") ( 6 7 8 9=2 ">=5times"),gen(b3a)
drop b3a
***ta forgetapoint

ta glucostexthelp typ2, col
replace glucostexthelp=3 if glucostexthelp==.



////
ta db3 typ2 , col
ta db4 typ2 , col
ta b3a typ2 , col
ta edu typ2 , col
ta occupation typ2 , col
ta diag typ2 , col
ta income2 typ2 , col
ta partneredu typ2 , col
ta havephone typ2 , col

///RISK FACTORS
ta smoke typ2, col
ta agestatsmok typ2, col
ta oftensmoke typ2, col
ta advicestopsmok typ2, col
ta agestopsk typ2, col
ta smokpas30days typ2, col
ta consumanyalco typ2, col
ta freqstandalco typ2, col
ta past30consalco typ2, col

/////behaviour

///ta agesmoke 
//ta agestopsmok typ2, col
//sort past30consalco
//replace past30consalco=. in 5
ta fruits 
recode fruits (0 .=1 "none") (1=2 "once") (2=3 "twice") (3 4 5=4 ">=3times"),gen(fruits2)
ta fruits2 typ2, col

ta fruitserving typ2, col
recode fruitserving (0=0 "none") (1=1 "once") (2=2 "twice") (3 4 5 7=4 ">=3times"),gen(fruitserving2)
ta fruitserving2

ta vegetables2
recode vegetables (0=1 "none") (1=2 "once") (2=3 "twice") (3 4 5 7=4 ">=3times"),gen(vegetables2)
ta vegetables2 typ2, col

ta vegetableserving
recode vegetableserving (0=0 "none") (1=1 "once") (2=2 "twice") (3 4 5 7=4 ">=3times"),gen(vegetableserving2)
ta vegetableserving2

ta seasoninadd typ2, col
ta sweateners 
 typ2, col

ta cupperday
replace cupperday = "7" in 25
destring cupperday,replace
recode cupperday (0 .=0 "none") (1/3=1 "1-3") (4/6=2 "4-6") (7/max=3 ">6"),gen(cupperday2)
ta cupperday2 typ2, col

////adherence
ta numbamedi 
recode numbamedi (1=1 "1") (2 21=2 "2") (4=3 "3"),gen(numbamedia)
ta numbamedia
ta dosage typ2, col

ta takepeescribemed 
replace takepeescribemed=2 if takepeescribemed==.
ta takepeescribemed typ2, col
ta famsupport 
replace famsupport=2 if famsupport==.
ta famsupport typ2, col

ta formsupport typ2, col
ta othersupport 
ta review  typ2, col
replace review=3 if review==.

ta oftenchglucos typ2, col 
replace oftenchglucos=3 if oftenchglucos==.
ta glucolevel

ta doingdailyactiv

///BASELINE
code
type 
Name 
age 
sex 
marital 
education 
occupation 
diagnosed 
glucoselevel s
atisfysugalevel 
income 
partneredu 
havephone 
lasthadbloodsugar 
ta lasthadblodsugarthirst 
everbeenhospitalized 
doingdailyactiv 
missedappoint 
howmanymissedapoint 
forgetapoint 
believuseful 
placenotappropraite 
dontliketodo 
outofmat 
notavailable 
glucostexthelp 
smoke 
agesmoke 
agestatsmok 
oftensmoke 
advicestopsmok 
agestopsmok 
agestopsk 
smokpas30days 
consumanyalco 
freqstandalco 
past30consalco 
ta fruits 
fruitserving 
ta vegetables 
vegetableserving 
seasoninadd 
sweateners 
cupperday 
numbamedi 
Med1 
med2 
med3 
med4 
dosage 
takepeescribemed 
famsupport 
formsupport 
othersupport 
review 
oftenchglucos 
glucolevel 
bp 
visit
Date 
PersonalPhonenumber

///DROP OUT
ta dropout,nol
encode dropout,gen(dropout2)
recode dropout2 (1 3=2 "no") (2 4=1 "yes"),gen (vst2)
ta vst2

/////MIDLINE
ta uid
destring uid,replace

ta typ2
encode type,gen(type2)
drop type
ren type2 typ2

ta sugar 
destring sugar,replace
ren sugar sug2

ta bp
encode bp,gen(bp2)
drop bp

des doyoustillhavethebooklet 
ren doyoustillhavethebooklet pos2

ta haveubeenreadingit 
ren haveubeenreadingit read2


ta howmanytimesdidureadit
ren howmanytimesdidureadit numread2

ta understandthemessageinbookle
ren understandthemessageinbookle unda2

ta bookletbeenbeneficial 
ren bookletbeenbeneficial bene2

ta booklethelpsindiabetesmanage 
ren booklethelpsindiabetesmanage help2

ta booldsugarlevelnormalized
ren booldsugarlevelnormalized nomaliz2
 
ta Reasonfornotreading 
ren Reasonfornotreading reason2

ta comment
ren comment com2


///ENDLINE
ta Nmes
encode Nmes,gen(Nmes2)
ren Nmes2 nam3
drop Nmes 

uid 
drop dropout
encode dropout,gen(vst3)
ta vst3

type 
encode type,gen(type2)
drop type
ren type2 typ3

sugar 
destring sugar,replace
ren sugar sug3

bp
encode bp,gen(bp3)
drop bp
 
ta DoyoustillhavetheNutrition
ren vs3 vsa3

ta Haveyoubeenreadingoreverre 
ren Haveyoubeenreadingoreverre vsb3

Howmanytimesdoyoureaditin 
ren Howmanytimesdoyoureaditin vsc3

Doyouunderstandthemessagesi
ren Doyouunderstandthemessagesi vsd3

Havethebookletbeenbeneficial
ren Havethebookletbeenbeneficial vse3

Dothebooklethelpinyourdiab
ren Dothebooklethelpinyourdiab vsf3
 
Haveyourbloodsugarlevelnorm 
ren Haveyourbloodsugarlevelnorm vsg3

Whatareyourreasonsfornotre
ren Whatareyourreasonsfornotre vsh3
 
Howoftendoyoureceivediabete
ren Howoftendoyoureceivediabete vsi3

Haveyoubeenreadingthemessag 
ren Haveyoubeenreadingthemessag vsj3

Doyouunderstandthemessages 
ren Doyouunderstandthemessages vsk3

Havethemessagesbeenbeneficia 
ren Havethemessagesbeenbeneficia vsl3

Dothemassageshelpinyourdia 
ren Dothemassageshelpinyourdia vsm3

T 
ren T vsn3

Doyouhaveproblemwithyourph 
ren Doyouhaveproblemwithyourph vso3

Whatdoyouthinkisthecauseo
ren Whatdoyouthinkisthecauseo vsp3


//ASSESSMENT OF HP MIDLINE



///ASSESSMENT OF DIABETES MIDLINE
ta sug
ta sug2
recode sug2 (min/6.2=0 "controlled") (6.3/max=1 "uncontrolled"),gen(sug2new)
ta sug2new

ta sug2new visit2, col chi

///ASSESSMENT OF DIABETES ENDLINE 
ta sug3
su sug3
destring sug3,replace

recode sug3 (min/6.2=0 "controlled") (6.3/max=1 "uncontrolled"),gen(sug3new)

ta sug3new typ3, col chi

ta vst2
gen v2=.
replace v2=1 if vst2==2 
ta v2 typ2

gen vs2=.
replace vs2=1 if v2==1 & typ2==2
replace vs2=2 if v2==1 & typ2==1
replace vs2=3 if vs2==.
ta vs2

recode vs2 (1=1 "booklet") (2=2 "SMS") (3=3 "Cont"),gen(visit2)
ta visit2

ta vst3
gen v3=.
replace v3=1 if vst3==1
ta v3
gen vs3=.
replace vs3=1 if v3==1 & typ3==1
replace vs3=2 if v3==1 & typ3==2
sort vs3
replace vs3=3 in 36/48
ta vs3

ta typ2 vst2

recode vs3 (2=1 "booklet") (1=2 "SMS") (3=3 "Cont"),gen(visit3)
ta visit3 

gen t1=.
replace t1=1 if visit2==1
ta t1

gen t2=.
replace t2=1 if visit2==2
ta t2

gen t3=.
replace t3=1 if visit2==3
ta t3

 

///CHISQUARE MIDLINE UNCONTROLLED DIABETES
ta agegrp sug2new if visit2==1, col chi
ta sex2 sug2new if visit2==1, col chi
ta mar sug2new if visit2==1, col chi
ta edu sug2new if visit2==1, col chi
ta occup sug2new if visit2==1, col chi
ta diag sug2new if visit2==1, col chi
ta partneredu2 sug2new if visit2==1, col chi
ta income2 sug2new if visit2==1, col chi 
ta takepeescribemed sug2new if visit2==1, col chi
ta missedappoint sug2new if visit2==1, col chi
ta sweateners sug2new if visit2==1, col chi
ta fruits2 sug2new if visit2==1, col chi
ta smoke sug2new if visit2==1, col chi
ta vegetableserving2 sug2new if visit2==1, col chi

///SMS
ta agegrp sug2new if visit2==2, col chi
ta sex2 sug2new if visit2==2, col chi
ta mar sug2new if visit2==2, col chi
ta edu sug2new if visit2==2, col chi
ta occup sug2new if visit2==2, col chi
ta diag sug2new if visit2==2, col chi
ta satisfysugalevel sug2new if visit2==2, col chi
ta partneredu2 sug2new if visit2==2, col chi
ta income2 sug2new if visit2==2, col chi 
ta takepeescribemed sug2new if visit2==2, col chi
ta missedappoint sug2new if visit2==2, col chi
ta sweateners sug2new if visit2==2, col chi
ta fruits2 sug2new if visit2==2, col chi
ta smoke sug2new if visit2==2, col chi
ta vegetableserving2 sug2new if visit2==2, col chi


///CHISQUARE ENDLINE UNCONTROLLED DIABETES
ta agegrp sug3new if visit3==1, col chi
ta sex2 sug3new if visit3==1, col chi
ta mar sug3new if visit3==1, col chi
ta edu sug3new if visit3==1, col chi
ta occup sug3new if visit3==1, col chi
ta diag sug3new if visit3==1, col chi
ta satisfysugalevel sug3new if visit3==1, col chi
ta partneredu2 sug3new if visit3==1, col chi
ta income2 sug3new if visit3==1, col chi 
ta takepeescribemed sug3new if visit3==1, col chi
ta missedappoint sug3new if visit3==1, col chi
ta sweateners sug3new if visit3==1, col chi
ta smoke sug3new if visit3==1, col chi


ta agegrp sug3new if visit3==2, col chi
ta sex2 sug3new if visit3==2, col chi
ta mar sug3new if visit3==2, col chi
ta edu sug3new if visit3==2, col chi
ta occup sug3new if visit3==2, col chi
ta diag sug3new if visit3==2, col chi
ta satisfysugalevel sug3new if visit3==2, col chi
ta partneredu2 sug3new if visit3==2, col chi
ta income2 sug3new if visit3==2, col chi 
ta takepeescribemed sug3new if visit3==2, col chi
ta missedappoint sug3new if visit3==2, col chi
ta sweateners sug3new if visit3==2, col chi
ta smoke sug3new if visit3==2, col chi

//HYPERTENSION
***Baseline
ta bp,nol
encode bp,gen(hp1)
ta hp1,nol
recode hp1 (min/5=0 "controlled hp") (6/max=1 "uncontrolled hp"),gen(hplevelbase)
ta hplevelbase

**8midline
ta bp2,nol
recode bp2 (min/12=0 "controlled hp") (13/max=1 "uncontrolled hp"),gen(hplevelmid)
ta hplevelmid

***endline
ta bp3
recode bp3 (min/9=0 "controlled hp") (10/max=1 "uncontrolled hp"),gen(hplevelend)
ta hplevelend

ta hplevelbase type, col chi

ta dropout2,nol
recode dropout2 (1 3=1 "no") (2 4=2 "yes"),gen(drop1)
ta drop1

ta  type vst3,col


ta hplevelmid typ2,col
ta hplevelend typ2,col
ta sug3new typ2,col

ta visit2

///CHISQUARE MIDLINE UNCONTROLLED HYPERTENSION 
ta agegrp hplevelmid if visit2==1, col chi
ta sex2 hplevelmid if visit2==1, col chi
ta mar hplevelmid if visit2==1, col chi
ta edu hplevelmid if visit2==1, col chi
ta occup hplevelmid if visit2==1, col chi
ta diag hplevelmid if visit2==1, col chi
ta satisfysugalevel hplevelmid if visit2==1, col chi
ta partneredu2 hplevelmid if visit2==1, col chi
ta income2 hplevelmid if visit2==1, col chi 
ta takepeescribemed hplevelmid if visit2==1, col chi
ta missedappoint hplevelmid if visit2==1, col chi
ta sweateners hplevelmid if visit2==1, col chi
ta smoke hplevelmid if visit2==1, col chi
ta vegetableserving2 hplevelmid if visit2==1, col chi

///CHISQUARE MIDLINE UNCONTROLLED HYPERTENSION 
ta agegrp hplevelmid if visit2==2, col chi
ta sex2 hplevelmid if visit2==2, col chi
ta mar hplevelmid if visit2==2, col chi
ta edu hplevelmid if visit2==2, col chi
ta occup hplevelmid if visit2==2, col chi
ta diag hplevelmid if visit2==2, col chi
ta satisfysugalevel hplevelmid if visit2==2, col chi
ta partneredu2 hplevelmid if visit2==2, col chi
ta income2 hplevelmid if visit2==2, col chi 
ta takepeescribemed hplevelmid if visit2==2, col chi
ta missedappoint hplevelmid if visit2==2, col chi
ta sweateners hplevelmid if visit2==2, col chi
ta smoke hplevelmid if visit2==2, col chi

///CHISQUARE ENDLINE UNCONTROLLED HYPERTENSION 
ta agegrp hplevelend if visit3==1, col chi
ta sex2 hplevelend if visit3==1, col chi
ta mar hplevelend if visit3==1, col chi
ta edu hplevelend if visit3==1, col chi
ta occup hplevelend if visit3==1, col chi
ta diag hplevelend if visit3==1, col chi
ta satisfysugalevel hplevelend if visit3==1, col chi
ta partneredu2 hplevelend if visit3==1, col chi
ta income2 hplevelend if visit3==1, col chi 
ta takepeescribemed hplevelend if visit3==1, col chi
ta missedappoint hplevelend if visit3==1, col chi
ta sweateners hplevelend if visit3==1, col chi
ta smoke hplevelend if visit3==1, col chi

///CHISQUARE ENDLINE UNCONTROLLED HYPERTENSION 
ta agegrp hplevelend if visit3==2, col chi
ta sex2 hplevelend if visit3==2, col chi
ta mar hplevelend if visit3==2, col chi
ta edu hplevelend if visit3==2, col chi
ta occup hplevelend if visit3==2, col chi
ta diag hplevelend if visit3==2, col chi
ta satisfysugalevel hplevelend if visit3==2, col chi
ta partneredu2 hplevelend if visit3==2, col chi
ta income2 hplevelend if visit3==2, col chi 
ta takepeescribemed hplevelend if visit3==2, col chi
ta missedappoint hplevelend if visit3==2, col chi
ta sweateners hplevelend if visit3==2, col chi
ta smoke hplevelend if visit3==2, col chi

///DIABETES 
ta sugabase typ2, col chi
su sugabase if typ2==1
ta sug2new visit2, col chi
ta sug3new visit3, col chi


ta typ2
//MEANS
ta visit3
ta vst22
ta vst2
gen vst22=.
replace vst22=1 if vst2==2
su sug2 if vst2==2, col chi
su sug3 if vst3==1
su sugar

 ///Baseline mean for sms and booklet
ta typ2
recode glucoselevel (min/6.2=0 "controlled") (6.3/max=1 "uncontrolled"),gen(sugabase)
ta sugabase
su sug3
ta typ2
su glucoselevel if typ2==1


 gen visit1_base=.
 replace visit1_base=1 if typ2==1
 replace visit1_base=2 if typ2==2
 ta visit1_base
 ttest visit1_base, by(sugabase) 
 
**HP
ta hplevelbase
ttest visit1_base, by(hplevelbase) 

//////
gen smscont=.
replace smscont=1 if visit2==2
replace smscont=2 if visit2==3
ta smscont

///midline mean for sms and booklet
 gen visit22=.
 replace visit22=1 if visit2==1
 replace visit22=2 if visit2==2
 ta visit2
 ttest smscont, by(sug2new) 
 su sug2 if visit22==2
 
 gen visitsms=.
 replace visitsms=1 if visit22==1
 ta visitsms
 **HP
ta hplevelmid
ttest visit1_base, by(hplevelmid) 

/****sms
 gen visit2_sms=.
 replace visit2_sms=1 if visit2==2
 ta visit2_sms
 ttest visit2_sms, by(sug2new) 

***booklet
 gen visit2_book=.
 replace visit2_book=1 if visit2==1
 ta visit2_book
  ttest visit2_book, by(sug2new) 
*/
 
///endline mean for sms and booklet
ta visit3
gen bklcont=.
replace bklcont=1 if visit3==1
replace bklcont=2 if visit3==3
ta bklcont
ttest sug3new, by(bklcont) 

 gen visit33=.
 replace visit33=1 if visit3==1
 replace visit33=2 if visit3==2
 ta visit33
 ttest visit33, by(sug3new) 

**HP
ta hplevelend
ttest visit1_base, by(hplevelend) 



////Compare SMS TO CONTROL GROUP
///Baseline mean for sms and booklet
ta typ2
recode glucoselevel (min/6.2=0 "controlled") (6.3/max=1 "uncontrolled"),gen(sugabase)
ta sugabase
su sug3
ta typ2
su glucoselevel if typ2==1


 gen visit1_baseSC=.
 replace visit1_baseSC=1 if typ2==1
 replace visit1_baseSC=2 if typ2==3
 ta visit1_baseSC
 ttest visit1_baseSC, by(sugabase) 
 
**HP
ta hplevelbase
ttest visit1_baseSC, by(hplevelbase) 

 ///midline mean for sms and NONE
 ta visit2
 gen visit22SC=.
 replace visit22SC=1 if visit2==2
 replace visit22SC=2 if visit2==3
 ta visit22SC
 ttest visit22SC, by(sug2new) 
 su sug2 if visit22SC==2
 
 **HP
ta hplevelmid
ttest visit1_baseSC, by(hplevelmid) 

 ///endline mean for sms and booklet
 ta visit3
 gen visit33SC=.
 replace visit33SC=1 if visit3==2
 replace visit33SC=2 if visit3==3
 ta visit33SC
 ttest visit33SC, by(sug3new) 
ta sug3
  **HP
ta hplevelend
ttest visit1_baseSC, by(hplevelend) 


////Compare BOOKLET TO CONTROL GROUP
 ///Baseline mean
recode glucoselevel (min/6.2=0 "controlled") (6.3/max=1 "uncontrolled"),gen(sugabase)
ta sugabase
su sug3
ta typ2
su glucoselevel if typ2==1


 gen visit1_baseBC=.
 replace visit1_baseBC=1 if typ2==2
 replace visit1_baseBC=2 if typ2==3
 ta visit1_baseBC
 ttest visit1_baseBC, by(sugabase) 
 
**HP
ta hplevelbase
ttest visit1_baseBC, by(hplevelbase) 

 ///midline mean for booklet and NONE
 ta visit2
 gen visit22BC=.
 replace visit22BC=1 if visit2==1
 replace visit22BC=2 if visit2==3
 ta visit22BC
 ttest visit22BC, by(sug2new) 
 su sug2 
 if visit22BC==2
 
 **HP
ta hplevelmid
ttest visit1_baseBC, by(hplevelmid) 

 ///endline mean for control and booklet
 ta visit3
 gen visit33BC=.
 replace visit33BC=1 if visit3==1
 replace visit33BC=2 if visit3==3
 ta visit33BC
 ttest visit33BC, by(sug3new) 
ta sug3new
  **HP
ta hplevelend
ttest visit1_baseBC, by(hplevelend) 



////////////////////////////////
recode visit2 (1=3 "booklet") (2=2 "SMS") (3=1 "Control"),gen (midvisit)
ta midvisit

recode visit3 (1=3 "booklet") (2=2 "SMS") (3=1 "Control"),gen (endvisit)
ta endvisit


recode typ2 (2=3 "booklet") (1=2 "SMS") (3=1 "Control"),gen (basevisit)
ta basevisit
//////////////////////SMS AND CONTROL
***baseline
ta basevisit
gen smscotbas=.
replace smscotbas=1 if basevisit==2
replace smscotbas=2 if basevisit==1
recode smscotbas (1=1 "SMS") (2=2 "CONTROL"),gen(smscontbase)
ta smscontbase

***midline
ta midvisit
gen smscontmi=.
replace smscontmi=1 if midvisit==2
replace smscontmi=2 if midvisit==1
recode smscontmi (1=1 "SMS") (2=2 "CONTROL"),gen(smscontmid)
ta smscontmid

***endline
ta endvisit
gen smscontnd=.
replace smscontnd=1 if endvisit==2
replace smscontnd=2 if endvisit==1
recode smscontnd (1=1 "SMS") (2=2 "CONTROL"),gen (smscontend)
ta smscontend

//////////////////////BOOKLET AND CONTROL
***baseline
ta basevisit
gen bkcotbas=.
replace bkcotbas=1 if basevisit==3
replace bkcotbas=2 if basevisit==1
recode bkcotbas (1=1 "booklet") (2=2 "CONTROL"),gen(bkletcontbas)
ta bkletcontbas


***midline
ta midvisit
gen bkcontmi=.
replace bkcontmi=1 if midvisit==3
replace bkcontmi=2 if midvisit==1
recode bkcontmi (1=1 "BOOKLET") (2=2 "CONTROL"),gen(bkletcontmi)
ta bkletcontmi


***endline
ta endvisit
gen bkcontnd=.
replace bkcontnd=1 if endvisit==3
replace bkcontnd=2 if endvisit==1
recode bkcontnd (1=1 "booklet") (2=2 "CONTROL"),gen (bkletcontnd)
ta bkletcontnd

ta smscont
ta bklcont
//logistic sugabase i. basevisit
logistic sug2new i. midvisit
logistic sug3new i. endvisit

/////////////////////////////////////
ta visit3
gen smscontvst2=.
replace smscontvst2=1 if visit2==1
replace smscontvst2=2 if visit2==2
recode smscontvst2 (1=1 "booklet") (2=2 "sms"), gen (smscontvstmid)
ta smscontvstmid

gen smscontvst3=.
replace smscontvst3=1 if visit3==1
replace smscontvst3=2 if visit3==2
recode smscontvst3 (1=1 "booklet") (2=2 "sms"), gen (smscontvstend)
ta smscontvstend,nol

ttest smscontvstmid, by(sug2new)
ttest smscontvstend, by(sug3new) 

//mean for baseline SMS AND CONTROL
su glucoselevel if smscontbase==1
su glucoselevel if smscontbase==2


//mean for midline SMS AND CONTROL
su sug2 if midvisit==2
su sug2 if midvisit==1
ed sug2 midvisit

//mean for midline SMS AND CONTROL
su sug3 if smscontend==1
su sug3 if smscontend==2

//mean cane diff
ttest glucoselevel, by(smscontbase) 
ttest sug2, by(smscontmid) 
ttest sug3, by(smscontend) 

/////////////////////////////////////////

//mean for midline booklet AND CONTROL
su sug2 if midvisit==2
su sug2 if midvisit==1
ed sug2 midvisit

//mean for midline booklet AND CONTROL
su sug3 if smscontend==1
su sug3 if smscontend==2

//mean cane diff
ttest glucoselevel, by(bkletcontbas) 
ttest sug2, by(bkletcontmi) 
ttest sug3, by(bkletcontnd) 

/////SMS AND BOOKLET
***baseline
ta basevisit
gen smsbkt=.
replace smsbkt=1 if basevisit==2
replace smsbkt=2 if basevisit==3
ta smsbkt
recode smsbkt (1=1 "SMS") (2=2 "BOOKLET"),gen (smsbkt2)
ta smsbkt2

****midlne
ta midvisit
gen smsbktmid=.
replace smsbktmid=1 if midvisit==2
replace smsbktmid=2 if midvisit==3
ta smsbktmid
recode smsbktmid (1=1 "SMS") (2=2 "BOOKLET"),gen (smsbktmid2)
ta smsbktmid2

***endline
ta endvisit
gen smsbktend=.
replace smsbktend=1 if endvisit==2
replace smsbktend=2 if endvisit==3
ta smsbktend
recode smsbktend (1=1 "SMS") (2=2 "BOOKLET"),gen (smsbktend2)
ta smsbktend2

//mean cane diff
ttest glucoselevel, by(smsbkt2) 
ttest sug2, by(smsbktmid2) 
ttest sug3, by(smsbktend2)

////PREVALENCE OF DIABETES
ta glucoselevel
ta sug2
ta su
***************BASELINE
****baseline
ta sugabase basevisit,ro
****midline
ta sug2new smsbktmid2,ro
****endline
ta sug3new smsbktend2,ro