sub EVENT_SPAWN {
	quest::settimer("cough",350);
	}

sub EVENT_TIMER {
	quest::emote("coughs and wheezes.");
	}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, $name.  My name is Vicus Nonad. <cough>  I am the official tax collector for the fine city of Qeynos. <cough>  I serve the will of Antonius Bayle, our glorious leader.  <cough>  <cough>  Please excuse my [cough].  <cough>");
}
if($text=~/what cough/i){
quest::say("Oh, <cough> I am sorry, but it seems I have fallen a bit ill.  I was caught out in the rain the other day and my chills have gotten the best of me. <cough>  If only someone would [help] me with today's [collections]..  <cough>");
}
if($text=~/i would help you with todays collections/i){
quest::say("Oh thank <cough> you so <cough> <cough> much <cough>..  Here is the official collection box.  Please collect from each merchant on the <cough> [list].  Then bring me back the combined total of all your collections.");
quest::summonitem(17012);
}
if($text=~/what list/i){
quest::say("Oh.  <cough>  I am sorry..  I forgot to give it to you.  Here you go.  Be sure to give that back when your job is finished.  <cough>");
quest::summonitem(18009);
 }
}
#END of FILE Zone:qeynos  ID:1056 -- Vicus_Nonad 

