# Spawn armor stand shuttle
summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,Marker:1,Tags:["fruitbowl_shuttle"]}

# Copy helmet from player head to shuttle mainhand
item replace entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand from entity @s armor.head

# Tag it so we know it's been processed (data merge creates custom_data if it doesn't exist)
data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:custom_data":{fruitbowl_hat:true}}}}}

# Strip the armor texture by overriding equippable to just slot:head
data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head}}}}}
# data merge only merges, so explicitly remove asset_id to stop armor layer rendering
data remove entity @n[type=armor_stand,tag=fruitbowl_shuttle] equipment.mainhand.components."minecraft:equippable".asset_id

# Copy the modified helmet back to player head
item replace entity @s armor.head from entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand

# Kill the shuttle
kill @n[type=armor_stand,tag=fruitbowl_shuttle]
