# Spawn armor stand shuttle
summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,Marker:1,Tags:["fruitbowl_shuttle"]}

# Copy helmet from player head to shuttle mainhand
item replace entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand from entity @s armor.head

# Strip the armor texture rendering by overriding equippable to just slot:head
# This makes the game render the item_model / CMD dispatch instead of the armor layer
data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:equippable":{slot:head}}}}}

# Tag it so we know it's been processed
data modify entity @n[type=armor_stand,tag=fruitbowl_shuttle] equipment.mainhand.components."minecraft:custom_data".fruitbowl_hat set value true

# Copy the modified helmet back to player head
item replace entity @s armor.head from entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand

# Kill the shuttle
kill @n[type=armor_stand,tag=fruitbowl_shuttle]
