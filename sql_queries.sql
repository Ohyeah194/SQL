-- oldest registed users
SELECT * FROM users ORDER BY created_at LIMIT 5;

-- The most registered days
SELECT username, DAYNAME(created_at) AS Days, COUNT(created_at) AS most, created_at  FROM users 
GROUP BY Days 
ORDER BY most DESC LIMIT 2;

-- user that never posted a photo (inactive users)
SELECT username, image_url FROM users 
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE image_url IS NULL;
  
-- The most like user's photo   
SELECT photos.id, username, photos.image_url, 
   COUNT(photos.id) AS photos 
FROM likes
JOIN photos
   ON likes.photo_id = photos.id
JOIN users
   ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY photos DESC LIMIT 1;

-- How many times average user post (not sure)
SELECT ROUND((COUNT(users.id) / 100), 2) AS counts FROM users
JOIN photos
ON users.id = photos.user_id;

-- (Calculate) How many times average user post?
SELECT 
  ROUND((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users), 2) AS Average;