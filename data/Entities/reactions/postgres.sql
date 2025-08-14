-- Таблица постов
CREATE TABLE posts (
  id          bigserial PRIMARY KEY
);

-- Таблица пользователей
CREATE TABLE users (
  id          bigserial PRIMARY KEY,
  username    varchar(50) NOT NULL UNIQUE,
  email       varchar(70) NOT NULL UNIQUE
);

-- Тип реакций
CREATE TYPE post_reaction_type AS ENUM ('LIKE','DISLIKE','SUPER','HOT','OMG');

-- Таблица активных реакций (истина)
CREATE TABLE post_user_reactions (
  post_id       bigserial NOT NULL REFERENCES posts(id),
  author_id     bigserial NOT NULL REFERENCES users(id),
  reaction_type post_reaction_type NOT NULL,
  created_at    timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY   (post_id, author_id)  -- одна активная реакция на пост
);

-- Для выборок "мои реакции"
CREATE INDEX idx_pur_author ON post_user_reactions(author_id);

-- Для выборок "кто поставил LIKE посту"
CREATE INDEX idx_pur_post_react ON post_user_reactions(post_id, reaction_type);

-- Таблица счётчиков по типам
CREATE TABLE post_reactions_count (
  post_id       bigserial NOT NULL REFERENCES posts(id),
  reaction_type post_reaction_type NOT NULL,
  count         integer NOT NULL DEFAULT 0 CHECK (count >= 0),
  PRIMARY KEY   (post_id, reaction_type)
);