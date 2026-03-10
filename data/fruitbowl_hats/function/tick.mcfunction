# Fruitbowl Hat System - Runs every tick
# Enable restore trigger for all players
scoreboard players enable @a restore_hat

# Check each player for helmet->hat swap
execute as @a at @s run function fruitbowl_hats:check

# Handle restore trigger
execute as @a[scores={restore_hat=1..}] run function fruitbowl_hats:restore

# Revert fruitbowl hats that are no longer on the head
execute as @a at @s run function fruitbowl_hats:revert_loose
