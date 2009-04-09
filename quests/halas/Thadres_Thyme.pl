sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name!  It's hard to believe just how cold it gets here!  It really has been wearing me down. Especially after the [journey] from Qeynos.");
}
if($text=~/what journey/i){
quest::say("I have been traveling the face of Norrath to unravel the mystery of why my beloved [brother] attacked a group of traveling bards.  He didn't survive the fight.  It's been so long. I can't really remember what he looked like!  I miss him so much...  Now all I have are his [diary] and some brewing recipes he sold before his death.");
}
if($text=~/what diary/i){
quest::say("The diary?  It's one of the two connections I still have to my brother.  Sadly. [pages] are missing from it.  I've been looking for them.");
}

if ($text=~/brother/i) {
   quest::say("My brother was Delius Thyme. I think he was a great man. $name, have you ever lost someone close? I don't know if I can ever forgive myself for letting him travel on his own after his sanity began to fade. Oh, Delius, please forgive me!");  
}
if($text=~/what pages/i){
quest::say("I believe the pages contain the events that drove my brother to insanity.  I have been searching for the remaining three missing pages.  There is some hope; I found a couple of pages over in Everfrost Mountains."); }
}

sub EVENT_ITEM
{ 
 if($itemcount{18136} == 1 && $itemcount{18137} == 1 && $itemcount{18138} == 1)
  {
   quest::say("Thank you, thank you. Let me read them. Oh! How could I want these brewing recipes after they made my brother insane? Where are they? I think this is all of them. Take them away from me! Delius can smile upon me now.");
   quest::summonitem(18139);
   quest::exp(200);
 }
 plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29015 -- Thadres_Thyme 

