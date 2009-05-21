#zone: tutorialb

sub EVENT_SAY{
  if ($text=~/hail/i){
   quest::say("Hello $name. I'm not much of a fighter myself but I can bestow the power of my god's favor. Would you like to be [blessed]?");
   }
  if ($text=~/blessed/i && quest::istaskactivityactive(22,5) && ($class eq 'Warrior' || $class eq 'Rogue' || $class eq 'Monk' || $class eq 'Berserker')){
   $npc->CastSpell(5150,$userid);
   quest::updatetaskactivity(22,5);  
   }
  elsif ($text=~/blessed/i && quest::istaskactivityactive(22,5) && ($class eq 'Cleric' || $class eq 'Paladin' || $class eq 'Ranger' || $class eq 'Druid' || $class eq 'Shaman' || $class eq 'Beastlord' || $class eq 'Shadowknight')){
   quest::say("You seem to be a bit of a caster yourself! You will find that spells and songs can greatly enhance your power. Take this and scribe it in your spell book. I can only hope it helps you against the kobold horde. As you earn money and gain experience you will fnd other powerful spells. Good luck out there!");
   $npc->CastSpell(5150,$userid);
   quest::updatetaskactivity(22,5); 
   quest::summonitem(15213); 
   }
  elsif ($text=~/blessed/i && quest::istaskactivityactive(22,5) && ($class eq 'Necromancer' || $class eq 'Magician' || $class eq 'Wizard' || $class eq 'Enchanter')){
   quest::say("You seem to be a bit of a caster yourself! You will find that spells and songs can greatly enhance your power. Take this and scribe it in your spell book. I can only hope it helps you against the kobold horde. As you earn money and gain experience you will fnd other powerful spells. Good luck out there!");
   $npc->CastSpell(5150,$userid);
   quest::updatetaskactivity(22,5); 
   quest::summonitem(15205);
   }
  elsif ($text=~/blessed/i && quest::istaskactivityactive(22,5) && ($class eq 'Bard')){
   quest::say("You seem to be a bit of a caster yourself! You will find that spells and songs can greatly enhance your power. Take this and scribe it in your spell book. I can only hope it helps you against the kobold horde. As you earn money and gain experience you will fnd other powerful spells. Good luck out there!");
   $npc->CastSpell(5150,$userid);
   quest::updatetaskactivity(22,5); 
   quest::summonitem(15703);
   }
   elsif ($text=~/blessed/i){
   $npc->CastSpell(5150,$userid);
   }
}