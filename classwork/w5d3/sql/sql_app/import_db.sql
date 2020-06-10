PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY(author_id) REFERENCES users(id)
);
DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);
DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    subject_question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    reply_author_id INTEGER NOT NULL,
    reply_body TEXT NOT NULL,
    FOREIGN KEY (subject_question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (reply_author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname,lname)
VALUES
    ('Matthew','Greer'),
    ('Yuanyuan','Zhou');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Matthew question', 'is this working?', (SELECT id FROM users WHERE fname = 'Matthew' and lname = 'Greer')),
    ('Yuan''s Question', 'how to write a SQL database', (SELECT id
FROM users WHERE fname = 'Yuanyuan' and lname = 'Zhou'));

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    (
        (SELECT id FROM users WHERE fname = 'Matthew' and lname = 'Greer'),
    (SELECT id FROM questions WHERE title = 'Yuan''s Question')
    );
    
INSERT INTO
    replies (subject_question_id, parent_reply_id, reply_author_id, reply_body)
VALUES
    (
    (SELECT id FROM questions WHERE title = 'Yuan''s Question'),
    NULL,
    (SELECT id FROM users WHERE fname = 'Matthew' and lname = 'Greer'),
    'work together!'
    );

INSERT INTO
    question_likes (user_id, question_id)
VALUES
    (
    (SELECT id FROM users WHERE fname = 'Matthew' and lname = 'Greer'),
    (SELECT id FROM questions WHERE title = 'Yuan''s Question')
    );
@
    
