sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings. friend!!  I am Lozani. Scribe Supreme of the Eldritch Collective.  I have been sent forth from the great Library of Mechanimagica in the city of Ak'Anon. to study the arcane knowledge of man and beast alike.  I have studied many languages and spells. from Crushbone to Kerra Ridge.  I have found most languages hard to decipher.  As of this date. I have learned to read only the script of the [orc oracles].  Oh well. I am on a five decade mission.  Better luck next language.");
}
if($text=~/what orc oracles/i){
quest::say("Oh!!  Heard of the orc oracles have you?  A ghastly bunch they are!!  Argh! The numerous days I spent interrogating those beasts with their foul breath.  It was as if rats had gone and died in their mouths.  I wished I could read minds after those days.  TWENTY WEEKS of that rat-carcass breath and all I have learned is the ability to decipher [oracle scrolls] and [apprentice cantrips].  What a mess that was!  I'm beginning to think I should have become a Gemchopper.");
}
if($text=~/what oracle scrolls/i){
quest::say("Orc oracle scrolls?  Mere shaman spells are they.  I know how to decipher those illegible scrolls.  I can do so. but it will cost you.  Nothing is for free in this world. y'know?  You give me one of those illegible scrolls and four gold coins.");
}
if($text=~/what apprentice cantrips/i){
quest::say("Orc apprentice cantrips.  Child's play they are.  Very difficult to decipher. mostly due to the orc sweat smearing the writing.  I fill in the blanks with a second orc cantrip and my universe of knowledge. so you never know what spell is going to be scribed!  Could be magic. could be wizardry. could be necromancy. golly!!  Sometimes I even end up with a recipe!!  If you want me to try to decipher one just hand me two illegible cantrips.  No coinage necessary!!  They are mostly apprentice spells.  Nothing much."); }
}
#END of FILE Zone:freporte  ID:Not_Found -- Lozani 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Good day to you! Sit and have a drink. I shall be playing soon enough."); }
}
#END of FILE Zone:freporte  ID:Not_Found -- Branis_Noolright 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hey. hello there. $name.  It's been so busy around here lately!  Barely time to eat and sleep. let alone have any fun.  Oh well. it keeps me employed.  But. I really could use someone to [help] me out around here.");
}
if($text=~/what help/i){
quest::say("Yeah. if you can help me out with a few things that'd be great!  Geez. where do we start?  I need someone to run over to [Janam and Rebby's]?  Can you do that for me?");
}
if($text=~/what janam and rebby/i){
quest::say("Janam and Rebby are a couple of merchants working the area around the Theater of the Tranquil and the Ashen Order. in West Freeport. It's part of my job to keep tabs on those two rascals.  I need someone to take this note to Rebby for me.  Don't worry. your efforts won't go unnoticed. $name."); }
}
#END of FILE Zone:freporte  ID:Not_Found -- Nestral_TGaza 

