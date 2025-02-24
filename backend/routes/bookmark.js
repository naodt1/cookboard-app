// routes/bookmarks.js
const express = require('express');
const Bookmark = require('../models/bookmarkModel');

const router = express.Router();

// Get all bookmarks
router.get('/', async (req, res) => {
  try {
    const bookmarks = await Bookmark.find();
    res.status(200).json(bookmarks);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Create a new bookmark
router.post('/', async (req, res) => {
  try {
    const bookmark = await Bookmark.create(req.body);
    res.status(201).json(bookmark);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Get a specific bookmark by ID
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const bookmark = await Bookmark.findById(id);

    if (!bookmark) {
      return res.status(404).json({ message: 'Bookmark not found' });
    }

    res.status(200).json(bookmark);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Delete a bookmark by ID
router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const deletedBookmark = await Bookmark.findByIdAndDelete(id);

    if (!deletedBookmark) {
      return res.status(404).json({ message: 'Bookmark not found' });
    }

    res.status(200).json({ message: 'Bookmark deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Export the router
module.exports = router;
