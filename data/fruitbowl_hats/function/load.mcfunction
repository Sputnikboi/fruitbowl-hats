# Fruitbowl Hat System - Initialize
scoreboard objectives add fb.cmd dummy
scoreboard objectives add restore_hat trigger
tellraw @a [{"text":"[Fruitbowl Hats] ","color":"gold"},{"text":"Hat system loaded! Set CMD on a helmet to wear 3D hats with armor stats.","color":"yellow"}]
