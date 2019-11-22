def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  return shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, amount)
  return shop[:admin][:pets_sold] += amount
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  count = []
  for pets in shop[:pets]
    if pets[:breed] == breed
      count << pets[:name]
    end
  end
  return count
end

def find_pet_by_name(shop, pet_name)
  for pets in shop[:pets]
    if pets[:name] == pet_name
      return pets
    end
  end
  return nil
end

def remove_pet_by_name(shop, pet_name)
  for pets in shop[:pets]
    if pets[:name] == pet_name
      shop[:pets].delete(pets)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(shop, pet, customer)
  add_pet_to_customer(customer, pet)
  increase_pets_sold(shop, 1)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(shop, pet[:price])
end
