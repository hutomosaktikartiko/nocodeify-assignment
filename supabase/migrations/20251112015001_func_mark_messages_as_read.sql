CREATE OR REPLACE FUNCTION mark_messages_as_read(p_room_id UUID, p_viewer_id BIGINT)
RETURNS void AS $$
    UPDATE messages
    SET is_read = true
    WHERE room_id = p_room_id
        AND sender_id = p_viewer_id
        AND is_read = false;
$$ LANGUAGE sql;