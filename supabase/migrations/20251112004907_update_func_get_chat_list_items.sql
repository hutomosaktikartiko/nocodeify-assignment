DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_proc p
    JOIN pg_namespace n ON n.oid = p.pronamespace
    WHERE p.proname = 'get_chat_list_items'
      AND n.nspname = 'public'
      AND p.pronargs = 1
  ) THEN
    DROP FUNCTION public.get_chat_list_items(bigint);
  END IF;
END $$;

CREATE OR REPLACE FUNCTION public.get_chat_list_items(p_viewer_id BIGINT)
RETURNS TABLE (
    room_id UUID,
    sender_id BIGINT,
    receiver_id BIGINT,
    receiver_name TEXT,
    latest_message_content TEXT,
    latest_message_timestamp TIMESTAMPTZ,
    unread_count BIGINT
)
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.id AS room_id,
        latest_msg.sender_id AS sender_id,
        p.id AS receiver_id,
        p.name AS receiver_name,
        latest_msg.content AS latest_message_content,
        latest_msg.created_at AS latest_message_timestamp,
        COALESCE(unread_info.unread_count, 0) AS unread_count
    FROM
        rooms r
    JOIN
        profiles p ON p.id = (
            CASE
                WHEN r.participant_1_id = p_viewer_id THEN r.participant_2_id
                ELSE r.participant_1_id
            END
        )
    LEFT JOIN LATERAL (
        SELECT m.sender_id, m.content, m.created_at
        FROM messages m
        WHERE m.room_id = r.id
        ORDER BY m.created_at DESC
        LIMIT 1
    ) AS latest_msg ON true
    LEFT JOIN LATERAL (
        SELECT count(*) AS unread_count
        FROM messages m
        WHERE m.room_id = r.id
          AND m.receiver_id = p_viewer_id
          AND m.is_read = false
    ) AS unread_info ON true
    WHERE r.participant_1_id = p_viewer_id OR r.participant_2_id = p_viewer_id
    ORDER BY latest_msg.created_at DESC NULLS LAST;
END;
$$;

-- Lock down and grant only execute to client roles
REVOKE ALL ON FUNCTION public.get_chat_list_items(bigint) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_chat_list_items(bigint) TO anon, authenticated;


