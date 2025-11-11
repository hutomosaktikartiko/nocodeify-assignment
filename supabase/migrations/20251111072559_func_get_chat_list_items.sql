CREATE OR REPLACE FUNCTION get_chat_list_items(p_viewer_id BIGINT)
RETURNS TABLE (
    room_id UUID,
    other_participant_id BIGINT,
    other_participant_name TEXT,
    latest_message_content TEXT,
    latest_message_timestamp TIMESTAMPTZ,
    unread_count BIGINT
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.id AS room_id,

        -- Get other participant
        p.id AS other_participant_id,
        p.name AS other_participant_name,

        -- Get latest message
        latest_msg.content AS latest_message_content,
        latest_msg.created_at AS latest_message_timestamp,

        -- Count unread messages
        COALESCE(unread_info.unread_count, 0) AS unread_count

    FROM
        rooms r

    -- Join to get other participant
    JOIN
        profiles p ON p.id = (
        CASE
            WHEN r.participant_1_id = p_viewer_id THEN r.participant_2_id
            ELSE r.participant_1_id
        END
    )
    
    -- Join to get latest message
    LEFT JOIN LATERAL (
        SELECT
        m.content,
        m.created_at
        FROM
        messages m
        WHERE
        m.room_id = r.id
        ORDER BY
        m.created_at DESC
        LIMIT 1
    ) AS latest_msg ON true

    -- Join to count unread messages
    LEFT JOIN LATERAL (
        SELECT
        count(*) AS unread_count
        FROM
        messages m
        WHERE
        m.room_id = r.id
        AND m.receiver_id = p_viewer_id
        AND m.is_read = false
    ) AS unread_info ON true

    -- Filter by viewer
    WHERE
        r.participant_1_id = p_viewer_id OR r.participant_2_id = p_viewer_id

    -- Order by latest message timestamp
    ORDER BY
        latest_msg.created_at DESC NULLS LAST;

END;
$$ LANGUAGE plpgsql;