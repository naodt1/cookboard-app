const mongoose = require('mongoose');

const bookmarkSchema = mongoose.Schema(
    {
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    recipe: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Recipe',
        required: true
    },
},
{
    timestamps: true, // Add timestamps to the schema
  }
)

const Bookmark = mongoose.model('Bookmark', bookmarkSchema);
module.exports = Bookmark;