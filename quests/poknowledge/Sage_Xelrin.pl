sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $name.  I assume you are here to ask about my research?  I imagine that word has spread of my groundbreaking approach to spell creation.  Well I am always willing to enlighten those that choose to learn.  As not to bog you down with too many details. my theory is simple. [Continue]");
}
if($text=~/continue/i){
quest::say("Well the idea is rather basic.  As I am sure you know. there are many magical artifacts in the world with effects that we have not mastered.  It is my conjecture that some of the magic may be extracted from these items in order to further our magical repertoire.  Even in the case where an object has a spell that we already have access to. I believe the binding used to tie the magic to the object could be useful as well. [Continue]");
quest::say("By using this box created in cooperation with the [other sages] in Knowledge. you will be able to either extract a magical scroll or the binding used to hold the magic to the object.  Those elements will be the basis for my research.  Just bring anything you manage to extract for me.");
quest::summonitem("17176");
}
if($text=~/other sages/i){
quest::say("chuckles. 'Well my associates are working on their own theories for the creation of new magic.  I am sure that their projects are no where near advanced as mine. but even their primitive research could prove a boon in my own work.  If you happen to come across any of their research feel free to show it to my assistants. they will know the best manner in which to process it.  Bring reseach from Balic to Bolcen. and Gunyth's research to Acomar.  Thank you for your assistance.'"); }
}
#END of FILE Zone:poknowledge  ID:202040 -- Sage_Xelrin 

