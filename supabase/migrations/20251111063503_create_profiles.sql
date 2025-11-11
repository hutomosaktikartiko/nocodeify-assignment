CREATE TABLE profiles (
    id BIGINT PRIMARY KEY,
    name TEXT NOT NULL
);

-- Enable Row Level Security
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
