(* TEST HOMEWORK3 *)

(*Exercise 1*)
val test11 = only_capitals ["A","b","c","D"] = ["A","D"];
val test12 = only_capitals ["a","b","c","D"] = ["D"];
val test13 = only_capitals ["a","b","c","d"] = [];
val test14 = only_capitals ["A","B","c","D"] = ["A","B","D"];
val test15 = only_capitals ["A","B","C","D"] = ["A","B","C","D"];

(* Exercise 2 *)

val test21 = longest_string1 ["a","bb", "ccc", "dddd"] = "dddd";
val test22 = longest_string1 ["a","b", "cc", "d"] = "cc"; 
val test23 = longest_string1 ["a","b", "", "dd"] = "dd"; 
val test24 = longest_string1 ["aaa","bv", "", "dd"] = "aaa"; 
val test25 = longest_string1 ["a","bb", "cc", "d"] = "bb";

(* Exercise 3 *)
val test31 = longest_string2 ["a","bb", "cc", "d"] = "cc";
val test32 = longest_string2 ["a","bb", "cc", "dd"] = "dd";
val test33 = longest_string2 ["aaa","bb", "cc", "d"] = "aaa";
val test34 = longest_string2 ["a","bbc", "ccc", "d"] = "ccc";
val test35 = longest_string2 ["a","bb", "cccc", "dddd"] = "dddd";

(* Exercise 4*)

val test41 = longest_string3 ["a","bb", "cc", "dd"] = "bb"; 
val test42 = longest_string3 ["aaa","bb", "cc", "d"] = "aaa";
val test43 = longest_string3 ["a","bbc", "ccc", "d"] = "bbc";
val test44 = longest_string3 ["a","bb", "cccc", "dddd"] = "cccc";

val test45 = longest_string4 ["a","bb", "cc", "dd"] = "dd";
val test46 = longest_string4 ["aaa","bb", "cc", "d"] = "aaa";
val test47 = longest_string4 ["a","bbc", "ccc", "d"] = "ccc";
val test48 = longest_string4 ["a","bb", "cccc", "dddd"] = "dddd";

(* Exercise 5 *)

val test51 = longest_capitalized ["AA","bb"] = "AA";
val test52 = longest_capitalized ["AA","BB"] = "AA"; 
val test53 = longest_capitalized ["aa","bb"] = "";
val test54 = longest_capitalized ["aa","bb","CC", "CdAA"] = "CdAA";
val test55 = longest_capitalized ["aa","bB"] = "";
val test56 = longest_capitalized ["aa","bb","CCaaa", "CdAA"] = "CCaaa";
val test57 = longest_capitalized ["aa","bb","aCCaaa", "CdAA"] = "CdAA";

(* Exercise 6 *)

val test61 = rev_string "hi" = "ih";
val test62 = rev_string "hi alex" = "xela ih";
val test63 = rev_string "this is a test to reverse" = "esrever ot tset a si siht";
val test64 = rev_string "esrever ot tset a si siht" = "this is a test to reverse";

(* Exercise 8*)

val test81 = all_answers (fn x => x) [] = SOME [];
val test82 = all_answers (fn x => NONE) [1, 2, 3, 4, 5] = NONE;
val test83 = all_answers (fn x => SOME [x, x*x]) [2, 5, 3, 4] = SOME [2, 4, 5, 25, 3, 9, 4, 16];
            

(* Exercise 10 *)

val test101 = check_pat (TupleP [Variable "my_var", Variable "my_var"]) = false;
val test102 = check_pat(TupleP [Variable "my_var", UnitP, Wildcard, Variable "my_var"]) = false;
val test103 = check_pat (TupleP [Variable "my_var", UnitP, Wildcard, Variable "other_var"]) = true;


(* Exercise 11 *)

val test111 = match(Const 16, Wildcard) = SOME [];
val test112 = match(Const 13, Variable "my_var") = SOME [("my_var", Const 13)];
val test113 = match(Unit, UnitP) = SOME [];
val test114 = match(Const 17, ConstP 17) = SOME [];
val test115 = match(Constructor("my_constructor", Const 13), ConstructorP("my_constructor", Variable "my_var")) = SOME [("my_var", Const 13)];
val test116 = match(Tuple [Const 13, Const 17], TupleP [Variable "my_var", Variable "other_var"]) = SOME [("my_var", Const 13), ("other_var", Const 17)];

val test117 = match(Const 17, ConstP 5) = NONE;
val test118 = match(Unit,ConstP 17) = NONE;
val test119 = match(Constructor ("egg", (Constructor ("egg",(Const 4)))),ConstructorP ("egg",(ConstP 4))) = NONE;