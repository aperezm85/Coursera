val newyear1 = (2011,1,1);
val newyear2 = (2012,1,1);
val newyear3 = (2013,1,1);
val christmas1 = (2011,12,25);
val christmas2 = (2012,12,25);
val christmas3 = (2013,12,25);
val july1 = (2011,7,4);
val july2 = (2012,7,4);
val july3 = (2013,7,4);
val months = [31,28,31,30,31,30,31,31,30,31,30,31];

(* TEST IS_OLDER *)
val test_is_older1 = is_older(newyear1, newyear2) = true;
val test_is_older2 = is_older(newyear2, newyear3) = true;
val test_is_older3 = is_older(newyear1, newyear3) = true;
val test_is_older4 = is_older(newyear2, newyear1) = false;
val test_is_older5 = is_older(newyear2, newyear2) = false;

(* TEST NUMBER_IN_MONTH *)
val test_num1 = number_in_month([newyear1,newyear2,july1,july2],1) = 2;
val test_num2 = number_in_month([newyear1,newyear2, newyear3,july1,july2],1) = 3;
val test_num3 = number_in_month([newyear1,newyear2,july1,july2],2) = 0;
val test_num4 = number_in_month([newyear1,newyear2,july1,july2],7) = 2;

(* TEST NUMBER_IN_MONTHS *)
val test_num_months1 = number_in_months([newyear1,newyear2,july1,july2],[1,7]) = 4;
val test_num_months2 = number_in_months([newyear1,newyear2, newyear3,july1,july2],[1,3,6,7]) = 5;
val test_num_months3 = number_in_months([newyear1,newyear2,july1,july2],[2]) = 0;
val test_num_months4 = number_in_months([newyear1,newyear2,july1,july2],[7]) = 2;

(* TEST DATES_IN_MONTH *)

val test_dates_month1 = dates_in_month([newyear1,newyear2,july1,july2],1) = [newyear1,newyear2];
val test_dates_month2 = dates_in_month([newyear1,newyear2, newyear3,july1,july2],7) = [july1,july2];
val test_dates_month3 = dates_in_month([newyear1,newyear2,july1,july2],2) = [];
val test_dates_month4 = dates_in_month([newyear1,newyear2,july1,july2],7) = [july1,july2];

(* TEST DATES_IN_MONTHS *)

val test_dates_months1 = dates_in_months([newyear1,newyear2,july1,july2],[1,7]) = [newyear1,newyear2, july1, july2];
val test_dates_months2 = dates_in_months([newyear1,newyear2, newyear3,july1,july2],[2,7,8,9]) = [july1,july2];
val test_dates_months3 = dates_in_months([newyear1,newyear2,july1,july2],[2]) = [];
val test_dates_months4 = dates_in_months([newyear1,newyear2,july1,july2],[7]) = [july1,july2];

(* TEST GET_NTH *)
val test1 = get_nth(["hi","class","coursera","is","awesome"],3)="coursera";
val test2 = get_nth(["hi","class","coursera","is","awesome"],4)="is";
val test3 = get_nth(["hi","class","coursera","is","awesome"],5)="awesome";
val test4 = get_nth(["hi","class","coursera","is","awesome"],6)="";

(* TEST DATE_TO_STRING *)

val dts1 = date_to_string(newyear1) = "January 1, 2011";
val dts2 = date_to_string(newyear2) = "January 1, 2012";
val dts3 = date_to_string(july1) = "July 4, 2011";

(* TEST NUMBER_BEFORE_REACHING_SUM *)

val nbrs1 = number_before_reaching_sum(1, months) = 1;
val nbrs2 = number_before_reaching_sum(50, months) = 2;
val nbrs3 = number_before_reaching_sum(365, months) = 12;
val nbrs4 = number_before_reaching_sum(100, months) = 4;

(* TEST WHAT_MONTH *)

val wm1 = what_month(1) = 1;
val wm2 = what_month(50) = 2;
val wm3 = what_month(365) = 12;
val wm4 = what_month(100) = 4;

(* TEST OLDEST *)

val old1 = oldest([newyear1,newyear2,newyear3]) = SOME newyear1;
val old2 = oldest([newyear3,newyear2,newyear1]) = SOME newyear1;
val old3 = oldest([july1,christmas1,newyear3]) = SOME july1;
val old4 = oldest([]) = NONE;



val nbrs5 = number_before_reaching_sum(1, [2]) = 0 ;
val nbrs6 = number_before_reaching_sum(5, [3,1,2]) = 2 ;
val nbrs7 = number_before_reaching_sum(5, [3,2,2]) = 1;
val nbrs8 = number_before_reaching_sum(4, [1,4,1,1]) = 1;
val nbrs9 = number_before_reaching_sum(6, [4,1,1,1]) = 2;
val nbrs10 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3;


(*)

