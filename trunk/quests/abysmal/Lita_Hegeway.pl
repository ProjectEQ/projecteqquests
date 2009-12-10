sub EVENT_SAY {
 if(quest::istaskactivityactive(171,4) && $text=~/hail/i) { 
    quest::say("You've been a great help already. I sense that you have greater tasks to attend to and there are fledglings about that can continue your work. As a reward for you assistance, please allow me to teach you the secret of filtering the Taelosian sludge. ' Lita leans forward and whispers directly in you ear. What she tells you makes sense and you believe that you can now filter the sludge. All you need to do is put the Sample of Taelosian Sludge into your medicine bag and combine. This will return a Sample of Filtered Taelosian Sludge. You believe that with continued work on filtering the sludge you may be able to improve your results.");
    quest::updatetaskactivity(171,4);
}
}