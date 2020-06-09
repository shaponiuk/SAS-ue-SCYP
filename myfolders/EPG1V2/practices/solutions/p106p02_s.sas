***********************************************************;
*  LESSON 6, PRACTICE 2 SOLUTION                          *;
***********************************************************;

ods rtf file="&outpath/ParkReport.rtf" style=Journal startpage=no;

ods noproctitle;
options nodate;
title "US National Park Regional Usage Summary";

proc freq data=pg1.np_final;
   tables Region / nocum;
run;

proc means data=pg1.np_final mean median max nonobs maxdec=0;
   class Region;
   var DayVisits Campers;
run;

ods rtf style=SASDocPrinter;
title2 'Day Visits vs. Camping';
proc sgplot data=pg1.np_final;
   vbar  Region / response=DayVisits;
   vline Region / response=Campers ;
run;
title;ods proctitle;
ods rtf close;
options date;

