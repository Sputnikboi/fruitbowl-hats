# Fruitbowl Hats v2 - Runs every tick

# Enable glint trigger for all players
scoreboard players enable @a glint

# Check for glint requests: 1 = disable glint, 2 = enable glint
execute as @a[scores={glint=1}] at @s run function fruitbowl_hats:glint_off
execute as @a[scores={glint=2}] at @s run function fruitbowl_hats:glint_on

# For each player wearing a helmet, check if we need to apply/update/revert
execute as @a at @s run function fruitbowl_hats:check
