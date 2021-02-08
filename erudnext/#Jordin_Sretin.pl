##Jordin_Sretin.pl
#Part of Rescue a Shipwrecked Sailor
#I found other text on Alla's for this guy that I have no clue what it's for.
#I'm adding it because it belongs to him.
# items: 55007

sub EVENT_SAY { 
	if ($text=~/Hail/i){
  	quest::say("Welcome to the Port of Erudin. What can I help you with today?");
  }
	if ($text=~/Glory/i){
  	quest::emote("shuffles through some paperwork that is strewn messily before him. 'The Light's Glory, let's see. Yes it is a merchant ship headed from Freeport to Erudin. Yes it should have been here a week ago. Seems we have had a couple ships disappear as of late. Rumors tell of increased pirate activity. Seems none of the local guards wants to get involved in investigating this. Any assistance you could provide would be most appreciated. I suggest that you travel to Erud's Crossing and talk to a Kerran named Nifta. He lives near the dock on the isle and has a great wealth of knowledge of the sea and ships that pass through the crossing. Ask him if he has seen The Light's Glory.'");
  }
	if ($text=~/safe passage/i){
  	quest::say("How unfortunate.  I don't like Trolls much, but I feel I must help.  Take this and give it to him.");#Text completely made up -Kilelen
  	quest::summonitem(55007);#A note of safe passage
  }
}