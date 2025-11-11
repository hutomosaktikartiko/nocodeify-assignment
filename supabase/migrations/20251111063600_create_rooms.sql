CREATE TABLE rooms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    participant_1_id BIGINT REFERENCES profiles(id),
    participant_2_id BIGINT REFERENCES profiles(id)
);


-- Enable Row Level Security
ALTER TABLE rooms ENABLE ROW LEVEL SECURITY;