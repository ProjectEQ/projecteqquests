#zone:PoKnowledge
#Angelox/Cavedude
# items: 84091, 84092, 84093, 85064, 85068, 85065, 85063, 85066, 85067, 66615

sub EVENT_SAY { 
if(($text=~/hail/i)){
$npc->SetAppearance(0);
quest::say("Hello $name, I'm Deiffin's younger brother. I angered him a 
bit so it looks as though I was placed on buffbot duty. Anyway, for a 
donation of 3pp, I'll cast SoW on ya or for 15pp I can cast SoE. 
In addition, for 500pp I can stop the weather in this zone for one hour.");
quest::say("Happy Halloween! If you can find me Bristlebane's Ticket of Admission, then I can give you a trick, treat, or possibly a special prize!");

 }
}

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	$npc->SetAppearance(1);
	my $random_result = int(rand(100));
	if ($random_result<=15){
	quest::shout("Casting SoW and SoE for donations behind the main 
bank!");
	}else{
	#Do Nothing
 }
}

sub EVENT_ITEM{
  $random_result = 0;
  my $random_result = int(rand(10));
   if(($platinum==3)){
    $npc->SetAppearance(0);
    $npc->CastSpell(278,$userid); # Spell: Spirit of Wolf
    quest::say("Casting Sow, Good hunting!");
  }
  if(($platinum==15)){
    $npc->SetAppearance(0);
    $npc->CastSpell(2517,$userid); # Spell: Spirit of Eagle
    quest::say("Casting SoE, Good hunting!");
  }
  if(($platinum>=500)){
    quest::settimer("weather",4);
    quest::signalwith(202361,12345); # NPC: Illusionist_Nomaad
    quest::rain(0);
    quest::snow(0);
  }
  if($ulevel > 9) {
  if($itemcount{85062} && $random_result<3){
      quest::summonitem(quest::ChooseRandom(84091,84092,84093)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093)
      quest::say("Hahaha! Better luck next time!");
  }
  if($itemcount{85062} && $random_result>2 && $random_result<9){ 
      quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
      quest::say("Don't get too hyper now!");
  }
  if($itemcount{85062} && $random_result==9){
      quest::summonitem(66615); # Item: Gold Ticket
      quest::say("There you are, Charlie!");
  }
  if($itemcount{85062} && $random_result==10){
      quest::summonitem(quest::ChooseRandom(84091,84092,84093)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093)
      quest::say("Hahaha! Better luck next time!");
  }
}
  if($ulevel < 10){
  if($itemcount{85062} && $random_result<3){
      quest::summonitem(quest::ChooseRandom(84091,84092,84093)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093)
      quest::say("Hahaha! Better luck next time!");
  }
  if($itemcount{85062} && $random_result>2 && $random_result<11){ 
      quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
      quest::say("Don't get too hyper now!");
  }
 }
}

sub EVENT_TIMER {
  if($timer eq "weather") {
    quest::rain(0);
    quest::snow(0);
 }
}

sub EVENT_SIGNAL {
quest::shout("Casting SoW and SoE for donations behind the main bank!");
if($signal == 12346) {
  quest::stoptimer("weather");
  }
}
