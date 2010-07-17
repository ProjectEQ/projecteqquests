sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Fleshy mortal, can you not see that I am cursed to live in eternal anguish? What is it that you seek from me?");
  }
  if($text=~/worthy/i) {
    if($faction <= 2) {
      quest::say("The squishy mortal has proven itself by releasing Elysian spirits. We greet the Elysian spirits to our realm and rejoice in their freedom. Go on fleshling, ask the bone man to tell you of Vex Thal.");
    }
    else {
      quest::say("Begone from my sight corruptor of spirits. I will only aid my allies.");
    }
  }
  if($text=~/vex thal/i) {
    if($faction <= 2) {
      quest::say("The city of shadow is sealed by powerful magic. Only one that wears the talisman of Akelha Ra can pass through the seals on the gate. I have not been beyond the gates but rumors of dark prophets that possess great power have been heard throughout the ages.");
    }
    else {
      quest::say("I will not reveal the secrets I have discovered so easily. Since I am unable to leave the protection of the whisperling circle, I will need you to aid me in releasing the Elysian spirits from their tormented states. Destroy their remains and release their spirits from the grip of the shadow curse. Return four of their skulls to me as proof of your deeds. Only then will I impart my discoveries to you.");
    }
  }
  if($text=~/dark prophets/i) {
    if($faction <= 2) {
      quest::say("Only legends and rumors have circulated about the dark prophets in Vex Thal. I suspect that they are the reason for my eternally cursed state. If you could find someway to defeat the dark prophet leading those in Vex Thal and bring me back proof of the deed, I shall reward you with an ancient relic that I possess.");
    }
    else {
      quest::say("Begone from my sight corruptor of spirits. I will only aid my allies.");
    }
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8365 => 1)) { #Soul Essence of Aten Ha Ra
    quest::say("$name, you have done more than was ever expected. Take this and my blessing will be with you always.");
    quest::summonitem(8364); #Talisman of Vah Kerrath
    quest::exp(1670);
  }
  elsif(plugin::check_handin(\%itemcount, 28102 => 4)) { #Elysian Skull
    quest::say("You have done well. Clear your mind of all distractions and ask the whisperlings if you are worthy of my knowledge.");
    quest::faction(358,5); #Whisperling
    quest::faction(3,-5);  #Akheva
    quest::exp(1000);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:umbral ID:176013 -- remains_of_Vah_Kerrath