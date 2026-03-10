# Revert a processed hat back to normal helmet rendering
# Restore the vanilla equippable component (with asset_id) so armor texture renders again

summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,Marker:1,Tags:["fruitbowl_shuttle"]}

# Copy helmet from player head to shuttle
item replace entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand from entity @s armor.head

# Restore vanilla equippable based on helmet type
execute if items entity @s armor.head minecraft:leather_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:leather"}}}}}
execute if items entity @s armor.head minecraft:chainmail_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:chainmail"}}}}}
execute if items entity @s armor.head minecraft:iron_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:iron"}}}}}
execute if items entity @s armor.head minecraft:golden_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:gold"}}}}}
execute if items entity @s armor.head minecraft:diamond_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:diamond"}}}}}
execute if items entity @s armor.head minecraft:netherite_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:netherite"}}}}}
execute if items entity @s armor.head minecraft:turtle_helmet run data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head,asset_id:"minecraft:turtle_scute"}}}}}

# Remove our processing tag
data remove entity @n[type=armor_stand,tag=fruitbowl_shuttle] equipment.mainhand.components."minecraft:custom_data".fruitbowl_hat

# Copy back to player
item replace entity @s armor.head from entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand

# Kill shuttle
kill @n[type=armor_stand,tag=fruitbowl_shuttle]
