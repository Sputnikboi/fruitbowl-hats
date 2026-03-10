execute unless items entity @s weapon.mainhand * run return 0
summon armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,Marker:1,Tags:["fruitbowl_shuttle"]}
item replace entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand from entity @s weapon.mainhand
data merge entity @n[type=armor_stand,tag=fruitbowl_shuttle] {equipment:{mainhand:{components:{"minecraft:enchantment_glint_override":false}}}}
item replace entity @s weapon.mainhand from entity @n[type=armor_stand,tag=fruitbowl_shuttle] weapon.mainhand
kill @n[type=armor_stand,tag=fruitbowl_shuttle]
scoreboard players set @s glint 0
