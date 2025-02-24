const mongoose = require('mongoose');

const recipeSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  ingredients: [{
    name: { type: String, required: true },
    quantity: { type: String, required: true },
  }],
  instructions: {
    type: [String],
    required: true,
  },
  prepTime: {
    type: Number,
    required: true,
  },
  cookTime: {
    type: Number,
    required: true,
  },
  servings: {
    type: Number,
    required: true,
  },
  imageUrl: {
    type: String,
    default: 'https://bookmychefs.com/uploads/dish/default_food.jpg',
  },
  createdBy: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true,
  },
  likes: {
    type: Number,
  }
},
{
  timestamps: true, // Add timestamps to the schema
}
);

const Recipe = mongoose.model('Recipe', recipeSchema);

module.exports = Recipe;
