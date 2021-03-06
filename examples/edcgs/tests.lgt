/*
The MIT License (MIT)

Copyright (c) 2015 Michael Hendricks

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/


:- object(tests,
	extends(lgtunit)).

	:- info([
		version is 1:2:0,
		author is 'Michael Hendricks; adapted to Logtalk by Paulo Moura.',
		date is 2020-10-22,
		comment is 'Unit tests for the "edcgs" example.'
	]).

	cover(gemini).
	cover(list_constructors).
	cover(list_sums).
	cover(synopsis).
	cover(unique).

	test(list_constructors_flist_1, true(L == [1, 2, 3, 4, 5, 6, 7])) :-
		list_constructors::flist(7, [], L).

	test(list_constructors_rlist_1, true(L == [7, 6, 5, 4, 3, 2, 1])) :-
		list_constructors::rlist(7, L, []).

	test(list_sums_sum_first_n_1, true(Sum == 0)) :-
		list_sums::sum_first_n(0, 0, Sum).

	test(list_sums_sum_first_n_2, true(Sum == 10)) :-
		list_sums::sum_first_n(4, 0, Sum).

	test(list_sums_sum_1, true(Sum == 7)) :-
		list_sums::sum([2,2,3], Sum).

	test(synopsis_1, true) :-
		synopsis::len([], 0).

	test(synopsis_2, true) :-
		synopsis::len([a], 1).

	test(synopsis_3, true) :-
		synopsis::len([a,b,a], 3).

	test(unique_1, true) :-
		unique::unique([],[]).

	test(unique_2, true) :-
		unique::unique([a],[a]).

	test(unique_3, true) :-
		unique::unique([a,b,a],[a,b]).

	test(gemini_1, true(S0 == S)) :-
		gemini::p(1, S0, S, _).

:- end_object.
