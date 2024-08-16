import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
}).promise();

export const getUserList = async () => {
  const [userList] = await pool.query('SELECT * FROM users');

  return userList;
};

export const getUser = async (id) => {
  const [user] = await pool.query(`
    SELECT * FROM users
    WHERE id = ?  
  `, [id]);

  return user[0];
};

export const createPost = async (userId, title, body) => {
  const [res] = await pool.query(`
    INSERT INTO posts (user_id, title, body)
    VALUES (?, ?, ?)
  `, [userId, title, body]);

  return res.insertId;
}

export const getPostList = async () => {
  const [postList] = await pool.query('SELECT * FROM posts');

  return postList;
};
