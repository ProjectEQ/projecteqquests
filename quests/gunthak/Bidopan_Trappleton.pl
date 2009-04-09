#zone: gunthak NPC: Bidopan_Trappleton (224207)
#Angelox

sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("How do you do! If you have anything of value, I would advise leaving it with me before you venture further upon the island. There are many unsavory characters who would happily part you with your items, or even your life.");
 }
}