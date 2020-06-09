***********************************************************;
*  LESSON 5, PRACTICE 1 SOLUTION                          *;
***********************************************************;

/*part a*/
title1 "Categories of Reported Species";
proc freq data=pg1.np_species order=freq;
	tables Category / nocum;
run;

/*part b*/
ods graphics on;
ods noproctitle;
title1 "Categories of Reported Species";
title2 "in the Everglades";
proc freq data=pg1.np_species order=freq;
	tables Category / nocum plots=freqplot;
	where Species_ID like "EVER%" and Category ne "Vascular Plant";
run;
title;
