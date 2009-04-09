sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I greet thee, $name. You will have to pardon my demeanour; I am afraid that I am not in the best of spirits. Recently yet another brother was taken from us by an evil unknown through the dark art of mind rending.");
  }
  if ($text=~/evil/i) {
    quest::say("Somewhere there exists a group of outcast phantasmists that use their powers solely to harvest pure evil. These masters of the mind are of an origin that we have yet to uncover, for they exist only in one's thoughts, slowly turning one insane from the horrors that pound through their mind.");
  }
  if ($text=~/outcast/i) {
    quest::say("These outcasts were once believe to be part of our circle before turning to the way of evil and using the mindbending abilities that they possess to take over those whose knowledge would benefit them most.");
  }
  if ($text=~/abilities/i) {
    quest::say("What these beguilers are capable of is unknown, but what we do know is that as each day passes we are all at risk from an attack that could very well end us. But there is a chance that if we could find the ancient tomes of their weaknesses, this evil could be stopped.");
  }
  if ($text=~/tomes/i) {
    quest::say("Legend exists that there are two lost tomes that cover the darker sides of mind control. These tomes were last believed to be possessed by mortals much like yourself that stumbled upon them not knowing what they possessed because they could not understand the unknown code the books are scribed in.");
  }
  if ($text=~/code/i) {
    quest::say("To prevent those that could not control the powerful abilities that these tomes described how to perform, these tomes were scribed of ancient language that not many could decifer. In search of someone that could assist them, these heros fell in the city of giants.");
  }
  if ($text=~/language/i) {
    quest::say("As I told you before, these books are distinctly coded to only be understood by those that have the abilities to perform and contain these magics. If these tomes were recovered it is very possible that I could decode them and develop an immunity to the mind altering attacks that I feel are upon us.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31445 => 1, 31446 => 1, 31443 => 1, 31444 => 1)) {
    quest::say("In my hands I hold the teachings of those who gave their lives to produce a defense against the evils of mind control. For what you have done for me I cannot thank you enough; please accept this magical item as a reminder of my gratitude.");
    quest::summonitem(1325);
    quest::exp(1000);
  }
  else {
    quest::say("I have no need of this, friend."); #text made up
    plugin::return_items(\%itemcount);
  }
}

# Quest by mystic414