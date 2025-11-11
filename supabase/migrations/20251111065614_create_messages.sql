CREATE TABLE messages(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    room_id UUID REFERENCES rooms(id) NOT NULL,
    sender_id BIGINT REFERENCES profiles(id) NOT NULL,
    receiver_id BIGINT REFERENCES profiles(id) NOT NULL,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;