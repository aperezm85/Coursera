fun is_older ( d1: (int * int * int), d2 :(int * int* int)) =
    if (#1 d1) < (#1 d2)
    then true
    else
	if (#1 d1) > (#1 d2)
	then false
	else
	    if (#2 d1) < (#2 d2)
	    then true
	    else 
		if (#2 d1) > (#2 d2)
		then false
		else 
		    if (#3 d1) < (#3 d2)
		    then true
		    else
			false

fun number_in_month (xs: (int * int * int) list , m : int) = 
    if null xs 
    then 0
    else 
	if (#2 (hd(xs))) = m
	then 1 + number_in_month(tl(xs),m)
	else number_in_month(tl(xs),m)

fun number_in_months (xs: (int * int * int) list , cm : int list) =
    if null cm
    then 0
    else number_in_month(xs, hd(cm)) + number_in_months(xs, tl(cm))

fun dates_in_month (xs: (int*int*int) list, m: int) =
    if null xs
    then []
    else 
	if (#2 (hd(xs))) = m
	then hd(xs) :: dates_in_month(tl(xs),m)
	else dates_in_month(tl(xs),m)

fun dates_in_months (xs: (int * int * int) list , cm : int list) =
    if null cm
    then []
    else dates_in_month(xs, hd(cm))@ dates_in_months(xs,tl(cm))

fun get_nth (s: string list, n: int) =
    if n = 1
    then 
	if null s
	then ""
	else hd(s)
    else get_nth(tl(s),n-1)
 
fun date_to_string (date: (int * int * int)) =
    let val months = ["January", "February", "March", "April", "May","June", "July", "August", "September", "October", "November", "December"];
in
    get_nth(months, (#2 date)) ^ " " ^ Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))
end

fun number_before_reaching_sum (sum: int, l: int list) =
    if sum - hd(l) > 0
    then 1 + number_before_reaching_sum(sum - hd(l), tl(l))
    else 0

fun what_month (day: int) =
    let
	val months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	number_before_reaching_sum(day, months) + 1
    end

fun month_range (day1: int, day2: int) =
    if day2 < day1
    then []
    else what_month(day1) :: month_range(day1+1,day2);

fun oldest (dates: (int * int * int) list) =
    if null dates
    then NONE
    else let 
	    fun the_oldest (dates: (int * int * int) list) =
		if null (tl dates) (* xs better not be [] *)
		then hd dates
		else let val tl_ans = the_oldest(tl dates)
		     in
			 if is_older(hd dates, tl_ans)
			 then hd dates
			 else tl_ans
		     end
	in
	    SOME (the_oldest dates)
	end


(* CHALLENGE*)    

fun number_in_months_challenge (dates : (int * int * int) list, months: int list) =

    let
	fun remove (xlist: int list, elto: int) =
	    if null xlist
	    then []
	    else
		if hd(xlist) = elto
		then remove(tl(xlist),elto)
		else hd(xlist)::remove(tl(xlist),elto)

	fun removeDuplicates (xlist : int list) =
	    if null xlist
	    then []
	    else
		hd(xlist)::remove(removeDuplicates(tl(xlist)), hd(xlist))
    in
	number_in_months(dates, removeDuplicates(months))
    end

fun dates_in_months_challenge (dates : (int * int * int) list, months: int list) =

    let
	fun remove (xlist: int list, elto: int) =
	    if null xlist
	    then []
	    else
		if hd(xlist) = elto
		then remove(tl(xlist),elto)
		else hd(xlist)::remove(tl(xlist),elto)

	fun removeDuplicates (xlist : int list) =
	    if null xlist
	    then []
	    else
		hd(xlist)::remove(removeDuplicates(tl(xlist)), hd(xlist))
    in
	dates_in_months(dates, removeDuplicates(months))
    end

fun reasonable_date (date : (int * int * int) ) =
    let
	val day = (#3 date)
	val month = (#2 date)
	val year = (#1 date)
	fun calculate_last_day(year: int, month : int, day :int) =
	    let
		val months = [31,28,31,30,31,30,31,31,30,31,30,31]
		fun get_pos (a: int list, n: int) =
		    if n = 1
		    then 
			if null a
			then 0
			else hd(a)
		    else get_pos(tl(a),n-1)
	    in
		if ((month=2) andalso 
		    (Int.mod (year,4) = 0) andalso 
		    not (Int.mod (year,400) = 100) andalso
		    not (Int.mod (year,400) = 200) andalso
		    not (Int.mod (year,400) = 300))
		then 29
		else get_pos(months,month)		    
	    end		
    in
	if year <= 0
	then false
	else
	    if month <= 0 orelse month > 12
	    then false
	    else 
		if day <= 0 orelse day > 31
		then false
		else 
		    if day <= calculate_last_day(year, month, day)
		    then
			true
		    else
			false

    end
