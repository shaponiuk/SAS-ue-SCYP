***********************************************************;
*  LESSON 4, PRACTICE 9 SOLUTION                          *;
***********************************************************;

data parks monuments;
	set pg1.np_summary;
	where type in ('NP', 'NM');
	Campers=sum(OtherCamping, TentCampers, RVCampers, BackcountryCampers);
	format Campers comma17.;
	length ParkType $ 8;
	select (type);
		when ('NP') do;
			ParkType='Park';
			output parks;
		end;
		otherwise do;
			ParkType='Monument';
			output monuments;
		end;
	end;
	keep Reg ParkName DayVisits OtherLodging Campers ParkType;
run;

