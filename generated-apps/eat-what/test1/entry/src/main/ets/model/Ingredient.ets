// Ingredient entity — a single item in the user's fridge inventory.

export interface Ingredient {
  id: string;
  name: string;
}

export function makeIngredient(id: string, name: string): Ingredient {
  const ingredient: Ingredient = {
    id: id,
    name: name,
  };
  return ingredient;
}
