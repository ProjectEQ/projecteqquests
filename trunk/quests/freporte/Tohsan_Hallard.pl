# Orc Picks 
# Lottery Tickets
# Lead to - Princess Lenya quest 

sub EVENT_SAY {

if($text=~/Hail/i) {

	quest::say("Greetings and welcome to Hallard's!  You will find many aged weapons begging you to shine them up and make them great once more.  We will gladly pay you top dollar for any rusty weapons you may have found littering the Commonlands.  I have a [special offer] for those who have obtained orc pawn picks.");

}

if($text=~/what special offer/i) {

	quest::say("I will pay some silver pieces for every four orc pawn picks returned to me.  I shall also throw in a ticket to the Highpass Hold lottery.  It could be a winner!!");

}

}


sub EVENT_ITEM {

if($itemcount{13885} == 4) {  # Orc Pawn Pick

	quest::say("As I promised, some silver and of course, the Highpass lottery ticket. Oh yes, I forgot to mention the ticket was for last season's lottery. Ha Ha!! You now own a losing Highpass lottery ticket, lucky you! Ha!!");
   
	quest::exp(50);
	quest::ding();
	quest::faction("47","1"); # Coalition of Tradefolk
	quest::faction("184","1"); # Knights of Truth   
	quest::faction("217","1"); # Merchants of Qeynos
	quest::faction("48","1"); # Coalition of Tradesfolk Underground 
	quest::summonitem(quest::ChooseRandom(12264, 12265, 12261, 12262, 12263,12266)); # Random Lottery Ticket
	quest::givecash("0","3","0","0");
	
   }

}


#END of FILE Zone:freporte  ID:10053 -- Tohsan_Hallard.pl


