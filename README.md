# Ultra-Strong Machine Learing in Noughts-and-Crosses using MIL 

MIGOc learns a complete Noughts-and-Crosses winning strategy efficiently. The strategy program learned by MIGOc 
is more human interpretable and run-time efficient than the program learned by Meta-interpretive game learning 
system MIGO (Muggleton and Hocquette 2019).
![MIGOc_strategy](MIGOc_impl_and_eval/results/MIGOc_strategy.png)


winning first move for X = X moves + X has one attack + O moves + X will be blocked by O
                         + X then makes two attacks + O has no attack
                         
winning second move for X = X moves + X has two attacks + O has no attack

winning third move for X = X moves + X has three pieces in a line


## MIGOc implementation and evaluation

### Backtrack algorithm
- MIGOc_impl_and_eval/MIGOc/backtrack_and_replay.pl

### MIGOc meta-rules and feature primitives
- MIGOc_impl_and_eval/MIGOc/learning.pl

### MIGOc game playing enviroment
- MIGOc_impl_and_eval/MIGOc/environment.pl

### MIGOc learning (Metaopt and episode learning) extending MIGO
- MIGOc_impl_and_eval/MIGOc/MIGO/episode_learning.pl

- MIGOc_impl_and_eval/MIGOc/MIGO/assign_labels.pl

- MIGOc_impl_and_eval/MIGOc/MIGO/execute_strategy.pl

- MIGOc_impl_and_eval/MIGOc/MIGO/METAOPT/metaopt.pl

- MIGOc_impl_and_eval/MIGOc/MIGO/METAOPT/tree-costs.pl

### Learning efficiency evaluation
Q-Learing, DQN and MIGO are compared with MIGOc.

An implementation of Q-learning (Q-learning tic-tac-toe accessed 14 April, 2019) and 
an implementation of DeepQ-learning  (Solving  tic-tac-toe  using  deep  reinforcement 
learning. accessed  14  April,  2019) were used to learn how to win Noughts-and-Crosses 
as ”X” from the same set of 2-ply winnable boards as MIGO and MIGOc.  For each of the methods, 
we accumulated regrets from each game,  and the regret for each won,  drawn,  lost game is 0,  1,  2 respectively.  
For Q-learning and Deep Q-learning, an illegal move is treated as a lost and the regret is 2.  
We set the state space to include a state for each cell of the board and an action is a move made by player ”X”. 
The DQN learner and the classical Q-Learning assume an optimal opponent for gameplay.  
We defined reward functions that heavily penalize invalid moves for both Q-Learning and DQN. 
We set discount factor to 0.9 for Q-learning and 0.8 for DQN. 
For DQN, we used a small learning rate  to  avoid  over-fitting and a simple fully-connected network (256,  64)  as  the  value  network. 
Both Q-Learning and DQN were given a set of initial boards for learning to ensure the best achievable outcome of gameplay is win.

- MIGOc_impl_and_eval/Deep_Q_learning/output/DQN.txt

- MIGOc_impl_and_eval/nandc_MIGO/output/MIGO.txt

- MIGOc_impl_and_eval/Q_learning/output/q.txt

- MIGOc_impl_and_eval/MIGOc/output/MIGO_with_features.txt

![cumulative_regrets](MIGOc_impl_and_eval/results/cumulative_regrets.png)


### Run-time efficiency evaluation
- MIGOc_impl_and_eval/MIGOc/output/inference.txt

- MIGOc_impl_and_eval/MIGOc/output/.txt

- MIGOc_impl_and_eval/MIGOc/output/inference.txt

![run-time](MIGOc_impl_and_eval/results/runtime_performance.png)


## MIGOc usage
Requirement: SWI-Prolog version => 7

Change to directory MIGOc_impl_and_eval/MIGOc/

run `swipl -s backtrack_and_replay.pl -g goal -t halt`



## Minimax database
- minimax/canonical_map.m

- minimax/data.m

- minimax/minimax_DB.py (functions for creating database, visualization and conversion to JS)

## Interface V1 (Test Experiment)
### Using database with html via js
Run Python binary_to_JS() in minimax/minimax_DB.py to generate js usable minimax database

- html_interface/scripts/canonicalMap.js

- html_interface/scripts/data.js

- html_interface/scripts/partitions.js

- html_interface/scripts/partitions15000.js

- html_interface/scripts/partitions15000_parsed.js

### Introduction page
- html_interface/index.html

### Experiment session interface and control
- html_interface/experiment.html

- html_interface/scripts/init.js

- html_interface/scripts/minimax.js

- html_interface/scripts/noughts-and-crosses.js

- html_interface/scripts/questions.js

- html_interface/scripts/utils.js

- html_interface/scripts/variables.js

## Interface V2 & V3 (Second Experiment)
### Experiment session interface and control
- html_interface_v2/index.html

- html_interface_v2/phase1.html

- html_interface_v2/phase2-4.html

- html_interface_v2/submission.html

- html_interface_v2/scripts/~

### Generating explanation

#### test experiment
- explanation/translation.py

#### 2nd experiment
1.locate to 'explanation'

2.Start SWI Prolog session in terminal

3.Consult in interactive Prolog mode, `consult(loader).`

4.Examples are given in explanation/sl_background_features 
and explanation/sl_migo

5.To add targets, `add_target(rule_name).`

6.To start generating explanation, `interpret_program.`

### Collected records
- records_test (test experiment)
- records


Muggleton, Stephen and Celine Hocquette (2019). “Machine Discovery of Comprehensible Strategies for Simple Games Using Meta-
interpretive Learning”. In: New Generation Computing 37.2, pp. 203–217.

Q-learning tic-tac-toe(accessed 14 April, 2019). url:https://gist.github.com/fheisler/430e70fa249ba30e707f.

Solving  tic-tac-toe  using  deep  reinforcement  learning.(accessed 14 April, 2019).url:https://github.com/yanji84/tic-tac-toe-rl.