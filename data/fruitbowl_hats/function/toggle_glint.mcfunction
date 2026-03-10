# Toggle enchantment glint on held item using armor stand shuttle

# Must be holding something
execute unless items entity @s weapon.mainhand * run return run tellraw @s [{"text":"[Hats]","color":"gold"},{"text":" Hold an item in your main hand first!","color":"red"}]

# Spawn shuttle
summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,Marker:1,Tags:["fruitbowl_shuttle"]}

# Copy held item to shuttle
item replace entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand from entity @s weapon.mainhand

# Check if glint override is already set to false (glint hidden) → remove it (restore default)
execute store result score #has_glint_off fruitbowl_hats run data get entity @n[type=armor_stand,tag=fruitbowl_shuttle] equipment.mainhand.components."minecraft:enchantment_glint_override"

# If the component exists and is 0 (false/hidden), remove it to restore glint
execute if data entity @n[type=armor_stand,tag=fruitbowl_shuttle] equipment.mainhand.components."minecraft:enchantment_glint_override" run data remove entity @n[type=armor_stand,tag=fruitbowl_shuttle] equipment.mainhand.components."minecraft:enchantment_glint_override"
execute if score #has_glint_off fruitbowl_hats matches 0 run item replace entity @s weapon.mainhand from entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand
execute if score #has_glint_off fruitbowl_hats matches 0 run kill @n[type=armor_stand,tag=fruitbowl_shuttle]
execute if score #has_glint_off fruitbowl_hats matches 0 run scoreboard players set @s glint 0
execute if score #has_glint_off fruitbowl_hats matches 0 run return run tellraw @s [{"text":"[Hats]","color":"gold"},{"text":" Enchantment glint restored!","color":"green"}]

# Otherwise, set glint override to false (hide glint)
data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:enchantment_glint_override":false}}}}

# Copy back
item replace entity @s weapon.mainhand from entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand

# Cleanup
kill @n[type=armor_stand,tag=fruitbowl_shuttle]
scoreboard players set @s glint 0
tellraw @s [{"text":"[Hats]","color":"gold"},{"text":" Enchantment glint hidden!","color":"yellow"}]
