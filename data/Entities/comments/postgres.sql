-- Таблица постов
CREATE TABLE posts (
  id            bigserial PRIMARY KEY
);

-- Таблица пользователей
CREATE TABLE users (
  id            bigserial PRIMARY KEY,
  username      varchar(50) NOT NULL UNIQUE,
  email         varchar(70) NOT NULL UNIQUE
);

-- Таблица комментариев к постам
CREATE TABLE post_user_comments (
    comment_id  bigserial PRIMARY KEY,
    post_id     bigserial NOT NULL REFERENCES posts(id),
    author_id   bigserial NOT NULL REFERENCES users(id),
    created_at  timestamptz NOT NULL DEFAULT now()
);

-- Для выборок "комментарии поста"
CREATE UNIQUE INDEX idx_commentid_postid ON post_user_comments(post_id, comment_id);