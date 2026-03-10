# Skip if nothing in head slot
execute unless items entity @s armor.head * run return 0

# Skip if not a helmet
execute unless items entity @s armor.head #fruitbowl_hats:helmets run return 0

# CASE 1: Helmet has CMD and is NOT yet processed → apply
execute if items entity @s armor.head *[custom_model_data~{}] unless items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] run function fruitbowl_hats:apply

# CASE 2: Already processed - check if CMD changed
execute if items entity @s armor.head *[custom_data~{fruitbowl_hat:true}] run function fruitbowl_hats:check_update

# CASE 3: Processed hat but CMD was removed (shouldn't normally happen, but safety net)
# This is handled inside check_update
