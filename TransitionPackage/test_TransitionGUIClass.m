% test_TransitionClass

initial_ned = [...
    0 0 0;
    1 0 0;
    2 0 0];

final_ned = [...
    0 2 0;
    1 2 0;
    2 2 0];

pairings=[
    1 1;
    2 2;
    3 3];

Transition1 = TransitionClass(initial_ned,final_ned,pairings);
Transition2 = TransitionClass(initial_ned,final_ned);
Transition3 = TransitionClass(Transition1);

TransitionGUI1 = TransitionGUIClass(Transition1);