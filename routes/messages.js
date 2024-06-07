const express = require('express');
const router = express.Router();
const {ensureCorrectUser}= require('../middleware/auth');
const Message = require('../models/message');
const db = require('../db');

/** GET /:id - get detail of message.
 *
 * => {message: {id,
 *               body,
 *               sent_at,
 *               read_at,
 *               from_user: {username, first_name, last_name, phone},
 *               to_user: {username, first_name, last_name, phone}}
 *
 * Make sure that the currently-logged-in users is either the to or from user.
 *
**/
router.get('/:id', ensureCorrectUser, async (req, res, next) => {
    try{
        const message = await Message.get(req.params.id);
        const from_user = message.from_user.username;
        const to_user = message.to_user.username;
        return res.json({'from':from_user, 'to':to_user});
    }catch(err){
        return next(err);
    }
});


/** POST / - post message.
 *
 * {to_username, body} =>
 *   {message: {id, from_username, to_username, body, sent_at}}
 *
**/
router.get('/:id', ensureCorrectUser, async (req, res, next) => {
    try{
        return "...";
    }catch(err){
        return next(err);
    }
});

/** POST/:id/read - mark message as read:
 *
 *  => {message: {id, read_at}}
 *
 * Make sure that the only the intended recipient can mark as read.
 *
**/

router.post('/:id/read', ensureCorrectUser, async (req, res, next) => {
    try{
        return "...";
    }catch(err){
        return next(err);
    }
});

module.exports = router;