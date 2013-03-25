sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ahh...yes, I've read reports about you. Always showing up here and there across Luclin. Not always under the best circumstances though, eh? No matter. I need someone who can get [things done]. I'm not looking for a saint.");
  }
  if($text=~/things done/i) {
    quest::say("I've been collecting information on the Grimlings and a disturbing pattern is emerging. Although the military-minded Vah Shir are focused on the Grimling battle strength, I fear there is something else growing in the [dark depths] of those caverns.");
  }
  if($text=~/dark depths/i) {
    quest::say("There is a legend of a Vah Shir name Khati Sha. He was one of my people's first great heroes. An explorer and leader, he mysteriously disappeared long ago. I have the unsettling feeling that this war will uncover the [secret] of his disappearance.");
  }
  if($text=~/secret/i) {
    quest::say("I believe that Khati Sha is somehow wrapped up in the past and present of the Grimlings. There are tales of a 'Legend of Lies' amongst the common Grimlings...a secret history kept by their elite. If you are willing to help, go into the deep caverns and search out this text. If we can find it, we may be able to unravel the truth of the Grimling past.");
  }
  if($text=~/hero/i && defined($qglobals{SummaryScroll}) && ($qglobals{SummaryScroll} == 1)) {
    quest::say("I must try and collate this legend with the rest of the information. I must ask you an enormous favor. Will you go and search for more information? I can give you no better direction but to hunt the snake men. The text of 'ledgers and testaments'...perhaps the Shissar have some record of the event. Take this [summary scroll].");
    quest::summonitem(63163); #Legend of Lies
    quest::summonitem(63164); #Summary Scroll
  }
  if($text=~/summary scroll/i && defined($qglobals{SummaryScroll}) && ($qglobals{SummaryScroll} == 1)) {
    quest::say("It has a magic on it that will encode any text put into it, hiding meaning in confusion. See if you can track down the answers we need. Return to me when you have sealed the scroll, when you've found all the answers you can. I fear, however, that the final answer may only be found when we find Khati Sha himself...or whatever remains of him.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 63163 => 1)) { #Legend of Lies
    quest::say("This is disturbing. Is there no corner of place or time that the Shissar have not tainted? I must know more. The Vah Shir people must know the truth of their [hero].");
    quest::setglobal("SummaryScroll",1,0,"F");
  }
  elsif(plugin::check_handin(\%itemcount, 63146 => 1)) { #Sealed Summary Scroll
    quest::say(""); #Missing final text
    quest::summonitem(63170); #Fused Mnemonic of Khati Sha
  }
  plugin::return_items(\%itemcount);
}