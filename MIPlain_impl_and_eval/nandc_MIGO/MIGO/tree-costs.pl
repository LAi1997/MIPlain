%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% metaopt
%% A. Cropper and S. H. Muggleton. Learning efficient logic programs.Machine Learning,108:1063–1083, 2019.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos_cost(Goal,Cost):-
  (functor(Goal,_,0) -> pos_cost_monadic(Goal,Cost); pos_cost_general(Goal,Cost)).
neg_cost(Goal,Cost):-
  (functor(Goal,_,0) -> neg_cost_monadic(Goal,Cost); neg_cost_general(Goal,Cost)).

pos_cost_monadic(Goal,Cost):-
  statistics(inferences,I1),
  call(Goal),
  statistics(inferences,I2),
  Cost is I2-I1.

pos_cost_general(Goal,Cost):-
  Goal=..[P,A,B|Rest],
  NewGoal=..[P,A,C|Rest],
  statistics(inferences,I1),
  call(NewGoal),B=C,
  statistics(inferences,I2),
  Cost is I2-I1.

neg_cost_monadic(Goal,Cost):-
  statistics(inferences,I1),
  (call(Goal) -> true; true),
  statistics(inferences,I2),
  Cost is I2-I1.

neg_cost_general(Goal,Cost):-
  Goal=..[P,A,B],
  NewGoal=..[P,A,C],
  statistics(inferences,I1),
  (call(NewGoal) -> B=C; true),
  statistics(inferences,I2),
  Cost is I2-I1.