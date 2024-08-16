import express from 'express';

import { createPost, getPostList, getUser, getUserList } from './db.js';

const PORT = 8080;

const app = express();
app.use(express.json());

app.get('/users', async (_, res) => {
  const userList = await getUserList();

  res.send(userList);
});

app.get('/user/:id', async (req, res) => {
  const id = req.params.id;
  const user = await getUser(id);

  res.send(user);
});

app.post('/posts', async (req, res) => {
  const {
    userId,
    title,
    body
  } = req.body;
  
  const postId = await createPost(userId, title, body);

  res.sendStatus(201).send(postId);
});

app.get('/posts', async (_, res) => {
  const postList = await getPostList();

  res.send(postList);
});

app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(500).send('Something broke!')
})

app.listen(PORT, function(err){
    if (err) console.log('Error in server setup')

    console.log('Server listening on Port', PORT);
});

