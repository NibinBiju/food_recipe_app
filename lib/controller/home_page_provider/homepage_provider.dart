import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:recipe_app/constants/api_constants/api_constants.dart';

class HomeProvider with ChangeNotifier {
  var responceBody = [
    {
      "id": 1,
      "title": "Grilled Chicken Caesar Salad",
      "category": "daily_inspiration",
      "ingredients": [
        {"name": "Chicken breasts", "image": "https://via.placeholder.com/150"},
        {"name": "Romaine lettuce", "image": "https://via.placeholder.com/150"},
        {"name": "Caesar dressing", "image": "https://via.placeholder.com/150"},
        {"name": "Parmesan cheese", "image": "https://via.placeholder.com/150"},
        {"name": "Croutons", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Grill chicken breasts until fully cooked.",
        "Chop Romaine lettuce and place it in a large bowl.",
        "Slice grilled chicken and add it to the lettuce.",
        "Drizzle Caesar dressing over the salad.",
        "Shave Parmesan cheese on top and toss with croutons."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "30 minutes",
      "rating": 4.5
    },
    {
      "id": 2,
      "title": "Creamy Tomato Basil Soup",
      "category": "daily_inspiration",
      "ingredients": [
        {"name": "Tomatoes", "image": "https://via.placeholder.com/150"},
        {"name": "Onion", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "Chicken broth", "image": "https://via.placeholder.com/150"},
        {"name": "Heavy cream", "image": "https://via.placeholder.com/150"},
        {"name": "Fresh basil", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Sauté onions and garlic in a pot until softened.",
        "Add tomatoes, chicken broth, and fresh basil.",
        "Simmer until tomatoes are cooked.",
        "Blend the mixture until smooth.",
        "Stir in heavy cream and season with salt and pepper."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "40 minutes",
      "rating": 4.8
    },
    {
      "id": 3,
      "title": "Spinach and Feta Stuffed Chicken Breast",
      "category": "daily_inspiration",
      "ingredients": [
        {"name": "Chicken breasts", "image": "https://via.placeholder.com/150"},
        {"name": "Spinach", "image": "https://via.placeholder.com/150"},
        {"name": "Feta cheese", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "Olive oil", "image": "https://via.placeholder.com/150"},
        {"name": "Salt and pepper", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Preheat oven to 375°F (190°C).",
        "Mix spinach, feta, and garlic in a bowl.",
        "Cut a pocket in each chicken breast.",
        "Stuff each breast with the spinach and feta mixture.",
        "Season with salt and pepper.",
        "Bake until chicken is cooked through."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "35 minutes",
      "rating": 4.2
    },
    {
      "id": 4,
      "title": "Teriyaki Salmon with Pineapple Salsa",
      "category": "trending_now",
      "ingredients": [
        {"name": "Salmon fillets", "image": "https://via.placeholder.com/150"},
        {"name": "Teriyaki sauce", "image": "https://via.placeholder.com/150"},
        {"name": "Pineapple", "image": "https://via.placeholder.com/150"},
        {"name": "Red bell pepper", "image": "https://via.placeholder.com/150"},
        {"name": "Red onion", "image": "https://via.placeholder.com/150"},
        {"name": "Cilantro", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Marinate salmon in teriyaki sauce.",
        "Grill or bake salmon until done.",
        "Dice pineapple, red bell pepper, and red onion for salsa.",
        "Mix salsa ingredients together.",
        "Serve salmon with pineapple salsa on top."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "20 minutes",
      "rating": 4.6
    },
    {
      "id": 5,
      "title": "Lemon Garlic Roasted Chicken Thighs",
      "category": "trending_now",
      "ingredients": [
        {"name": "Chicken thighs", "image": "https://via.placeholder.com/150"},
        {"name": "Lemon", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "Olive oil", "image": "https://via.placeholder.com/150"},
        {"name": "Thyme", "image": "https://via.placeholder.com/150"},
        {"name": "Paprika", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Preheat oven to 400°F (200°C).",
        "Combine lemon juice, minced garlic, olive oil, thyme, and paprika.",
        "Coat chicken thighs with the mixture.",
        "Roast in the oven until golden and cooked through."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "45 minutes",
      "rating": 4.7
    },
    {
      "id": 6,
      "title": "Margherita Pizza with Fresh Basil",
      "category": "trending_now",
      "ingredients": [
        {"name": "Pizza dough", "image": "https://via.placeholder.com/150"},
        {"name": "Tomato sauce", "image": "https://via.placeholder.com/150"},
        {
          "name": "Fresh mozzarella",
          "image": "https://via.placeholder.com/150"
        },
        {"name": "Tomatoes", "image": "https://via.placeholder.com/150"},
        {"name": "Fresh basil", "image": "https://via.placeholder.com/150"},
        {"name": "Olive oil", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Roll out pizza dough on a baking sheet.",
        "Spread tomato sauce over the dough.",
        "Arrange slices of fresh mozzarella and tomatoes.",
        "Bake until crust is golden.",
        "Top with fresh basil and drizzle with olive oil."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "15 minutes",
      "rating": 4.4
    },
    {
      "id": 7,
      "title": "Shrimp Scampi with Linguine",
      "category": "trending_now",
      "ingredients": [
        {"name": "Shrimp", "image": "https://via.placeholder.com/150"},
        {"name": "Linguine", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "White wine", "image": "https://via.placeholder.com/150"},
        {"name": "Lemon", "image": "https://via.placeholder.com/150"},
        {"name": "Parsley", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Cook linguine according to package instructions.",
        "Sauté shrimp and minced garlic in olive oil.",
        "Add white wine and lemon juice.",
        "Toss cooked linguine with the shrimp mixture.",
        "Garnish with chopped parsley."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "25 minutes",
      "rating": 4.9
    },
    {
      "id": 8,
      "title": "Quinoa and Black Bean Burrito Bowl",
      "category": "recipes_you_may_like",
      "ingredients": [
        {"name": "Quinoa", "image": "https://via.placeholder.com/150"},
        {"name": "Black beans", "image": "https://via.placeholder.com/150"},
        {"name": "Corn", "image": "https://via.placeholder.com/150"},
        {"name": "Avocado", "image": "https://via.placeholder.com/150"},
        {"name": "Salsa", "image": "https://via.placeholder.com/150"},
        {"name": "Lime", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Cook quinoa according to package instructions.",
        "Combine cooked quinoa with black beans, corn, and diced avocado.",
        "Top with salsa and a squeeze of lime."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "20 minutes",
      "rating": 4.2
    },
    {
      "id": 9,
      "title": "Caprese Pasta Salad",
      "category": "recipes_you_may_like",
      "ingredients": [
        {"name": "Pasta", "image": "https://via.placeholder.com/150"},
        {"name": "Cherry tomatoes", "image": "https://via.placeholder.com/150"},
        {
          "name": "Fresh mozzarella",
          "image": "https://via.placeholder.com/150"
        },
        {"name": "Basil", "image": "https://via.placeholder.com/150"},
        {
          "name": "Balsamic vinaigrette",
          "image": "https://via.placeholder.com/150"
        }
      ],
      "instructions": [
        "Cook pasta according to package instructions.",
        "Toss pasta with cherry tomatoes, fresh mozzarella, and basil.",
        "Drizzle with balsamic vinaigrette and toss."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "15 minutes",
      "rating": 4.6
    },
    {
      "id": 10,
      "title": "Mediterranean Grilled Eggplant",
      "category": "recipes_you_may_like",
      "ingredients": [
        {"name": "Eggplant", "image": "https://via.placeholder.com/150"},
        {"name": "Olive oil", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "Lemon juice", "image": "https://via.placeholder.com/150"},
        {"name": "Oregano", "image": "https://via.placeholder.com/150"},
        {"name": "Feta cheese", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Slice eggplant and brush with olive oil.",
        "Grill until tender.",
        "Combine minced garlic, lemon juice, and oregano.",
        "Drizzle the dressing over grilled eggplant.",
        "Crumble feta cheese on top."
      ],
      "recipe_image": "https://via.placeholder.com/600"
    },
    {
      "id": 11,
      "title": "Beef and Vegetable Stir-Fry",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Beef strips", "image": "https://via.placeholder.com/150"},
        {"name": "Broccoli", "image": "https://via.placeholder.com/150"},
        {"name": "Carrots", "image": "https://via.placeholder.com/150"},
        {"name": "Soy sauce", "image": "https://via.placeholder.com/150"},
        {"name": "Ginger", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Slice beef into strips.",
        "Stir-fry beef, broccoli, and carrots in soy sauce.",
        "Add minced ginger and garlic.",
        "Cook until beef is browned and vegetables are tender."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "20 minutes",
      "rating": 4.5
    },
    {
      "id": 12,
      "title": "Roasted Vegetable and Chickpea Salad",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Bell peppers", "image": "https://via.placeholder.com/150"},
        {"name": "Zucchini", "image": "https://via.placeholder.com/150"},
        {"name": "Chickpeas", "image": "https://via.placeholder.com/150"},
        {"name": "Red onion", "image": "https://via.placeholder.com/150"},
        {"name": "Olive oil", "image": "https://via.placeholder.com/150"},
        {"name": "Balsamic vinegar", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Roast bell peppers, zucchini, and chickpeas.",
        "Mix roasted vegetables with red onion.",
        "Drizzle with olive oil and balsamic vinegar.",
        "Toss the salad until well combined."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "25 minutes",
      "rating": 4.0
    },
    {
      "id": 13,
      "title": "BBQ Pulled Pork Sandwiches",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Pork shoulder", "image": "https://via.placeholder.com/150"},
        {"name": "BBQ sauce", "image": "https://via.placeholder.com/150"},
        {"name": "Coleslaw", "image": "https://via.placeholder.com/150"},
        {"name": "Buns", "image": "https://via.placeholder.com/150"},
        {"name": "Pickles", "image": "https://via.placeholder.com/150"},
        {"name": "Onion", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Slow-cook pork shoulder in BBQ sauce until tender.",
        "Shred the pork with a fork.",
        "Toast buns and pile pulled pork on top.",
        "Top with coleslaw and pickles."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "4 hours",
      "rating": 4.8
    },
    {
      "id": 14,
      "title": "Thai Green Curry with Tofu",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Tofu", "image": "https://via.placeholder.com/150"},
        {
          "name": "Green curry paste",
          "image": "https://via.placeholder.com/150"
        },
        {"name": "Coconut milk", "image": "https://via.placeholder.com/150"},
        {"name": "Bell peppers", "image": "https://via.placeholder.com/150"},
        {"name": "Thai basil", "image": "https://via.placeholder.com/150"},
        {"name": "Jasmine rice", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Sauté tofu in green curry paste.",
        "Pour in coconut milk and add bell peppers.",
        "Simmer until vegetables are tender.",
        "Stir in Thai basil.",
        "Serve over jasmine rice."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "30 minutes",
      "rating": 4.2
    },
    {
      "id": 15,
      "title": "Baked Ziti with Italian Sausage",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Ziti pasta", "image": "https://via.placeholder.com/150"},
        {"name": "Italian sausage", "image": "https://via.placeholder.com/150"},
        {"name": "Marinara sauce", "image": "https://via.placeholder.com/150"},
        {"name": "Ricotta cheese", "image": "https://via.placeholder.com/150"},
        {
          "name": "Mozzarella cheese",
          "image": "https://via.placeholder.com/150"
        },
        {"name": "Parmesan cheese", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Cook ziti according to package instructions.",
        "Brown Italian sausage in a pan.",
        "Mix ziti with sausage and marinara sauce.",
        "Layer with ricotta, mozzarella, and Parmesan cheese.",
        "Bake until bubbly and golden."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "40 minutes",
      "rating": 4.7
    },
    {
      "id": 16,
      "title": "Vegetarian Chili with Cornbread",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Kidney beans", "image": "https://via.placeholder.com/150"},
        {"name": "Black beans", "image": "https://via.placeholder.com/150"},
        {"name": "Corn", "image": "https://via.placeholder.com/150"},
        {"name": "Tomatoes", "image": "https://via.placeholder.com/150"},
        {"name": "Chili powder", "image": "https://via.placeholder.com/150"},
        {"name": "Cornbread", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Combine kidney beans, black beans, corn, and tomatoes.",
        "Add chili powder and cook until heated through.",
        "Serve with a side of cornbread."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "35 minutes",
      "rating": 4.4
    },
    {
      "id": 17,
      "title": "Sweet Potato and Black Bean Enchiladas",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Sweet potatoes", "image": "https://via.placeholder.com/150"},
        {"name": "Black beans", "image": "https://via.placeholder.com/150"},
        {"name": "Enchilada sauce", "image": "https://via.placeholder.com/150"},
        {"name": "Tortillas", "image": "https://via.placeholder.com/150"},
        {"name": "Cheese", "image": "https://via.placeholder.com/150"},
        {"name": "Cilantro", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Roast sweet potatoes and mix with black beans.",
        "Fill tortillas with the sweet potato and black bean mixture.",
        "Pour enchilada sauce over the filled tortillas.",
        "Top with cheese and bake until bubbly."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "45 minutes",
      "rating": 4.6
    },
    {
      "id": 18,
      "title": "Chicken and Broccoli Alfredo",
      "category": "easy_recipes",
      "ingredients": [
        {
          "name": "Fettuccine pasta",
          "image": "https://via.placeholder.com/150"
        },
        {"name": "Chicken breast", "image": "https://via.placeholder.com/150"},
        {"name": "Broccoli", "image": "https://via.placeholder.com/150"},
        {"name": "Alfredo sauce", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "Parmesan cheese", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Cook fettuccine pasta according to package instructions.",
        "Sauté chicken and broccoli in garlic and olive oil.",
        "Pour in Alfredo sauce and stir.",
        "Combine with cooked pasta.",
        "Sprinkle with Parmesan cheese."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "30 minutes",
      "rating": 4.3
    },
    {
      "id": 19,
      "title": "Garlic Butter Shrimp Pasta",
      "category": "easy_recipes",
      "ingredients": [
        {"name": "Shrimp", "image": "https://via.placeholder.com/150"},
        {"name": "Linguine", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic", "image": "https://via.placeholder.com/150"},
        {"name": "Butter", "image": "https://via.placeholder.com/150"},
        {"name": "Cherry tomatoes", "image": "https://via.placeholder.com/150"},
        {"name": "Parsley", "image": "https://via.placeholder.com/150"}
      ],
      "instructions": [
        "Cook linguine according to package instructions.",
        "Sauté shrimp in garlic and butter until pink.",
        "Toss cooked linguine with shrimp mixture.",
        "Add cherry tomatoes and parsley.",
        "Serve with a sprinkle of Parmesan cheese."
      ],
      "recipe_image": "https://via.placeholder.com/600",
      "time_to_cook": "25 minutes",
      "rating": 4.9
    }
  ];

  // RecipeModel recipeModel = RecipeModel.fromJson(jsonData.tojson);
}
