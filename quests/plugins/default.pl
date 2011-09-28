# Global Default NPC Actions

sub EVENT_SAY
{
  plugin::defaultSay();
}

sub EVENT_ITEM
{
  plugin::defaultItem();
}

sub EVENT_COMBAT
{
  plugin::defaultCombat();
}

sub EVENT_SLAY
{
  plugin::defaultSlay();
}

sub EVENT_NPC_SLAY
{
  plugin::defaultSlay();
}

sub EVENT_DEATH
{
  plugin::defaultDeath();
}